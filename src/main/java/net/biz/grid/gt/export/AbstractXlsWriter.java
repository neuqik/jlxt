package net.biz.grid.gt.export;
 
 import java.io.IOException;
 import java.io.OutputStream;
 
 public abstract class AbstractXlsWriter
 {
   private OutputStream out;
   private String encoding = null;
 
   public abstract void init();
 
   public abstract void start();
 
   public abstract void end();
 
   public abstract void addRow(Object[] paramArrayOfObject);
 
   public void close() { try { getOut().close();
     } catch (IOException localIOException)
     {
     } }
 
   public OutputStream getOut() {
     return this.out;
   }
   public void setOut(OutputStream out) {
     this.out = out;
   }
   public String getEncoding() {
     return this.encoding;
   }
   public void setEncoding(String encoding) {
     this.encoding = encoding;
   }
 }

