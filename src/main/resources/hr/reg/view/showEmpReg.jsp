<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	var empId = "${EMP_ID}";
</script>
<script type="text/javascript" src="${BaseURL}pages/hr/reg/showEmpReg.js"></script>

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
	function doCheckIsOnlyRow1() {
		var empIds1 = new Array();
		var i = 0;
		$.each(showempreg_grid.checkedRows, function(key, value) {
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
	function doDropEmpReg() {
		var id1 = doCheckIsOnlyRow1();
		if (id1 < 0) {
			alertMsg.error("请选择一条注册信息来删除！");
		} else {
			// 如果只有一条
			alertMsg.confirm("是否确定删除该注册信息？", {
				okCall : function() {
					$.post(
							'${BaseURL}labour/dropEmpReg?empId=${EMP_ID}&ID='
									+ id1, {
								empId : ''
							}, function() {
								DWZ.ajaxDone;
								showempreg_grid.reload();
								showempreg_grid.checkedRows = {};
							}, "json");
				}
			});
		}
	}
	//checkbox编辑员工基本信息
	function doEditEmpReg() {
		var id1 = doCheckIsOnlyRow1();
		if (id1 < 0) {
			alertMsg.error("请选择一条注册信息编辑！");
		} else {
			// 如果只有一条
			$.pdialog.open(
					'${BaseURL}labour/editEmpReg?empId=${EMP_ID}&ID=' + id1,
					'xgzc', "修改注册信息", {
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
							showempreg_grid.reload();
							showempreg_grid.checkedRows = {};
							return true;
						}
					});

		}
	}

	function doAddEmpReg() {
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
						showempreg_grid.reload();
						return true;
					}
				});*/
		navTab.openTab('tjzc', "${BaseURL}labour/addEmpReg?empId=${EMP_ID}", {
			title : "添加注册",
			fresh : false,
			data : {}
		});
	}
</script>
<div class="pageContent" id="showempreg_head"
	style="overflow-x: hidden; overflow-y: hidden">
	<div class="panelBar" id="showempreg_bar">
		<ul class="toolBar">
			<li><a class="add" onclick="doAddEmpReg();" rel="tjzc"><span>添加注册</span></a></li>
			<li><a class="edit" onclick="doEditEmpReg();" rel="xgzc"><span>修改注册</span></a></li>
			<li><a class="delete" onclick="doDropEmpReg();" rel="sczc"><span>删除注册</span></a></li>
		</ul>
	</div>
	<div>
		<div id="gridbox_showempreg"></div>
	</div>
</div>
