<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	var prjId = "${PRJ_ID}";
</script>
<script type="text/javascript" src="${BaseURL}pages/prj/projectcheck.js"></script>

<script type="text/javascript">
	//检查是否只有一条记录
	function doCheckIsOnlyRowForPrjChkSafe() {
		var empIdsForPrj = new Array();
		var i = 0;
		$.each(projectcheck_grid.checkedRows, function(key, value) {
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
				CHECK_TYPE : '01'
			},
			close : function() {
				// 对话框关闭时执行刷新
				projectcheck_grid.reload();
				projectcheck_grid.checkedRows = {};
				return true;
			}
		});
	}
	//编辑评分
	function doEditScore() {
		var id1 = doCheckIsOnlyRowForPrjChkSafe();
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
					projectcheck_grid.reload();
					projectcheck_grid.checkedRows = {};
					return true;
				}
			});
		}
	}
	//编辑评分
	function doEditCheckItem() {
		var id1 = doCheckIsOnlyRowForPrjChkSafe();
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
		var id1 = doCheckIsOnlyRowForPrjChkSafe();
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
						projectcheck_grid.reload();
						projectcheck_grid.checkedRows = {};
					}, "json");
				}
			});
		}
	}
	//打印检查单
	function doPrintScoreSafe() {
		var id1 = doCheckIsOnlyRowForPrjChkSafe();
		if (id1 < 0) {
			alertMsg.error("请选择一条信息打印！");
		} else {
			// 如果只有一条
			$.pdialog.open('${BaseURL}prj/printcheckgroup?ID=' + id1, 'dyjcd',
					"导出文件", {
						width : 400,
						height : 300,
						max : false,
						mask : true,
						mixable : true,
						minable : true,
						resizable : true,
						drawable : true,
						fresh : true,
						close : function() {
							return true;
						}
					});
		}
	}
</script>

<div class="pageContent" id="projectcheck_head"
	style="overflow-x: hidden; overflow-y: hidden">

	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" onclick="doAddScore();" rel="tjjcd"><span>添加新检查单</span></a></li>
			<li><a class="edit" onclick="doEditScore();" rel="bjjcd"><span>编辑检查单</span></a></li>
			<li><a class="edit" onclick="doEditCheckItem();" rel="bjjcx"><span>编辑检查项</span></a></li>
			<li><a class="delete" onclick="doDelScore();" rel="scjcd"><span>删除检查单</span></a></li>
			<li class="line">line</li>
			<li><a class="agree" onclick="doPrintScoreSafe();" rel="dyjcd"><span>打印检查单</span></a></li>
		</ul>

	</div>

	<div>
		<div id="gridbox_projectcheck"></div>
	</div>
</div>
