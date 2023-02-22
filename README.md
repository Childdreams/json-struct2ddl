# Json2ddl

### v2

```
ch202 -q "select data from T" | gojsonstruct > t_struct.go && go run .
--json_router=xx.xx.x // 需要解析的json路径 golang struct的格式 
--clear 清理config配置文件 , 如果解析新的json 请在第一次时候增加该参数
--database_database_column sql中需要解析json字段 
--prefix 解析增加的前缀
--filename 保存的文件名称
--debug 不打印输出
```