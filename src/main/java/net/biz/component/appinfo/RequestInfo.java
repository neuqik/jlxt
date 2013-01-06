package net.biz.component.appinfo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.biz.component.Const;
import net.biz.grid.gt.model.FilterInfo;
import net.biz.grid.gt.model.SortInfo;

/**
 * 保存请求信息
 * 
 * @author
 * 
 */
public class RequestInfo {
	private Map<String, Object> body = new HashMap<String, Object>();

	/**
	 * 设置Body的参数
	 * 
	 * @param param
	 * @param value
	 */
	public void setParameter(String param, Object value) {
		body.put(param, value);
	}

	/**
	 * 查询Body的内容
	 * 
	 * @param param
	 * @return
	 */
	public Object getParameter(String param) {
		return body.get(param);
	}

	/**
	 * 设置请求中的SQL
	 * 
	 * @param sql
	 */
	public void setSQL(String sql) {
		body.put(Const.SQL, sql);
	}

	/**
	 * 设置请求参数中的总行数
	 * 
	 * @param totalCount
	 */
	public void setRowCount(int totalCount) {
		body.put(Const.ROW_COUNT, totalCount);
	}

	public void setRowCount(long totalCount) {
		body.put(Const.ROW_COUNT, totalCount);
	}

	/**
	 * 查询SQL参数的内容
	 * 
	 * @return
	 */
	public String getSQL() {
		return String.valueOf(getParameter(Const.SQL));
	}

	/**
	 * 查询总行数的内容
	 * 
	 * @return
	 */
	public int getRowCount() {
		return Integer.parseInt(String.valueOf(getParameter(Const.ROW_COUNT)));
	}

	/**
	 * 查找SQL执行时的开始行
	 * 
	 * @return
	 */
	public int getStartRow() {
		return Integer.parseInt(String.valueOf(getParameter(Const.START_ROW)));
	}

	/**
	 * 返回SQL执行是的页大小
	 * 
	 * @return
	 */
	public int getPageSize() {
		return Integer.parseInt(String.valueOf(getParameter(Const.PAGE_SIZE)));
	}

	/**
	 * 设置开始行号
	 * 
	 * @param startRow
	 */
	public void setStartRow(int startRow) {
		setParameter(Const.START_ROW, startRow);
	}

	/**
	 * 设置页大小
	 * 
	 * @param pageSize
	 */
	public void setPageSize(int pageSize) {
		setParameter(Const.PAGE_SIZE, pageSize);
	}

	/**
	 * 获取Filter对象
	 * 
	 * @return
	 */
	public List<FilterInfo> getFilters() {
		return (List<FilterInfo>) getParameter(Const.FILTERS);

	}

	/**
	 * 设置filters
	 * 
	 * @param filters
	 */
	public void setFilters(List<FilterInfo> filters) {
		setParameter(Const.FILTERS, filters);
	}

	/**
	 * 获取排序对象
	 * 
	 * @return
	 */
	public List<SortInfo> getSorts() {
		return (List<SortInfo>) getParameter(Const.SORTS);
	}

	/**
	 * 设置排序对象
	 * 
	 * @param sorts
	 */
	public void setSorts(List<SortInfo> sorts) {
		setParameter(Const.SORTS, sorts);
	}
}
