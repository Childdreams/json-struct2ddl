package main

import (
	"app/v2/template"
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
			RecursionGenerateWith(node, typeOfXc)
		} else {
			log.Println(node.JsonRouter, "node.JsonRouter")
			reflectChildStruct, isHave := typeOfXc.FieldByName(node.JsonRouter)
			if !isHave {
				log.Panicf("json 路径错误 %s", nodeName)
			}
			if reflectChildStruct.Type.Kind() == reflect.Ptr {
				node.IsNullable = true
			}
			RecursionGenerateWith(node, reflectChildStruct.Type)
		}

	}
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
func RecursionGenerateWith(subClass *ConfigSubClassStruct, reflectStruct reflect.Type) {
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
			RecursionGenerateWith(node, reflectChildStruct.Type)
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

	log.Println(subClass.JsonRouter, "subClass.JsonRouter")
	if reflectStruct.Kind() == reflect.Slice || (reflectStruct.Kind() == reflect.Ptr && reflectStruct.Elem().Kind() == reflect.Slice) {
		var ws string
		if subClass.ParentRoute == "" {
			ws, _ = WithArrayJoinFirst(subClass.JsonRouter)
		} else {
			ws, _ = WithArrayJoin(subClass.ParentRoute, subClass.JsonRouter)
		}
		subClass.Kind = reflect.Slice
		subClass.WithSql = ws
		if subClass.IsDecompose {
			subClass.CreateSqls = make([]string, 0)
			subClass.SelectSqls = make([]string, 0)
			r := reflectStruct.Elem()
			if reflectStruct.Elem().Kind() == reflect.Ptr {
				r = reflectStruct.Elem().Elem()
			}
			for i := 0; i < r.NumField(); i++ {
				JsonRouterGenerateCreateSql(r.Field(i), subClass)
				JsonRouterGenerateSelectSql(r.Field(i), subClass)
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
		if reflectStruct.Kind() == reflect.Ptr {
			reflectStruct = reflectStruct.Elem()
		}
		subClass.Kind = reflectStruct.Kind()
		if subClass.IsDecompose {
			subClass.CreateSqls = make([]string, 0)
			subClass.SelectSqls = make([]string, 0)
			for i := 0; i < reflectStruct.NumField(); i++ {
				JsonRouterGenerateCreateSql(reflectStruct.Field(i), subClass)
				JsonRouterGenerateSelectSql(reflectStruct.Field(i), subClass)
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

	for s, classStruct := range config.Config {
		log.Printf("当前解析:%s", s)
		analysisConfigStruct2Txt(classStruct)
	}
	generateCreateSql(config)
	generatePythonFile(config)
	generateSelectSql(config)
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
}

func main() {
	flag.Parse()
	config := initMain()
	JsonRouterGenerateStruct(config)
	GenerateSql(config)
	config.SaveFile(configJsonFile)
}
