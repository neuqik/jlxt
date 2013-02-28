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
	src="http://localhost:8080/myproject/grid/flashchart/fusioncharts/FusionCharts.js">
	</script-->

<script type="text/javascript">
	// 检查是否只有一条记录
	function doCheckIsOnlyRow() {

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
	// 编辑职称及认证
	function doEditProfCert() {
		var id = doCheckIsOnlyRow();
		if (id < 0) {
			alertMsg.error("请选择一位员工来编辑职称及认证信息！");
		} else {
			// 如果只有一条
			navTab.openTab("zcrz", "${BaseURL}hrs/showEmpProfCert?empId=" + id,
					{
						title : "职称及认证",
						fresh : false,
						data : {}
					});
		}
	}
	// 编辑职称及认证
	function doEditPic() {
		var id = doCheckIsOnlyRow();
		if (id < 0) {
			alertMsg.error("请选择一位员工来编辑照片！");
		} else {
			// 如果只有一条
			navTab.openTab("ygzp", "${BaseURL}hrs/showEmpPic?empId=" + id, {
				title : "员工照片",
				fresh : false,
				data : {}
			});
		}
	}
	// 删除员工
	function doDelete() {
		console.log(showemployee_grid.getCellValue(1, 1));
		return;
		var id_delete = doCheckIsOnlyRow();
		if (id_delete < 0) {
			alertMsg.error("请选择一位员工来删除！");
		} else {
			alertMsg.confirm("是否要删除编号为" + id_delete + "的员工？删除前请确认该员工没有在建工程。", {
				okCall : function() {
					$.post("${BaseURL}hrs/deleteEmp?empId=" + id_delete, {},
							function() {
								DWZ.ajaxDone;
								showemployee_grid.reload();
								showemployee_grid.checkedRows = {};
							}, "json");

					//console.log(showemployee_grid.checkedRows);
				}
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
			<li><a class="edit" onclick="doEditEmpBase();" rel="xgjbxx"><span>基本信息</span></a></li>
			<li><a class="edit" onclick="doEditExt();" rel="grzl"><span>其他信息</span></a></li>
			<li><a class="edit" onclick="doEditPic();" rel="ygzp"><span>员工照片</span></a></li>
			<li><a class="delete" onclick="doDelete();" rel="ygsc"><span>删除</span></a></li>
			<li class="line">line</li>
			<li><a class="icon" href="javascript:;"><span>导入EXCEL</span></a></li>
		</ul>
	</div>
	<div>
		<div id="gridbox_showemployee"></div>
	</div>
</div>
