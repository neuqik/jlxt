package net.biz.util;

import org.apache.log4j.Logger;


public class LogUtil {
	public static void error(Object info) {
		Logger.getLogger("net.biz").error(info);
	}

	public static void warn(Object info) {
		Logger.getLogger("net.biz").warn(info);
	}

	public static void info(Object info) {
		Logger.getLogger("net.biz").info(info);
	}

	public static void debug(Object info) {
		Logger.getLogger("net.biz").debug(info);
	}
}
