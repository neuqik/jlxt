package net.biz.grid.gt.export;
 
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
 
 public class SimpleXlsWriter extends AbstractXlsWriter
 {
   private short row = 0;
   public static final int BYTE_LEN = 1;
   public static final int SHORT_LEN = 2;
   public static final int INT_LEN = 4;
   public static final int FLOAT_LEN = 4;
   public static final int LONG_LEN = 8;
   public static final int DOUBLE_LEN = 8;
 
   public void init()
   {
     this.row = 0;
   }
 
   public void start() {
     pack2Stream(new short[] { 2057, 8, 0, 16 });
   }
 
   public void end() {
     pack2Stream(new short[] { 10 });
   }
 
   public void addRow(Object[] record) {
     for (short i = 0; i < record.length; i = (short)(i + 1)) {
       writeCell(this.row, i, record[i]);
     }
     this.row = (short)(this.row + 1);
   }
 
   public void writeNumCell(short row, short col, double value)
   {
     pack2Stream(new short[] { 515, 14 });
     pack2Stream(new short[] { row, col });
     pack2Stream(new short[1]);
     pack2Stream(value);
   }
 
   public void writeStringCell(short row, short col, String value)
   {
     writeStringCell(row, col, parseString(value));
   }
 
   public void writeStringCell(short row, short col, byte[] strBytes) {
     int len = strBytes.length;
     pack2Stream(new short[] { 516, (short)(8 + len) });
     pack2Stream(new short[] { row, col });
     pack2Stream(new short[] { 0, (short)len });
     pack2Stream(strBytes);
   }
 
   public void writeCell(short row, short col, Object value) {
     if (isNumber(value)) {
       double dNum = Double.parseDouble(String.valueOf(value));
       writeNumCell(row, col, dNum);
     } else {
       writeStringCell(row, col, String.valueOf(value));
     }
   }
 
   public void writeCell(short col, Object value) {
     writeCell(this.row, col, String.valueOf(value));
   }
 
   public byte[] parseString(String str)
   {
     if (getEncoding() != null) {
       try {
         return str.getBytes(getEncoding());
       } catch (UnsupportedEncodingException e) {
         System.out.println(e.getMessage());
       }
     }
     return str.getBytes();
   }
 
   public void pack2Stream(byte[] bytes) {
     try {
       getOut().write(bytes);
       getOut().flush();
     } catch (IOException localIOException) {
     }
   }
 
   public void pack2Stream(double doubleNum) {
     pack2Stream(doubleToBytes(doubleNum));
   }
 
   public void pack2Stream(short shortNum) {
     pack2Stream(shortToBytes(shortNum));
   }
 
   public void pack2Stream(short[] shorts) {
     for (int i = 0; i < shorts.length; i++)
       pack2Stream(shorts[i]);
   }
 
   public short getRow() {
     return this.row;
   }
 
   public static boolean isNumber(Object value)
   {
     return value instanceof Number;
   }
 
   public static byte[] longToBytes(long lnum) {
     byte[] bytes = new byte[8];
     int startIndex = 0;
     for (int i = 0; i < 8; i++)
       bytes[(startIndex + i)] = (byte)(int)(lnum >> i * 8 & 0xFF);
     return bytes;
   }
   public static byte[] shortToBytes(short num) {
     byte[] bytes = new byte[2];
     int startIndex = 0;
     bytes[startIndex] = (byte)(num & 0xFF);
     bytes[(startIndex + 1)] = (byte)(num >> 8 & 0xFF);
     return bytes;
   }
   public static byte[] doubleToBytes(double dnum) {
     return longToBytes(Double.doubleToLongBits(dnum));
   }
 
   public static void main(String[] args)
     throws IOException
   {
     SimpleXlsWriter xlsw = new SimpleXlsWriter();
     xlsw.setOut(new FileOutputStream(new File("d:/testXLS.xls")));
 
     xlsw.start();
     for (int i = 0; i < 200; i++) {
       xlsw.addRow(
         new Object[] { 
         "第 " + i + "行", 
         "你好啊", 
         "123", 
         new Integer(12), 
         new Integer(1234), 
         new Long(1234567890L), 
         new Float(12.34D), 
         new Double(12345.678900000001D), 
         "我很好" });
     }
 
     xlsw.end();
     xlsw.close();
   }
 }

