package main

import (
	"app/v4/template"
	"bytes"
	"encoding/json"
	"flag"
	"fmt"
	"log"
	"os"
	"reflect"
	"sort"
	"strings"
)

func initMain() ConfigStruct {
	config := ReadConfigJson(configJsonFile)
	if config.getDatabaseColumn() == "" {
		config.SetDatabaseColumn("data")
	}
	if *databaseColumnFlagParse != "" {
		config.SetDatabaseColumn(*databaseColumnFlagParse)
	}
	if config.getDatabaseColumn() == "" {
		config.SetDatabaseColumn("data")
	}
	if *filenameFlagParse != "" {
		config.SetFilename(*filenameFlagParse)
	}
	if *isStoreFlagParse {
		config.SetIsStore(*isStoreFlagParse)
	}
	if *sourceTableFlagParse != "" {
		config.SetSourceTable(*sourceTableFlagParse)
	}
	if *pythonClassNameFlagParse != "🐯🐯🐯" {
		config.SetPythonClassName(*pythonClassNameFlagParse)
	}
	configByte := config.SetConfig(*jsonRouterFlagParse, *prefixFlagParse)
	WriteConfigJson(configJsonFile, configByte)
	sortJsonRouter(config)
	return config
}

var (
	t                        T
	sourceTableFlagParse     = flag.String("source_table", "", "资源表名称")
	isStoreFlagParse         = flag.Bool("is_store", false, "是否开启存储表")
	pythonClassNameFlagParse = flag.String("python_class_name", "🐯🐯🐯", "生成python类名称")
	prefixFlagParse          = flag.String("prefix", "", "名称的前缀")
	filenameFlagParse        = flag.String("filename", "", "可以多次操作")
	jsonRouterFlagParse      = flag.String("json_router", "", "json从哪个位置开始")
	databaseColumnFlagParse  = flag.String("database_column", "", "json从哪个位置开始")
	clearFlagParse           = flag.Bool("clear", false, "是否格式化")
	debugFlagParse           = flag.Bool("debug", false, "debug模式")
)

var (
	withSqls       = make([]string, 0)
	goStruct       = make([]string, 0)
	selectSqls     = make([]string, 0)
	createSqls     = make([]string, 0)
	typeOfXc       reflect.Type
	configJsonFile = "config.json"
)

func isParentChildRe(column1, column2 string) bool {
	column1Slice := strings.Split(column1, ".")
	column2Slice := strings.Split(column2, ".")
	if len(column1Slice) > len(column2Slice) {
		return false
	}
	for i := 0; i < len(column1Slice); i++ {
		if column1Slice[i] != column2Slice[i] {
			return false
		}
	}
	return true
}
func LogPanicLnErr(err error) {
	if err != nil {
		log.Panicln(err.Error())
	}
}

func ReadTStruct(filename string) string {
	fileInfo, err := os.Stat(filename)
	if err != nil {
		_, err := os.Create(filename)
		LogPanicLnErr(err)
	}
	if fileInfo.Size() == 0 {
		log.Panicf("%s 大小为0", filename)
	}
	tStruct, err := os.ReadFile(filename)
	if err != nil {
		LogPanicLnErr(err)
	}
	return strings.Replace(string(tStruct), "package main", "", -1)
}

func ReadConfigJson(filename string) ConfigStruct {
	var (
		config = ConfigStruct{}
	)
	fileInfo, err := os.Stat(filename)
	if err != nil {
		_, err := os.Create(filename)
		LogPanicLnErr(err)
		fileInfo, _ = os.Stat(filename)
		config = ConfigStruct{}
		return config
	}
	if *clearFlagParse {
		data := make([]byte, 0)
		os.WriteFile(filename, data, 0o666)
		config = ConfigStruct{}
		return config
	}
	if fileInfo.Size() == 0 {
		config = ConfigStruct{}
		return config
	}
	configJson, err := os.ReadFile(filename)
	if err != nil {
		log.Panicln(err.Error())
	}
	err = json.Unmarshal(configJson, &config)
	if err != nil {
		log.Panicln(err.Error())
	}

	return config
}

func WriteConfigJson(filename string, content []byte) {
	err := os.WriteFile(filename, content, 0o666)
	LogPanicLnErr(err)
}

func sortJsonRouter(config ConfigStruct) []string {
	jsonRouters := make([]string, 0)
	for i, _ := range config.Config {
		jsonRouters = append(jsonRouters, config.Config[i].JsonRouter)
	}
	sort.Strings(jsonRouters)
	return jsonRouters
}

func WithArrayJoin(formerName, lastName string) (string, string) {
	nextName := FormatColumnAsname(formerName, lastName)
	return fmt.Sprintf("CAST(JSONExtractKeysAndValues(arrayJoin(JSONExtractArrayRaw(%s[ '%s'])), 'String'), 'Map(String,String)') as %s", FormatColumnAsname(formerName), snakeString(lastName), nextName), nextName
}

func WithArrayJoinFirst(formerName string) (string, string) {
	nextName := FormatColumnAsname(formerName)
	return fmt.Sprintf("CAST(JSONExtractKeysAndValues(arrayJoin(JSONExtractArrayRaw(%s)), 'String'), 'Map(String,String)') as %s", formerName, nextName), nextName
}
func WithJSONExtractRawFirst(formerName string) (string, string) {
	nextName := FormatColumnAsname(formerName)
	return fmt.Sprintf("CAST(JSONExtractKeysAndValues(%s, 'String'), 'Map(String,String)') as %s", formerName, nextName), nextName
}
func WithJSONExtractRaw(formerName, lastName string) (string, string) {
	nextName := FormatColumnAsname(formerName, lastName)
	return fmt.Sprintf("CAST(JSONExtractKeysAndValues(%s['%s'],'String'), 'Map(String,String)') as %s", FormatColumnAsname(formerName), snakeString(lastName), nextName), nextName
}
func JsonRouterGenerateStruct(config ConfigStruct) {
	typeOfXc = reflect.TypeOf(t)
	for nodeName, node := range config.Config {
		if node.JsonRouter == config.getDatabaseColumn() {
			RecursionGenerateWith(node, typeOfXc, "")
		} else {
			log.Println(node.JsonRouter, "node.JsonRouter")
			reflectChildStruct, isHave := typeOfXc.FieldByName(node.JsonRouter)
			if !isHave {
				log.Panicf("json 路径错误 %s", nodeName)
			}
			if reflectChildStruct.Type.Kind() == reflect.Ptr {
				node.IsNullable = true
			}
			RecursionGenerateWith(node, reflectChildStruct.Type, "")
		}

	}
}

func JsonRouterGenerateGoStructCode(f reflect.StructField, subClass *ConfigSubClassStruct) {
	if subClass.SubClass != nil {
		for _, classStruct := range subClass.SubClass {
			if ReplaceOmitempty(f.Tag.Get("json")) == snakeString(classStruct.JsonRouter) {
				return
			}
		}
	}
	j := nullAbleOrNilStruct(f.Type.Kind())
	column := fmt.Sprintf("%s%s", subClass.Prefix, ReplaceOmitempty(f.Tag.Get("json")))
	if f.Type.Kind() == reflect.Ptr {
		subClass.GolangStructCode = append(subClass.GolangStructCode, fmt.Sprintf(j.GoStructOmitEmpty, camelString(column), column))
	} else {
		subClass.GolangStructCode = append(subClass.GolangStructCode, fmt.Sprintf(j.GoStruct, camelString(column), column))
	}
}
func JsonRouterGenerateGoCode(f reflect.StructField, subClass *ConfigSubClassStruct) {
	if subClass.SubClass != nil {
		for _, classStruct := range subClass.SubClass {
			if ReplaceOmitempty(f.Tag.Get("json")) == snakeString(classStruct.JsonRouter) {
				return
			}
		}
	}

	column := fmt.Sprintf("%s%s", subClass.Prefix, ReplaceOmitempty(f.Tag.Get("json")))
	if f.Type.Kind() == reflect.Struct || (f.Type.Kind() == reflect.Ptr && f.Type.Elem().Kind() == reflect.Struct) || f.Type.Kind() == reflect.Slice {
		subClass.GolangCode = append(subClass.GolangCode, fmt.Sprintf("marshal, err = json.Marshal(%s.%s)\n\tif err != nil {\n\t\tlogR(err)\n\t}\n\t tt.%s = string(marshal)", subClass.JsonRouterStruct, f.Name, camelString(column)))
	} else {
		haveAnd := ""
		if f.Type.Kind() == reflect.Ptr {
			haveAnd = "&"
		}
		a := fmt.Sprintf("tt.%s = %s%s.%s", camelString(column), haveAnd, subClass.JsonRouterStruct, f.Name)
		if f.Type.Kind() == reflect.Interface {
			a = fmt.Sprintf(`tt.%s = fmt.Sprintf("%%v", %s%s.%s)`, camelString(column), haveAnd, subClass.JsonRouterStruct, f.Name)
		}
		subClass.GolangCode = append(subClass.GolangCode, a)
	}
	subClass.GolangIsNullAbleCode = append(subClass.GolangIsNullAbleCode, fmt.Sprintf("tt.%s = nil", camelString(column)))

}

func JsonRouterGenerateSelectSql(f reflect.StructField, subClass *ConfigSubClassStruct) {
	if subClass.SubClass != nil {
		for _, classStruct := range subClass.SubClass {
			if ReplaceOmitempty(f.Tag.Get("json")) == snakeString(classStruct.JsonRouter) {
				return
			}
		}
	}
	j := nullAbleOrNilStruct(f.Type.Kind())
	isNllable := strings.Contains(f.Tag.Get("json"), "omitempty") || subClass.IsNullable
	column := ReplaceOmitempty(f.Tag.Get("json"))
	lastName := FormatColumnAsname(subClass.ParentRoute, subClass.JsonRouter)
	if subClass.ParentRoute == "" {
		lastName = FormatColumnAsname(subClass.JsonRouter)
	}

	c := fmt.Sprintf("%s['%s']", lastName, column)
	subClass.SelectSqls = append(subClass.SelectSqls, fmt.Sprintf("%s as %s", j.NullAbleFunc(c, isNllable), fmt.Sprintf("%s%s", subClass.Prefix, column)))
}

func JsonRouterGenerateCreateSql(f reflect.StructField, subClass *ConfigSubClassStruct) {
	if subClass.SubClass != nil {
		for _, classStruct := range subClass.SubClass {
			if ReplaceOmitempty(f.Tag.Get("json")) == snakeString(classStruct.JsonRouter) {
				return
			}
		}
	}
	j := nullAbleOrNilStruct(f.Type.Kind())
	column := ReplaceOmitempty(f.Tag.Get("json"))
	if strings.Contains(f.Tag.Get("json"), ",omitempty") || subClass.IsNullable {
		subClass.CreateSqls = append(subClass.CreateSqls, fmt.Sprintf("%s%s %s ", subClass.Prefix, column, j.NullabelType))
	} else {
		subClass.CreateSqls = append(subClass.CreateSqls, fmt.Sprintf("%s%s %s ", subClass.Prefix, column, j.CurrencyType))
	}
}
func ReplaceOmitempty(c string) string {
	return strings.Replace(c, ",omitempty", "", -1)
}
func RecursionGenerateWith(subClass *ConfigSubClassStruct, reflectStruct reflect.Type, parentRouteStruct string) {
	jsonRouterStruct := ""
	if parentRouteStruct == "" {
		subClass.JsonRouterStruct = "t"
		jsonRouterStruct = "t"
	}
	if jsonRouterStruct == "" {
		c := strings.Split(subClass.ParentRoute, ".")
		c = append(c, subClass.JsonRouter)
		jsonRouterStruct = camelString(strings.Join(c, "__"))
		if reflectStruct.Kind() == reflect.Slice {
			jsonRouterStruct = fmt.Sprintf("%sI", firstToLow(subClass.JsonRouter))

		}

		subClass.JsonRouterStruct = jsonRouterStruct
	}
	subClass.ParentRouteStruct = parentRouteStruct
	if subClass.SubClass != nil {
		for _, node := range subClass.SubClass {
			reflectStructChild := reflectStruct

			if reflectStruct.Kind() == reflect.Slice {
				reflectStructChild = reflectStruct.Elem()
			}
			if subClass.IsNullable || reflectStructChild.Kind() == reflect.Ptr {
				node.IsNullable = true
			}
			if reflectStructChild.Kind() == reflect.Ptr {
				reflectStructChild = reflectStructChild.Elem()

			}
			reflectChildStruct, isHave := reflectStructChild.FieldByName(node.JsonRouter)

			if !isHave {
				log.Panicf("json 路径错误 %s", node.JsonRouter)
			}
			RecursionGenerateWith(node, reflectChildStruct.Type, jsonRouterStruct)
		}
	}
	if reflectStruct.Kind() == reflect.Ptr || (reflectStruct.Kind() == reflect.Slice && reflectStruct.Elem().Kind() == reflect.Ptr) {
		subClass.IsNullable = true
	}
	if subClass.IsDecompose && subClass.CreateSqls == nil {
		subClass.CreateSqls = make([]string, 0)
	}
	if subClass.IsDecompose && subClass.SelectSqls == nil {
		subClass.SelectSqls = make([]string, 0)
	}

	if reflectStruct.Kind() == reflect.Slice || (reflectStruct.Kind() == reflect.Ptr && reflectStruct.Elem().Kind() == reflect.Slice) {
		var ws string
		if subClass.ParentRoute == "" {
			ws, _ = WithArrayJoinFirst(subClass.JsonRouter)
		} else {
			ws, _ = WithArrayJoin(subClass.ParentRoute, subClass.JsonRouter)
		}
		subClass.Kind = reflect.Slice
		subClass.WithSql = ws
		subClass.GolangCode = make([]string, 0)
		subClass.GolangIsNullAbleCode = make([]string, 0)
		if subClass.Kind != reflect.Slice {
			if subClass.ParentRouteStruct != "" {
				subClass.GolangCode = append(subClass.GolangCode, fmt.Sprintf("%s := %s.%s", subClass.JsonRouterStruct, subClass.ParentRouteStruct, subClass.JsonRouter))
			}
		}
		if reflectStruct.Elem().Kind() == reflect.Ptr {
			subClass.GolangCodeAssignment = fmt.Sprintf(`if %s != nil {%s}`, subClass.JsonRouterStruct, "%s")
		}
		if subClass.IsDecompose {
			subClass.CreateSqls = make([]string, 0)
			subClass.SelectSqls = make([]string, 0)
			subClass.GolangStructCode = make([]string, 0)

			subClass.GolangIsNullAbleCode = append(subClass.GolangIsNullAbleCode, fmt.Sprintf("%s = %s.%s", subClass.JsonRouterStruct, subClass.ParentRouteStruct, reflectStruct.Name()))
			r := reflectStruct.Elem()
			subClass.GolangCodeAssignment = ""
			if reflectStruct.Elem().Kind() == reflect.Ptr {
				r = reflectStruct.Elem().Elem()
			}

			for i := 0; i < r.NumField(); i++ {
				JsonRouterGenerateCreateSql(r.Field(i), subClass)
				JsonRouterGenerateSelectSql(r.Field(i), subClass)
				JsonRouterGenerateGoStructCode(r.Field(i), subClass)
				JsonRouterGenerateGoCode(r.Field(i), subClass)
			}
		}

	} else {
		var ws string
		if subClass.ParentRoute == "" {
			ws, _ = WithJSONExtractRawFirst(subClass.JsonRouter)
		} else {
			ws, _ = WithJSONExtractRaw(subClass.ParentRoute, subClass.JsonRouter)
		}
		subClass.WithSql = ws
		subClass.GolangCodeAssignment = ""
		fmt.Println(subClass.JsonRouterStruct, reflectStruct.Kind(), "------------------")
		if reflectStruct.Kind() == reflect.Ptr {
			reflectStruct = reflectStruct.Elem()
			fmt.Println("true")
			subClass.GolangCodeAssignment = fmt.Sprintf(`if %s != nil {%s}`, subClass.JsonRouterStruct, "%s")
		}
		subClass.Kind = reflectStruct.Kind()
		subClass.GolangCode = make([]string, 0)
		subClass.GolangIsNullAbleCode = make([]string, 0)
		if subClass.Kind != reflect.Slice {
			if subClass.ParentRouteStruct != "" {
				subClass.GolangCode = append(subClass.GolangCode, fmt.Sprintf("%s := %s.%s", subClass.JsonRouterStruct, subClass.ParentRouteStruct, subClass.JsonRouter))
			}
		}
		if subClass.IsDecompose {
			subClass.CreateSqls = make([]string, 0)
			subClass.SelectSqls = make([]string, 0)
			subClass.GolangStructCode = make([]string, 0)
			subClass.GolangIsNullAbleCode = append(subClass.GolangIsNullAbleCode, fmt.Sprintf("%s = %s.%s", subClass.JsonRouterStruct, subClass.ParentRouteStruct, subClass.JsonRouter))
			for i := 0; i < reflectStruct.NumField(); i++ {
				JsonRouterGenerateCreateSql(reflectStruct.Field(i), subClass)
				JsonRouterGenerateSelectSql(reflectStruct.Field(i), subClass)
				JsonRouterGenerateGoStructCode(reflectStruct.Field(i), subClass)
				JsonRouterGenerateGoCode(reflectStruct.Field(i), subClass)
			}
		}
	}
}

type JsonExtractAndNullableAndType struct {
	JsonExtract         string `json:"json_extract"`
	NullabelType        string `json:"nullabel_type"`
	NullAbleFunc        func(column string, isNullable bool) string
	NullableJson        string       `json:"nullable_json"`
	CurrencyType        string       `json:"currency_type"`
	GoStruct            string       `json:"go_struct"`
	GoStructOmitEmpty   string       `json:"go_struct_omit_empty"`
	CurrencyReflectType reflect.Kind `json:"currency_ref_type"`
}

func nullAbleOrNilStruct(columnType reflect.Kind) JsonExtractAndNullableAndType {
	nullableStr := "Nullable(%s)"
	switch columnType {
	case reflect.Int:
		return JsonExtractAndNullableAndType{
			JsonExtract:         "toInt64",
			NullableJson:        "toInt64OrNull",
			NullabelType:        fmt.Sprintf(nullableStr, "Int64"),
			CurrencyType:        "Int64",
			CurrencyReflectType: reflect.Int64,
			GoStruct:            "%s int `json:\"%s\"`",
			GoStructOmitEmpty:   "%s *int `json:\"%s\"`",
			NullAbleFunc: func(column string, isNullable bool) string {
				if isNullable {
					return "toInt64OrNull(" + column + ")"
				} else {
					return "toInt64(" + column + ")"
				}
			},
		}
	case reflect.Bool:
		return JsonExtractAndNullableAndType{
			JsonExtract:         "if(%s='true',1,0)",
			NullableJson:        "toUInt8OrNull(multiIf(%s='true','1',%s='false','0',''))",
			NullabelType:        fmt.Sprintf(nullableStr, "UInt8"),
			CurrencyType:        "UInt8",
			CurrencyReflectType: reflect.Uint8,
			GoStruct:            "%s bool `json:\"%s\"`",
			GoStructOmitEmpty:   "%s *bool `json:\"%s\"`",
			NullAbleFunc: func(column string, isNullable bool) string {
				if isNullable {
					return "toUInt8OrNull(multiIf(" + column + "='true','1'," + column + "='false','0',''))"
				} else {
					return "toUInt8(if(" + column + "='true',1,0))"
				}
			},
		}
	case reflect.Float64:
		return JsonExtractAndNullableAndType{
			JsonExtract:         "toFloat64OrZero",
			NullableJson:        "toFloat64OrNull",
			NullabelType:        fmt.Sprintf(nullableStr, "Float64"),
			CurrencyType:        "Float64",
			CurrencyReflectType: reflect.Float64,
			GoStruct:            "%s float64 `json:\"%s\"`",
			GoStructOmitEmpty:   "%s *float64 `json:\"%s\"`",
			NullAbleFunc: func(column string, isNullable bool) string {
				if isNullable {
					return "toFloat64OrNull(" + column + ")"
				} else {
					return "toFloat64(" + column + ")"
				}
			},
		}
	case reflect.Float32:
		return JsonExtractAndNullableAndType{
			JsonExtract:         "toFloat32",
			NullableJson:        "toFloat32OrNull",
			NullabelType:        fmt.Sprintf(nullableStr, "Float32"),
			CurrencyType:        "Float32",
			CurrencyReflectType: reflect.Int32,
			GoStruct:            "%s float32 `json:\"%s\"`",
			GoStructOmitEmpty:   "%s *float32 `json:\"%s\"`",
			NullAbleFunc: func(column string, isNullable bool) string {
				if isNullable {
					return "toFloat32OrNull(" + column + ")"
				} else {
					return "toFloat32(" + column + ")"
				}
			},
		}
	default:
		return JsonExtractAndNullableAndType{
			JsonExtract:         "",
			NullableJson:        "if(%s = '',Null,%s)",
			NullabelType:        fmt.Sprintf(nullableStr, "String"),
			CurrencyType:        fmt.Sprintf(nullableStr, "String"),
			CurrencyReflectType: reflect.String,
			GoStruct:            "%s string `json:\"%s\"`",
			GoStructOmitEmpty:   "%s string `json:\"%s\"`",
			NullAbleFunc: func(column string, isNullable bool) string {
				return "if(" + column + " = '',Null," + column + ")"
			},
		}
	}
}

func FormatColumnAsname(name ...string) string {
	nameStr := strings.Join(name, ".")
	nameHasSplit := strings.Replace(nameStr, ".", "_", -1)
	return fmt.Sprintf("%s_join", snakeString(nameHasSplit))
}

func camelString(s string) string {
	parts := strings.Split(s, "_")
	for i := 0; i < len(parts); i++ {
		parts[i] = strings.Title(parts[i])
	}
	return strings.Join(parts, "")
}
func firstToLow(str string) string {
	return strings.ToLower(str[0:1]) + str[1:]
}
func snakeString(s string) string {
	data := make([]byte, 0, len(s)*2)
	j := false
	num := len(s)
	for i := 0; i < num; i++ {
		d := s[i]
		if i > 0 && d >= 'A' && d <= 'Z' && j {
			data = append(data, '_')
		}
		if d != '_' {
			j = true
		}
		data = append(data, d)
	}
	return strings.ToLower(string(data[:]))
}

func GenerateSql(config ConfigStruct) {
	a1s := make([]string, 0)
	for s, classStruct := range config.Config {
		log.Printf("当前解析:%s", s)
		analysisConfigStruct2Txt(classStruct)
		a1, _ := analysisConfigStruct2GolangCode(classStruct)
		a1s = append(a1s, a1)
	}

	generateCreateSql(config)
	generatePythonFile(config)
	generateSelectSql(config)
	goS := generateGoStruct(config)
	tStruct := ReadTStruct("t_struct.go")
	a := fmt.Sprintf(template.Temp["go"], goS, tStruct, strings.Join(a1s, "\n\r"))
	if config.getFilename() != "" {
		err := os.WriteFile(strings.Replace(config.getFilename(), ".", "_goooog.", -1), []byte(a), 0o666)
		LogPanicLnErr(err)
	}
}
func generatePythonFile(config ConfigStruct) {
	c := strings.Join(createSqls, "\n\t,")
	s := fmt.Sprintf("%s%s%s", strings.Join(withSqls, "\n\t,"), "\nselect \n	", strings.Join(selectSqls, "\n\t,"))
	sourceTable := config.GetSourceTable()
	sourceTableNotSource := strings.Replace(sourceTable, "source_", "", -1)
	pythonClassName := config.GetPythonClassName()
	inputTable := strings.Replace(sourceTableNotSource, ".", "._", -1)
	outputTable := strings.Replace(sourceTableNotSource, ".", ".clean_", -1)
	mvTable := strings.Replace(sourceTableNotSource, ".", "._mv_", -1)
	store := "select 1"
	if config.IsStoreTable {
		store = fmt.Sprintf("create table if not exists {self.OUTPUT_TABLE} (\n\t%s\n\t,source_time DateTime\n\t,inserted_time  DateTime default now() \n)engine=🍌🍌🍌", c)
	}
	a := fmt.Sprintf(template.Temp["clean"], pythonClassName, inputTable, outputTable, mvTable, sourceTable, store, c, s)
	if config.getFilename() != "" {
		err := os.WriteFile(strings.Replace(config.getFilename(), ".", "_python.", -1), []byte(a), 0o666)
		LogPanicLnErr(err)
	}
}
func generateCreateSql(config ConfigStruct) {
	buffer := &bytes.Buffer{}
	buffer.Grow(65536)
	fmt.Fprintf(buffer, "create table if not exists T (\n	")
	fmt.Fprintf(buffer, strings.Join(createSqls, "\n\t,"))
	fmt.Fprintf(buffer, "\n)engine=Null")
	if !*debugFlagParse {
		fmt.Println(buffer.String())
	}
	if config.getFilename() != "" {
		err := os.WriteFile(strings.Replace(config.getFilename(), ".", "_create.", -1), buffer.Bytes(), 0o666)
		LogPanicLnErr(err)
	}
}
func generateGoStruct(config ConfigStruct) string {
	buffer := &bytes.Buffer{}
	buffer.Grow(65536)
	fmt.Fprintf(buffer, "type TT struct{\n	")
	fmt.Fprintf(buffer, strings.Join(goStruct, "\n\t"))
	fmt.Fprintf(buffer, "\n}")
	if !*debugFlagParse {
		fmt.Println(buffer.String())
	}
	if config.getFilename() != "" {
		if config.getFilename() != "" {
			err := os.WriteFile(strings.Replace(config.getFilename(), ".", "_go.", -1), buffer.Bytes(), 0o666)
			LogPanicLnErr(err)
		}
	}
	return buffer.String()
}
func generateSelectSql(config ConfigStruct) {
	buffer := &bytes.Buffer{}
	buffer.Grow(655360)
	fmt.Fprintf(buffer, "with \n	")
	fmt.Fprintf(buffer, strings.Join(withSqls, "\n\t,"))
	fmt.Fprintf(buffer, "\nselect \n	")
	fmt.Fprintf(buffer, strings.Join(selectSqls, "\n\t,"))
	fmt.Fprintf(buffer, "\nFROM T")
	if !*debugFlagParse {
		fmt.Println(buffer.String())
	}
	if config.getFilename() != "" {
		err := os.WriteFile(strings.Replace(config.getFilename(), ".", "_select.", -1), buffer.Bytes(), 0o666)
		LogPanicLnErr(err)
	}
}

func analysisConfigStruct2Txt(subClass *ConfigSubClassStruct) {
	if subClass.SubClass != nil {
		for s, classStruct := range subClass.SubClass {
			log.Printf("当前解析:%s", s)
			analysisConfigStruct2Txt(classStruct)
		}
	}
	if subClass.WithSql != "" {
		withSqls = append([]string{subClass.WithSql}, withSqls...)
	}
	if subClass.SelectSqls != nil && len(subClass.SelectSqls) != 0 {
		selectSqls = append([]string{strings.Join(subClass.SelectSqls, "\n\t,")}, selectSqls...)
	}
	if subClass.CreateSqls != nil && len(subClass.CreateSqls) != 0 {
		createSqls = append([]string{strings.Join(subClass.CreateSqls, "\n\t,")}, createSqls...)
	}
	if subClass.GolangStructCode != nil && len(subClass.GolangStructCode) != 0 {
		goStruct = append([]string{strings.Join(subClass.GolangStructCode, "\n\t")}, goStruct...)
	}
}

func analysisConfigStruct2GolangCode(subClass *ConfigSubClassStruct) (string, string) {
	log.Printf("当前解析 层级 GO CODE:%s", subClass.JsonRouter)
	if subClass.SubClass != nil {
		code := ""
		codeNotNullAbleSub := make([]string, 0)
		codeNullAbleSub := make([]string, 0)
		if subClass.Kind == reflect.Slice {
			code = fmt.Sprintf(`for _, %s := range t.%s {
	%s
}`, subClass.JsonRouterStruct, subClass.JsonRouter, "%s")
		} else {
			code = "%s"
		}
		codeNotNullAbleSub = append(codeNotNullAbleSub, subClass.GolangCode...)
		for s, classStruct := range subClass.SubClass {
			log.Printf("当前解析GO CODE:%s", s)
			notNullAble, nullAble := analysisConfigStruct2GolangCode(classStruct)
			codeNotNullAbleSub = append(codeNotNullAbleSub, notNullAble)
			codeNullAbleSub = append(codeNullAbleSub, nullAble)
		}
		if subClass.GolangCodeAssignment != "" {
			return fmt.Sprintf("%s\n%s", subClass.GolangCode[0], fmt.Sprintf(subClass.GolangCodeAssignment, strings.Join(subClass.GolangCode[1:], "\n\t"))), strings.Join(subClass.GolangIsNullAbleCode, "\n\t")
		}
		code = fmt.Sprintf(code, strings.Join(codeNotNullAbleSub, "\n\t"))
		return code, ""
	}
	fmt.Println(subClass.ParentRoute, subClass.JsonRouter, subClass.GolangCodeAssignment)
	if subClass.GolangCodeAssignment != "" {
		return fmt.Sprintf("%s\n%s", subClass.GolangCode[0], fmt.Sprintf(subClass.GolangCodeAssignment, strings.Join(subClass.GolangCode[1:], "\n\t"))), strings.Join(subClass.GolangIsNullAbleCode, "\n\t")
	}
	return strings.Join(subClass.GolangCode, "\n\t"), strings.Join(subClass.GolangIsNullAbleCode, "\n\t")

}

func main() {
	flag.Parse()
	dirName := "file"
	if *filenameFlagParse != "" {
		m := fmt.Sprintf("%s/%s", dirName, *filenameFlagParse)
		filenameFlagParse = &m
	}
	if _, err := os.Stat(dirName); os.IsNotExist(err) {
		// 文件夹不存在，创建
		err = os.MkdirAll(dirName, os.ModePerm)
		if err != nil {
			log.Panicln("创建文件夹失败：", err)
			return
		}
	}

	config := initMain()
	JsonRouterGenerateStruct(config)
	GenerateSql(config)
	config.SaveFile(configJsonFile)
}
