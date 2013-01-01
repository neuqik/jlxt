package net.biz.grid.gt.view.model;

public class ColumnModels extends BaseModelGrid {
	private GridModels gridModel;
	private RowModelGrid rowModel;

	public String getCellHTML() {
		return "";
	}

	public String toHTML(Object record, int rowNO, int colNO) {
		StringBuffer sbf = new StringBuffer();
		sbf.append("<td>");
		sbf.append("<div>");
		sbf.append(getCellHTML());
		sbf.append("</div>");
		sbf.append("</td>");
		return sbf.toString();
	}

	public GridModels getGridModel() {
		return this.gridModel;
	}

	public void setGridModel(GridModels gridModel) {
		this.gridModel = gridModel;
	}

	public RowModelGrid getRowModel() {
		return this.rowModel;
	}

	public void setRowModel(RowModelGrid rowModel) {
		this.rowModel = rowModel;
	}
}
