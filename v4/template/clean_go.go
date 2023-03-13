package template

import (
	"strings"
)

func CleanGo() string {
	a := `package main

import (
	"app/databases/clickhouse"
	"context"
	"encoding/json"
	"fmt"
	"log"
	"time"
)

%s

%s

type SourceData struct {
	SpiderType string   丨json:"spider_type"  ch:"spider_type"丨
	Seed       string    丨json:"seed" ch:"seed"丨
	SpiderData string    丨json:"spider_data" ch:"spider_data"丨
	CreatedAt  time.Time 丨json:"created_at" ch:"created_at"丨
}
func logR(err error){
	log.Panicln(err.Error())
}
func main() {
	var err error
	sql := ""
	rows, err := clickhouse.ClickHouse.Query(context.Background(), sql)
	if err != nil {
		return
	}
	tts := make([]TT, 0)
	for rows.Next() {
		sourceData := SourceData{}
		err = rows.ScanStruct(&sourceData)
		if err != nil {
			return
		}
		t := T{}
		err = json.Unmarshal([]byte(sourceData.SpiderData), &t)
		if err != nil {
			return
		}
		tt := TT{}
		var (
			marshal []byte
		)
		%s
		tts = append(tts, tt)
	}
}
`
	return strings.ReplaceAll(a, "丨", "`")
}
