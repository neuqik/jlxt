 package net.biz.grid.gt.view.model;
 
 import java.util.ArrayList;
import java.util.List;
 
 public class RowModelGrid extends BaseModelGrid
 {
	private List<ColumnModels> columnModels = new ArrayList<ColumnModels>();
   private GridModels gridModel;
   private ColumnModels currentColModel;
   private int currentColNO = -1;
 
   public String toHTML(Object record, int rowNO) {
     StringBuffer sbf = new StringBuffer();
     sbf.append("<tr>");
     int colNum = this.columnModels.size();
     for (this.currentColNO = 0; this.currentColNO < colNum; this.currentColNO += 1) {
       this.currentColModel = this.columnModels.get(this.currentColNO);
       sbf.append(this.currentColModel.toHTML(record, rowNO, this.currentColNO));
     }
     sbf.append("</tr>");
     this.currentColModel = null;
     return sbf.toString();
   }
 
   public void addColumnModel(ColumnModels columnModel) {
     this.columnModels.add(columnModel);
     columnModel.setRowModel(this);
     columnModel.setGridModel(getGridModel());
   }
 
   public GridModels getGridModel()
   {
     return this.gridModel;
   }
 
   public void setGridModel(GridModels gridModel) {
     this.gridModel = gridModel;
   }
 
   public List<ColumnModels> getColumnModels() {
     return this.columnModels;
   }
 
   public void setColumnModels(List<ColumnModels> columnModels) {
     this.columnModels = columnModels;
   }
 
   public ColumnModels getCurrentColModel() {
     return this.currentColModel;
   }
 
   public void setCurrentColModel(ColumnModels currentColModel) {
     this.currentColModel = currentColModel;
   }
 
   public int getCurrentColNO() {
     return this.currentColNO;
   }
 
   public void setCurrentColNO(int currentColNO) {
     this.currentColNO = currentColNO;
   }
 }

