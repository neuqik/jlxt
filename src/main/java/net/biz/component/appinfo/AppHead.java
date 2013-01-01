package net.biz.component.appinfo;

import net.biz.component.Const;

public class AppHead {
	/**
	 * 应用处理结果的代码
	 */
	private String appCode = "-1"; // 默认是不成功
	/**
	 * 应用的错误消息
	 */
	private String appError = "";
	/**
	 * 应用的信息
	 */
	private String appInfo = "";

	public String getAppCode() {
		return appCode;
	}

	private void setAppCode(String appCode) {
		this.appCode = appCode;
	}

	public String getAppError() {
		return appError;
	}

	public void setAppError(String appError) {
		this.appError = appError;
	}

	public String getAppInfo() {
		return appInfo;
	}

	public void setAppInfo(String appInfo) {
		this.appInfo = appInfo;
	}

	/**
	 * 设置应用执行成功
	 */
	public void setSuccess(String info) {
		setAppCode(Const.SUCCESS);
		setAppInfo(info);
	}

	/**
	 * 设置应用执行失败
	 */
	public void setFail(String info) {
		setAppCode(Const.FAIL);
		setAppError(info);
	}
}
