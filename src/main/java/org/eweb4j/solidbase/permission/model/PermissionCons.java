package org.eweb4j.solidbase.permission.model;

import java.util.Map;

import org.eweb4j.cache.Props;
import org.eweb4j.config.ConfigConstant;
import org.eweb4j.mvc.view.CallBackJson;

public class PermissionCons {
	/**
	 * 配置文件ID (在eweb4j框架启动培植文件中定义)
	 */
	private final static String propId = "PermissionConstant";
	private static Map<String, String> map = Props.getMap(propId);

	public static Map<String, String> getMap() {
		return map;
	}

	public static String IOC_SERVICE_BEAN_ID() {
		return map.get("IOC_SERVICE_BEAN_ID");
	}

	public static String MODEL_NAME() {
		return map.get("MODEL_NAME");
	}

	public static String DWZ_SUCCESS_JSON(String _mess) {
		String openType = OPEN_TYPE();
		String callbackType = "dialog".equalsIgnoreCase(openType) ? "reloadTab"
				: "closeCurrent";
		String mess = _mess == null ? "操作成功" : _mess;
		String rel = map.get("SHOW_LIST_REL");
		String path = map.get("SHOW_LIST_PATH");
		path = ConfigConstant.BASE_URL + path;
		String title = map.get("SHOW_LIST_TITLE");
		return new CallBackJson("200", mess, rel, path, callbackType, title)
				.toString();
	}

	public static String OPEN_TYPE() {
		return map.get("OPEN_TYPE");
	}

	public static String PERMISSION_TYPE_CODE_VALUE() {
		return map.get("PERMISSION_TYPE_CODE_VALUE");
	}

	public static String HTTP_METHOD_CODE_VALUE() {
		return map.get("HTTP_METHOD_CODE_VALUE");
	}

	public static String PERMISSION_NOT_FOUND_MESS() {
		return map.get("PERMISSION_NOT_FOUND_MESS");
	}

	public static String DUP_PERMISSION_MESS() {
		return map.get("DUP_PERMISSION_MESS");
	}

	public static String HTTP_METHOD_REQUIRED_MESS() {
		return map.get("HTTP_METHOD_REQUIRED_MESS");
	}

	public static String DATA_ACCESS_ERR() {
		return map.get("DATA_ACCESS_ERR");
	}

	public static String PERMISSION_TYPE_REQUIRED_MESS() {
		return map.get("PERMISSION_TYPE_REQUIRED_MESS");
	}

	public static String PERMISSION_NOT_SELECTED_MESS() {
		return map.get("PERMISSION_NOT_SELECTED_MESS");
	}

	public static String HTTP_METHOD_NOT_FOUND_MESS() {
		return map.get("HTTP_METHOD_NOT_FOUND_MESS");
	}

	public static String EDIT_ACTION_RESULT() {
		return map.get("EDIT_ACTION_RESULT");
	}

	public static String NEW_ACTION_RESULT() {
		return map.get("NEW_ACTION_RESULT");
	}

	public static String PAGING_ACTION_RESULT() {
		return map.get("PAGING_ACTION_RESULT");
	}
}
