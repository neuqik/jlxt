package org.eweb4j.component.dwz.menu.treemenu;

import java.util.Map;

import org.eweb4j.cache.Props;
import org.eweb4j.config.ConfigConstant;
import org.eweb4j.mvc.view.CallBackJson;

public class TreeMenuCons {
	private static final String propId = "TreeMenuConstant";
	private static final Map<String, String> map = Props
			.getMap("TreeMenuConstant");

	public static String IOC_SERVICE_BEAN_ID() {
		return (String) map.get("IOC_SERVICE_BEAN_ID");
	}

	public static String MODEL_NAME() {
		return (String) map.get("MODEL_NAME");
	}

	public static String DWZ_SUCCESS_JSON_RELOAD_NAVTAB() {
		String rel = (String) map.get("SHOW_LIST_REL");
		String path = (String) map.get("SHOW_LIST_PATH");
		path = ConfigConstant.BASE_URL + path;
		String title = (String) map.get("SHOW_LIST_TITLE");
		return new CallBackJson("200", "操作成功", rel, path, "reloadTab", title)
				.toString();
	}

	public static String DWZ_SUCCESS_JSON_CLOSE_CURRENT() {
		String rel = (String) map.get("SHOW_LIST_REL");
		String path = (String) map.get("SHOW_LIST_PATH");
		path = ConfigConstant.BASE_URL + path;
		String title = (String) map.get("SHOW_LIST_TITLE");
		return new CallBackJson("200", "操作成功", rel, path, "closeCurrent", title)
				.toString();
	}

	public static String ROOT_UL_STYLE_CLASS() {
		String defaultVal = "tree treeFolder";
		String val = (String) map.get("ROOT_UL_STYLE_CLASS");
		if (val == null) {
			val = defaultVal;
		}
		return val;
	}

	public static long TOP_TREE_MENU_ID() {
		String id = (String) map.get("TOP_TREE_MENU_ID");

		if (id.matches("^-?\\d+$")) {
			return Long.parseLong(id);
		}
		return -1L;
	}

	public static String TOP_TREE_MENU_NAME() {
		return (String) map.get("TOP_TREE_MENU_NAME");
	}

	public static String NEW_ACTION_RESULT() {
		return (String) map.get("NEW_ACTION_RESULT");
	}

	public static String EDIT_ACTION_RESULT() {
		return (String) map.get("EDIT_ACTION_RESULT");
	}

	public static String LOOKUP_ACTION_RESULT() {
		return (String) map.get("LOOKUP_ACTION_RESULT");
	}

	public static String PAGING_ACTION_RESULT() {
		return (String) map.get("PAGING_ACTION_RESULT");
	}

	public static String MENU_NOT_SELECTED_MESS() {
		return "请选择菜单";
	}
}
