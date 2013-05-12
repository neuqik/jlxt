package net.biz.project.vo;

import java.sql.Date;

import net.biz.util.DateUtils;

public class PRJ_INFO {
	private String BUILDINGCOUNT;

	public void setBUILDINGCOUNT(String theBUILDINGCOUNT) {
		BUILDINGCOUNT = theBUILDINGCOUNT;
	}

	public String getBUILDINGCOUNT() {
		return BUILDINGCOUNT;
	}

	private String CONTRACTAREA;

	public void setCONTRACTAREA(String theCONTRACTAREA) {
		CONTRACTAREA = theCONTRACTAREA;
	}

	public String getCONTRACTAREA() {
		return CONTRACTAREA;
	}

	private String PRJ_LEVEL;

	public void setPRJ_LEVEL(String thePRJ_LEVEL) {
		PRJ_LEVEL = thePRJ_LEVEL;
	}

	public String getPRJ_LEVEL() {
		return PRJ_LEVEL;
	}

	private String PRJ_TYPE;

	public void setPRJ_TYPE(String thePRJ_TYPE) {
		PRJ_TYPE = thePRJ_TYPE;
	}

	public String getPRJ_TYPE() {
		return PRJ_TYPE;
	}

	private String PRJ_INVEST;

	public void setPRJ_INVEST(String thePRJ_INVEST) {
		PRJ_INVEST = thePRJ_INVEST;
	}

	public String getPRJ_INVEST() {
		return PRJ_INVEST;
	}

	private String WEEKMEETING;

	public void setWEEKMEETING(String theWEEKMEETING) {
		WEEKMEETING = theWEEKMEETING;
	}

	public String getWEEKMEETING() {
		return WEEKMEETING;
	}

	private String PRJ_MAP;

	public void setPRJ_MAP(String thePRJ_MAP) {
		PRJ_MAP = thePRJ_MAP;
	}

	public String getPRJ_MAP() {
		return PRJ_MAP;
	}

	private String PRJ_REGION;

	public void setPRJ_REGION(String thePRJ_REGION) {
		PRJ_REGION = thePRJ_REGION;
	}

	public String getPRJ_REGION() {
		return PRJ_REGION;
	}

	private String PRJ_ARCHIVE;

	public void setPRJ_ARCHIVE(String thePRJ_ARCHIVE) {
		PRJ_ARCHIVE = thePRJ_ARCHIVE;
	}

	public String getPRJ_ARCHIVE() {
		return PRJ_ARCHIVE;
	}

	private String WEEKMEETINGTIME;

	public void setWEEKMEETINGTIME(String theWEEKMEETINGTIME) {
		WEEKMEETINGTIME = theWEEKMEETINGTIME;
	}

	public String getWEEKMEETINGTIME() {
		return WEEKMEETINGTIME;
	}

	private String PRJ_ARCHIVETIME;

	public void setPRJ_ARCHIVETIME(String thePRJ_ARCHIVETIME) {
		PRJ_ARCHIVETIME = thePRJ_ARCHIVETIME;
	}

	public String getPRJ_ARCHIVETIME() {
		return PRJ_ARCHIVETIME;
	}

	public Date getPRJ_ARCHIVETIMEForSqlDate() {
		return DateUtils.parseFormerSqlDate(getPRJ_ARCHIVETIME());
	}

	private String LOCATION4;

	public void setLOCATION4(String theLOCATION4) {
		LOCATION4 = theLOCATION4;
	}

	public String getLOCATION4() {
		return LOCATION4;
	}

	private String ID;

	public void setID(String theID) {
		ID = theID;
	}

	public String getID() {
		return ID;
	}

	private String PRJNO;

	public void setPRJNO(String thePRJNO) {
		PRJNO = thePRJNO;
	}

	public String getPRJNO() {
		return PRJNO;
	}

	private String CONTRACTNO;

	public void setCONTRACTNO(String theCONTRACTNO) {
		CONTRACTNO = theCONTRACTNO;
	}

	public String getCONTRACTNO() {
		return CONTRACTNO;
	}

	private String PRJ_NAME;

	public void setPRJ_NAME(String thePRJ_NAME) {
		PRJ_NAME = thePRJ_NAME;
	}

	public String getPRJ_NAME() {
		return PRJ_NAME;
	}

	private String PRJ_AREA;

	public void setPRJ_AREA(String thePRJ_AREA) {
		PRJ_AREA = thePRJ_AREA;
	}

	public String getPRJ_AREA() {
		return PRJ_AREA;
	}

	private String QUALITY_TARGET;

	public void setQUALITY_TARGET(String theQUALITY_TARGET) {
		QUALITY_TARGET = theQUALITY_TARGET;
	}

	public String getQUALITY_TARGET() {
		return QUALITY_TARGET;
	}

	private String PRJ_STARTTIME;

	public void setPRJ_STARTTIME(String thePRJ_STARTTIME) {
		PRJ_STARTTIME = thePRJ_STARTTIME;
	}

	public String getPRJ_STARTTIME() {
		return PRJ_STARTTIME;
	}

	public Date getPRJ_STARTTIMEForSqlDate() {
		return DateUtils.parseFormerSqlDate(getPRJ_STARTTIME());
	}

	private String PRJ_ENDTIME;

	public void setPRJ_ENDTIME(String thePRJ_ENDTIME) {
		PRJ_ENDTIME = thePRJ_ENDTIME;
	}

	public String getPRJ_ENDTIME() {
		return PRJ_ENDTIME;
	}

	public Date getPRJ_ENDTIMEForSqlDate() {
		return DateUtils.parseFormerSqlDate(getPRJ_ENDTIME());
	}

	private String PRJ_TIME;

	public void setPRJ_TIME(String thePRJ_TIME) {
		PRJ_TIME = thePRJ_TIME;
	}

	public String getPRJ_TIME() {
		return PRJ_TIME;
	}

	private String PRJ_PIC;

	public void setPRJ_PIC(String thePRJ_PIC) {
		PRJ_PIC = thePRJ_PIC;
	}

	public String getPRJ_PIC() {
		return PRJ_PIC;
	}

	private String PRJ_PROGRESS;

	public void setPRJ_PROGRESS(String thePRJ_PROGRESS) {
		PRJ_PROGRESS = thePRJ_PROGRESS;
	}

	public String getPRJ_PROGRESS() {
		return PRJ_PROGRESS;
	}

	private String LOCATION1;

	public void setLOCATION1(String theLOCATION1) {
		LOCATION1 = theLOCATION1;
	}

	public String getLOCATION1() {
		return LOCATION1;
	}

	private String MEMO;

	public void setMEMO(String theMEMO) {
		MEMO = theMEMO;
	}

	public String getMEMO() {
		return MEMO;
	}

	private String VALID;

	public void setVALID(String theVALID) {
		VALID = theVALID;
	}

	public String getVALID() {
		return VALID;
	}

	private String LOCATION2;

	public void setLOCATION2(String theLOCATION2) {
		LOCATION2 = theLOCATION2;
	}

	public String getLOCATION2() {
		return LOCATION2;
	}

	private String LOCATION3;

	public void setLOCATION3(String theLOCATION3) {
		LOCATION3 = theLOCATION3;
	}

	public String getLOCATION3() {
		return LOCATION3;
	}
}