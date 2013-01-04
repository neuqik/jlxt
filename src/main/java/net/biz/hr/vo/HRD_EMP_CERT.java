package net.biz.hr.vo;

import java.sql.Date;

import net.biz.util.DateUtils;

public class HRD_EMP_CERT {
	private String ID;
	private String EMP_ID;
	private String CERT;
	private String CERTNO;
	private String OBTDATE;
	private String CLOSEDATE;
	private String CERTDEPT;
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

	public String getCERT() {
		return CERT;
	}

	public void setCERT(String cERT) {
		CERT = cERT;
	}

	public String getCERTNO() {
		return CERTNO;
	}

	public void setCERTNO(String cERTNO) {
		CERTNO = cERTNO;
	}

	public String getOBTDATE() {
		return OBTDATE;
	}

	public void setOBTDATE(String oBTDATE) {
		OBTDATE = oBTDATE;
	}

	public String getCLOSEDATE() {
		return CLOSEDATE;
	}

	public void setCLOSEDATE(String cLOSEDATE) {
		CLOSEDATE = cLOSEDATE;
	}

	public String getCERTDEPT() {
		return CERTDEPT;
	}

	public void setCERTDEPT(String cERTDEPT) {
		CERTDEPT = cERTDEPT;
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

	public Date getOBDATEForSqlDate() {
		return DateUtils.parseFormerSqlDate(getOBTDATE());
	}

	public Date getCLOSEDATEForSqlDate() {
		return DateUtils.parseFormerSqlDate(getCLOSEDATE());
	}
}
