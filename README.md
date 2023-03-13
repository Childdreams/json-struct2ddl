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

### 20230224

- 可以生成python文件
- 增加 source_table 参数 生成python文件的input、output、mv 表名
- 增加 python_class_name 生成python的类名称

### 20230314
- 增加V3-V4版本 v3版本是V2版本速度的5倍 V4版本是V3的5倍
- V4版本直接生成golang代碼
