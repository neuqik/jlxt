<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	var checkgroupNo = "${CHECKGROUP_NO}";
</script>
<script type="text/javascript"
	src="${BaseURL}pages/prj/showcheckgroup.js"></script>
<script type="text/javascript">
	//检查是否只有一条记录
	function doCheckIsOnlyRowForPrjCheck() {
		var empIdsForPrjCheck = new Array();
		var i = 0;
		$.each(showcheckgroup_grid.checkedRows, function(key, value) {
			empIdsForPrjCheck[i] = key;
			i++;
		});
		//console.log(empIdsForPrj);
		if (empIdsForPrjCheck.length != 1) {
			return -1;
		} else {
			return empIdsForPrjCheck[0];
		}
	}
	// 添加扣分
	function doAddCheck() {
		/*
		navTab.openTab("tjkf", MyURL
				+ "prj/addscorebygroup?CHECKGROUP_NO=${CHECKGROUP_NO}", {
			title : "添加扣分",
			fresh : false,
			data : {},
			close : function() {
				// 对话框关闭时执行刷新
				showcheckgroup_grid.reload();
				showcheckgroup_grid.checkedRows = {};
				return true;
			}
		});*/
		$.pdialog.open("prj/addscorebygroup?CHECKGROUP_NO=${CHECKGROUP_NO}",
				"tjkf", "添加扣分", {
					width : 840,
					height : 380,
					max : false,
					mask : true,
					mixable : true,
					minable : true,
					resizable : true,
					drawable : true,
					fresh : true,
					close : function() {
						// 对话框关闭时执行刷新
						showcheckgroup_grid.reload();
						showcheckgroup_grid.checkedRows = {};
						return true;
					}
				});
	}
	//checkbox编辑扣分
	function doEditCheck() {

		var id1 = doCheckIsOnlyRowForPrjCheck();
		if (id1 < 0) {
			alertMsg.error("请选择一条信息编辑！");
		} else {
			/*
			navTab.openTab("bjkf", MyURL + "prj/editscore?ID=" + id1, {
				title : "编辑扣分",
				fresh : false,
				data : {},
				close : function() {
					// 对话框关闭时执行刷新
					showcheckgroup_grid.reload();
					showcheckgroup_grid.checkedRows = {};
					return true;
				}
			});*/
			$.pdialog.open("prj/editscore?ID=" + id1, "bjkf", "编辑扣分", {
				width : 840,
				height : 380,
				max : false,
				mask : true,
				mixable : true,
				minable : true,
				resizable : true,
				drawable : true,
				fresh : true,
				close : function() {
					// 对话框关闭时执行刷新
					showcheckgroup_grid.reload();
					showcheckgroup_grid.checkedRows = {};
					return true;
				}
			});

		}
	}
	//checkbox删除扣分
	function doDelCheck() {
		var id1 = doCheckIsOnlyRowForPrjCheck();
		if (id1 < 0) {
			alertMsg.error("请选择一条信息删除，删除前请确认该项目可删除！");
		} else {
			// 如果只有一条
			alertMsg.confirm("是否确定删除该信息？", {
				okCall : function() {
					$.post('${BaseURL}prj/delscore?ID=' + id1, {
						empId : ''
					}, function() {
						DWZ.ajaxDone;
						showcheckgroup_grid.reload();
						showcheckgroup_grid.checkedRows = {};
					}, "json");
				}
			});
		}
	}
	function test() {
		return true;
	}
</script>

<div class="pageContent" id="showcheckgroup_head"
	style="overflow-x: hidden; overflow-y: hidden">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" onclick="doAddCheck();" ref="tjkf"><span>添加扣分</span></a></li>
			<li><a class="edit" onclick="doEditCheck();" rel="bjkf"><span>编辑扣分</span></a></li>
			<li><a class="delete" onclick="doDelCheck();" rel="sckf"><span>删除扣分</span></a></li>
		</ul>
	</div>
	<div>
		<div id="gridbox_showcheckgroup"></div>
	</div>
</div>
