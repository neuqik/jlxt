<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	var empId = "${EMP_ID}";
</script>
<script type="text/javascript" src="${BaseURL}pages/hr/reg/showEmpEdu.js"></script>

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
	function doCheckIsOnlyEduRow() {
		var empIds1 = new Array();
		var i = 0;
		$.each(showempedu_grid.checkedRows, function(key, value) {
			empIds1[i] = key;
			i++;
		});
		if (empIds1.length != 1) {
			return -1;
		} else {
			return empIds1[0];
		}
	}
	//checkbox编辑员工基本信息
	function doDropEmpEdu() {
		var id1 = doCheckIsOnlyEduRow();
		if (id1 < 0) {
			alertMsg.error("请选择一条学历信息来删除！");
		} else {
			// 如果只有一条
			alertMsg.confirm("是否确定删除该学历信息？", {
				okCall : function() {
					$.post(
							'${BaseURL}labour/dropEmpEdu?empId=${EMP_ID}&ID='
									+ id1, {
								empId : ''
							}, function() {
								DWZ.ajaxDone;
								showempedu_grid.reload();
								showempedu_grid.checkedRows = {};
							}, "json");
				}
			});
		}
	}
	//checkbox编辑员工基本信息
	function doEditEmpEdu() {
		var id1 = doCheckIsOnlyEduRow();
		if (id1 < 0) {
			alertMsg.error("请选择一条学历信息编辑！");
		} else {
			// 如果只有一条
			$.pdialog.open(
					'${BaseURL}labour/editEmpEdu?empId=${EMP_ID}&ID=' + id1,
					'xgxl', "修改学历信息", {
						width : 640,
						height : 480,
						max : false,
						mask : true,
						mixable : true,
						minable : true,
						resizable : true,
						drawable : true,
						fresh : true,
						close : function() {
							// 对话框关闭时执行刷新
							showempedu_grid.reload();
							showempedu_grid.checkedRows = {};
							return true;
						}
					});

		}
	}

	function doAddEmpEdu() {
		// 如果只有一条
		/*$.pdialog.open("${BaseURL}hrs/addEmpReg?empId=${EMP_ID}", 'tjzc',
				"添加注册", {
					width : 640,
					height : 480,
					max : false,
					mask : true,
					mixable : true,
					minable : true,
					resizable : true,
					drawable : true,
					fresh : true,
					close : function() {
						// 对话框关闭时执行刷新
						showempedu_grid.reload();
						return true;
					}
				});*/
		navTab.openTab('tjxl', "${BaseURL}labour/addEmpEdu?empId=${EMP_ID}", {
			title : "添加学历",
			fresh : false,
			data : {}
		});
	}
</script>
<div class="pageContent" id="showempedu_head"
	style="overflow-x: hidden; overflow-y: hidden">
	<div class="panelBar" id="showempedu_bar">
		<ul class="toolBar">
			<li><a class="add" onclick="doAddEmpEdu();" rel="tjxl"><span>添加学历</span></a></li>
			<li><a class="edit" onclick="doEditEmpEdu();" rel="xgxl"><span>修改学历</span></a></li>
			<li><a class="delete" onclick="doDropEmpEdu();" rel="scxl"><span>删除学历</span></a></li>
		</ul>
	</div>
	<div>
		<div id="gridbox_showempedu"></div>
	</div>
</div>
