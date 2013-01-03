<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${BaseURL}pages/hr/showEmployee.js"></script>
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
	src="http://localhost:8080/myproject/grid/flashchart/fusioncharts/FusionCharts.js"></script-->

<script type="text/javascript">
	// 检查是否只有一条记录
	function doCheckIsOnlyRow() {
		var recs = showemployee_grid.getSelectedRecords();
		var empIds = new Array();
		var i = 0;
		$.each(showemployee_grid.checkedRows, function(key, value) {
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
	// 编辑培训信息
	function doEditTrainPerf() {
		var id = doCheckIsOnlyRow();
		if (id < 0) {
			alertMsg.error("请选择一位员工来修改绩效、培训信息！");
		} else {
			// 如果只有一条
			navTab.openTab("jxpx",
					"${BaseURL}hrs/showEmpTransPerf?empId=" + id, {
						title : "绩效及培训",
						fresh : false,
						data : {}
					});
		}
	}
	// 编辑个人资料
	function doEditExt() {
		var id = doCheckIsOnlyRow();
		if (id < 0) {
			alertMsg.error("请选择一位员工来编辑个人资料！");
		} else {
			// 如果只有一条
			navTab.openTab("grzl", "${BaseURL}hrs/showEmpExt?empId=" + id, {
				title : "个人资料",
				fresh : false,
				data : {}
			});
		}
	}
</script>

<div class="pageContent" id="showemployee_head"
	style="overflow-x: hidden; overflow-y: hidden">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="${BaseURL}hrs/addEmpBase"
				target="navTab" title="添加员工"><span>添加员工</span></a></li>
			<li><a class="edit" onclick="doEditEmpBase();" rel="xgjbxx"><span>修改基本信息</span></a></li>
			<li><a class="edit" onclick="doEditTrainPerf();" rel="jxpx"><span>绩效及培训</span></a></li>
			<li><a class="edit" onclick="doEditExt();" rel="grzl"><span>个人资料</span></a></li>
			<li><a class="edit" href="${BaseURL}hrs/{pojo_id}/editEmp"
				target="navTab" warn="请选择一条记录"><span>认证及证书</span></a></li>
			<li><a class="edit" href="${BaseURL}hrs/{pojo_id}/editEmp"
				target="navTab" warn="请选择一条记录"><span>选择照片</span></a></li>
			<li><a title="确实要删除这些记录吗?" target="selectedTodo" rel="chk"
				href="${BaseURL}hrs/batchRemove?_method=delete" class="delete"><span>删除</span></a></li>
			<li class="line">line</li>
			<li><a class="icon" href="javascript:;"><span>导入EXCEL</span></a></li>
		</ul>
	</div>
	<div>
		<div id="gridbox_showemployee"></div>
	</div>
</div>
