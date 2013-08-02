package net.biz.project.vo;

import java.sql.Date;
import java.sql.SQLException;

import net.biz.util.DateUtils;
import net.biz.util.JDBCOracleUtil;

public class PRJ_MAJORCHECK {
	private String SUM3;

	public void setSUM3(String theSUM3) {
		SUM3 = theSUM3;
	}

	public String getSUM3() {
		return SUM3;
	}

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

	private String DEPT_ID;

	public void setDEPT_ID(String theDEPT_ID) {
		DEPT_ID = theDEPT_ID;
	}

	public String getDEPT_ID() {
		return DEPT_ID;
	}

	private String PROGRESS;

	public void setPROGRESS(String thePROGRESS) {
		PROGRESS = thePROGRESS;
	}

	public String getPROGRESS() {
		return PROGRESS;
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

	private String CHECK_USER;

	public void setCHECK_USER(String theCHECK_USER) {
		CHECK_USER = theCHECK_USER;
	}

	public String getCHECK_USER() {
		return CHECK_USER;
	}

	private String TESTER;

	public void setTESTER(String theTESTER) {
		TESTER = theTESTER;
	}

	public String getTESTER() {
		return TESTER;
	}

	private String EMP_ID;

	public void setEMP_ID(String theEMP_ID) {
		EMP_ID = theEMP_ID;
	}

	public String getEMP_ID() {
		return EMP_ID;
	}

	private String EMP_ID_2;

	public void setEMP_ID_2(String theEMP_ID_2) {
		EMP_ID_2 = theEMP_ID_2;
	}

	public String getEMP_ID_2() {
		return EMP_ID_2;
	}

	private String SUM1;

	public void setSUM1(String theSUM1) {
		SUM1 = theSUM1;
	}

	public String getSUM1() {
		return SUM1;
	}

	private String RATIO1;

	public void setRATIO1(String theRATIO1) {
		RATIO1 = theRATIO1;
	}

	public String getRATIO1() {
		return RATIO1;
	}

	private String CHECKGROUP_NO;

	public void setCHECKGROUP_NO(String theCHECKGROUP_NO) {
		CHECKGROUP_NO = theCHECKGROUP_NO;
	}

	/**
	 * 如果没有检查单编号，则自动生成一个
	 * 
	 * @return
	 * @throws SQLException
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws ClassNotFoundException
	 */
	public String getCHECKGROUP_NO() throws SQLException,
			InstantiationException, IllegalAccessException,
			ClassNotFoundException {
		if (CHECKGROUP_NO == null || "".equals(CHECKGROUP_NO)) {
			CHECKGROUP_NO = JDBCOracleUtil.getSYSDATEMS();
		}
		return CHECKGROUP_NO;
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

	private String SUM2;

	public void setSUM2(String theSUM2) {
		SUM2 = theSUM2;
	}

	public String getSUM2() {
		return SUM2;
	}

	private String PRJNO;
	private String PRJ_NAME;

	public String getPRJNO() {
		return PRJNO;
	}

	public void setPRJNO(String pRJNO) {
		PRJNO = pRJNO;
	}

	public String getPRJ_NAME() {
		return PRJ_NAME;
	}

	public void setPRJ_NAME(String pRJ_NAME) {
		PRJ_NAME = pRJ_NAME;
	}

	private String DEPT_NAME;

	public String getDEPT_NAME() {
		return DEPT_NAME;
	}

	public void setDEPT_NAME(String dEPT_NAME) {
		DEPT_NAME = dEPT_NAME;
	}

	private String TESTER_NAME;

	public String getTESTER_NAME() {
		return TESTER_NAME;
	}

	public void setTESTER_NAME(String tESTER_NAME) {
		TESTER_NAME = tESTER_NAME;
	}

	private String CHECK_TYPE;

	public String getCHECK_TYPE() {
		return CHECK_TYPE;
	}

	public void setCHECK_TYPE(String cHECK_TYPE) {
		CHECK_TYPE = cHECK_TYPE;
	}

	private String JOIN_TYPE;
	private String BATCHNO;

	public String getJOIN_TYPE() {
		return JOIN_TYPE;
	}

	public void setJOIN_TYPE(String jOIN_TYPE) {
		JOIN_TYPE = jOIN_TYPE;
	}

	public String getBATCHNO() {
		return BATCHNO;
	}

	public void setBATCHNO(String bATCH) {
		BATCHNO = bATCH;
	}

}