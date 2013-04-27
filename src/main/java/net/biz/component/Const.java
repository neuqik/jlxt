package net.biz.component;

public class Const {
	//
	// JDBC查询时，返回appinfo的总行数
	public static final String ROW_COUNT = "row_count";
	// requestinfo中放置SQL语句的key
	public static final String SQL = "sql";
	// 设置放置的数据
	public static final String DATA = "data";
	// 设置requestinfo中的开始行参数
	public static final String START_ROW = "start_row";
	// 设置requestinfo中的页大小
	public static final String PAGE_SIZE = "page_size";
	// 成功代码
	public static final String SUCCESS = "0";
	// 失败代码
	public static final String FAIL = "-1";
	// 过滤参数
	public static final String FILTERS = "filters";
	// 排序参数
	public static final String SORTS = "sorts";
	// 调转类型，内部调转
	public static final String TRANSFERTYPE_INTER = "02";
	// 人员类型，终止
	public static final String EMPTYPE_TERM = "99";
}
