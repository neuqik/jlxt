package net.codegenerate;

public class JSONField {
	private String name;
	private String type;

	public JSONField(String theName, String theType) {
		name = theName;
		type = theType;
	}

	public String getName() {
		return name;
	}

	public String getType() {
		return type;
	}

}
