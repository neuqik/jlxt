package org.eweb4j.solidbase.permission.model;

import java.util.List;

import org.eweb4j.mvc.view.EditPage;
import org.eweb4j.mvc.view.PageMod;

public interface PermissionService {

	void addPermission(Permission permission) throws Exception;

	PageMod<Permission> getPage(int pageNum, int numPerPage) throws Exception;

	EditPage<Permission> getEditPage(long permId) throws Exception;

	void remove(long permId) throws Exception;

	void batchRemove(long[] permIds) throws Exception;

	void update(Permission permission) throws Exception;

	Permission findByURIAndHttpMethod(String uri, String httpMethod)
			throws Exception;

	List<Permission> findByTypeId(long permTypeId) throws Exception;

	List<PermissionMod> assemPermissionMod()
			throws Exception;

}
