package net.biz.project.vo;

import java.sql.Date;
import java.sql.SQLException;

import net.biz.util.DateUtils;
import net.biz.util.JDBCOracleUtil;

public class PRJ_SUPERVISOR_MAJORCHECK {
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

	private String BATCHNO;

	public void setBATCHNO(String theBATCHNO) {
		BATCHNO = theBATCHNO;
	}

	public String getBATCHNO() {
		return BATCHNO;
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

	private String MEMO;

	public void setMEMO(String theMEMO) {
		MEMO = theMEMO;
	}

	public String getMEMO() {
		return MEMO;
	}

	private String CONSTRUCT;

	public void setCONSTRUCT(String theCONSTRUCT) {
		CONSTRUCT = theCONSTRUCT;
	}

	public String getCONSTRUCT() {
		return CONSTRUCT;
	}

	private String ACT_BEGIN;

	public void setACT_BEGIN(String theACT_BEGIN) {
		ACT_BEGIN = theACT_BEGIN;
	}

	public String getACT_BEGIN() {
		return ACT_BEGIN;
	}

	public Date getACT_BEGINForSqlDate() {
		return DateUtils.parseFormerSqlDate(getACT_BEGIN());
	}

	private String ACT_END;

	public void setACT_END(String theACT_END) {
		ACT_END = theACT_END;
	}

	public String getACT_END() {
		return ACT_END;
	}

	public Date getACT_ENDForSqlDate() {
		return DateUtils.parseFormerSqlDate(getACT_END());
	}

	private String PRJ_AREA;

	public void setPRJ_AREA(String thePRJ_AREA) {
		PRJ_AREA = thePRJ_AREA;
	}

	public String getPRJ_AREA() {
		return PRJ_AREA;
	}

	private String PRJ_LEVEL;

	public void setPRJ_LEVEL(String thePRJ_LEVEL) {
		PRJ_LEVEL = thePRJ_LEVEL;
	}

	public String getPRJ_LEVEL() {
		return PRJ_LEVEL;
	}

	private String CHECKGROUP_NO;

	public void setCHECKGROUP_NO(String theCHECKGROUP_NO) {
		CHECKGROUP_NO = theCHECKGROUP_NO;
	}

	public String getCHECKGROUP_NO() throws SQLException,
			InstantiationException, IllegalAccessException,
			ClassNotFoundException {
		if (CHECKGROUP_NO == null || "".equals(CHECKGROUP_NO)) {
			CHECKGROUP_NO = JDBCOracleUtil.getSYSDATEMS();
		}
		return CHECKGROUP_NO;
	}

	private String CONSTRUCTION;

	public void setCONSTRUCTION(String theCONSTRUCTION) {
		CONSTRUCTION = theCONSTRUCTION;
	}

	public String getCONSTRUCTION() {
		return CONSTRUCTION;
	}

	private String CONSTRUCTION_SUM;

	public void setCONSTRUCTION_SUM(String theCONSTRUCTION_SUM) {
		CONSTRUCTION_SUM = theCONSTRUCTION_SUM;
	}

	public String getCONSTRUCTION_SUM() {
		return CONSTRUCTION_SUM;
	}

	private String CONSTRUCTION_COMMENT;

	public void setCONSTRUCTION_COMMENT(String theCONSTRUCTION_COMMENT) {
		CONSTRUCTION_COMMENT = theCONSTRUCTION_COMMENT;
	}

	public String getCONSTRUCTION_COMMENT() {
		return CONSTRUCTION_COMMENT;
	}

	private String WATER;

	public void setWATER(String theWATER) {
		WATER = theWATER;
	}

	public String getWATER() {
		return WATER;
	}

	private String WATER_SUM;

	public void setWATER_SUM(String theWATER_SUM) {
		WATER_SUM = theWATER_SUM;
	}

	public String getWATER_SUM() {
		return WATER_SUM;
	}

	private String WATER_COMMENT;

	public void setWATER_COMMENT(String theWATER_COMMENT) {
		WATER_COMMENT = theWATER_COMMENT;
	}

	public String getWATER_COMMENT() {
		return WATER_COMMENT;
	}

	private String ELECTRIC;

	public void setELECTRIC(String theELECTRIC) {
		ELECTRIC = theELECTRIC;
	}

	public String getELECTRIC() {
		return ELECTRIC;
	}

	private String ELECTRIC_SUM;

	public void setELECTRIC_SUM(String theELECTRIC_SUM) {
		ELECTRIC_SUM = theELECTRIC_SUM;
	}

	public String getELECTRIC_SUM() {
		return ELECTRIC_SUM;
	}

	private String ELECTRIC_COMMENT;

	public void setELECTRIC_COMMENT(String theELECTRIC_COMMENT) {
		ELECTRIC_COMMENT = theELECTRIC_COMMENT;
	}

	public String getELECTRIC_COMMENT() {
		return ELECTRIC_COMMENT;
	}

	private String SECURITY;

	public void setSECURITY(String theSECURITY) {
		SECURITY = theSECURITY;
	}

	public String getSECURITY() {
		return SECURITY;
	}

	private String SECURITY_SUM;

	public void setSECURITY_SUM(String theSECURITY_SUM) {
		SECURITY_SUM = theSECURITY_SUM;
	}

	public String getSECURITY_SUM() {
		return SECURITY_SUM;
	}

	private String SECURITY_COMMENT;

	public void setSECURITY_COMMENT(String theSECURITY_COMMENT) {
		SECURITY_COMMENT = theSECURITY_COMMENT;
	}

	public String getSECURITY_COMMENT() {
		return SECURITY_COMMENT;
	}

	private String CONSTRUCTION_RATIO;

	public void setCONSTRUCTION_RATIO(String theCONSTRUCTION_RATIO) {
		CONSTRUCTION_RATIO = theCONSTRUCTION_RATIO;
	}

	public String getCONSTRUCTION_RATIO() {
		return CONSTRUCTION_RATIO;
	}

	private String WATER_RATIO;

	public void setWATER_RATIO(String theWATER_RATIO) {
		WATER_RATIO = theWATER_RATIO;
	}

	public String getWATER_RATIO() {
		return WATER_RATIO;
	}

	private String ELECTRIC_RATIO;

	public void setELECTRIC_RATIO(String theELECTRIC_RATIO) {
		ELECTRIC_RATIO = theELECTRIC_RATIO;
	}

	public String getELECTRIC_RATIO() {
		return ELECTRIC_RATIO;
	}

	private String SECURITY_RATIO;

	public void setSECURITY_RATIO(String theSECURITY_RATIO) {
		SECURITY_RATIO = theSECURITY_RATIO;
	}

	public String getSECURITY_RATIO() {
		return SECURITY_RATIO;
	}

	private String TOTAL_SUM;

	public void setTOTAL_SUM(String theTOTAL_SUM) {
		TOTAL_SUM = theTOTAL_SUM;
	}

	public String getTOTAL_SUM() {
		return TOTAL_SUM;
	}

	private String VALID = "1";

	public void setVALID(String theVALID) {
		VALID = theVALID;
	}

	public String getVALID() {
		return VALID;
	}

	private String PRJNO = "";

	public String getPRJNO() {
		return PRJNO;
	}

	public void setPRJNO(String pRJNO) {
		PRJNO = pRJNO;
	}

	private String PRJ_NAME = "";
	private String DEPT_NAME = "";

	public String getPRJ_NAME() {
		return PRJ_NAME;
	}

	public void setPRJ_NAME(String pRJ_NAME) {
		PRJ_NAME = pRJ_NAME;
	}

	public String getDEPT_NAME() {
		return DEPT_NAME;
	}

	public void setDEPT_NAME(String dEPT_NAME) {
		DEPT_NAME = dEPT_NAME;
	}

}