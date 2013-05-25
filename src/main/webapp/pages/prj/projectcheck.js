var c = $("#myContent").height();
var header = $("#projectcheck_head").height();
var sql = "SELECT ACT_SCORE, TO_CHAR(CHECKDATE,'YYYY-MM-DD') CHECKDATE, PRJNO, PRJ_NAME, CHECKITEM, PRJ_ID,CHECKGROUP_NO, DEPT_COUNT  FROM V_PRJ_CHECK_SUM";
// 定义数据类型
var dsOption = {
	fields : [ {
		name : "ACT_SCORE"
	}, {
		name : "CHECKDATE"
	}, {
		name : "CHECKITEM"
	}, {
		name : "PRJNO"
	}, {
		name : "PRJ_NAME"
	}, {
		name : "PRJ_ID"
	}, {
		name : "CHECKGROUP_NO"
	}, {
		name : "DEPT_COUNT"
	} ],
	uniqueField : 'PRJ_ID',
	recordType : 'json'
};
// 定义列选项
var colsOption = [ {
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
	id : "CHECKGROUP_NO",
	width : 200,
	editable : false,
	header : "检查单编号"
}, {
	id : "CHECKDATE",
	width : 150,
	editable : false,
	header : "检查时间"
}, {
	id : "CHECKITEM",
	width : 100,
	editable : false,
	header : "检查项目合计"
}, {
	id : "DEPT_COUNT",
	width : 150,
	editable : false,
	header : "扣分分公司数量"
}, {
	id : "ACT_SCORE",
	width : 100,
	editable : false,
	header : "扣分合计"
} ];

var gridOption = {
	id : "projectcheck_grid",
	loadURL : MyURL + 'common/doPageQuery?sql=' + sql,
	width : "100%", // "100%", // 700,
	height : c - header, // "100%", // 330,
	container : "gridbox_projectcheck",
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
	}
};

var projectcheck_grid = new Sigma.Grid(gridOption);
projectcheck_grid.render();
