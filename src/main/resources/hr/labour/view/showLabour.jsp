<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="${BaseURL}pages/hr/labour/showLabour.js"></script>
<!-- script type="text/javascript"
	src="http://localhost:8080/myproject/grid/calendar/calendar.js"></script>
<script type="text/javascript"
	src="http://localhost:8080/myproject/grid/calendar/calendar-cn-utf8.js"></script>
<script type="text/javascript"
	src="http://localhost:8080/myproject/grid/calendar/calendar-setup.js"></script>
<script type="text/javascript"
	src="http://localhost:8080/myproject/grid/gt_grid_all.js"></script>
<script type="text/javascript"
	src="http://localhost:8080/myproject/grid/gt_msg_cn.js"></script>
<script type="text/javascript"
	src="http://localhost:8080/myproject/grid/flashchart/fusioncharts/FusionCharts.js">
	</script-->

<script type="text/javascript">
	// 检查是否只有一条记录
	function doCheckIsOnlyRow() {

		var empIds = new Array();
		var i = 0;
		$.each(showlabour_grid.checkedRows, function(key, value) {
			//alert("key:" + key + "value:" + value);
			empIds[i] = key;
			i++;
		});
		if (empIds.length != 1) {
			return -1;
		} else {
			return empIds[0];
		}
	}
	//checkbox编辑员工基本信息
	function doEditEmpBase() {
		var id = doCheckIsOnlyRow();
		if (id < 0) {
			alertMsg.error("请选择一位员工来修改基本信息！");
		} else {
			// 如果只有一条
			navTab.openTab("xgjbxx", "${BaseURL}hrs/editEmpBase?empId=" + id, {
				title : "修改基本信息",
				fresh : false,
				data : {}
			});
		}
	}
</script>

<div class="pageContent" id="showlabour_head"
	style="overflow-x: hidden; overflow-y: hidden">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="${BaseURL}hrs/labour/addLabour"
				target="navTab" title="添加员工"><span>添加劳动关系</span></a></li>
			<li><a class="edit" onclick="doEditEmpBase();" rel="xgjbxx"><span>修改劳动关系</span></a></li>
		</ul>
	</div>
	<div>
		<div id="gridbox_showlabour"></div>
	</div>
</div>
