package net.biz.hr.vo;

import java.sql.Date;

import net.biz.util.DateUtils;

public class HRD_EMP_WORK {
	private String ID;
	private String EMP_ID;
	private String BEGIN;
	private String END;
	private String UNIT;
	private String DEPT;
	private String JOBROLE;
	private String MEMO;

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

	public String getBEGIN() {
		return BEGIN;
	}

	public void setBEGIN(String bEGIN) {
		BEGIN = bEGIN;
	}

	public String getEND() {
		return END;
	}

	public void setEND(String eND) {
		END = eND;
	}

	public String getUNIT() {
		return UNIT;
	}

	public void setUNIT(String uNIT) {
		UNIT = uNIT;
	}

	public String getDEPT() {
		return DEPT;
	}

	public void setDEPT(String dEPT) {
		DEPT = dEPT;
	}

	public String getJOBROLE() {
		return JOBROLE;
	}

	public void setJOBROLE(String jOBROLE) {
		JOBROLE = jOBROLE;
	}

	public String getMEMO() {
		return MEMO;
	}

	public void setMEMO(String mEMO) {
		MEMO = mEMO;
	}

	public Date getBEGINForSqlDate() {
		return DateUtils.parseFormerSqlDate(getBEGIN());
	}

	public Date getENDForSqlDate() {
		return DateUtils.parseFormerSqlDate(getEND());
	}

}
