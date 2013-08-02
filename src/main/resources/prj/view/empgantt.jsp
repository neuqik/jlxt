<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link type="text/css" rel="stylesheet"
	href="${BaseURL}gantt/dhtmlxgantt.css">
<script type="text/javascript" language="JavaScript"
	src="${BaseURL}gantt/dhtmlxcommon.js"></script>
<script type="text/javascript" language="JavaScript"
	src="${BaseURL}gantt/dhtmlxgantt.js"></script>
<script type="text/javascript">
	var ganttChartControl = new GanttChart();
	// Setup paths and behavior
	ganttChartControl.setImagePath(MyURL + "gantt/imgs/");
	ganttChartControl.create("GanttDiv");

	//查询甘特图
	function doQueryGantt() {
		var begin = $("#BEGINDATE").val();
		var end = $("#ENDDATE").val();
		var empId = $("#EMPNO").val();
		if (begin.length > 0) {
			ganttChartControl.loadData(MyURL + "prj/querygantt?BEGINDATE="
					+ begin + "&ENDDATE=" + end + "&EMPNO=" + empId + "&A=1",
					true, true);
		} else {
			alertMsg.error("请输入开始日期");
		}
	}
</script>
<div class="pageContent" id="empgantt_id"
	style="overflow-x: hidden; overflow-y: hidden">
	<div class="panelBar">
		<div class="button">
			<div class="buttonContent">
				<button class="print" onclick="ganttChartControl.printToWindow();">打印</button>
			</div>
			<div class="buttonContent">
				<button class="add" onclick="doQueryGantt();">查询</button>
			</div>
		</div>
		<label>入场开始日期：</label> <input type="text" name="" id="BEGINDATE"
			class="date required" size="30" yearstart="-80" yearend="5" /> <label>入场结束日期：</label>
		<input type="text" name="" id="ENDDATE" class="date" size="30"
			yearstart="-80" yearend="5" /><label>员工编号：</label> <input
			type="text" name="" id="EMPNO" class="" size="30" />
	</div>


	<div style="height: 450px;" id="GanttDiv"></div>
</div>

