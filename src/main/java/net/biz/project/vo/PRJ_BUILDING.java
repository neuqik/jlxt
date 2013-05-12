package net.biz.project.vo;

import java.sql.Date;

import net.biz.util.DateUtils;

public class PRJ_BUILDING {
	private String LICENSE_DATE;

	public void setLICENSE_DATE(String theLICENSE_DATE) {
		LICENSE_DATE = theLICENSE_DATE;
	}

	public String getLICENSE_DATE() {
		return LICENSE_DATE;
	}

	public Date getLICENSE_DATEForSqlDate() {
		return DateUtils.parseFormerSqlDate(getLICENSE_DATE());
	}

	private String SECURITY_LEVEL;

	public void setSECURITY_LEVEL(String theSECURITY_LEVEL) {
		SECURITY_LEVEL = theSECURITY_LEVEL;
	}

	public String getSECURITY_LEVEL() {
		return SECURITY_LEVEL;
	}

	private String CONSTRUCT_TYPE;

	public void setCONSTRUCT_TYPE(String theCONSTRUCT_TYPE) {
		CONSTRUCT_TYPE = theCONSTRUCT_TYPE;
	}

	public String getCONSTRUCT_TYPE() {
		return CONSTRUCT_TYPE;
	}

	private String ACT_TIME;

	public void setACT_TIME(String theACT_TIME) {
		ACT_TIME = theACT_TIME;
	}

	public String getACT_TIME() {
		return ACT_TIME;
	}

	private String PROGRESS;

	public void setPROGRESS(String thePROGRESS) {
		PROGRESS = thePROGRESS;
	}

	public String getPROGRESS() {
		return PROGRESS;
	}

	private String BUILDER_LICENSE;

	public void setBUILDER_LICENSE(String theBUILDER_LICENSE) {
		BUILDER_LICENSE = theBUILDER_LICENSE;
	}

	public String getBUILDER_LICENSE() {
		return BUILDER_LICENSE;
	}

	private String BUILDING_TYPE;

	public void setBUILDING_TYPE(String theBUILDING_TYPE) {
		BUILDING_TYPE = theBUILDING_TYPE;
	}

	public String getBUILDING_TYPE() {
		return BUILDING_TYPE;
	}

	private String IMAGE_PROGRESS;

	public void setIMAGE_PROGRESS(String theIMAGE_PROGRESS) {
		IMAGE_PROGRESS = theIMAGE_PROGRESS;
	}

	public String getIMAGE_PROGRESS() {
		return IMAGE_PROGRESS;
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

	private String BUILDING_ID;

	public void setBUILDING_ID(String theBUILDING_ID) {
		BUILDING_ID = theBUILDING_ID;
	}

	public String getBUILDING_ID() {
		return BUILDING_ID;
	}

	private String UNDERFLOOR;

	public void setUNDERFLOOR(String theUNDERFLOOR) {
		UNDERFLOOR = theUNDERFLOOR;
	}

	public String getUNDERFLOOR() {
		return UNDERFLOOR;
	}

	private String ABOVEFLOOR;

	public void setABOVEFLOOR(String theABOVEFLOOR) {
		ABOVEFLOOR = theABOVEFLOOR;
	}

	public String getABOVEFLOOR() {
		return ABOVEFLOOR;
	}

	private String HEIGHT;

	public void setHEIGHT(String theHEIGHT) {
		HEIGHT = theHEIGHT;
	}

	public String getHEIGHT() {
		return HEIGHT;
	}

	private String BUILDING_AREA;

	public void setBUILDING_AREA(String theBUILDING_AREA) {
		BUILDING_AREA = theBUILDING_AREA;
	}

	public String getBUILDING_AREA() {
		return BUILDING_AREA;
	}
}