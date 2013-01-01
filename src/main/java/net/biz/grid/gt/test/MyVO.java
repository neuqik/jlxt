package net.biz.grid.gt.test;
 
 import java.util.Date;
 
 public class MyVO
 {
   private String id;
   private String name;
   private Date birthday;
   private int age;
 
   public String getId()
   {
     return this.id;
   }
   public void setId(String id) {
     this.id = id;
   }
   public String getName() {
     return this.name;
   }
   public void setName(String name) {
     this.name = name;
   }
   public Date getBirthday() {
     return this.birthday;
   }
   public void setBirthday(Date birthday) {
     this.birthday = birthday;
   }
   public int getAge() {
     return this.age;
   }
   public void setAge(int age) {
     this.age = age;
   }
 }

