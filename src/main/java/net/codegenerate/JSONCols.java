package net.codegenerate;

public class JSONCols {
	private String id;
	private String header;
	private int width;
	private boolean editable = false;

	public JSONCols(String theId, String theHeader, int theWidth,
			boolean theEditable) {
		id = theId;
		header = theHeader;
		width = theWidth;
		editable = theEditable;
	}

	public String getId() {
		return id;
	}

	public String getHeader() {
		return header;
	}

	public int getWidth() {
		return width;
	}

	public boolean isEditable() {
		return editable;
	}

}
