<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	var prjId = "${PRJ_ID}";
</script>
<script type="text/javascript" src="${BaseURL}pages/prj/showproject.js"></script>

<script type="text/javascript">
	//检查是否只有一条记录
	function doCheckIsOnlyRowForPrj() {
		var empIdsForPrj = new Array();
		var i = 0;
		$.each(showproject_grid.checkedRows, function(key, value) {
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
	// 添加参建单位
	function doAddPrj() {
		// 如果只有一条
		navTab.openTab("xzxm", MyURL + "prj/addproject", {
			title : "新增项目",
			fresh : false,
			data : {},
			close : function() {
				// 对话框关闭时执行刷新
				showproject_grid.reload();
				showproject_grid.checkedRows = {};
				return true;
			}
		});
	}
	//checkbox编辑参建单位
	function doEditPrj() {

		var id1 = doCheckIsOnlyRowForPrj();
		if (id1 < 0) {
			alertMsg.error("请选择一条信息编辑！");
		} else {
			// 如果只有一条)
			navTab.openTab("xgxm", MyURL + "prj/editproject?PRJ_ID=" + id1, {
				title : "维护项目",
				fresh : false,
				data : {},
				close : function() {
					// 对话框关闭时执行刷新
					showproject_grid.reload();
					showproject_grid.checkedRows = {};
					return true;
				}
			});
		}
	}
	//checkbox删除参建单位
	function doDelPrj() {
		var id1 = doCheckIsOnlyRowForPrj();
		if (id1 < 0) {
			alertMsg.error("请选择一条信息删除，删除前请确认该项目可删除！");
		} else {
			// 如果只有一条
			alertMsg.confirm("是否确定删除该信息？", {
				okCall : function() {
					$.post('${BaseURL}prj/delproject?PRJ_ID=${PRJ_ID}&ID='
							+ id1, {
						empId : ''
					}, function() {
						DWZ.ajaxDone;
						showproject_grid.reload();
						showproject_grid.checkedRows = {};
					}, "json");
				}
			});
		}
	}
	function test() {
		return true;
	}
</script>

<div class="pageContent" id="showproject_head"
	style="overflow-x: hidden; overflow-y: hidden">
	<input id="projectwhere" name="regwhere" type="hidden"
		value="${projectwhere}" />
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" onclick="doAddPrj();" rel="xzxm"><span>新增项目</span></a></li>
			<li><a class="edit" onclick="doEditPrj();" rel="whxm"><span>维护项目</span></a></li>
			<li><a class="delete" onclick="doDelPrj();" rel="scxm"><span>删除项目</span></a></li>
			<li class="line">line</li>
			<li><a class="edit" href="${BaseURL}prj/queryproject"
				target="dialog" mask="true" title="查询框" width="840" height="480"
				close="test"><span>高级查询</span></a></li>
		</ul>
	</div>
	<div>
		<div id="gridbox_showproject"></div>
	</div>
</div>
