package net.biz.component.appinfo;

import java.util.HashMap;
import java.util.Map;

public class AppBody {
	private Map<String, Object> body = new HashMap<String, Object>();
	/**
	 * 设置Body的参数
	 * @param param
	 * @param value
	 */
	public void setParameter(String param, Object value) {
		body.put(param, value);
	}
	/**
	 * 查询Body的内容
	 * @param param
	 * @return
	 */
	public Object getParameter(String param) {
		return body.get(param);
	}
}
