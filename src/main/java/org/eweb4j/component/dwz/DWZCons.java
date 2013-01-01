package org.eweb4j.component.dwz;

import java.util.Map;

import org.eweb4j.cache.Props;

public class DWZCons {
	private static final String propId = "DWZConstant";
	private static final Map<String, String> map = Props.getMap("DWZConstant");

	public static String ERROR_ATTR_NAME() {
		return (String) map.get("ERROR_ATTR_NAME");
	}

	public static String ERROR_PAGE() {
		return (String) map.get("ERROR_PAGE");
	}

	public static String IOC_DWZ_BEAN_ID() {
		return (String) map.get("IOC_DWZ_BEAN_ID");
	}

	public static String DIV_PAGE_BTN_MAX_SHOW() {
		return (String) map.get("DIV_PAGE_BTN_MAX_SHOW");
	}
}
