package net.biz.grid.gt.dataaccess.helper;

import java.util.Map;

public class SqlSnippet {
	public String snippet;
	public String condition;
	public String content;
	public int start;
	public int end;
	public String type;
	public String condition_before;
	public String condition_c;
	public String condition_after;
	public Object value;
	public boolean need = false;

	public String toString() {
		StringBuffer bufs = new StringBuffer();
		bufs.append("===== ").append(getClass().getName()).append(" =====\n");
		bufs.append("snippet : ").append(this.snippet).append("\n");
		bufs.append("condition : ").append(this.condition).append("\n");
		bufs.append("condition_ex : ").append(this.condition_before)
				.append(this.condition_c).append(this.condition_after)
				.append("\n");
		bufs.append("content : ").append(this.content).append("\n");
		bufs.append("start : ").append(this.start).append("\n");
		bufs.append("end : ").append(this.end).append("\n");
		return bufs.toString();
	}

	public void init() {
		if (this.condition.indexOf("!=") > 0)
			this.condition_c = "!=";
		else if (this.condition.indexOf("<=") > 0)
			this.condition_c = "<=";
		else if (this.condition.indexOf(">=") > 0)
			this.condition_c = ">=";
		else if (this.condition.indexOf("=") > 0)
			this.condition_c = "=";
		else if (this.condition.indexOf("<") > 0)
			this.condition_c = "<";
		else if (this.condition.indexOf(">") > 0) {
			this.condition_c = ">";
		}

		String[] ba = this.condition.split(this.condition_c);
		this.condition_before = ba[0];
		this.condition_after = ba[1];
	}

	public boolean check(Map map) {
		String type = "string";
		this.value = map.get(this.condition_before);

		String beforeS = this.value == null ? null : String.valueOf(this.value);
		String afterS = this.condition_after;

		long beforeL = -1L;
		long afterL = -1L;

		if ((this.condition_after.indexOf("'") < 0)
				&& (this.condition_after.indexOf("\"") < 0)) {
			try {
				afterL = new Long(this.condition_after).longValue();
				type = "number";
			} catch (Exception e) {
				type = "string";
			}
		}
		if ("number".equalsIgnoreCase(type)) {
			try {
				beforeL = new Long(beforeS).longValue();
				type = "number";
			} catch (Exception e) {
				type = "string";
			}
		}

		boolean need = false;
		this.type = type;

		if ("number".equalsIgnoreCase(type)) {
			if (this.condition.indexOf("!=") > 0)
				need = DataAccessUtils.isNotEquals(beforeL, afterL);
			else if (this.condition.indexOf("<=") > 0)
				need = DataAccessUtils.isLessThenE(beforeL, afterL);
			else if (this.condition.indexOf(">=") > 0)
				need = DataAccessUtils.isGreatThenE(beforeL, afterL);
			else if (this.condition.indexOf("=") > 0)
				need = DataAccessUtils.isEquals(beforeL, afterL);
			else if (this.condition.indexOf("<") > 0)
				need = DataAccessUtils.isLessThen(beforeL, afterL);
			else if (this.condition.indexOf(">") > 0) {
				need = DataAccessUtils.isGreatThen(beforeL, afterL);
			}
		} else if (this.condition.indexOf("!=") > 0) {
			if (afterS.equalsIgnoreCase("EMPTY")) {
				need = DataAccessUtils.isNotEmpty(beforeS);
			} else {
				if (afterS.equalsIgnoreCase("NULL")) {
					afterS = null;
				}
				need = DataAccessUtils.isNotEquals(beforeS, afterS);
			}
		} else if (this.condition.indexOf("<=") > 0)
			need = DataAccessUtils.isLessThenE(beforeS, afterS);
		else if (this.condition.indexOf(">=") > 0)
			need = DataAccessUtils.isGreatThenE(beforeS, afterS);
		else if (this.condition.indexOf("=") > 0) {
			if (afterS.equalsIgnoreCase("EMPTY")) {
				need = DataAccessUtils.isEmpty(beforeS);
			} else {
				if (afterS.equalsIgnoreCase("NULL")) {
					afterS = null;
				}
				need = DataAccessUtils.isEquals(beforeS, afterS);
			}
		} else if (this.condition.indexOf("<") > 0)
			need = DataAccessUtils.isLessThen(beforeS, afterS);
		else if (this.condition.indexOf(">") > 0) {
			need = DataAccessUtils.isGreatThen(beforeS, afterS);
		}

		this.need = need;
		return need;
	}
}
