package main

import (
	"bytes"
	"flag"
	"fmt"
	"log"
	"os"
	"reflect"
	"regexp"
	"strings"
)

var (
	t                        T
	tableName                = flag.String("table_name", "", "database.table")
	prefix                   = flag.String("prefix", "", "名称的前缀")
	filename                 = flag.String("filename", "", "可以多次操作")
	jsonRouter               = flag.String("json_router", "", "json从哪个位置开始")
	databaseColumn           = flag.String("database_column", "data", "json从哪个位置开始")
	debug                    = flag.Bool("debug", true, "json从哪个位置开始")
	columnPrefix             = ""
	lastJsonName             = "" // with 最后使用的字段名称
	jsonRoutersJson          = make([]string, 0)
	jsonRoutersJsonArrayJoin = ""
	sqlSlice                 = make([]string, 0)
	typeOfXc                 reflect.Type
	isHave                   = false
	feildChildStruct         reflect.StructField
)

func WithArrayJoin(formerName string) {
	nextName := fmt.Sprintf("%s_%s_json_join", strings.Replace(lastJsonName, "_json_join", "", -1), jsonRoutersJson[len(jsonRoutersJson)-1])
	sqlSlice = append(sqlSlice, fmt.Sprintf("    arrayJoin(JSONExtractArrayRaw(%s, '%s')) as %s", formerName, strings.Join(jsonRoutersJson, "','"), nextName))
	lastJsonName = nextName
}

func WithJSONExtractRaw(router string) {
	router = strings.Replace(feildChildStruct.Tag.Get("json"), ",omitempty", "", -1)
	lastJsonName1 := fmt.Sprintf("%s_%s_json_join", strings.Replace(lastJsonName, "_json_join", "", -1), router)
	jsonRoutersJson = append(jsonRoutersJson, strings.Replace(feildChildStruct.Tag.Get("json"), ",omitempty", "", -1))
	sqlSlice = append(sqlSlice, fmt.Sprintf("    JSONExtractRaw(%s, '%s') as %s", lastJsonName, jsonRoutersJson[len(jsonRoutersJson)-1], lastJsonName1))
	lastJsonName = lastJsonName1
}

func JsonRouterGenerateWithSql() {
	jsonRouters := strings.Split(*jsonRouter, ".")
	feildChild := typeOfXc
	for _, router := range jsonRouters {
		feildChildStruct, isHave = feildChild.FieldByName(router)
		if !isHave {
			log.Panicf("json 路径错误 %s", router)
		}
		if feildChildStruct.Type.Kind() == reflect.Slice {
			jsonRoutersJson = make([]string, 0)
			jsonRoutersJson = append(jsonRoutersJson, strings.Replace(feildChildStruct.Tag.Get("json"), ",omitempty", "", -1))
			WithArrayJoin(lastJsonName)
			databaseColumn = &lastJsonName
			feildChild = feildChildStruct.Type.Elem()

			feildChild = feildChildStruct.Type.Elem()
		} else {
			WithJSONExtractRaw(router)
		}
		if feildChildStruct.Type.Kind() == reflect.Slice {
			feildChild = feildChildStruct.Type.Elem()
		} else {
			feildChild = feildChildStruct.Type
		}

	}
	typeOfXc = feildChild
}

func main() {
	flag.Parse()
	typeOfXc = reflect.TypeOf(t)
	lastJsonName = *databaseColumn
	if *jsonRouter != "" {
		JsonRouterGenerateWithSql()
	}

	buffer := &bytes.Buffer{}
	bufferSelect := &bytes.Buffer{}
	buffer.Grow(65536)
	bufferSelect.Grow(65536)
	if *tableName != "" {
		fmt.Fprintf(buffer, "create table if not exists %v (\n    ", *tableName)
	} else {
		fmt.Fprintf(buffer, "create table if not exists T (\n    ")
		*tableName = "T"
	}
	if *prefix != "" {
		columnPrefix = fmt.Sprintf("%v", *prefix)
	}

	columns := columnCreate(typeOfXc, columnPrefix, jsonRoutersJson)
	if lastJsonName == "" {
		lastJsonName = *databaseColumn
	}
	columnsSelect := sqlCreate(typeOfXc, columnPrefix, []string{}, lastJsonName)
	columnsStr := strings.Join(columns, ",\n    ")
	columnsSelectStr := strings.Join(columnsSelect, ",\n    ")
	fmt.Fprintf(buffer, "%s\n )engine=Null", columnsStr)
	fmt.Fprintf(bufferSelect, "with \n %s \nselect\n    %s \nfrom %s", strings.Join(sqlSlice, ","), columnsSelectStr, *tableName)
	sqlFilename := ""
	createFileName := ""
	if *filename != "" {
		sqlFilename = strings.Replace(*filename, ".", "_select_sql.", -1)
		createFileName = strings.Replace(*filename, ".", "_create_sql.", -1)
	}
	saveFileCreate(createFileName, buffer.Bytes(), columnsStr)
	saveFileSql(sqlFilename, bufferSelect.Bytes(), columnsSelectStr, sqlSlice)

}

func saveFileCreate(filename string, content []byte, columnsStr string) {
	if filename != "" {
		fileInfo, err := os.Stat(filename)
		if err != nil {
			_, err = os.Create(filename)
			if err != nil {
				log.Panicln(err.Error())
			}
			fileInfo, _ = os.Stat(filename)
		}
		if fileInfo.Size() != 0 {
			content, err = os.ReadFile(filename)
			if err != nil {
				log.Panicln(err.Error())
			}
			content1 := strings.Replace(string(content), "\n )engine=Null", fmt.Sprintf(",\n    %s\n )engine=Null", columnsStr), -1)
			if *debug {
				fmt.Println(content1)
			}
			err = os.WriteFile(filename, []byte(content1), 0o666)
			if err != nil {
				log.Panicln(err.Error())
			}
		} else {
			if *debug {
				fmt.Println(string(content))
			}
			err = os.WriteFile(filename, content, 0o666)
			if err != nil {
				log.Panicln(err.Error())
			}
		}
	} else {
		if *debug {
			fmt.Println(string(content))
		}
	}

}
func saveFileSql(filename string, content []byte, columnsSelectStr string, withSqls []string) {
	if filename != "" {
		fileInfo, err := os.Stat(filename)
		if err != nil {
			_, err = os.Create(filename)
			if err != nil {
				log.Panicln(err.Error())
			}
			fileInfo, _ = os.Stat(filename)
		}
		if fileInfo.Size() != 0 {
			content, err = os.ReadFile(filename)
			if err != nil {
				log.Panicln(err.Error())
			}
			r := regexp.MustCompile("\nfrom[a-zA-Z ]+")
			fromTable := r.FindAllString(string(content), -1)
			if len(fromTable) == 0 {
				log.Panicln("sql原始文件错误")
			}
			content = []byte(r.ReplaceAllString(string(content), ""))
			content1 := fmt.Sprintf("%s,\n    %s%s", content, columnsSelectStr, fromTable[0])
			if string(content)[0:4] != "with" {
				content1 = fmt.Sprintf("with \n  %s \n %s,\n    %s%s", strings.Join(withSqls, ",\n"), content, columnsSelectStr, fromTable[0])
			} else {
				rSelect := regexp.MustCompile("\nselect")
				noRepeatWith := make([]string, 0)
				for i := range withSqls {
					if !strings.Contains(string(content), withSqls[i]) {
						noRepeatWith = append(noRepeatWith, withSqls[i])
					}
				}
				content1 = rSelect.ReplaceAllString(string(content), fmt.Sprintf(",\n %s\nselect", strings.Join(noRepeatWith, ",\n")))
				content1 = fmt.Sprintf("%s,\n    %s%s", content1, columnsSelectStr, fromTable[0])
			}
			if *debug {
				fmt.Println(content1, "content1")
			}
			err = os.WriteFile(filename, []byte(content1), 0o666)
			if err != nil {
				log.Panicln(err.Error())
			}
		} else {
			if *debug {
				fmt.Println(string(content))
			}
			err = os.WriteFile(filename, content, 0o666)
			if err != nil {
				log.Panicln(err.Error())
			}
		}
	} else {
		if *debug {
			fmt.Println(string(content))
		}
	}

}
func sqlCreate(typeOfXc reflect.Type, columnPrefix string, jsonRouters []string, databaseColumn string) []string {
	columnsSelect := make([]string, 0)
	if typeOfXc.Kind() == reflect.Ptr {
		typeOfXc = typeOfXc.Elem()
	}
	for i := 0; i < typeOfXc.NumField(); i++ {
		fieldType := typeOfXc.Field(i)
		// 输出成员名和tag
		columnName := strings.Replace(fieldType.Tag.Get("json"), ",omitempty", "", -1)
		columnAsName := snakeString(fmt.Sprintf("%s%s", columnPrefix, columnName))
		newJsonRoute := make([]string, 0)
		newJsonRoute = jsonRouters
		newJsonRoute = append(newJsonRoute, columnName)
		switch fieldType.Type.Kind() {
		case reflect.Int:
			columnsSelect = append(columnsSelect, fmt.Sprintf("JSONExtractInt(%s,'%s') as %s", databaseColumn, strings.Join(newJsonRoute, "','"), columnAsName))
		case reflect.Float64:
			columnsSelect = append(columnsSelect, fmt.Sprintf("JSONExtractFloat(%s,'%s') as %s", databaseColumn, strings.Join(newJsonRoute, "','"), columnAsName))
		case reflect.Bool:
			columnsSelect = append(columnsSelect, fmt.Sprintf("JSONExtractBool(%s,'%s') as %s", databaseColumn, strings.Join(newJsonRoute, "','"), columnAsName))
		case reflect.Struct:
			feildChild, isHave := fieldType.Type.FieldByName("Value")
			if !isHave {
				columnsSelect = append(columnsSelect, fmt.Sprintf("JSONExtractString(%s,'%s') as %s", databaseColumn, strings.Join(newJsonRoute, "','"), columnAsName))
			} else {
				if feildChild.Type.Kind() == reflect.Int {
					columnsSelect = append(columnsSelect, fmt.Sprintf("JSONExtractInt(%s,'%s','value') as %s", databaseColumn, strings.Join(newJsonRoute, "','"), columnAsName))
				} else if feildChild.Type.Kind() == reflect.Float64 {
					columnsSelect = append(columnsSelect, fmt.Sprintf("JSONExtractFloat(%s,'%s','value') as %s", databaseColumn, strings.Join(newJsonRoute, "','"), columnAsName))
				} else if feildChild.Type.Kind() == reflect.Bool {
					columnsSelect = append(columnsSelect, fmt.Sprintf("JSONExtractInt(%s,'%s','value') as %s", databaseColumn, strings.Join(newJsonRoute, "','"), columnAsName))
				} else {
					columnsSelect = append(columnsSelect, fmt.Sprintf("JSONExtractString(%s,'%s','value') as %s", databaseColumn, strings.Join(newJsonRoute, "','"), columnAsName))
				}
			}
		default:
			columnsSelect = append(columnsSelect, fmt.Sprintf("JSONExtractString(%s,'%s') as %s", databaseColumn, strings.Join(newJsonRoute, "','"), columnAsName))
		}
	}
	return columnsSelect
}
func columnCreate(typeOfXc reflect.Type, columnPrefix string, jsonRouters []string) []string {
	columns := make([]string, 0)
	isAllColumnNullAble := false
	if typeOfXc.Kind() == reflect.Ptr {
		typeOfXc = typeOfXc.Elem()
		isAllColumnNullAble = true
	}
	for i := 0; i < typeOfXc.NumField(); i++ {
		fieldType := typeOfXc.Field(i)
		// 输出成员名和tag
		columnName := strings.Replace(fieldType.Tag.Get("json"), ",omitempty", "", -1)
		columnAsName := snakeString(fmt.Sprintf("%s%s", columnPrefix, columnName))
		newJsonRoute := make([]string, 0)
		newJsonRoute = jsonRouters
		newJsonRoute = append(newJsonRoute, columnName)
		typeStr := nullAbleOrNil(fieldType.Type.Kind(), strings.Contains(fieldType.Tag.Get("json"), "omitempty"))
		if isAllColumnNullAble {
			typeStr = nullAbleOrNil(fieldType.Type.Kind(), isAllColumnNullAble)
		}
		switch fieldType.Type.Kind() {
		case reflect.Int:
			columns = append(columns, fmt.Sprintf("%s %s ", columnAsName, typeStr))
		case reflect.Float64:
			columns = append(columns, fmt.Sprintf("%s %s ", columnAsName, typeStr))
		case reflect.Bool:
			columns = append(columns, fmt.Sprintf("%s %s ", columnAsName, typeStr))
		case reflect.Struct:
			feildChild, isHave := fieldType.Type.FieldByName("Value")
			typeStrSlice := nullAbleOrNil(fieldType.Type.Kind(), strings.Contains(fieldType.Tag.Get("json"), "omitempty"))
			if !isHave {
				columns = append(columns, fmt.Sprintf("%s String ", columnAsName))
			} else {
				if feildChild.Type.Kind() == reflect.Int {
					columns = append(columns, fmt.Sprintf("%s %s ", columnAsName, typeStrSlice))
				} else if feildChild.Type.Kind() == reflect.Float64 {
					columns = append(columns, fmt.Sprintf("%s %s ", columnAsName, typeStrSlice))
				} else if feildChild.Type.Kind() == reflect.Bool {
					columns = append(columns, fmt.Sprintf("%s %s ", columnAsName, typeStrSlice))
				} else {
					columns = append(columns, fmt.Sprintf("%s %s ", columnAsName, typeStrSlice))
				}
			}
		default:
			columns = append(columns, fmt.Sprintf("%s %s ", columnAsName, typeStr))
		}
	}
	return columns
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

func nullAbleOrNil(columnType reflect.Kind, isNullable bool) string {
	nullableStr := "%s"
	if isNullable {
		nullableStr = "Nullable(%s)"
	}
	switch columnType {
	case reflect.Int:
		return fmt.Sprintf(nullableStr, "Int64")
	case reflect.Bool:
		return fmt.Sprintf(nullableStr, "UInt8")
	case reflect.Float64:
		return fmt.Sprintf(nullableStr, "Float64")
	case reflect.Float32:
		return fmt.Sprintf(nullableStr, "Float32")
	default:
		return fmt.Sprintf(nullableStr, "String")

	}
}
