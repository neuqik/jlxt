package net.biz.project.vo;

public class ProjectQueryParam {
	private String PRJNO = "";
	private String CONTRACTNO = "";
	private String PRJ_NAME = "";
	private String PRJ_LEVEL = "";
	private String PRJ_TYPE = "";
	private String PRJ_STARTTIME = "";
	private String PRJ_ENDTIME = "";
	private String WEEKMEETING = "";
	private String WEEKMEETINGTIME = "";
	private String LOCATION1 = "";
	private String LOCATION2 = "";
	private String LOCATION3 = "";
	private String LOCATION4 = "";
	private String MEMO = "";
	private String DEPT_ID = "";
	private String UNIT_NAME = "";
	private String UNIT_TYPE = "";
	private String QUALI_LEVEL = "";
	private String EMP_NAME = "";
	private String PRJ_ROLE = "";
	private String ENTERTIME = "";
	private String LEAVETIME = "";
	private String PRJ_PROGRESS = "";

	public String getPRJNO() {
		return PRJNO;
	}

	public void setPRJNO(String pRJNO) {
		PRJNO = pRJNO;
	}

	public String getCONTRACTNO() {
		return CONTRACTNO;
	}

	public void setCONTRACTNO(String cONTRACTNO) {
		CONTRACTNO = cONTRACTNO;
	}

	public String getPRJ_NAME() {
		return PRJ_NAME;
	}

	public void setPRJ_NAME(String pRJ_NAME) {
		PRJ_NAME = pRJ_NAME;
	}

	public String getPRJ_LEVEL() {
		return PRJ_LEVEL;
	}

	public void setPRJ_LEVEL(String pRJ_LEVEL) {
		PRJ_LEVEL = pRJ_LEVEL;
	}

	public String getPRJ_TYPE() {
		return PRJ_TYPE;
	}

	public void setPRJ_TYPE(String pRJ_TYPE) {
		PRJ_TYPE = pRJ_TYPE;
	}

	public String getPRJ_STARTTIME() {
		return PRJ_STARTTIME;
	}

	public void setPRJ_STARTTIME(String pRJ_STARTTIME) {
		PRJ_STARTTIME = pRJ_STARTTIME;
	}

	public String getPRJ_ENDTIME() {
		return PRJ_ENDTIME;
	}

	public void setPRJ_ENDTIME(String pRJ_ENDTIME) {
		PRJ_ENDTIME = pRJ_ENDTIME;
	}

	public String getWEEKMEETING() {
		return WEEKMEETING;
	}

	public void setWEEKMEETING(String wEEKMEETING) {
		WEEKMEETING = wEEKMEETING;
	}

	public String getWEEKMEETINGTIME() {
		return WEEKMEETINGTIME;
	}

	public void setWEEKMEETINGTIME(String wEEKMEETINGTIME) {
		WEEKMEETINGTIME = wEEKMEETINGTIME;
	}

	public String getLOCATION1() {
		return LOCATION1;
	}

	public void setLOCATION1(String lOCATION1) {
		LOCATION1 = lOCATION1;
	}

	public String getLOCATION2() {
		return LOCATION2;
	}

	public void setLOCATION2(String lOCATION2) {
		LOCATION2 = lOCATION2;
	}

	public String getLOCATION3() {
		return LOCATION3;
	}

	public void setLOCATION3(String lOCATION3) {
		LOCATION3 = lOCATION3;
	}

	public String getLOCATION4() {
		return LOCATION4;
	}

	public void setLOCATION4(String lOCATION4) {
		LOCATION4 = lOCATION4;
	}

	public String getMEMO() {
		return MEMO;
	}

	public void setMEMO(String mEMO) {
		MEMO = mEMO;
	}

	public String getDEPT_ID() {
		return DEPT_ID;
	}

	public void setDEPT_ID(String dEPT_ID) {
		DEPT_ID = dEPT_ID;
	}

	public String getUNIT_NAME() {
		return UNIT_NAME;
	}

	public void setUNIT_NAME(String uNIT_NAME) {
		UNIT_NAME = uNIT_NAME;
	}

	public String getUNIT_TYPE() {
		return UNIT_TYPE;
	}

	public void setUNIT_TYPE(String uNIT_TYPE) {
		UNIT_TYPE = uNIT_TYPE;
	}

	public String getQUALI_LEVEL() {
		return QUALI_LEVEL;
	}

	public void setQUALI_LEVEL(String qUALI_LEVEL) {
		QUALI_LEVEL = qUALI_LEVEL;
	}

	public String getEMP_NAME() {
		return EMP_NAME;
	}

	public void setEMP_NAME(String eMP_NAME) {
		EMP_NAME = eMP_NAME;
	}

	public String getPRJ_ROLE() {
		return PRJ_ROLE;
	}

	public void setPRJ_ROLE(String pRJ_ROLE) {
		PRJ_ROLE = pRJ_ROLE;
	}

	public String getENTERTIME() {
		return ENTERTIME;
	}

	public void setENTERTIME(String eNTERTIME) {
		ENTERTIME = eNTERTIME;
	}

	public String getLEAVETIME() {
		return LEAVETIME;
	}

	public void setLEAVETIME(String lEAVETIME) {
		LEAVETIME = lEAVETIME;
	}

	public String getPRJ_PROGRESS() {
		return PRJ_PROGRESS;
	}

	public void setPRJ_PROGRESS(String pRJ_PROGRESS) {
		PRJ_PROGRESS = pRJ_PROGRESS;
	}

	/**
	 * 判断对象内容是否为空
	 * 
	 * @return
	 */
	public boolean isEmpty() {
		if ("".equals(getCONTRACTNO()) & "".equals(getDEPT_ID())
				& "".equals(getEMP_NAME()) & "".equals(getENTERTIME())
				& "".equals(getLEAVETIME()) & "".equals(getLOCATION1())
				& "".equals(getLOCATION2()) & "".equals(getLOCATION3())
				& "".equals(getLOCATION4()) & "".equals(getMEMO())
				& "".equals(getPRJNO()) & "".equals(getPRJ_ENDTIME())
				& "".equals(getPRJ_LEVEL()) & "".equals(getPRJ_NAME())
				& "".equals(getPRJ_ROLE()) & "".equals(getPRJ_STARTTIME())
				& "".equals(getPRJ_TYPE()) & "".equals(getPRJNO())
				& "".equals(getQUALI_LEVEL()) & "".equals(getUNIT_NAME())
				& "".equals(getUNIT_TYPE()) & "".equals(getWEEKMEETING())
				& "".equals(getWEEKMEETINGTIME())
				& "".equals(getPRJ_PROGRESS()))
			return true;
		return false;
	}
}
