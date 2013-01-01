package net.biz.grid.gt.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.biz.grid.gt.util.LogHandler;
import net.biz.grid.gt.util.StringUtils;

public class BaseAction {
	private PrintWriter out;
	protected HttpServletRequest request;
	protected HttpServletResponse response;
	protected Map parameterMap;
	protected boolean printed = false;
	protected String viewPath;
	protected String viewBasePath;
	protected ServletWrapper servletWrapper;

	public void service() throws ServletException, IOException {
		throw new ServletException("Please override service() Method!");
	}

	public void init(HttpServletRequest request, HttpServletResponse response) {
		setRequest(request);
		setResponse(response);
		setServletWrapper(new ServletWrapper(request, response));
	}

	protected void println(Object text) {
		print(text);
		println();
	}

	protected void println() {
		this.printed = true;
		getOut().println();
	}

	protected void print(Object text) {
		this.printed = true;
		getOut().print(String.valueOf(text));
	}

	protected void flushOut() {
		getOut().flush();
	}

	protected void closeOut() {
		getOut().close();
	}

	protected String getViewUrl(String viewName) {
		String queryStr = null;
		int aidx = viewName.indexOf('?');
		if (aidx > 0) {
			queryStr = viewName.substring(aidx + 1);
			viewName = viewName.substring(0, aidx);
		}
		if ((!StringUtils.endsWithIgnoreCase(viewName, ".jsp"))
				&& (!StringUtils.endsWithIgnoreCase(viewName, ".html"))
				&& (!StringUtils.endsWithIgnoreCase(viewName, ".htm"))) {
			viewName = viewName + ".jsp";
		}
		if (StringUtils.isNotEmpty(queryStr)) {
			viewName = viewName + '?' + queryStr;
		}

		if (viewName.indexOf("//") == 0) {
			return viewName.substring(1);
		}
		if (viewName.indexOf("/") == 0) {
			return getViewBasePath() + viewName;
		}
		String viewPath = getViewPath();
		if (viewName.indexOf("../") == 0) {
			viewName = viewName.substring(3);
			int idx = viewPath.lastIndexOf('/');
			viewPath = viewPath.substring(0, idx);
		}
		return getViewBasePath() + viewPath + "/" + viewName;
	}

	protected void redirect(String viewName) throws IOException {
		this.response.sendRedirect(getViewUrl(viewName));
	}

	protected void forward(String viewName) throws ServletException,
			IOException {
		this.request.getRequestDispatcher(getViewUrl(viewName)).forward(
				this.request, this.response);
	}

	protected void include(String viewName) throws ServletException,
			IOException {
		this.request.getRequestDispatcher(getViewUrl(viewName)).include(
				this.request, this.response);
	}

	public HttpServletRequest getRequest() {
		return this.request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
		setParameterMap(request.getParameterMap());
	}

	public HttpServletResponse getResponse() {
		return this.response;
	}

	public void setContentType(String contextType) {
		this.response.setContentType(contextType);
	}

	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}

	public boolean isPrinted() {
		return this.printed;
	}

	public String getViewPath() {
		return this.viewPath;
	}

	public void setViewPath(String viewPath) {
		this.viewPath = viewPath;
	}

	public String getViewBasePath() {
		return this.viewBasePath;
	}

	public void setViewBasePath(String viewBasePath) {
		this.viewBasePath = viewBasePath;
	}

	public Map getParameterMap() {
		return this.parameterMap;
	}

	public Map<String, Object> getParameterSimpleMap() {
		Iterator kit = this.parameterMap.keySet().iterator();
		Map<String, Object> param = new HashMap<String, Object>();
		while (kit.hasNext()) {
			String key = String.valueOf(kit.next());
			String[] v = (String[]) null;
			try {
				v = (String[]) this.parameterMap.get(key);
			} catch (Exception e) {
				continue;
			}
			if ((v != null) && (v.length == 1))
				param.put(key, v[0]);
			else {
				param.put(key, v);
			}
		}
		return param;
	}

	public String getParameter(String name) {
		return this.request.getParameter(name);
	}

	public void setParameterMap(Map parameterMap) {
		this.parameterMap = parameterMap;
	}

	public void dispose() {
		this.out = null;
		this.request = null;
		this.response = null;
		this.printed = false;
		this.viewPath = null;
		this.viewBasePath = null;
	}

	public ServletWrapper getServletWrapper() {
		return this.servletWrapper;
	}

	public void setServletWrapper(ServletWrapper servletWrapper) {
		this.servletWrapper = servletWrapper;
	}

	public PrintWriter getOut() {
		if (this.out == null) {
			try {
				setOut(this.response.getWriter());
			} catch (IOException e) {
				LogHandler.error(this, e);
			}
		}
		return this.out;
	}

	public void setOut(PrintWriter out) {
		this.out = out;
	}
}
