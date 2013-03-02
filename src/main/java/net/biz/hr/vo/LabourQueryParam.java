package net.biz.hr.vo;

import java.sql.Date;

import net.biz.util.DateUtils;

public class LabourQueryParam {
	private String EMP_ID = "";
	private String EMP_NAME = "";
	private String DEPT_ID = "";
	private String MEMO = "";
	private String CONTRACT_FLAG = "";
	private String ACCIDENT_FLAG = "";
	private String ENDDATE = "";
	private String[] INSU_FLAGE = new String[2];
	private String ACCIDENT_END = "";
	private String INSUSTATUS = "";

	public String getEMP_ID() {
		return EMP_ID;
	}

	public void setEMP_ID(String eMP_ID) {
		EMP_ID = eMP_ID;
	}

	public String getEMP_NAME() {
		return EMP_NAME;
	}

	public void setEMP_NAME(String eMP_NAME) {
		EMP_NAME = eMP_NAME;
	}

	public String getDEPT_ID() {
		return DEPT_ID;
	}

	public void setDEPT_ID(String dEPT_ID) {
		DEPT_ID = dEPT_ID;
	}

	public String getMEMO() {
		return MEMO;
	}

	public void setMEMO(String mEMO) {
		MEMO = mEMO;
	}

	public String getCONTRACT_FLAG() {
		return CONTRACT_FLAG;
	}

	public void setCONTRACT_FLAG(String cONTRACT_FLAG) {
		CONTRACT_FLAG = cONTRACT_FLAG;
	}

	public String getENDDATE() {
		return ENDDATE;
	}

	public void setENDDATE(String eNDDATE) {
		ENDDATE = eNDDATE;
	}

	public String[] getINSU_FLAGE() {
		return INSU_FLAGE;
	}

	public void setINSU_FLAGE(String[] iNSU_FLAGE) {
		INSU_FLAGE = iNSU_FLAGE;
	}

	public String getACCIDENT_END() {
		if ("".equals(ACCIDENT_END)) {
			ACCIDENT_END = "";
		}
		return ACCIDENT_END;
	}

	public void setACCIDENT_END(String aCCIDENT_END) {
		ACCIDENT_END = aCCIDENT_END;
	}

	public String getINSUSTATUS() {
		return INSUSTATUS;
	}

	public void setINSUSTATUS(String iNSUSTATUS) {
		INSUSTATUS = iNSUSTATUS;
	}

	public Date getENDDATEForSqlDate() {
		return DateUtils.parseFormerSqlDate(getENDDATE());
	}

	public Date getACCIDENT_ENDForSqlDate() {
		return DateUtils.parseFormerSqlDate(getACCIDENT_END());
	}

	public String getACCIDENT_FLAG() {
		return ACCIDENT_FLAG;
	}

	public void setACCIDENT_FLAG(String aCCIDENT_FLAG) {
		ACCIDENT_FLAG = aCCIDENT_FLAG;
	}

	/**
	 * 判断对象内容是否为空
	 * 
	 * @return
	 */
	public boolean isEmpty() {
		if ("".equals(getCONTRACT_FLAG()) & "".equals(getDEPT_ID())
				& "".equals(getACCIDENT_FLAG()) & "".equals(getEMP_ID())
				& "".equals(getEMP_NAME()) & (getINSU_FLAGE().length == 0)
				& "".equals(getINSUSTATUS()) & "".equals(getMEMO()))
			return true;
		return false;
	}

	/**
	 * 是否有效
	 * 
	 * @return
	 */
	public boolean isContractValid() {
		if ("1".equals(getCONTRACT_FLAG())) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 是否参加养老保险选择
	 */
	public boolean isPENSION() {
		if ("1".equals(getINSU_FLAGE()[0])) {
			return true;
		}
		return false;
	}

	/**
	 * 是否参加医疗保险选择
	 * 
	 * @return
	 */
	public boolean isMEDICA() {
		if ("2".equals(getINSU_FLAGE()[0])) {
			return true;
		}
		if ("2".equals(getINSU_FLAGE()[1])) {
			return true;
		}
		return false;
	}

	/**
	 * 是否有效合同选择
	 * 
	 * @return
	 */
	public boolean isCONTRACE() {
		if ("1".equals(getCONTRACT_FLAG())) {
			return true;
		}
		return false;
	}

	/**
	 * 是否有效意外险
	 * 
	 * @return
	 */
	public boolean isACCIDENT() {
		if ("1".equals(getACCIDENT_FLAG())) {
			return true;
		}
		return false;
	}
}
