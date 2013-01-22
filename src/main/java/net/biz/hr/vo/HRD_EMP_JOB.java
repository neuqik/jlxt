package net.biz.hr.vo;

import java.util.Date;

import net.biz.util.DateUtils;

public class HRD_EMP_JOB {
	private String ID;
	private String EMP_ID;
	private String JOB_START;
	private String JOB_END;
	private String ACCIDENT_START;
	private String ACCIDENT_END;
	private String MEMO;
	private String PENSION;
	private String MEDIC;
	private String BEAR;
	private String UNEMP;
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

	public String getJOB_START() {
		return JOB_START;
	}

	public void setJOB_START(String jOB_START) {
		JOB_START = jOB_START;
	}

	public String getJOB_END() {
		return JOB_END;
	}

	public void setJOB_END(String jOB_END) {
		JOB_END = jOB_END;
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

	public String getMEMO() {
		return MEMO;
	}

	public void setMEMO(String mEMO) {
		MEMO = mEMO;
	}

	public Date getJOB_STARTForSqlDate() {
		return DateUtils.parseFormerSqlDate(getJOB_START());
	}

	public Date getJOB_ENDForSqlDate() {
		return DateUtils.parseFormerSqlDate(getJOB_END());
	}

	public Date getACCIDENT_STARTForSqlDate() {
		return DateUtils.parseFormerSqlDate(getACCIDENT_START());
	}

	public Date getACCIDENT_ENDForSqlDate() {
		return DateUtils.parseFormerSqlDate(getACCIDENT_END());
	}

	public String getPENSION() {
		return PENSION;
	}

	public void setPENSION(String pENSION) {
		PENSION = pENSION;
	}

	public String getMEDIC() {
		return MEDIC;
	}

	public void setMEDIC(String mEDIC) {
		MEDIC = mEDIC;
	}

	public String getBEAR() {
		return BEAR;
	}

	public void setBEAR(String bEAR) {
		BEAR = bEAR;
	}

	public String getUNEMP() {
		return UNEMP;
	}

	public void setUNEMP(String uNEMP) {
		UNEMP = uNEMP;
	}

	public String getINSU() {
		return INSU;
	}

	public void setINSU(String iNSU) {
		INSU = iNSU;
	}

}
