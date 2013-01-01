package net.biz.hr.vo;

import java.sql.Date;

import net.biz.util.DateUtils;

public class HRD_EMP_TRAIN {
	private String ID;
	private String EMP_ID;
	private String TRAININGDATE;
	private String TRAINING;
	private String KNOWLEDGE;
	private String TRAININGDEPT;
	private Double FEE;
	private String INTERTRAINING;
	private String MEMO;

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

	public String getTRAININGDATE() {
		return TRAININGDATE;
	}

	public void setTRAININGDATE(String tRAININGDATE) {
		TRAININGDATE = tRAININGDATE;
	}

	public String getTRAINING() {
		return TRAINING;
	}

	public void setTRAINING(String tRAINING) {
		TRAINING = tRAINING;
	}

	public String getKNOWLEDGE() {
		return KNOWLEDGE;
	}

	public void setKNOWLEDGE(String kNOWLEDGE) {
		KNOWLEDGE = kNOWLEDGE;
	}

	public String getTRAININGDEPT() {
		return TRAININGDEPT;
	}

	public void setTRAININGDEPT(String tRAININGDEPT) {
		TRAININGDEPT = tRAININGDEPT;
	}

	public Double getFEE() {
		return FEE;
	}

	public void setFEE(Double fEE) {
		FEE = fEE;
	}

	public String getINTERTRAINING() {
		return INTERTRAINING;
	}

	public void setINTERTRAINING(String iNTERTRAINING) {
		INTERTRAINING = iNTERTRAINING;
	}

	public String getMEMO() {
		return MEMO;
	}

	public void setMEMO(String mEMO) {
		MEMO = mEMO;
	}

	public Date getTRAINDATEForSQL() {
		return DateUtils.parseFormerSqlDate(getTRAININGDATE());
	}
}
