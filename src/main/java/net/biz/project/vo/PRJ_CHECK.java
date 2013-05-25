package net.biz.project.vo;

import java.sql.Date;

import net.biz.util.DateUtils;

public class PRJ_CHECK {
	private String ID;

	public void setID(String theID) {
		ID = theID;
	}

	public String getID() {
		return ID;
	}

	private String PRJ_ID;

	public void setPRJ_ID(String thePRJ_ID) {
		PRJ_ID = thePRJ_ID;
	}

	public String getPRJ_ID() {
		return PRJ_ID;
	}

	private String CHECKITEM;

	public void setCHECKITEM(String theCHECKITEM) {
		CHECKITEM = theCHECKITEM;
	}

	public String getCHECKITEM() {
		return CHECKITEM;
	}

	private String CHECKDATE;

	public void setCHECKDATE(String theCHECKDATE) {
		CHECKDATE = theCHECKDATE;
	}

	public String getCHECKDATE() {
		return CHECKDATE;
	}

	public Date getCHECKDATEForSqlDate() {
		return DateUtils.parseFormerSqlDate(getCHECKDATE());
	}

	private String ACT_SCORE;

	public void setACT_SCORE(String theACT_SCORE) {
		ACT_SCORE = theACT_SCORE;
	}

	public String getACT_SCORE() {
		return ACT_SCORE;
	}

	private String DEPT_ID;

	public void setDEPT_ID(String theDEPT_ID) {
		DEPT_ID = theDEPT_ID;
	}

	public String getDEPT_ID() {
		return DEPT_ID;
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

	private String JSDW_ID;

	public void setJSDW_ID(String theJSDW_ID) {
		JSDW_ID = theJSDW_ID;
	}

	public String getJSDW_ID() {
		return JSDW_ID;
	}

	private String SGDW_ID;

	public void setSGDW_ID(String theSGDW_ID) {
		SGDW_ID = theSGDW_ID;
	}

	public String getSGDW_ID() {
		return SGDW_ID;
	}

	private String PRJ_PROGRESS;

	public void setPRJ_PROGRESS(String thePRJ_PROGRESS) {
		PRJ_PROGRESS = thePRJ_PROGRESS;
	}

	public String getPRJ_PROGRESS() {
		return PRJ_PROGRESS;
	}

	private String CONSTRUCT_TYPE;

	public void setCONSTRUCT_TYPE(String theCONSTRUCT_TYPE) {
		CONSTRUCT_TYPE = theCONSTRUCT_TYPE;
	}

	public String getCONSTRUCT_TYPE() {
		return CONSTRUCT_TYPE;
	}

	private String EMP_ID;

	public void setEMP_ID(String theEMP_ID) {
		EMP_ID = theEMP_ID;
	}

	public String getEMP_ID() {
		return EMP_ID;
	}

	private String BEGINDATE;

	public void setBEGINDATE(String theBEGINDATE) {
		BEGINDATE = theBEGINDATE;
	}

	public String getBEGINDATE() {
		return BEGINDATE;
	}

	public Date getBEGINDATEForSqlDate() {
		return DateUtils.parseFormerSqlDate(getBEGINDATE());
	}

	private String ENDDATE;

	public void setENDDATE(String theENDDATE) {
		ENDDATE = theENDDATE;
	}

	public String getENDDATE() {
		return ENDDATE;
	}

	public Date getENDDATEForSqlDate() {
		return DateUtils.parseFormerSqlDate(getENDDATE());
	}

	private String CHECKGROUP_NO;

	public void setCHECKGROUP_NO(String theCHECKGROUP_NO) {
		CHECKGROUP_NO = theCHECKGROUP_NO;
	}

	public String getCHECKGROUP_NO() {
		return CHECKGROUP_NO;
	}
}