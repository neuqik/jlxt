package org.eweb4j.orm;

/**
 * 级联操作接口
 * @author weiwei
 *
 */
public interface Cascade {

	void merge(String... fields);
	
	void refresh(long newIdVal, String... fields);
	
	void remove(String... fields);
	
	void persist(String... fields);
	
}
