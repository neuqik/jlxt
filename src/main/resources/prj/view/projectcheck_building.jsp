<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	var prjId = "${PRJ_ID}";
</script>
<script type="text/javascript"
	src="${BaseURL}pages/prj/projectcheck_building.js"></script>

<script type="text/javascript">
	//检查是否只有一条记录
	function doCheckIsOnlyRowForPrjChk() {
		var empIdsForPrj = new Array();
		var i = 0;
		$.each(projectcheck_building_grid.checkedRows, function(key, value) {
			empIdsForPrj[i] = key;
			i++;
		});
		//console.log(empIdsForPrj);
		if (empIdsForPrj.length != 1) {
			return -1;
		} else {
			return empIdsForPrj[0];
		}
	}
	//添加评分
	function doAddScore() {
		// 如果只有一条
		navTab.openTab("tjjcd", MyURL + "prj/addscore", {
			title : "添加新检查单",
			fresh : false,
			data : {
				CHECK_TYPE : '02'
			},
			close : function() {
				// 对话框关闭时执行刷新
				projectcheck_building_grid.reload();
				projectcheck_building_grid.checkedRows = {};
				return true;
			}
		});
	}
	//编辑评分
	function doEditScore() {
		var id1 = doCheckIsOnlyRowForPrjChk();
		if (id1 < 0) {
			alertMsg.error("请选择一条信息编辑！");
		} else {
			// 如果只有一条
			navTab.openTab("bjjcd", MyURL + "prj/editscore?ID=" + id1, {
				title : "编辑检查单",
				fresh : false,
				data : {},
				close : function() {
					// 对话框关闭时执行刷新
					projectcheck_building_grid.reload();
					projectcheck_building_grid.checkedRows = {};
					return true;
				}
			});
		}
	}
	//编辑评分
	function doEditCheckItem() {
		var id1 = doCheckIsOnlyRowForPrjChk();
		if (id1 < 0) {
			alertMsg.error("请选择一条信息编辑！");
		} else {
			// 如果只有一条
			navTab.openTab("bjjcx", MyURL + "prj/editcheckitem?ID=" + id1, {
				title : "编辑检查项",
				fresh : false,
				data : {}
			});
		}
	}
	//删除检查单
	function doDelScore() {
		var id1 = doCheckIsOnlyRowForPrjChk();
		if (id1 < 0) {
			alertMsg.error("请选择一条信息删除，删除前请确认信息可删除！");
		} else {
			// 如果只有一条
			alertMsg.confirm("是否确定删除该信息？", {
				okCall : function() {
					$.post('${BaseURL}prj/delcheckgroup?ID=' + id1, {
						empId : ''
					}, function() {
						DWZ.ajaxDone;
						projectcheck_building_grid.reload();
						projectcheck_building_grid.checkedRows = {};
					}, "json");
				}
			});
		}
	}
</script>

<div class="pageContent" id="projectcheck_building_head"
	style="overflow-x: hidden; overflow-y: hidden">

	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" onclick="doAddScore();" rel="tjjcd"><span>添加新检查单</span></a></li>
			<li><a class="edit" onclick="doEditScore();" rel="bjjcd"><span>编辑检查单</span></a></li>
			<li><a class="edit" onclick="doEditCheckItem();" rel="bjjcx"><span>编辑检查项</span></a></li>
			<li><a class="delete" onclick="doDelScore();" rel="scjcd"><span>删除检查单</span></a></li>
		</ul>

	</div>

	<div>
		<div id="gridbox_projectcheck_building"></div>
	</div>
</div>
