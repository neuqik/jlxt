package net.biz.hr.vo;

import java.sql.Date;

import net.biz.util.DateUtils;

public class HRD_EMP_REG {
	private String ID;
	private String EMP_ID;
	private String REGTYPE;
	private String REGLEVEL;
	private String REGMAJOR1;
	private String REGMAJOR2;
	private String REGMAJOR3;
	private String REGNO;
	private String CERTIFICATE;
	private String VALIDDATE;
	private String ISSUEDATE;
	private String CERTNUMBER;
	private String CERTDATE;
	private String CERTVALIDDATE;
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

	public String getREGTYPE() {
		return REGTYPE;
	}

	public void setREGTYPE(String rEGTYPE) {
		REGTYPE = rEGTYPE;
	}

	public String getREGLEVEL() {
		return REGLEVEL;
	}

	public void setREGLEVEL(String rEGLEVEL) {
		REGLEVEL = rEGLEVEL;
	}

	public String getREGMAJOR1() {
		return REGMAJOR1;
	}

	public void setREGMAJOR1(String rEGMAJOR1) {
		REGMAJOR1 = rEGMAJOR1;
	}

	public String getREGMAJOR2() {
		return REGMAJOR2;
	}

	public void setREGMAJOR2(String rEGMAJOR2) {
		REGMAJOR2 = rEGMAJOR2;
	}

	public String getREGMAJOR3() {
		return REGMAJOR3;
	}

	public void setREGMAJOR3(String rEGMAJOR3) {
		REGMAJOR3 = rEGMAJOR3;
	}

	public String getREGNO() {
		return REGNO;
	}

	public void setREGNO(String rEGNO) {
		REGNO = rEGNO;
	}

	public String getCERTIFICATE() {
		return CERTIFICATE;
	}

	public void setCERTIFICATE(String cERTIFICATE) {
		CERTIFICATE = cERTIFICATE;
	}

	public String getVALIDDATE() {
		return VALIDDATE;
	}

	public void setVALIDDATE(String vALIDDATE) {
		VALIDDATE = vALIDDATE;
	}

	public String getISSUEDATE() {
		return ISSUEDATE;
	}

	public void setISSUEDATE(String iSSUEDATE) {
		ISSUEDATE = iSSUEDATE;
	}

	public String getCERTNUMBER() {
		return CERTNUMBER;
	}

	public void setCERTNUMBER(String cERTNUMBER) {
		CERTNUMBER = cERTNUMBER;
	}

	public String getCERTDATE() {
		return CERTDATE;
	}

	public void setCERTDATE(String cERTDATE) {
		CERTDATE = cERTDATE;
	}

	public String getCERTVALIDDATE() {
		return CERTVALIDDATE;
	}

	public void setCERTVALIDDATE(String cERTVALIDDATE) {
		CERTVALIDDATE = cERTVALIDDATE;
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

	public Date getVALIDDATEForSqlDate() {
		return DateUtils.parseFormerSqlDate(getVALIDDATE());
	}

	public Date getISSUEDATEForSqlDate() {
		return DateUtils.parseFormerSqlDate(getISSUEDATE());
	}

	public Date getCERTDATEForSqlDate() {
		return DateUtils.parseFormerSqlDate(getCERTDATE());
	}

	public Date getCERTVALIDDATESqlDate() {
		return DateUtils.parseFormerSqlDate(getCERTVALIDDATE());
	}
}
