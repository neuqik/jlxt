 package net.biz.grid.gt.view.model;
 
 import java.util.List;
 
 public class GridModels extends BaseModelGrid
 {
   private RowModelGrid rowModel;
   private int currentRowNO = -1;
 
   public RowModelGrid getRowModel() {
     return this.rowModel;
   }
 
   public void setRowModel(RowModelGrid rowModel) {
     this.rowModel = rowModel;
     this.rowModel.setGridModel(this);
   }
 
   public int getCurrentRowNO() {
     return this.currentRowNO;
   }
 
   public void setCurrentRowNO(int currentRowNO) {
     this.currentRowNO = currentRowNO;
   }
 
	public String toHTML(List dataList) {
     StringBuffer sbf = new StringBuffer();
     sbf.append("<table>");
     int rowNum = dataList.size();
     for (this.currentRowNO = 0; this.currentRowNO < rowNum; this.currentRowNO += 1) {
       Object record = dataList.get(this.currentRowNO);
       sbf.append(this.rowModel.toHTML(record, this.currentRowNO));
     }
     sbf.append("</table>");
     this.currentRowNO = -1;
     return sbf.toString();
   }
 }

