package net.biz.component.appinfo;

import java.util.List;
import java.util.Map;

import net.biz.component.Const;

/**
 * 保存应用处理信息
 * 
 * @author
 * 
 */
public class AppInfo {

	private AppHead head = new AppHead();
	private AppBody body = new AppBody();

	public AppHead getHead() {
		return head;
	}

	public void setHead(AppHead head) {
		this.head = head;
	}

	public AppBody getBody() {
		return body;
	}

	public void setBody(AppBody body) {
		this.body = body;
	}

	/**
	 * 设置返回值中的总行数
	 * 
	 * @param totalCount
	 */
	public void setRowCount(int totalCount) {
		getBody().setParameter(Const.ROW_COUNT, totalCount);
	}

	/**
	 * 获取总行数
	 * 
	 * @return
	 */
	public int getRowCount() {
		return Integer.parseInt(String.valueOf(getBody().getParameter(
				Const.ROW_COUNT)));
	}

	/**
	 * 设置SQL查询的结果对象
	 * 
	 * @param result
	 */
	public void setResultData(List<Map<String, Object>> result) {
		getBody().setParameter(Const.DATA, result);
	}

	/**
	 * 获取SQL结果
	 * 
	 * @return
	 */
	public List<Map<String, Object>> getResultData() {
		return (List<Map<String, Object>>) getBody().getParameter(Const.DATA);
	}

	/**
	 * 设置成功
	 * 
	 * @param info
	 */
	public void setSuccess(String info) {
		getHead().setSuccess(info);
	}

	/**
	 * 设置失败
	 * 
	 * @param info
	 */
	public void setFail(String info) {
		getHead().setFail(info);
	}
}
