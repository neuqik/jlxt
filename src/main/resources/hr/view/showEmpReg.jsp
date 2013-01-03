<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	var empId = "${EMP_ID}";
</script>
<script type="text/javascript" src="${BaseURL}pages/hr/showEmpReg.js"></script>

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
		var recs = showempreg_grid.getSelectedRecords();
		var empIds = new Array();
		var i = 0;
		$.each(showempreg_grid.checkedRows, function(key, value) {
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
	function doDropEmpReg() {
		var id = doCheckIsOnlyRow();
		if (id < 0) {
			alertMsg.error("请选择一位员工来删除注册信息！");
		} else {
			// 如果只有一条
			alertMsg.confirm("是否确定删除该注册信息？", {
				okCall : function() {
					$.post('${BaseURL}hrs/dropEmpReg?empId=${EMP_ID}&ID=' + id,
							{
								empId : ''
							}, function() {
								DWZ.ajaxDone;
								showempreg_grid.reload();
							}, "json");
				}
			});
		}
	}
	//checkbox编辑员工基本信息
	function doEditEmpReg() {
		var id = doCheckIsOnlyRow();
		if (id < 0) {
			alertMsg.error("请选择一位员工编辑注册信息！");
		} else {
			// 如果只有一条
			$.pdialog.open('${BaseURL}hrs/editEmpReg?empId=${EMP_ID}&ID=' + id,
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
							return true;
						}
					});

		}
	}
	//checkbox编辑员工基本信息
	function doAddEmpReg() {
		// 如果只有一条
		$.pdialog.open("${BaseURL}hrs/addEmpReg?empId=${EMP_ID}", 'tjzc',
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
