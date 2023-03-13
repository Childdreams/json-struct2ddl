package template

func Clean() string {
	return `from interface.clean_interface import CleanInterface
from utils.log import debug_log, log_method_name

class %s(CleanInterface):
    INPUT_TABLE = "%s"

    OUTPUT_TABLE = "%s"

    MATERIALIZED_VIEW = "%s"

    SOURCE_TABLE = "%s"

    @debug_log
    def input_table_sql(self) -> str:
        '''
        输入表建表语句
        :return:
        '''
        pass
    
    @debug_log
    def store_table_sql(self) -> str:
        '''
        存储表建表语句
        :return:
        '''
        return f"""
%s
"""
    
    @debug_log
    def output_table_sql(self) -> str:
        '''
        远程表建表语句
        :return:
        '''
        return f"""
create table if not exists {self.OUTPUT_TABLE} (
	%s
	,source_time DateTime
	,inserted_time  DateTime default now() 
)engine=🍌🍌🍌
        """
    
    @debug_log
    def materialized_view_sql(self) -> str:
        '''
        物化视图建表语句
        :return:
        '''
        return f"""
create materialized view if not exists {self.MATERIALIZED_VIEW} to {self.OUTPUT_TABLE}
as
with
	%s
	,created_time as source_time
	,now() as inserted_time
FROM {self.INPUT_TABLE}
"""
`
}
