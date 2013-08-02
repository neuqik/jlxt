var c = $("#myContent").height();
var header = $("#projectcheck_head").height();
var sql = "SELECT ID,PRJ_ID,PRJNO,PRJ_NAME,FUN_GETCODEDESC('DEPT_ID',DEPT_ID) DEPT_ID,PROGRESS,TO_CHAR(CHECKDATE,'YYYY-MM-DD') CHECKDATE,CHECK_USER,(SELECT EMP_NAME FROM HRD_EMP WHERE EMP_ID = V_PRJ_MAJORCHECK.TESTER) TESTER,MEMO,VALID,(SELECT EMP_NAME FROM HRD_EMP WHERE EMP_ID = V_PRJ_MAJORCHECK.EMP_ID) EMP_ID,(SELECT EMP_NAME FROM HRD_EMP WHERE EMP_ID = V_PRJ_MAJORCHECK.EMP_ID_2) EMP_ID_2,SUM1,RATIO1*100 RATIO1,CHECKGROUP_NO,FUN_GETCODEDESC('JOIN_TYPE',JOIN_TYPE) JOIN_TYPE,BATCHNO  FROM V_PRJ_MAJORCHECK WHERE CHECK_TYPE='04'";
// 定义数据类型
var dsOption = {
	fields : [ {
		name : "ID"
	}, {
		name : "PRJ_ID"
	}, {
		name : "PRJNO"
	}, {
		name : "PRJ_NAME"
	}, {
		name : "DEPT_ID"
	}, {
		name : "PROGRESS"
	}, {
		name : "CHECKDATE"
	}, {
		name : "CHECK_USER"
	}, {
		name : "TESTER"
	}, {
		name : "MEMO"
	}, {
		name : "EMP_ID"
	}, {
		name : "EMP_ID_2"
	}, {
		name : "SUM1"
	}, {
		name : "RATIO1"
	}, {
		name : "CHECKGROUP_NO"
	}, {
		name : "JOIN_TYPE"
	}, {
		name : "BATCHNO"
	} ],
	uniqueField : 'ID',
	recordType : 'json'
};
// 定义列选项
var colsOption = [ {
	id : "chk",
	isCheckColumn : true,
	frozen : true
}, {
	id : "ID",
	width : 100,
	editable : false,
	header : "",
	hidden : true,
	frozen : true
}, {
	id : "PRJ_ID",
	width : 100,
	editable : false,
	header : "项目ID",
	hidden : true
}, {
	id : "CHECKGROUP_NO",
	width : 200,
	editable : false,
	header : "检查单编号"
}, {
	id : "PRJNO",
	width : 150,
	editable : false,
	header : "项目编号"
}, {
	id : "PRJ_NAME",
	width : 300,
	editable : false,
	header : "项目名称"
}, {
	id : "CHECKDATE",
	width : 100,
	editable : false,
	header : "检查时间"
}, {
	id : "SUM1",
	width : 80,
	editable : false,
	header : "实得"
}, {
	id : "RATIO1",
	width : 80,
	editable : false,
	header : "得分率％"
}, {
	id : "EMP_ID",
	width : 100,
	editable : false,
	header : "总监"
}, {
	id : "EMP_ID_2",
	width : 100,
	editable : false,
	header : "总代"
}, {
	id : "TESTER",
	width : 100,
	editable : false,
	header : "受检人员"
}, {
	id : "CHECK_USER",
	width : 100,
	editable : false,
	header : "检查人员"
}, {
	id : "PROGRESS",
	width : 100,
	editable : false,
	header : "形象进度"
}, {
	id : "JOIN_TYPE",
	width : 80,
	editable : false,
	header : "参与评比"
}, {
	id : "BATCHNO",
	width : 100,
	editable : false,
	header : "轮次"
}, {
	id : "MEMO",
	width : 100,
	editable : false,
	header : "备注"
} ];

var gridOption = {
	id : "projectcheck_electric_grid",
	loadURL : MyURL + 'common/doPageQuery?sql=' + sql,
	width : "100%", // "100%", // 700,
	height : c - header - 67, // "100%", // 330,
	container : "gridbox_projectcheck_electric",
	toolbarPosition : 'bottom',
	toolbarContent : 'nav | pagesize | reload | print | xls | filter chart | state',
	pageSizeList : [ 15, 25, 40, 60, 100, 200 ],
	pageSize : 15,
	dataset : dsOption,
	columns : colsOption,
	recountAfterSave : true,
	showGridMenu : true,
	allowFreeze : true,
	allowGroup : true,
	allowHide : true,
	showIndexColumn : true,
	SigmaGridPath : '../grid/',// 图形路径，需要补充
	exportURL : MyURL + 'common/doExport?sql=' + sql,// 导出URL
	exportFileName : 'emp_info',
	remotePaging : true, // 服务器分页
	remoteFilter : true, // 发送请求到LoadURL中，并且填写filterInfo
	remoteSort : true, // 发送排序请求到LoadURL中，并且填写SortInfo
	submitUpdatedFields : true, // 只提交变动的数据
	autoLoad : true, // 窗口打开时是否自动加载URL
	parameters : {
		a : 123,
		b : 222,
		c : [ 8, 9 ]
	},
	onMouseOver : function(value, record, cell, row, colNo, rowNo, columnObj,
			grid) {
		if (columnObj && columnObj.toolTip) {
			grid.showCellToolTip(cell, columnObj.toolTipWidth);
		} else {
			grid.hideCellToolTip();
		}
	},
	onMouseOut : function(value, record, cell, row, colNo, rowNo, columnObj,
			grid) {
		grid.hideCellToolTip();
	},
	onCellDblClick : function(value, record, cell, row, colNO, rowNO,
			columnObj, grid) {
		// 如果只有一条
		navTab.openTab("bjjcx", MyURL + "prj/editcheckitem?ID=" + record.ID, {
			title : "编辑检查项",
			fresh : false,
			data : {}
		});
	},
	customRowAttribute : function(record, rn, grid) {
		if (record['JOIN_TYPE'] == '不参与') {
			return 'style="color:#ff0000"';
		}
	}
};

var projectcheck_electric_grid = new Sigma.Grid(gridOption);
projectcheck_electric_grid.render();
