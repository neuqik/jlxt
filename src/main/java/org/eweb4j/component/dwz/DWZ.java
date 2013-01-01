package org.eweb4j.component.dwz;

import java.util.List;

import org.eweb4j.component.dwz.view.UlTag;
import org.eweb4j.mvc.view.CallBackJson;

public abstract interface DWZ {
	public abstract void setTreeMenuPermissions(List<Long> paramList);

	public abstract void setRootUlStyleClass(String paramString);

	public abstract String getAccordion(String paramString, boolean paramBoolean)
			throws Exception;

	public abstract String getAccordion(Long paramLong, boolean paramBoolean)
			throws Exception;

	public abstract CallBackJson getSuccessJson(String paramString1,
			String paramString2, String paramString3, String paramString4,
			String paramString5);

	public abstract CallBackJson getFailedJson(String paramString);

	public abstract String createTreeMenu(Long paramLong, boolean paramBoolean)
			throws Exception;

	public abstract String createTreeMenu(String paramString,
			boolean paramBoolean) throws Exception;

	public abstract String createAllTreeMenu() throws Exception;

	public abstract UlTag getUlTag(Long paramLong, boolean paramBoolean)
			throws Exception;
}
