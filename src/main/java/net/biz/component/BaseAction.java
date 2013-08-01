package net.biz.component;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.biz.component.appinfo.AppInfo;
import net.biz.component.appinfo.RequestInfo;
import net.biz.framework.codelist.Code;
import net.biz.framework.codelist.CodeList;
import net.biz.grid.gt.model.FilterInfo;
import net.biz.grid.gt.model.SortInfo;
import net.biz.grid.gt.server.GridServerHandler;
import net.biz.util.BeanUtil;

import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.PropertyUtils;
import org.eweb4j.component.dwz.DWZ;
import org.eweb4j.component.dwz.DWZCons;
import org.eweb4j.config.ConfigConstant;
import org.eweb4j.ioc.IOC;
import org.eweb4j.mvc.MVC;
import org.eweb4j.mvc.view.CallBackJson;
import org.eweb4j.solidbase.user.model.User;
import org.eweb4j.solidbase.user.model.UserCons;

public abstract class BaseAction {
	protected GridServerHandler handler = new GridServerHandler(MVC.ctx()
			.getRequest(), MVC.ctx().getResponse());
	protected DWZ dwz = IOC.getBean(DWZCons.IOC_DWZ_BEAN_ID());

	/**
	 * 执行分页查询前的请求信息封装
	 * 
	 * @param sql
	 * @return
	 * @throws Exception
	 */
	protected RequestInfo wrapRequest(String sql) throws Exception {
		// 1.初始化参数对象和返回结果对象
		RequestInfo request = new RequestInfo();

		// 2.取过滤对象和排序对象
		List<FilterInfo> filters = handler.getFilterInfo();
		List<SortInfo> sorts = handler.getSortInfo();
		// 3.设置参数
		request.setFilters(filters);
		request.setSorts(sorts);
		request.setStartRow(handler.getStartRowNum());
		request.setPageSize(handler.getPageSize());
		request.setRowCount(-1);
		request.setSQL(sql);
		return request;
	}

	/**
	 * 生成返回信息的分页Json串
	 * 
	 * @param app
	 * @return
	 * @throws Exception
	 */
	protected String wrapResponse(AppInfo app) throws Exception {
		int totalCount = app.getRowCount();
		List<Map<String, Object>> result = app.getResultData();
		handler.setTotalRowNum(totalCount);
		handler.setData(result);

		return handler.getLoadResponseText();
	}

	/**
	 * 获得在T_CODELIST中的代码值
	 * 
	 * @param codeType
	 * @return
	 * @throws Exception
	 */
	protected List<Code> getCodeList(String codeType) throws Exception {

		return ((CodeList) BeanUtil.getBean("CodeList")).getCodeList(codeType
				.toUpperCase());
	}

	/**
	 * 从request中解析bean出来
	 * 
	 * @param bean
	 * @return
	 */
	protected Object parseRequest(Object bean) {
		return parseRequest(MVC.ctx().getRequest(), bean);
	}

	/**
	 * 从请求中封装bean对象
	 * 
	 * @param request
	 * @param bean
	 * @return
	 */
	protected Object parseRequest(HttpServletRequest request, Object bean) {
		// 取得所有参数列表
		Enumeration<String> enum1 = request.getParameterNames();
		// 遍历所有参数列表
		while (enum1.hasMoreElements()) {

			Object obj = enum1.nextElement();

			// 取得这个参数在Bean中的数据类型
			Class cls;
			try {
				// TODO:用log替代
				System.out.println("现在映射:" + obj.toString());
				cls = PropertyUtils.getPropertyType(bean, obj.toString());
				// 把相应的数据转换成对应的数据类型
				Object reqVal = request.getParameterMap().get(obj.toString());
				// 如果bean的属性多，则忽略
				if (reqVal == null)
					reqVal = "";
				if (cls != null) {
					Object beanValue = ConvertUtils.convert(reqVal, cls);
					// 添冲Bean值
					PropertyUtils.setProperty(bean, obj.toString(), beanValue);

				} else {
					// TODO:用log替代
					System.out.println("现在忽略:" + reqVal);
				}
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				e.printStackTrace();
			} catch (NoSuchMethodException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return bean;
	}

	/**
	 * 处理成功json消息，用于打开navtab页保存成功后的处理 关闭对话框或navtab页面
	 * 
	 * @param _mess
	 * @param openType
	 *            窗口打开类型
	 * @param 转发URL
	 * @param 窗口的内容
	 *            rel如果指定非当前窗口的rel，则会重新加载该窗口，不能加载自身，如果需要加载自身，则置空
	 * @return
	 */
	protected String successJSON(String _mess, String openType,
			String forwardURL, String rel) {
		// 暂不用
		// String callbackType = "dialog".equalsIgnoreCase(openType) ?
		// "reloadTab"
		// : "closeCurrent";
		String mess = _mess == null ? "操作成功" : _mess;
		String path = ConfigConstant.BASE_URL + forwardURL;
		return new CallBackJson("200", mess, rel, path, "closeCurrent", "信息")
				.toString();
	}

	/**
	 * 返回成功信息后，打开转发url
	 * 
	 * @param _mess
	 * @param openType
	 * @param forwardURL
	 * @param rel
	 * @return
	 */
	protected String successJSONForward(String _mess, String openType,
			String forwardURL, String rel) {
		// 暂不用
		// String callbackType = "dialog".equalsIgnoreCase(openType) ?
		// "reloadTab"
		// : "closeCurrent";
		String mess = _mess == null ? "操作成功" : _mess;
		String path = ConfigConstant.BASE_URL + forwardURL;
		return new CallBackJson("200", mess, rel, path, "forward", "信息")
				.toString();
	}

	/**
	 * 处理成功json消息 不关闭dialog或navtab
	 * 
	 * @param _mess
	 * @param openType
	 * @param forwardURL
	 * @param rel
	 * @return
	 */
	protected String successJSONReload(String _mess, String openType,
			String forwardURL, String rel) {
		String callbackType = "dialog".equalsIgnoreCase(openType) ? "reloadTab"
				: "closeCurrent";
		String mess = _mess == null ? "操作成功" : _mess;
		String path = ConfigConstant.BASE_URL + forwardURL;
		return new CallBackJson("200", mess, rel, path, callbackType, "信息")
				.toString();
	}

	/**
	 * 从request中获取参数
	 * 
	 * @param key
	 * @return
	 */
	protected String getParam(String key) {
		return MVC.ctx().getRequest().getParameter(key);
	}

	/**
	 * 获取Response
	 * 
	 * @return
	 */
	protected HttpServletResponse getResponse() {
		return MVC.ctx().getResponse();
	}

	/**
	 * 从request请求中的data中获得参数
	 * 
	 * @param key
	 * @return
	 */
	protected String[] getParamByData(String key) {
		return MVC.ctx().getRequest().getParameterMap().get(key);
	}

	/**
	 * 获取当前登录的用户名
	 * 
	 * @return
	 */
	protected String getCurrentUserName() {
		User user = (User) MVC.ctx().getSession()
				.getAttribute(UserCons.LOGIN_USER_ATTR_NAME());
		return user.getAccount();
	}

	/**
	 * 返回XML
	 * @throws IOException
	 * 
	 */
	protected void successXML(String xml) throws IOException {
		HttpServletResponse response = getResponse();
		response.setContentType("text/xml;charset=utf-8"); // （1）一定要在（2）的前面，不然会乱码
		response.setCharacterEncoding("UTF-8"); // （2）
		response.setHeader("Cache-Control", "no-cache");
		PrintWriter out;
		out = response.getWriter();
		StringBuilder sb = new StringBuilder();
		sb.append("<?xml version='1.0' encoding='UTF-8'?>");// 最外层节点唯一，不然报错
		sb.append(xml);
		out.print(sb.toString());
		out.flush();
		out.close();
	}
}
