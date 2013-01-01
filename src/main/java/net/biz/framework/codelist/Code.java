package net.biz.framework.codelist;

/**
 * 处理内存中代码类的保存
 * 
 * @author
 * 
 */
public class Code {
	private String codeType = ""; // 代码类型
	private String codeValue = ""; // 代码值
	private String codeDesc = ""; // 代码值中文描述

	public String getCodeType() {
		return codeType;
	}

	public void setCodeType(String codeType) {
		this.codeType = codeType;
	}

	public String getCodeValue() {
		return codeValue;
	}

	public void setCodeValue(String codeValue) {
		this.codeValue = codeValue;
	}

	public String getCodeDesc() {
		return codeDesc;
	}

	public void setCodeDesc(String codeDesc) {
		this.codeDesc = codeDesc;
	}

}
