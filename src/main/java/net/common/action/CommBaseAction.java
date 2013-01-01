package net.common.action;

import java.util.HashMap;
import java.util.Map;

import org.eweb4j.component.dwz.DWZ;
import org.eweb4j.component.dwz.DWZCons;
import org.eweb4j.config.ConfigConstant;
import org.eweb4j.ioc.IOC;
import org.eweb4j.mvc.MVC;
import org.eweb4j.mvc.view.CallBackJson;

public abstract class CommBaseAction {
	protected DWZ dwz = IOC.getBean(DWZCons.IOC_DWZ_BEAN_ID());
	private String pageNum = ""; // 当前页
	private String numPerPage = ""; // 每页数量
	private String orderField = ""; // 排序字段
	private String orderAE = ""; // 排序依据

	public static String DWZ_SUCCESS_JSON(String _mess) {
		String openType = "";
		String callbackType = "dialog".equalsIgnoreCase(openType) ? "reloadTab"
				: "closeCurrent";
		String mess = _mess == null ? "操作成功" : _mess;
		String rel = "comm";
		String path = "hrc/list";
		path = ConfigConstant.BASE_URL + path;
		String title = "";
		return new CallBackJson("200", mess, rel, path, callbackType, title)
				.toString();
	}

	/**
	 * 从前台收集分页信息
	 * 
	 * @author lef2371@gmail.com
	 * @return
	 */
	public Map<String, String> doPage() {
		pageNum = String
				.valueOf(MVC.ctx().getRequest().getParameter("pageNum")); // 当前页
		numPerPage = String.valueOf(MVC.ctx().getRequest()
				.getParameter("numPerPage")); // 每页信息
		orderField = String.valueOf(MVC.ctx().getRequest()
				.getParameter("orderField")); // 排序字段
		orderAE = String.valueOf(MVC.ctx().getRequest()
				.getParameter("orderDirection"));// 排序方式
		if ("null".equals(pageNum)) { // 默认为第一页
			pageNum = "1";
		}
		if ("null".equals(numPerPage)) {
			numPerPage = "10"; // 默认为每页10条记录
		}
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("pageNum", pageNum);
		map.put("numPerPage", numPerPage);
		map.put("orderField", orderField);
		map.put("orderDirection", orderAE);
		return map;
	}

	public String getNumPerPage() {
		return numPerPage;
	}

	public void setNumPerPage(String numPerPage) {
		this.numPerPage = numPerPage;
	}

	public String getPageNum() {
		return pageNum;
	}

	public void setPageNum(String pageNum) {
		this.pageNum = pageNum;
	}

	public String getOrderField() {
		return orderField;
	}

	public void setOrderField(String orderField) {
		this.orderField = orderField;
	}

	public String getOrderAE() {
		return orderAE;
	}

	public void setOrderAE(String orderAE) {
		this.orderAE = orderAE;
	}
}
