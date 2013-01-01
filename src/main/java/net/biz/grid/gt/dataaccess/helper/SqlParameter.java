package net.biz.grid.gt.dataaccess.helper;
 
 public class SqlParameter
 {
   private String name;
   private Object value;
   private String type;
   private int index;
 
   public SqlParameter(String name, Object value)
   {
     this.name = name;
     this.value = value;
     this.type = "in";
   }
   public SqlParameter(String name, Object value, String type) {
     this(name, value);
     this.type = type;
   }
   public String getName() {
     return this.name;
   }
   public void setName(String name) {
     this.name = name;
   }
   public String getType() {
     return this.type;
   }
   public void setType(String type) {
     this.type = type;
   }
   public Object getValue() {
     return this.value;
   }
   public void setValue(Object value) {
     this.value = value;
   }
   public String getValueAsString() {
     return String.valueOf(this.value);
   }
   public int getIndex() {
     return this.index;
   }
   public void setIndex(int index) {
     this.index = index;
   }
 
   public String toString() {
     return this.name + " = " + this.value;
   }
 }

