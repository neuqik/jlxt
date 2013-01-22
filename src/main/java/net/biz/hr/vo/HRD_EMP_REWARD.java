package net.biz.hr.vo;

import java.sql.Date;

import net.biz.util.DateUtils;

public class HRD_EMP_REWARD {
	private String ID;
	private String EMP_ID;
	private String REWARDTYPE;
	private String REWARDDATE;
	private String REWARDDEPT;
	private String REWARD;
	private String MEMO;
	private String REWARD_PERSON;

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

	public String getREWARDTYPE() {
		return REWARDTYPE;
	}

	public void setREWARDTYPE(String rEWARDTYPE) {
		REWARDTYPE = rEWARDTYPE;
	}

	public String getREWARDDATE() {
		return REWARDDATE;
	}

	public void setREWARDDATE(String rEWARDDATE) {
		REWARDDATE = rEWARDDATE;
	}

	public String getREWARDDEPT() {
		return REWARDDEPT;
	}

	public void setREWARDDEPT(String rEWARDDEPT) {
		REWARDDEPT = rEWARDDEPT;
	}

	public String getREWARD() {
		return REWARD;
	}

	public void setREWARD(String rEWARD) {
		REWARD = rEWARD;
	}

	public String getMEMO() {
		return MEMO;
	}

	public void setMEMO(String mEMO) {
		MEMO = mEMO;
	}

	public Date getREWARDDATEForSqlDate() {
		return DateUtils.parseFormerSqlDate(getREWARDDATE());
	}

	public String getREWARD_PERSON() {
		return REWARD_PERSON;
	}

	public void setREWARD_PERSON(String rEWARD_PERSON) {
		REWARD_PERSON = rEWARD_PERSON;
	}

}
