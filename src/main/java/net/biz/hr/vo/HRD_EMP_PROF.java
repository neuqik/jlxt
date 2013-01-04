package net.biz.hr.vo;

import java.sql.Date;

import net.biz.util.DateUtils;

public class HRD_EMP_PROF {
	private String ID;
	private String EMP_ID;
	private String PROFTYPE;
	private String OBTAINTYPE;
	private String OBTAINDATE;
	private String OBTAINDEPT;
	private String PROF_NUM;
	private String ENDDATE;
	private String MEMO;
	private String VALID;

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

	public String getPROFTYPE() {
		return PROFTYPE;
	}

	public void setPROFTYPE(String pROFTYPE) {
		PROFTYPE = pROFTYPE;
	}

	public String getOBTAINTYPE() {
		return OBTAINTYPE;
	}

	public void setOBTAINTYPE(String oBTAINTYPE) {
		OBTAINTYPE = oBTAINTYPE;
	}

	public String getOBTAINDATE() {
		return OBTAINDATE;
	}

	public void setOBTAINDATE(String oBTAINDATE) {
		OBTAINDATE = oBTAINDATE;
	}

	public String getOBTAINDEPT() {
		return OBTAINDEPT;
	}

	public void setOBTAINDEPT(String oBTAINDEPT) {
		OBTAINDEPT = oBTAINDEPT;
	}

	public String getPROF_NUM() {
		return PROF_NUM;
	}

	public void setPROF_NUM(String pROF_NUM) {
		PROF_NUM = pROF_NUM;
	}

	public String getENDDATE() {
		return ENDDATE;
	}

	public void setENDDATE(String eNDDATE) {
		ENDDATE = eNDDATE;
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

	public Date getOBTAINDATEForSqlDate() {
		return DateUtils.parseFormerSqlDate(getOBTAINDATE());
	}

	public Date getENDDATEForSqlDate() {
		return DateUtils.parseFormerSqlDate(getENDDATE());
	}

}
