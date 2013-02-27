package net.biz.hr.vo;

import java.sql.Date;

import net.biz.util.DateUtils;

public class HRD_EMP_EDU {
	private String ID;
	private String EMP_ID;
	private String GRADUATION;
	private String GRADUATEDATE;
	private String MAJOR;
	private String GRADUATENO;
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

	public String getGRADUATION() {
		return GRADUATION;
	}

	public void setGRADUATION(String gRADUATION) {
		GRADUATION = gRADUATION;
	}

	public String getGRADUATEDATE() {
		return GRADUATEDATE;
	}

	public void setGRADUATEDATE(String gRADUATEDATE) {
		GRADUATEDATE = gRADUATEDATE;
	}

	public String getMAJOR() {
		return MAJOR;
	}

	public void setMAJOR(String mAJOR) {
		MAJOR = mAJOR;
	}

	public String getGRADUATENO() {
		return GRADUATENO;
	}

	public void setGRADUATENO(String gRADUATENO) {
		GRADUATENO = gRADUATENO;
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

	public Date getGRADUATEDATEForSqlDate() {
		return DateUtils.parseFormerSqlDate(getGRADUATEDATE());
	}

}
