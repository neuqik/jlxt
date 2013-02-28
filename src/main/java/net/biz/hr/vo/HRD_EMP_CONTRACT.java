package net.biz.hr.vo;

import java.sql.Date;

import net.biz.util.DateUtils;

public class HRD_EMP_CONTRACT {
	private String ID;
	private String EMP_ID;
	private String CONTRACT_ID;
	private String CONTRACT_NAME;
	private String CONTRACTTYPE;
	private String CONTRACTPROP;
	private String BEGINDATE;
	private String ENDDATE;
	private String ADDITION;
	private String MEMO;
	private String VALID;
	private String ACCIDENT_START;
	private String ACCIDENT_END;
	private String INSU;

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public String getEMP_ID() {
		return EMP_ID;
	}

	public void setEMP_ID(String eMP_ID) {
		EMP_ID = eMP_ID;
	}

	public String getCONTRACT_ID() {
		return CONTRACT_ID;
	}

	public void setCONTRACT_ID(String cONTRACT_ID) {
		CONTRACT_ID = cONTRACT_ID;
	}

	public String getCONTRACT_NAME() {
		return CONTRACT_NAME;
	}

	public void setCONTRACT_NAME(String cONTRACT_NAME) {
		CONTRACT_NAME = cONTRACT_NAME;
	}

	public String getCONTRACTTYPE() {
		return CONTRACTTYPE;
	}

	public void setCONTRACTTYPE(String cONTRACTTYPE) {
		CONTRACTTYPE = cONTRACTTYPE;
	}

	public String getCONTRACTPROP() {
		return CONTRACTPROP;
	}

	public void setCONTRACTPROP(String cONTRACTPROP) {
		CONTRACTPROP = cONTRACTPROP;
	}

	public String getBEGINDATE() {
		return BEGINDATE;
	}

	public void setBEGINDATE(String bEGINDATE) {
		BEGINDATE = bEGINDATE;
	}

	public String getENDDATE() {
		return ENDDATE;
	}

	public void setENDDATE(String eNDDATE) {
		ENDDATE = eNDDATE;
	}

	public String getADDITION() {
		return ADDITION;
	}

	public void setADDITION(String aDDITION) {
		ADDITION = aDDITION;
	}

	public String getMEMO() {
		return MEMO;
	}

	public void setMEMO(String mEMO) {
		MEMO = mEMO;
	}

	public String getVALID() {
		return VALID;
	}

	public void setVALID(String vALID) {
		VALID = vALID;
	}

	public String getACCIDENT_START() {
		return ACCIDENT_START;
	}

	public void setACCIDENT_START(String aCCIDENT_START) {
		ACCIDENT_START = aCCIDENT_START;
	}

	public String getACCIDENT_END() {
		return ACCIDENT_END;
	}

	public void setACCIDENT_END(String aCCIDENT_END) {
		ACCIDENT_END = aCCIDENT_END;
	}

	public String getINSU() {
		return INSU;
	}

	public void setINSU(String iNSU) {
		INSU = iNSU;
	}

	public Date getBEGINDATEForSqlDate() {
		return DateUtils.parseFormerSqlDate(getBEGINDATE());
	}

	public Date getENDDATEForSqlDate() {
		return DateUtils.parseFormerSqlDate(getENDDATE());
	}

	public Date getACCIDENT_STARTForSqlDate() {
		return DateUtils.parseFormerSqlDate(getACCIDENT_START());
	}

	public Date getACCIDENT_ENDForSqlDate() {
		return DateUtils.parseFormerSqlDate(getACCIDENT_END());
	}
}
