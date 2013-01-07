package net.biz.hr.vo;

import java.sql.Date;

import net.biz.framework.codelist.CodeList;
import net.biz.util.DateUtils;

public class HRD_EMP_TRANSFER {
	private String ID = "";
	private String EMP_ID = "";
	private String EMP_NAME = "";
	private String DEPT_ID = "";
	private String IDCARD = "";
	private String TRANSFERDATE = "";
	private String TRANSFERTYPE = "";
	private String TRANSFERREASON = "";
	private String PREVDEPT_ID = "";
	private String NEWDEPT_ID = "";
	private String MEMO = "";
	private String VALID = "";

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

	public String getIDCARD() {
		return IDCARD;
	}

	public void setIDCARD(String iDCARD) {
		IDCARD = iDCARD;
	}

	public String getTRANSFERDATE() {
		return TRANSFERDATE;
	}

	public void setTRANSFERDATE(String tRANSFERDATE) {
		TRANSFERDATE = tRANSFERDATE;
	}

	public String getTRANSFERTYPE() {
		return TRANSFERTYPE;
	}

	public void setTRANSFERTYPE(String tRANSFERTYPE) {
		TRANSFERTYPE = tRANSFERTYPE;
	}

	public String getTRANSFERREASON() {
		return TRANSFERREASON;
	}

	public void setTRANSFERREASON(String tRANSFERREASON) {
		TRANSFERREASON = tRANSFERREASON;
	}

	public String getPREVDEPT_ID() {
		return PREVDEPT_ID;
	}

	public void setPREVDEPT_ID(String pREVDEPT_ID) {
		PREVDEPT_ID = pREVDEPT_ID;
	}

	public String getNEWDEPT_ID() {
		return NEWDEPT_ID;
	}

	public void setNEWDEPT_ID(String nEWDEPT_ID) {
		NEWDEPT_ID = nEWDEPT_ID;
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

	public Date getTRANSFERDATEForSqlDate() {
		return DateUtils.parseFormerSqlDate(getTRANSFERDATE());
	}
	/**
	 * 获得文本转的代码值
	 * @return
	 */
	public String getDEPT_IDValue() {
		return CodeList.getCodeValue("DEPT_ID", getDEPT_ID());
	}
}
