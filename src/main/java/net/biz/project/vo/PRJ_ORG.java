package net.biz.project.vo;

import java.sql.Date;

import net.biz.util.DateUtils;

public class PRJ_ORG {
	private String ID;

	public void setID(String theID) {
		ID = theID;
	}

	public String getID() {
		return ID;
	}

	private String EMP_ID;

	public void setEMP_ID(String theEMP_ID) {
		EMP_ID = theEMP_ID;
	}

	public String getEMP_ID() {
		return EMP_ID;
	}

	private String PRJ_ROLE;

	public void setPRJ_ROLE(String thePRJ_ROLE) {
		PRJ_ROLE = thePRJ_ROLE;
	}

	public String getPRJ_ROLE() {
		return PRJ_ROLE;
	}

	private String PRJ_ID;

	public void setPRJ_ID(String thePRJ_ID) {
		PRJ_ID = thePRJ_ID;
	}

	public String getPRJ_ID() {
		return PRJ_ID;
	}

	private String ENTERTIME;

	public void setENTERTIME(String theENTERTIME) {
		ENTERTIME = theENTERTIME;
	}

	public String getENTERTIME() {
		return ENTERTIME;
	}

	public Date getENTERTIMEForSqlDate() {
		return DateUtils.parseFormerSqlDate(getENTERTIME());
	}

	private String LEAVETIME;

	public void setLEAVETIME(String theLEAVETIME) {
		LEAVETIME = theLEAVETIME;
	}

	public String getLEAVETIME() {
		return LEAVETIME;
	}

	public Date getLEAVETIMEForSqlDate() {
		return DateUtils.parseFormerSqlDate(getLEAVETIME());
	}

	private String RESPONSBILITY;

	public void setRESPONSBILITY(String theRESPONSBILITY) {
		RESPONSBILITY = theRESPONSBILITY;
	}

	public String getRESPONSBILITY() {
		return RESPONSBILITY;
	}

	private String MEMO;

	public void setMEMO(String theMEMO) {
		MEMO = theMEMO;
	}

	public String getMEMO() {
		return MEMO;
	}

	private String VALID = "1";

	public void setVALID(String theVALID) {
		VALID = theVALID;
	}

	public String getVALID() {
		return VALID;
	}

	private String EMP_NAME = "";

	public String getEMP_NAME() {
		return EMP_NAME;
	}

	public void setEMP_NAME(String theEMP_NAME) {
		EMP_NAME = theEMP_NAME;
	}
}