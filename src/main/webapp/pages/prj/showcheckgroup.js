var c = $("#myContent").height();
var header = $("#showcheckgroup_head").height();
var panel = $("#showcheckgroup_panel").height();
var sql = "SELECT ACT_SCORE, TO_CHAR(BEGINDATE,'YYYY-MM-DD') BEGINDATE, TO_CHAR(CHECKDATE,'YYYY-MM-DD') CHECKDATE, CHECKGROUP_NO, FUN_GETCHECKITEM(CHECKITEM) CHECKITEM, FUN_GETCODEDESC('CONSTRUCT_TYPE',CONSTRUCT_TYPE) CONSTRUCT_TYPE, FUN_GETCODEDESC('DEPT_ID',DEPT_ID) DEPT_ID, (SELECT EMP_NAME FROM HRD_EMP A WHERE A.EMP_ID=C.EMP_ID) EMP_ID, TO_CHAR(ENDDATE,'YYYY-MM-DD') ENDDATE, ID, (SELECT UNIT_NAME FROM PRJ_UNIT B WHERE B.ID=JSDW_ID) JSDW_ID, MEMO, (SELECT PRJNO FROM PRJ_INFO WHERE ID = C.PRJ_ID) PRJNO,(SELECT PRJ_NAME FROM PRJ_INFO WHERE ID = C.PRJ_ID) PRJ_NAME, PRJ_ID, PRJ_PROGRESS, (SELECT UNIT_NAME FROM PRJ_UNIT B WHERE B.ID=SGDW_ID) SGDW_ID, FUN_GETCODEDESC('VALID',VALID) VALID,POINT FROM V_PRJ_CHECK C WHERE  CHECKGROUP_NO='"
		+ checkgroupNo + "'";
// 定义数据类型
var dsOption = {
	fields : [ {
		name : "ACT_SCORE"
	}, {
		name : "BEGINDATE"
	}, {
		name : "CHECKDATE"
	}, {
		name : "CHECKGROUP_NO"
	}, {
		name : "CHECKITEM"
	}, {
		name : "CONSTRUCT_TYPE"
	}, {
		name : "DEPT_ID"
	}, {
		name : "EMP_ID"
	}, {
		name : "ENDDATE"
	}, {
		name : "ID"
	}, {
		name : "JSDW_ID"
	}, {
		name : "MEMO"
	}, {
		name : "PRJ_ID"
	}, {
		name : "PRJ_PROGRESS"
	}, {
		name : "SGDW_ID"
	}, {
		name : "VALID"
	} , {
		name : "POINT"
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
	id : "PRJNO",
	width : 100,
	editable : false,
	header : "项目编号",
	frozen : true
}, {
	id : "PRJ_NAME",
	width : 100,
	editable : false,
	header : "项目名称",
	toolTip : true,
	toolTipWidth : 450
}, {
	id : "CHECKGROUP_NO",
	width : 120,
	editable : false,
	header : "检查单编号"
}, {
	id : "CHECKDATE",
	width : 100,
	editable : false,
	header : "检查时间"
}, {
	id : "CHECKITEM",
	width : 150,
	editable : false,
	header : "检查项目",
	toolTip : true,
	toolTipWidth : 550
}, {
	id : "ACT_SCORE",
	width : 80,
	editable : false,
	header : "实际得分"
}, {
	id : "POINT",
	width : 80,
	editable : false,
	header : "应得"
}, {
	id : "PRJ_ID",
	width : 100,
	editable : false,
	header : "项目ID",
	hidden : true
}, {
	id : "JSDW_ID",
	width : 150,
	editable : false,
	header : "建设单位",
	toolTip : true,
	toolTipWidth : 450
}, {
	id : "SGDW_ID",
	width : 150,
	editable : false,
	header : "施工单位",
	toolTip : true,
	toolTipWidth : 450
}, {
	id : "CONSTRUCT_TYPE",
	width : 70,
	editable : false,
	header : "结构类型"
}, {
	id : "ID",
	width : 150,
	editable : false,
	header : "",
	hidden : true
}, {
	id : "MEMO",
	width : 150,
	editable : false,
	header : "备注",
	toolTip : true,
	toolTipWidth : 350
}, {
	id : "VALID",
	width : 100,
	editable : false,
	header : "",
	hidden : true
} ];

var gridOption = {
	id : "showcheckgroup_grid",
	loadURL : MyURL + 'common/doPageQuery?sql=' + sql,
	width : "100%", // "100%", // 700,
	height : c - header - panel + 150,// 245, // "100%", // 330,
	container : "gridbox_showcheckgroup",
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
		// TODO:双击行事件
		$.pdialog.open("prj/editscore?ID=" + record.ID, "bjkf", "编辑扣分", {
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
};

var showcheckgroup_grid = new Sigma.Grid(gridOption);
showcheckgroup_grid.render();
