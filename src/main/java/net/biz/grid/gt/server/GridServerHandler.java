package net.biz.grid.gt.server;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.biz.grid.gt.common.Const;
import net.biz.grid.gt.export.AbstractXlsWriter;
import net.biz.grid.gt.export.SimpleXlsWriter;
import net.biz.grid.gt.model.ColumnInfo;
import net.biz.grid.gt.model.FilterInfo;
import net.biz.grid.gt.model.GridInfo;
import net.biz.grid.gt.model.PageInfo;
import net.biz.grid.gt.model.SortInfo;
import net.biz.grid.gt.util.BeanUtils;
import net.biz.grid.gt.util.JSONUtils;
import net.biz.grid.gt.util.LogHandler;
import net.biz.grid.gt.util.ModelUtils;
import net.biz.grid.gt.util.StringUtils;
import net.biz.grid.json.org.json.JSONArray;
import net.biz.grid.json.org.json.JSONException;
import net.biz.grid.json.org.json.JSONObject;

/**
 * @author fins
 * 
 */
public class GridServerHandler {

	public static String CONTENTTYPE = "text/html; charset=UTF-8";
	public static String GT_JSON_NAME = "_gt_json";
	public static String DATA_ROOT = "data";

	private String action;
	private String exception;

	private List data;
	private String recordType;
	private String encoding = null;

	private List fieldsName;

	private boolean success;

	private HttpServletRequest request;
	private HttpServletResponse response;

	private JSONObject jsonObject;

	private Class dataBeanClass = null;
	private JSONArray jsonData = null;

	private GridInfo gridInfo = new GridInfo();

	private PageInfo pageInfo = new PageInfo();

	private List<SortInfo> sortInfo = new ArrayList<SortInfo>();
	private List<FilterInfo> filterInfo = new ArrayList<FilterInfo>();
	private List<ColumnInfo> columnInfo = new ArrayList<ColumnInfo>();

	private Map parameters = new HashMap();

	private Map parameterMap;

	private Map<String, AbstractXlsWriter> writers = new HashMap<String, AbstractXlsWriter>();

	public GridServerHandler() {
	}

	public GridServerHandler(String gtJson) {
		init(gtJson);
	}

	public GridServerHandler(Map parameterMap) {
		setParameterMap(parameterMap);
		init();
	}

	public GridServerHandler(HttpServletRequest request,
			HttpServletResponse response) {
		setRequest(request);
		setResponse(response);
		init();
	}

	public void init(String gtJson) {
		if (StringUtils.isNotEmpty(gtJson)) {
			try {
				LogHandler.debug(" AJAX IN : " + gtJson);
				jsonObject = new net.biz.grid.json.org.json.JSONObject(gtJson);
				action = jsonObject.getString("action");
				recordType = jsonObject.getString("recordType");

				initGridInfo();

				if ("load".equalsIgnoreCase(action)) {
					initPageInfo();
					initSortInfo();
					initFilterInfo();
				} else if ("save".equalsIgnoreCase(action)) {

				} else if ("export".equalsIgnoreCase(action)) {
					// wonder add for export 可用 filter
					initPageInfo();
					initSortInfo();
					initFilterInfo();
					initColumnInfo();
				}
			} catch (JSONException e) {
				LogHandler.error(this, e);
			}
		}
	}

	public void init() {
		init(getParameter(GT_JSON_NAME));
	}

	public void initGridInfo() {
		JSONObject modelJS;
		try {
			modelJS = jsonObject.getJSONObject("gridInfo");
			if (modelJS != null) {
				setGridInfo(ModelUtils.createGridInfo(modelJS));
			}
		} catch (JSONException e) {
			// LogHandler.error(this,e);
		}
	}

	public void initPageInfo() {
		JSONObject modelJS;
		try {
			modelJS = jsonObject.getJSONObject("pageInfo");
			if (modelJS != null) {
				setPageInfo(ModelUtils.createPageInfo(modelJS));
			}
		} catch (JSONException e) {
			LogHandler.error(this, e);
		}
	}

	public void initSortInfo() {
		JSONArray modelJS;
		try {
			modelJS = jsonObject.getJSONArray("sortInfo");
			if (modelJS != null) {
				for (int i = 0; i < modelJS.length(); i++) {
					JSONObject si = modelJS.getJSONObject(i);
					sortInfo.add(ModelUtils.createSortInfo(si));
				}
			}
		} catch (JSONException e) {
			LogHandler.error(this, e);
		}
	}

	public void initFilterInfo() {
		JSONArray modelJS;
		try {
			modelJS = jsonObject.getJSONArray("filterInfo");
			if (modelJS != null) {
				for (int i = 0; i < modelJS.length(); i++) {
					JSONObject si = modelJS.getJSONObject(i);
					filterInfo.add(ModelUtils.createFilterInfo(si));
				}
			}
		} catch (JSONException e) {
			LogHandler.error(this, e);
		}
	}

	public void initColumnInfo() {
		JSONArray modelJS;
		try {
			modelJS = jsonObject.getJSONArray("columnInfo");
			if (modelJS != null) {
				for (int i = 0; i < modelJS.length(); i++) {
					JSONObject si = modelJS.getJSONObject(i);
					columnInfo.add(ModelUtils.createColumnInfo(si));
				}
			}
		} catch (JSONException e) {
			LogHandler.error(this, e);
		}
	}

	public void setXlsWriter(AbstractXlsWriter writer) {
		writers.put("xls", writer);
	}

	public AbstractXlsWriter getXlsWriter() {
		AbstractXlsWriter writer = null;
		try {
			writer = writers.get("xls");
		} catch (Exception e) {
			LogHandler.warn(this, e);
		}
		if (writer == null) {
			writer = new SimpleXlsWriter();
		}
		return writer;
	}

	public List<ColumnInfo> getDisplayColumnInfo() {
		List<ColumnInfo> disColumnInfo = new ArrayList<ColumnInfo>();
		if (columnInfo != null) {
			for (int i = 0, len = columnInfo.size(); i < len; i++) {
				ColumnInfo col = columnInfo.get(i);
				if (!col.isHidden()) {
					disColumnInfo.add(col);
				}
			}
		}
		return disColumnInfo;
	}

	public String getSaveResponseText() {
		JSONObject json = new JSONObject();
		try {
			json.put("success", success);
			json.put("exception", exception);
		} catch (JSONException e) {
			LogHandler.error(this, e);
		}
		return json.toString();
	}

	public JSONObject getLoadResponseJSON() {
		JSONObject json = new JSONObject();
		try {
			json.put(DATA_ROOT, jsonData);
			json.put("pageInfo", ModelUtils.generatePageInfoJSON(getPageInfo()));
			json.put("exception", exception);
		} catch (JSONException e) {
			LogHandler.error(this, e);
		}
		return json;
	}

	public String getLoadResponseText() {
		JSONObject json = getLoadResponseJSON();
		String jstr = json == null ? "" : json.toString();
		LogHandler.debug(" AJAX OUT : " + jstr);
		return jstr;
	}

	public void setData(List data) {
		this.data = data;
		this.dataBeanClass = null;
		setJsonData(new JSONArray(data));

	}

	public void setData(List data, Class beanClass) {
		this.data = data;
		this.dataBeanClass = beanClass;
		setJsonData(JSONUtils.BeanList2JSONArray(data, beanClass));
	}

	public List<Map> getUpdatedRecords() {
		return getRecordsList("updatedRecords");
	}

	public List<Object> getUpdatedRecords(Class beanClass) {
		return getRecordsList("updatedRecords", beanClass);
	}

	public List<Map> getInsertedRecords() {
		return getRecordsList("insertedRecords");
	}

	public List<Object> getInsertedRecords(Class beanClass) {
		return getRecordsList("insertedRecords", beanClass);
	}

	public List<Map> getDeletedRecords() {
		return getRecordsList("deletedRecords");
	}

	public List<Object> getDeletedRecords(Class beanClass) {
		return getRecordsList("deletedRecords", beanClass);
	}

	public List<Object> getRecordsList(String rname, Class beanClass) {
		List<Object> recordsList = null;
		JSONArray records_JS;
		try {
			records_JS = jsonObject.getJSONArray(rname);
			if (records_JS != null) {
				recordsList = new ArrayList<Object>();
				Object[] methodsInfo = BeanUtils
						.getCacheSetterMethodInfo(beanClass);
				for (int i = 0; i < records_JS.length(); i++) {
					JSONObject obj_JS = records_JS.getJSONObject(i);
					recordsList.add(JSONUtils.JSONObject2Bean(obj_JS,
							beanClass, methodsInfo));
				}
			}
		} catch (JSONException e) {
			// LogHandler.error(this,e);
		}
		return recordsList;
	}

	public List<Map> getRecordsList(String rname) {
		List<Map> recordsList = null;
		JSONArray records_JS;
		try {
			records_JS = jsonObject.getJSONArray(rname);
			if (records_JS != null) {
				recordsList = new ArrayList<Map>();
				for (int i = 0; i < records_JS.length(); i++) {
					JSONObject obj_JS = records_JS.getJSONObject(i);
					recordsList.add(JSONUtils.JSONObject2Map(obj_JS));
				}
			}
		} catch (JSONException e) {
			// LogHandler.error(this,e);
		}
		return recordsList;
	}

	public String[] getParameterValues(String name) {
		return (String[]) parameterMap.get(name);
	}

	public String getParameter(String name) {
		String[] pv = getParameterValues(name);
		if (pv != null && pv.length > 0) {
			return pv[0];
		}
		return null;
	}

	public void printResponseText(String text) {
		try {
			response.setContentType(CONTENTTYPE);
			PrintWriter out = response.getWriter();
			out.println(text);
			out.flush();
			out.close();
		} catch (IOException e) {
			LogHandler.error(this, e);
		}
	}

	public void initAttachmentHeader() {
		getResponse().setHeader("Cache-Control",
				"must-revalidate, post-check=0, pre-check=0");
		getResponse().setHeader("Content-Type", "application/force-download");
		getResponse().setHeader("Content-Type", "application/octet-stream");
		getResponse().setHeader("Content-Type", "application/download");
		getResponse().setHeader("Cache-Control",
				"private, max-age=0, must-revalidate");
		getResponse().setHeader("Pragma", "public");
	}

	public void downloadFile(String fileName) {
		downloadFile(fileName, Const.nullInt);
	}

	public void downloadFile(String fileName, long length) {
		initAttachmentHeader();
		getResponse().setHeader("Content-Disposition",
				"attachment; filename=\"" + fileName + "\"");
		if (length != Const.nullInt) {
			getResponse().setHeader("Content-Length", String.valueOf(length));
		}
	}

	private static Object[] map2Array(Map map, String[] properiesName) {
		int len = properiesName.length;
		Object[] objs = new Object[len];
		for (int i = 0; i < len; i++) {
			objs[i] = map.get(properiesName[i]);
		}
		return objs;
	}

	public void exportXLSfromMaps(List data) throws IOException {
		List<ColumnInfo> cols = this.getDisplayColumnInfo();
		int len = cols.size();

		String[] properiesName = new String[len];
		String[] headsName = new String[len];
		for (int i = 0; i < len; i++) {
			ColumnInfo colInfo = cols.get(i);
			properiesName[i] = colInfo.getFieldIndex();
			headsName[i] = colInfo.getHeader();
		}

		exportXLSfromMaps(data, properiesName, headsName);
	}

	public void exportXLSfromMaps(List data, String[] properiesName,
			String[] headsName) throws IOException {
		String fileName = getParameter("exportFileName");
		downloadFile(fileName + ".xls");

		OutputStream out = getResponse().getOutputStream();
		AbstractXlsWriter xlsw = getXlsWriter();
		xlsw.init();
		xlsw.setOut(out);
		xlsw.setEncoding(getEncoding());
		xlsw.start();
		xlsw.addRow(headsName);
		// 最多导出1万条记录 wonder
		for (int i = 0, len = data.size() >= 10000 ? 10000 : data.size(); i < len; i++) {
			Map record = (Map) data.get(i);
			xlsw.addRow(map2Array(record, properiesName));
		}
		xlsw.end();
		xlsw.close();
		out.close();
	}

	public void printSaveResponseText() {
		printResponseText(getSaveResponseText());
	}

	public void printLoadResponseText() {
		printResponseText(getLoadResponseText());
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public Map getParameters() {
		return parameters;
	}

	public void setParameters(Map parameters) {
		this.parameters = parameters;
	}

	public String getException() {
		return exception;
	}

	public void setException(String exception) {
		this.exception = exception;
	}

	public List<SortInfo> getSortInfo() {
		return sortInfo;
	}

	public void setSortInfo(List<SortInfo> sortInfo) {
		this.sortInfo = sortInfo;
	}

	public Map getSingleSortInfo() {
		return sortInfo == null || sortInfo.size() < 1 ? null : (Map) sortInfo
				.get(0);
	}

	public List<FilterInfo> getFilterInfo() {
		return filterInfo;
	}

	public void setFilterInfo(List<FilterInfo> filterInfo) {
		this.filterInfo = filterInfo;
	}

	public Map getSingleFilterInfo() {
		return filterInfo == null || filterInfo.size() < 1 ? null
				: (Map) filterInfo.get(0);
	}

	public List getData() {
		return data;
	}

	public String getRecordType() {
		return recordType;
	}

	public void setRecordType(String recordType) {
		this.recordType = recordType;
	}

	public List getFieldsName() {
		return fieldsName;
	}

	public void setFieldsName(List fieldsName) {
		this.fieldsName = fieldsName;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public int getPageSize() {
		return getPageInfo().getPageSize();
	}

	public void setPageSize(int pageSize) {
		getPageInfo().setPageSize(pageSize);
	}

	public int getPageNum() {
		return getPageInfo().getPageNum();

	}

	public void setPageNum(int pageNum) {
		getPageInfo().setPageNum(pageNum);
	}

	public int getTotalRowNum() {
		return getPageInfo().getTotalRowNum();
	}

	public void setTotalRowNum(int totalRowNum) {
		getPageInfo().setTotalRowNum(totalRowNum);
	}

	public int getTotalPageNum() {
		return getPageInfo().getTotalPageNum();
	}

	public void setTotalPageNum(int totalPageNum) {
		getPageInfo().setTotalPageNum(totalPageNum);
	}

	public int getStartRowNum() {
		return getPageInfo().getStartRowNum();
	}

	public void setStartRowNum(int startRowNum) {
		getPageInfo().setStartRowNum(startRowNum);
	}

	public int getEndRowNum() {
		return getPageInfo().getEndRowNum();
	}

	public void setEndRowNum(int endRowNum) {
		getPageInfo().setEndRowNum(endRowNum);
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
		setParameterMap(request.getParameterMap());
	}

	public HttpServletResponse getResponse() {
		return response;
	}

	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}

	public JSONObject getJsonObject() {
		return jsonObject;
	}

	public void setJsonObject(JSONObject jsonObject) {
		this.jsonObject = jsonObject;
	}

	public Class getDataBeanClass() {
		return dataBeanClass;
	}

	public void setDataBeanClass(Class dataBeanClass) {
		this.dataBeanClass = dataBeanClass;
	}

	public JSONArray getJsonData() {
		return jsonData;
	}

	public void setJsonData(JSONArray jsonData) {
		this.jsonData = jsonData;
	}

	public Map getParameterMap() {
		return parameterMap;
	}

	public void setParameterMap(Map parameterMap) {
		this.parameterMap = parameterMap;
	}

	public static int getInt(Object i) {
		return getInt(i, -1);
	}

	public static int getInt(Object i, int defaultI) {
		try {
			if (i != null) {
				return Integer.parseInt(String.valueOf(i));
			}
		} catch (Exception e) {
		}
		return defaultI;
	}

	public PageInfo getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}

	public GridInfo getGridInfo() {
		return gridInfo;
	}

	public void setGridInfo(GridInfo gridInfo) {
		this.gridInfo = gridInfo;
	}

	public String getEncoding() {
		return encoding;
	}

	public void setEncoding(String encoding) {
		this.encoding = encoding;
	}

	public List<ColumnInfo> getColumnInfo() {
		return columnInfo;
	}

	public void setColumnInfo(List<ColumnInfo> columnInfo) {
		this.columnInfo = columnInfo;
	}

}
