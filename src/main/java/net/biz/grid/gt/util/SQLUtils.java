package net.biz.grid.gt.util;

import java.util.Iterator;
import java.util.List;

import net.biz.framework.codelist.CodeList;
import net.biz.grid.gt.model.FilterInfo;
import net.biz.grid.gt.model.SortInfo;

/**
 * 与grid有关的SQL语句
 * 
 * @author
 * 
 */
public class SQLUtils {
	/**
	 * 拼接SQL语句where条件
	 * 
	 * @param col
	 *            如果选择的是<><=>=则先认为是数字，待完善
	 * @param logic
	 * @param value
	 * @return
	 */
	// TODO:需要完善数据类型
	private static String getSQLcondition(String col, String logic, String value) {
		if ("Equal".equalsIgnoreCase(logic)) {
			return col + " = '" + CodeList.getCodeValue(col, value) + "'";
		}
		if ("notEqual".equalsIgnoreCase(logic)) {
			return col + " <> '" + CodeList.getCodeValue(col, value) + "'";
		}
		if ("less".equalsIgnoreCase(logic)) {
			return col + " < " + CodeList.getCodeValue(col, value);
		}
		if ("great".equalsIgnoreCase(logic)) {
			return col + " > " + CodeList.getCodeValue(col, value);
		}
		if ("lessEqual".equalsIgnoreCase(logic)) {
			return col + " <= " + CodeList.getCodeValue(col, value);
		}
		if ("greatEqual".equalsIgnoreCase(logic)) {
			return col + " >= " + CodeList.getCodeValue(col, value);
		}
		if ("like".equalsIgnoreCase(logic)) {
			return col + " LIKE '" + "%" + CodeList.getCodeValue(col, value)
					+ "%'";
		}
		if ("startWith".equalsIgnoreCase(logic)) {
			return col + " LIKE '" + CodeList.getCodeValue(col, value) + "%'";
		}
		if ("endWith".equalsIgnoreCase(logic)) {
			return col + " LIKE '" + "%" + CodeList.getCodeValue(col, value)
					+ "'";
		}
		return "";
	}

	/**
	 * 获取SQL排序语句
	 * 
	 * @param col
	 * @param order
	 *            asc desc
	 * @return
	 */
	private static String getSQLSort(String col, String order) {

		return col + " " + order;
	}

	/**
	 * 根据grid的过滤信息生成SQL语句，如果是多个表，需要在columnid指定表名 所有条件都是And
	 * 
	 * @param filters
	 * @return 根据返回信息考虑是否增加AND
	 */
	public static String splitFilter(List<FilterInfo> filters) {
		String where = String.valueOf("");
		Iterator<FilterInfo> itor = filters.iterator();
		while (itor.hasNext()) {
			FilterInfo filterInfo = (FilterInfo) itor.next();
			String col = filterInfo.getColumnId();
			String logic = filterInfo.getLogic();
			String value = filterInfo.getValue();
			String clause = getSQLcondition(col, logic, value);
			where = where.concat(" AND ").concat(clause);
		}
		return where;
	}

	/**
	 * 拼查询排序
	 * 
	 * @param sorts
	 * @return
	 */
	public static String splitSort(List<SortInfo> sorts) {
		String where = String.valueOf("");
		if (sorts.size() > 0) {
			where = " ORDER BY ";
		}
		Iterator<SortInfo> itor = sorts.iterator();
		while (itor.hasNext()) {
			SortInfo sortInfo = (SortInfo) itor.next();
			String col = sortInfo.getColumnId();
			String order = sortInfo.getSortOrder().toUpperCase();
			String clause = getSQLSort(col, order);
			where = where.concat(" , ").concat(clause);
		}
		return where;
	}
}
