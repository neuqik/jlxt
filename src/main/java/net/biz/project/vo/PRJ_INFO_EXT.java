package net.biz.project.vo;

import java.sql.Date;

import net.biz.util.DateUtils;

public class PRJ_INFO_EXT {
	private String CONSTRUCT_TYPE = "";

	public String getCONSTRUCT_TYPE() {
		return CONSTRUCT_TYPE;
	}

	public void setCONSTRUCT_TYPE(String cONSTRUCT_TYPE) {
		CONSTRUCT_TYPE = cONSTRUCT_TYPE;
	}

	private String HEIGHT = "";

	public String getHEIGHT() {
		return HEIGHT;
	}

	public void setHEIGHT(String hEIGHT) {
		HEIGHT = hEIGHT;
	}

	private String FLOOR = "";

	public String getFLOOR() {
		return FLOOR;
	}

	public void setFLOOR(String fLOOR) {
		FLOOR = fLOOR;
	}

	private String SECURITY_LEVEL = "";

	public String getSECURITY_LEVEL() {
		return SECURITY_LEVEL;
	}

	public void setSECURITY_LEVEL(String sECURITY_LEVEL) {
		SECURITY_LEVEL = sECURITY_LEVEL;
	}

	private String ACT_BEGIN = "";
	private String ACT_END = "";
	private String ACT_TIME = "";

	public String getACT_BEGIN() {
		return ACT_BEGIN;
	}

	public void setACT_BEGIN(String aCT_BEGIN) {
		ACT_BEGIN = aCT_BEGIN;
	}

	public String getACT_END() {
		return ACT_END;
	}

	public void setACT_END(String aCT_END) {
		ACT_END = aCT_END;
	}

	public String getACT_TIME() {
		return ACT_TIME;
	}

	public void setACT_TIME(String aCT_TIME) {
		ACT_TIME = aCT_TIME;
	}

	private String DEPT_ID = "";

	public String getDEPT_ID() {
		return DEPT_ID;
	}

	public void setDEPT_ID(String dEPT_ID) {
		DEPT_ID = dEPT_ID;
	}

	private String IMAGE_PROGRESS = "";

	public String getIMAGE_PROGRESS() {
		return IMAGE_PROGRESS;
	}

	public void setIMAGE_PROGRESS(String iMAGE_PROGRESS) {
		IMAGE_PROGRESS = iMAGE_PROGRESS;
	}

}