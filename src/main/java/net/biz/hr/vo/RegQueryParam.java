package net.biz.hr.vo;

public class RegQueryParam {
	private String EMP_ID = "";
	private String EMP_NAME = "";
	private String DEPT_ID = "";
	private String REGMAJOR1 = "";
	private String REGMAJOR2 = "";
	private String REGMAJOR3 = "";
	private String REGNO = "";
	private String CERTIFICATE = "";
	private String CERTNUMBER = "";
	private String PERF_STUDY = "";
	private String CONTINUE_EDU = "";
	private String MEMO = "";

	public String getEMP_ID() {
		return EMP_ID;
	}

	public void setEMP_ID(String eMP_ID) {
		EMP_ID = eMP_ID;
	}

	public String getEMP_NAME() {
		return EMP_NAME;
	}

	public void setEMP_NAME(String eMP_NAME) {
		EMP_NAME = eMP_NAME;
	}

	public String getDEPT_ID() {
		return DEPT_ID;
	}

	public void setDEPT_ID(String dEPT_ID) {
		DEPT_ID = dEPT_ID;
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

	public String getCERTNUMBER() {
		return CERTNUMBER;
	}

	public void setCERTNUMBER(String cERTNUMBER) {
		CERTNUMBER = cERTNUMBER;
	}

	public String getPERF_STUDY() {
		return PERF_STUDY;
	}

	public void setPERF_STUDY(String pERF_STUDY) {
		PERF_STUDY = pERF_STUDY;
	}

	public String getCONTINUE_EDU() {
		return CONTINUE_EDU;
	}

	public void setCONTINUE_EDU(String cONTINUE_EDU) {
		CONTINUE_EDU = cONTINUE_EDU;
	}

	public String getMEMO() {
		return MEMO;
	}

	public void setMEMO(String mEMO) {
		MEMO = mEMO;
	}
	/**
	 * 判断对象内容是否为空
	 * @return
	 */
	public boolean isEmpty() {
		if ("".equals(getCERTIFICATE()) & "".equals(getCERTNUMBER())
				& "".equals(getCONTINUE_EDU()) & "".equals(getDEPT_ID())
				& "".equals(getEMP_ID()) & "".equals(getEMP_NAME())
				& "".equals(getMEMO()) & "".equals(getPERF_STUDY())
				& "".equals(getREGMAJOR1()) & "".equals(getREGMAJOR2())
				& "".equals(getREGMAJOR3()) & "".equals(getREGNO()))
			return true;
		return false;
	}
}
