package net.biz.grid.gt.dataaccess;
 
 import net.biz.grid.gt.util.LogHandler;
 
 public abstract class TransactionWrapper
 {
   private boolean success = false;
 
   public boolean execute()
   {
     this.success = true;
     beforeStart();
     DataAccessManager.txStart();
     try {
       transaction();
     } catch (Exception e) {
       this.success = false;
       LogHandler.error(this, e);
       DataAccessManager.txRollback();
       afterRollback(e);
     }
     if (this.success) {
       DataAccessManager.txEnd();
       afterEnd();
     }
     return this.success;
   }
   public abstract void transaction() throws Exception;
 
   public void beforeStart() {
   }
   public void afterRollback(Exception e) {  }
 
   public void afterEnd() {  }
 
   public boolean isSuccess() { return this.success;
   }
 }
