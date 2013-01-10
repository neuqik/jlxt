<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${BaseURL}pages/query/queryEmp.js"></script>
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
	//检查是否只有一条记录
	function doCheckIsOnlyRowView() {

		var empIds = new Array();
		var i = 0;
		$.each(queryemp_grid.checkedRows, function(key, value) {
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
	function doViewEmpBase() {
		var id = doCheckIsOnlyRowView();
		if (id < 0) {
			alertMsg.error("请选择一位员工查看基本信息！");
		} else {
			// 如果只有一条
			navTab.openTab("viewjbxx", "${BaseURL}query/viewEmpBase?empId="
					+ id, {
				title : "查看基本信息",
				fresh : false,
				data : {}
			});
		}
	}
	// 编辑绩效
	function doViewPerf() {
		var id = doCheckIsOnlyRowView();
		if (id < 0) {
			alertMsg.error("请选择一位员工查看绩效信息！");
		} else {
			// 如果只有一条
			navTab.openTab("viewjxkp", "${BaseURL}query/viewEmpPerf?empId="
					+ id, {
				title : "查看绩效考评",
				fresh : false,
				data : {}
			});
		}
	}
	// 编辑绩效
	function doViewTrain() {
		var id = doCheckIsOnlyRowView();
		if (id < 0) {
			alertMsg.error("请选择一位员工查看培训记录！");
		} else {
			// 如果只有一条
			navTab.openTab("viewpxjl", "${BaseURL}query/viewEmpTrans?empId="
					+ id, {
				title : "查看培训记录",
				fresh : false,
				data : {}
			});
		}
	}
	// 查看家庭关系
	function doViewFamily() {
		var id = doCheckIsOnlyRowView();
		if (id < 0) {
			alertMsg.error("请选择一位员工查看家庭成员！");
		} else {
			// 如果只有一条
			navTab.openTab("viewjtcy", "${BaseURL}query/viewEmpFamily?empId="
					+ id, {
				title : "查看家庭成员",
				fresh : false,
				data : {}

			});
		}
	}
	// 查看劳动合同
	function doViewJob() {
		var id = doCheckIsOnlyRowView();
		if (id < 0) {
			alertMsg.error("请选择一位员工查看劳动合同！");
		} else {
			// 如果只有一条
			navTab.openTab("viewldht",
					"${BaseURL}query/viewEmpJob?empId=" + id, {
						title : "查看劳动合同",
						fresh : false,
						data : {}

					});
		}
	}
	// 查看奖惩记录
	function doViewReward() {
		var id = doCheckIsOnlyRowView();
		if (id < 0) {
			alertMsg.error("请选择一位员工查看奖惩记录！");
		} else {
			// 如果只有一条
			navTab.openTab("viewjcjl", "${BaseURL}query/viewEmpReward?empId="
					+ id, {
				title : "查看奖惩记录",
				fresh : false,
				data : {}

			});
		}
	}
	// 查看工作经历
	function doViewWork() {
		var id = doCheckIsOnlyRowView();
		if (id < 0) {
			alertMsg.error("请选择一位员工查看工作经历！");
		} else {
			// 如果只有一条
			navTab.openTab("viewgzjl", "${BaseURL}query/viewEmpWork?empId="
					+ id, {
				title : "查看工作经历",
				fresh : false,
				data : {}

			});
		}
	}
	// 查看职称
	function doViewProf() {
		var id = doCheckIsOnlyRowView();
		if (id < 0) {
			alertMsg.error("请选择一位员工查看职称评定！");
		} else {
			// 如果只有一条
			navTab.openTab("viewzcpd", "${BaseURL}query/viewEmpProf?empId="
					+ id, {
				title : "查看职称评定",
				fresh : false,
				data : {}
			});
		}
	}
	// 查看注册信息
	function doViewReg() {
		var id = doCheckIsOnlyRowView();
		if (id < 0) {
			alertMsg.error("请选择一位员工查看注册信息！");
		} else {
			// 如果只有一条
			navTab.openTab("viewzcxx",
					"${BaseURL}query/viewEmpReg?empId=" + id, {
						title : "查看注册信息",
						fresh : false,
						data : {}
					});
		}
	}
	// 查看其他认证
	function doViewCert() {
		var id = doCheckIsOnlyRowView();
		if (id < 0) {
			alertMsg.error("请选择一位员工查看认证信息！");
		} else {
			// 如果只有一条
			navTab.openTab("viewqtrz", "${BaseURL}query/viewEmpCert?empId="
					+ id, {
				title : "查看认证信息",
				fresh : false,
				data : {}
			});
		}
	}
	// 查看照片
	function doViewPic() {
		var id = doCheckIsOnlyRowView();
		if (id < 0) {
			alertMsg.error("请选择一位员工查看照片！");
		} else {
			// 如果只有一条
			navTab.openTab("viewygzp",
					"${BaseURL}query/viewEmpPic?empId=" + id, {
						title : "查看员工照片",
						fresh : false,
						data : {}
					});
		}
	}
	// 查看其他认证
	function doViewTransfer() {
		var id = doCheckIsOnlyRowView();
		if (id < 0) {
			alertMsg.error("请选择一位员工查看变动信息！");
		} else {
			// 如果只有一条
			navTab.openTab("viewygbd", "${BaseURL}query/viewEmpTransfer?empId="
					+ id, {
				title : "查看员工变动",
				fresh : false,
				data : {}
			});
		}
	}
</script>

<div class="pageContent" id="queryemp_head"
	style="overflow-x: hidden; overflow-y: hidden">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="detail" onclick="doViewEmpBase();" rel="viewjbxx"><span>基本信息</span></a></li>
			<li><a class="detail" onclick="doViewPic();" rel="viewygzp"><span>员工照片</span></a></li>
			<li class="line">line</li>
			<li><a class="detail" onclick="doViewPerf();" rel="viewjxkp"><span>绩效考评</span></a></li>
			<li><a class="detail" onclick="doViewTrain();" rel="viewpxjl"><span>培训经历</span></a></li>
			<li class="line">line</li>
			<li><a class="detail" onclick="doViewFamily();" rel="viewjtcy"><span>家庭成员</span></a></li>
			<li><a class="detail" onclick="doViewJob();" rel="viewldht"><span>劳动合同</span></a></li>
			<li><a class="detail" onclick="doViewReward();" rel="viewjcjl"><span>奖惩记录</span></a></li>
			<li><a class="detail" onclick="doViewWork();" rel="viewgzjl"><span>工作经历</span></a></li>
			<li class="line">line</li>
			<li><a class="detail" onclick="doViewProf();" rel="viewzcpd"><span>职称评定</span></a></li>
			<li><a class="detail" onclick="doViewReg();" rel="viewzcxx"><span>注册信息</span></a></li>
			<li><a class="detail" onclick="doViewCert();" rel="viewqtrz"><span>其他认证</span></a></li>
			<li class="line">line</li>
			<li><a class="detail" onclick="doViewTransfer();" rel="viewygbd"><span>员工变动</span></a></li>
		</ul>
	</div>
	<div>
		<div id="gridbox_queryemp"></div>
	</div>
</div>
