package net.biz.hr.web;

import java.util.Map;

/**
 * HR业务逻辑
 * @author kuqi
 *
 */
public interface IHRBiz {
	public Map<String, Object> queryAllEmp(Map<String,String> map) throws Exception;
}
