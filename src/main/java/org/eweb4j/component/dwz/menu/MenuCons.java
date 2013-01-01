package org.eweb4j.component.dwz.menu;

import java.util.Map;

import org.eweb4j.cache.Props;

public class MenuCons {
	private static final String propId = "MenuConstant";
	private static final Map<String, String> map = Props.getMap("MenuConstant");

	public static String MENU_NOT_FOUND_MESS() {
		return (String) map.get("MENU_NOT_FOUND_MESS");
	}

	public static String DUP_MENU_NAME_MESS() {
		return (String) map.get("DUP_MENU_NAME_MESS");
	}

	public static String PARENT_MENU_NOT_FOUND_MESS() {
		return (String) map.get("PARENT_MENU_NOT_FOUND_MESS");
	}

	public static String NAV_MENU_NOT_FOUND_MESS() {
		return (String) map.get("NAV_MENU_NOT_FOUND_MESS");
	}

	public static String INVALID_PARENT_MESS() {
		return (String) map.get("INVALID_PARENT_MESS");
	}
}
