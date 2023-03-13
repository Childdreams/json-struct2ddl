package main

import (
	"encoding/json"
	"os"
	"reflect"
	"strings"
)

type ConfigSubClassStruct struct {
	JsonRouter           string                           `json:"json_router"`
	JsonRouterStruct     string                           `json:"json_router_struct"`
	Prefix               string                           `json:"prefix"`
	Kind                 reflect.Kind                     `json:"kind"`
	IsDecompose          bool                             `json:"is_decompose" default:"false"`
	IsNullable           bool                             `json:"is_nullable" default:"false"`
	ParentRoute          string                           `json:"parent_route"`
	ParentRouteStruct    string                           `json:"parent_route_struct"`
	WithSql              string                           `json:"with_sql"`
	CreateSqls           []string                         `json:"create_sql"`
	SelectSqls           []string                         `json:"select_sqls"`
	GolangCode           []string                         `json:"golang_code"`
	GolangIsNullAbleCode []string                         `json:"golang_is_null_able_code"`
	GolangStructCode     []string                         `json:"golang_struct_code"`
	GolangCodeAssignment string                           `json:"golang_code_assignment"`
	GoFuncParams         []string                         `json:"go_func_params"`
	SubClass             map[string]*ConfigSubClassStruct `json:"sub_class"`
}

type ConfigStruct struct {
	DatabaseColumn  string                           `json:"database_column"`
	PythonClassName string                           `json:"python_class_name"`
	IsStoreTable    bool                             `json:"is_store_table"`
	SourceTable     string                           `json:"source_table"`
	Filename        string                           `json:"filename"`
	Config          map[string]*ConfigSubClassStruct `json:"config"`
}

func (c *ConfigStruct) SetDatabaseColumn(value string) {
	c.DatabaseColumn = value
}
func (c *ConfigStruct) SetSourceTable(value string) {
	c.SourceTable = value
}
func (c *ConfigStruct) GetSourceTable() string {
	return c.SourceTable
}
func (c *ConfigStruct) SetIsStore(value bool) {
	c.IsStoreTable = value
}
func (c *ConfigStruct) GetIsStore() bool {
	return c.IsStoreTable
}
func (c *ConfigStruct) SetPythonClassName(value string) {
	c.PythonClassName = value
}
func (c *ConfigStruct) GetPythonClassName() string {
	return c.PythonClassName
}

func (c *ConfigStruct) SetFilename(value string) {
	c.Filename = value
}

func recursionConfig(jsonRouters []string, prefix string, configS *ConfigSubClassStruct, name string) {
	router := jsonRouters[0]
	currentRouter := strings.Join([]string{name, router}, ".")
	if configS == nil {
		configS = &ConfigSubClassStruct{}
	}
	if cs, ok := configS.SubClass[router]; ok {
		recursionConfig(jsonRouters[1:len(jsonRouters)], prefix, cs, currentRouter)
	} else {
		if configS.SubClass == nil {
			configS.SubClass = make(map[string]*ConfigSubClassStruct, 0)
		}
		if len(jsonRouters) == 1 {
			if configS.SubClass[currentRouter] == nil {
				configS.SubClass[currentRouter] = &ConfigSubClassStruct{
					JsonRouter:  router,
					Prefix:      prefix,
					SubClass:    nil,
					ParentRoute: name,
					IsDecompose: true,
					IsNullable:  false,
					CreateSqls:  make([]string, 0),
					SelectSqls:  make([]string, 0),
				}
			} else {
				configS.SubClass[currentRouter].JsonRouter = router
				configS.SubClass[currentRouter].Prefix = prefix
				configS.SubClass[currentRouter].ParentRoute = name
				configS.SubClass[currentRouter].IsDecompose = true
				configS.SubClass[currentRouter].CreateSqls = make([]string, 0)
				configS.SubClass[currentRouter].SelectSqls = make([]string, 0)
			}

		} else {
			if configS.SubClass[currentRouter] == nil {
				configS.SubClass[currentRouter] = &ConfigSubClassStruct{
					JsonRouter:  router,
					Prefix:      "",
					ParentRoute: name,
					SubClass:    nil,
				}
			}

			recursionConfig(jsonRouters[1:len(jsonRouters)], prefix, configS.SubClass[currentRouter], currentRouter)
		}
	}
}

func (c *ConfigStruct) SetConfig(jsonRoutersStr, prefix string) []byte {
	jsonR := strings.Split(jsonRoutersStr, ",")
	for _, jsonRouter := range jsonR {
		jsonRouters := strings.Split(jsonRouter, ".")
		if len(jsonRouter) == 0 {
			jsonRouters = []string{c.getDatabaseColumn()}
		} else {
			jsonRouters = append([]string{c.getDatabaseColumn()}, jsonRouters...)
		}
		name := jsonRouters[0]
		if len(c.Config) == 0 {
			c.Config = make(map[string]*ConfigSubClassStruct, 0)
		}
		if cs, ok := c.Config[name]; ok {
			if len(jsonRouters) != 1 {
				recursionConfig(jsonRouters[1:len(jsonRouters)], prefix, cs, name)
			}
		} else {
			c.Config[name] = &ConfigSubClassStruct{
				JsonRouter:  jsonRouters[0],
				Prefix:      prefix,
				IsDecompose: false,
				ParentRoute: "",
				SubClass:    make(map[string]*ConfigSubClassStruct),
			}
			if len(jsonRouters) != 1 {
				recursionConfig(jsonRouters[1:len(jsonRouters)], prefix, c.Config[name], jsonRouters[0])
			} else {
				c.Config[name].IsDecompose = true
			}
		}
	}

	marshal, err := json.MarshalIndent(&c, "", "	")
	if err != nil {
		LogPanicLnErr(err)
	}
	return marshal
}

func (c *ConfigStruct) getDatabaseColumn() string {
	return c.DatabaseColumn
}

func (c *ConfigStruct) getFilename() string {
	return c.Filename
}
func (c *ConfigStruct) getConfig() map[string]*ConfigSubClassStruct {
	return c.Config
}

func (c *ConfigStruct) SaveFile(filename string) {
	marshal, err := json.MarshalIndent(&c, "", "	")
	if err != nil {
		LogPanicLnErr(err)
	}
	err = os.WriteFile(filename, marshal, 0o666)
	LogPanicLnErr(err)
}
