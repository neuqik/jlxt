package net.biz.grid.gt.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.biz.grid.gt.server.DataAccessManagerLoader;
import net.biz.grid.gt.util.LogHandler;
import net.biz.grid.gt.util.StringUtils;

public class FrontController implements Filter {
	static final long serialVersionUID = 1L;
	public String webRootRealPath = null;
	public ServletContext servletContext = null;
	protected FilterConfig filterConfig = null;

	public static String DEFAULT_METHODNAME = "service";

	protected Map<String, Method> methodCache = Collections
			.synchronizedMap(new HashMap<String, Method>());

	protected Class[] types1 = { HttpServletRequest.class,
			HttpServletResponse.class };

	protected Class[] types2 = new Class[0];

	private static Map<String, Class> classCache = Collections
			.synchronizedMap(new HashMap<String, Class>());
	private String actionBasePath;
	private String viewBasePath;
	private String dispatchMethod;

	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig = filterConfig;
		this.servletContext = filterConfig.getServletContext();
		this.webRootRealPath = this.servletContext.getRealPath("/");

		this.actionBasePath = filterConfig.getInitParameter("actionBasePath");
		if (this.actionBasePath == null) {
			this.actionBasePath = "action";
		}

		this.viewBasePath = filterConfig.getInitParameter("viewBasePath");
		if (this.viewBasePath == null) {
			this.viewBasePath = "/view";
		}
		this.dispatchMethod = filterConfig.getInitParameter("dispatchMethod");
		if (this.dispatchMethod == null) {
			this.dispatchMethod = "doMethod";
		}

		DataAccessManagerLoader.loadDataAccessManager(this.servletContext);
	}

	public BaseAction loadAction(HttpServletRequest request,
			HttpServletResponse response) {
		String servletPath = request.getServletPath();
		Class klazz = classCache.get(servletPath);
		String actionName = null;
		try {
			int si = servletPath.lastIndexOf("/");
			int di = servletPath.lastIndexOf(".");
			servletPath = servletPath.substring(si + 1, di);
			String viewPath = servletPath.replaceAll("\\.", "/");
			if (klazz == null) {
				di = servletPath.lastIndexOf(".") + 1;
				actionName = servletPath.substring(0, di)
						+ servletPath.substring(di, di + 1).toUpperCase()
						+ servletPath.substring(di + 1);
				klazz = Class.forName(this.actionBasePath + '.' + actionName);
				classCache.put(servletPath, klazz);
			}

			BaseAction action = (BaseAction) klazz.newInstance();
			action.init(request, response);
			action.setViewBasePath(this.viewBasePath);
			action.setViewPath("/" + viewPath);
			return action;
		} catch (Exception e) {
			LogHandler.warn(actionName + " Action not found");
		}
		return null;
	}

	private String getMethodName(HttpServletRequest request) {
		return request.getParameter(this.dispatchMethod);
	}

	protected Method getMethod(Class clazz, String name, Class[] pTypes) {
		try {
			return clazz.getMethod(name, pTypes);
		} catch (NoSuchMethodException e) {
		}
		return null;
	}

	protected Method getMethod(Class<? extends BaseAction> clazz, String name) {
		String key = clazz.getName() + "/" + name;
		Method method = this.methodCache.get(key);
		if (method == null) {
			Exception mE = null;
			try {
				method = clazz.getMethod(name, this.types1);
			} catch (Exception e1) {
				mE = e1;
				try {
					method = clazz.getMethod(name, this.types2);
				} catch (Exception e2) {
					mE = e2;
					method = null;
				}
			}

			if (method == null)
				LogHandler.warn(this,
						new NoSuchMethodException(mE.getMessage()));
			else {
				this.methodCache.put(key, method);
			}
		}
		return method;
	}

	public void doFilter(ServletRequest servletRequest,
			ServletResponse servletResponse, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;

		BaseAction action = loadAction(request, response);
		String name = getMethodName(request);

		if (StringUtils.isEmpty(name)) {
			name = DEFAULT_METHODNAME;
		}
		if (action != null) {
			Object[] args = { request, response };
			Method method = getMethod(action.getClass(), name);
			try {
				if (method.getParameterTypes().length == 0)
					method.invoke(action, null);
				else
					method.invoke(action, args);
			} catch (Exception e) {
				LogHandler.warn(e);
				throw new ServletException(e);
			} finally {
				action.dispose();
			}
			return;
		}
		response.sendError(404);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html><body>Action not found!</body></html>");
		out.flush();
		out.close();
	}

	public String getWebRootRealPath() {
		return this.webRootRealPath;
	}

	public void destroy() {
		this.webRootRealPath = null;
		this.servletContext = null;
		this.filterConfig = null;

		this.methodCache = null;

		this.types1 = null;
		this.types2 = null;

		classCache = null;

		this.actionBasePath = null;
		this.viewBasePath = null;
		this.dispatchMethod = null;
		DataAccessManagerLoader.destroyDataAccessManager(this.servletContext);
	}
}
