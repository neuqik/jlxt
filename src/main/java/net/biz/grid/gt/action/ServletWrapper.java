package net.biz.grid.gt.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ServletWrapper {
	private HttpServletRequest request;
	private HttpServletResponse response;

	public ServletWrapper(HttpServletRequest request,
			HttpServletResponse response) {
		this.request = request;
		this.response = response;
	}

	public Map getParameterMap() {
		return this.request.getParameterMap();
	}

	public String getParameter(String key) {
		return this.request.getParameter(key);
	}

	public String getParameter(String key, String ifNull) {
		String obj = getParameter(key);
		return obj == null ? ifNull : obj;
	}

	public String[] getParameterValues(String key) {
		return this.request.getParameterValues(key);
	}

	public Integer getIntegerParameter(String key) {
		try {
			return Integer.valueOf(getParameter(key));
		} catch (Exception e) {
		}
		return null;
	}

	public Integer getIntegerParameter(String key, int ifNull) {
		Integer obj = getIntegerParameter(key);
		return obj == null ? new Integer(ifNull) : obj;
	}

	public Integer[] getIntegerParameterValues(String key) {
		String[] objs = getParameterValues(key);
		if (objs == null)
			return null;
		Integer[] dObjs = new Integer[objs.length];

		for (int i = 0; i < objs.length; i++) {
			try {
				dObjs[i] = Integer.valueOf(objs[i]);
			} catch (Exception e) {
				dObjs[i] = null;
			}
		}
		return dObjs;
	}

	public Double getDoubleParameter(String key) {
		try {
			return Double.valueOf(getParameter(key));
		} catch (Exception e) {
		}
		return null;
	}

	public Double getDoubleParameter(String key, double ifNull) {
		Double obj = getDoubleParameter(key);
		return obj == null ? new Double(ifNull) : obj;
	}

	public Double[] getDoubleParameterValues(String key) {
		String[] objs = getParameterValues(key);
		if (objs == null)
			return null;
		Double[] dObjs = new Double[objs.length];

		for (int i = 0; i < objs.length; i++) {
			try {
				dObjs[i] = Double.valueOf(objs[i]);
			} catch (Exception e) {
				dObjs[i] = null;
			}
		}
		return dObjs;
	}

	public Boolean getBooleanParameter(String key) {
		try {
			return Boolean.valueOf(getParameter(key));
		} catch (Exception e) {
		}
		return null;
	}

	public Boolean getBooleanParameter(String key, boolean ifNull) {
		Boolean obj = getBooleanParameter(key);
		return obj == null ? new Boolean(ifNull) : obj;
	}

	public Boolean[] getBooleanParameterValues(String key) {
		String[] objs = getParameterValues(key);
		if (objs == null)
			return null;
		Boolean[] dObjs = new Boolean[objs.length];

		for (int i = 0; i < objs.length; i++) {
			try {
				dObjs[i] = Boolean.valueOf(objs[i]);
			} catch (Exception e) {
				dObjs[i] = null;
			}
		}
		return dObjs;
	}

	public Object getAttribute(String key) {
		return this.request.getAttribute(key);
	}

	public void setAttribute(String key, Object value) {
		this.request.setAttribute(key, value);
	}

	public HttpServletRequest getRequest() {
		return this.request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public HttpServletResponse getResponse() {
		return this.response;
	}

	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}

	public HttpSession getSession() {
		return this.request.getSession();
	}

	public HttpSession getSession(boolean create) {
		return this.request.getSession(create);
	}
}
