package net.biz.util;

import java.io.Serializable;

/**
 * @author lef2371@gmail.com
 * 
 */
public class DataSourceBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private  String dbtype;
	private  String dburl;
	private  String dsid;
	private  String dsname;
	private  String dstype;
	private  String password;
	private  String servername;
	private  String username;


	public String getDbtype() {
		return dbtype;
	}

	public void setDbtype(String dbtype) {
		this.dbtype = dbtype;
	}

	public String getDburl() {
		return dburl;
	}

	public void setDburl(String dburl) {
		this.dburl = dburl;
	}

	public String getDsid() {
		return dsid;
	}

	public void setDsid(String dsid) {
		this.dsid = dsid;
	}

	public String getDsname() {
		return dsname;
	}

	public void setDsname(String dsname) {
		this.dsname = dsname;
	}

	public String getDstype() {
		return dstype;
	}

	public void setDstype(String dstype) {
		this.dstype = dstype;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getServername() {
		return servername;
	}

	public void setServername(String servername) {
		this.servername = servername;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public long getSerialVersionUID() {
		return serialVersionUID;
	}


}
