<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="${BaseURL}pages/hr/labour/showEmpLabour.js"></script>

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
	function doCheckIsOnlyRegRow() {

		var empIds = new Array();
		var i = 0;
		$.each(showlabouremployee_grid.checkedRows, function(key, value) {
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
	// 修改劳动信息
	function doEditLabour() {
		var id = doCheckIsOnlyRegRow();
		if (id < 0) {
			alertMsg.error("请选择一位员工来编辑劳动关系！");
		} else {
			// 如果只有一条
			navTab.openTab("ldgx", "${BaseURL}labour/editEmpLabour?empId=" + id, {
				title : "劳动关系",
				fresh : false,
				data : {}
			});
		}
	}
	function test() {
		return true;
	}
</script>

<div class="pageContent" id="showlabouremployee_head"
	style="overflow-x: hidden; overflow-y: hidden">
	<input id="labourwhere" name="regwhere" type="hidden"
		value="${labourwhere}" />
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="edit" onclick="doEditLabour();" rel="zcbj"><span>劳动关系</span></a></li>
			<li><a class="edit" href="${BaseURL}labour/showLabourQuery"
				target="dialog" mask="true" title="查询框" width="640" height="420"
				close="test"><span>高级检索</span></a></li>
		</ul>
	</div>
	<div>
		<div id="gridbox_showlabouremployee"></div>
	</div>
</div>
