<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="${BaseURL}pages/chk/showdepartcheck.js"></script>

<script type="text/javascript">
	//检查是否只有一条记录监理部检查
	function doCheckIsOnlyRowForPrjChkJLB() {
		var empIdsForPrj = new Array();
		var i = 0;
		$.each(showdepartcheck_grid.checkedRows, function(key, value) {
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
	//添加监理部检查单
	function doAddJLBCheckgourp() {
		// 如果只有一条
		navTab.openTab("tjjlbjcd", MyURL + "chk/adddepartcheck", {
			title : "添加新监理部检查单",
			fresh : false,
			data : {
				CHECK_TYPE : '01'
			},
			close : function() {
				// 对话框关闭时执行刷新
				showdepartcheck_grid.reload();
				showdepartcheck_grid.checkedRows = {};
				return true;
			}
		});
	}
	//编辑监理部检查单
	function doEditJLBCheckgroup() {
		var id1 = doCheckIsOnlyRowForPrjChkJLB();
		if (id1 < 0) {
			alertMsg.error("请选择一条信息编辑！");
		} else {
			// 如果只有一条
			navTab.openTab("bjjlbjcd", MyURL + "chk/editdepartcheck?ID=" + id1,
					{
						title : "编辑监理部检查单",
						fresh : false,
						data : {},
						close : function() {
							// 对话框关闭时执行刷新
							showdepartcheck_grid.reload();
							showdepartcheck_grid.checkedRows = {};
							return true;
						}
					});
		}
	}
	//编辑评分
	function doEditCheckItemJLB() {
		var id1 = doCheckIsOnlyRowForPrjChkJLB();
		if (id1 < 0) {
			alertMsg.error("请选择一条信息编辑！");
		} else {
			// 如果只有一条
			navTab.openTab("bjjlbjcx", MyURL + "chk/editdepartcheckitem?ID="
					+ id1, {
				title : "编辑监理部检查项",
				fresh : false,
				data : {}
			});
		}
	}
	//删除检查单
	function doDelJLBCheckgroup() {
		var id1 = doCheckIsOnlyRowForPrjChkJLB();
		if (id1 < 0) {
			alertMsg.error("请选择一条信息删除，删除前请确认信息可删除！");
		} else {
			// 如果只有一条
			alertMsg.confirm("是否确定删除该信息？", {
				okCall : function() {
					$.post('${BaseURL}chk/deldepartcheckgroup?ID=' + id1, {
						empId : ''
					}, function() {
						DWZ.ajaxDone;
						showdepartcheck_grid.reload();
						showdepartcheck_grid.checkedRows = {};
					}, "json");
				}
			});
		}
	}
</script>

<div class="pageContent" id="showdepartcheck_head"
	style="overflow-x: hidden; overflow-y: hidden">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" onclick="doAddJLBCheckgourp();"
				rel="tjjlbjcd"><span>新建监理部检查单</span></a></li>
			<li><a class="edit" onclick="doEditJLBCheckgroup();"
				rel="bjjlbjcd"><span>编辑检查单</span></a></li>
			<li><a class="add" onclick="doEditCheckItemJLB();"
				rel="bjjlbjcx"><span>编辑检查项</span></a></li>
			<li><a class="delete" onclick="doDelJLBCheckgroup();"
				rel="scjlbjcx"><span>删除检查单</span></a></li>
			<li class="line">line</li>
		</ul>
	</div>
	<div>
		<div id="gridbox_showdepartcheck"></div>
	</div>
</div>
