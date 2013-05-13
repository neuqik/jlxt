var c = $("#myContent").height();
var header = $("#editunitall_head").height();
var sql = "SELECT CONTRACTOR, CONTRACT_TEL, GROUP_NAME, ID, MEMO, PRJ_ID, FUN_GETCODEDESC('QUALI_LEVEL',QUALI_LEVEL) QUALI_LEVEL, TITLE, UNIT_ADDRESS, UNIT_NAME, FUN_GETCODEDESC('UNIT_TYPE',UNIT_TYPE) UNIT_TYPE, FUN_GETCODEDESC('VALID',VALID) VALID FROM V_PRJ_UNIT";
// 定义数据类型
var dsOption = {
	fields : [ {
		name : "CONTRACTOR"
	}, {
		name : "CONTRACT_TEL"
	}, {
		name : "GROUP_NAME"
	}, {
		name : "ID"
	}, {
		name : "MEMO"
	}, {
		name : "PRJ_ID"
	}, {
		name : "QUALI_LEVEL"
	}, {
		name : "TITLE"
	}, {
		name : "UNIT_ADDRESS"
	}, {
		name : "UNIT_NAME"
	}, {
		name : "UNIT_TYPE"
	}, {
		name : "VALID"
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
	id : "UNIT_NAME",
	width : 150,
	editable : false,
	header : "参建单位名称",
	toolTip : true,
	toolTipWidth : 300
}, {
	id : "GROUP_NAME",
	width : 150,
	editable : false,
	header : "参建集团名称",
	toolTip : true,
	toolTipWidth : 300
}, {
	id : "QUALI_LEVEL",
	width : 100,
	editable : false,
	header : "资质等级"
}, {
	id : "UNIT_TYPE",
	width : 100,
	editable : false,
	header : "项目角色"
}, {
	id : "CONTRACTOR",
	width : 100,
	editable : false,
	header : "联系人"
}, {
	id : "TITLE",
	width : 100,
	editable : false,
	header : "职务"
}, {
	id : "CONTRACT_TEL",
	width : 100,
	editable : false,
	header : "电话"
}, {
	id : "UNIT_ADDRESS",
	width : 150,
	editable : false,
	header : "单位地址",
	toolTip : true,
	toolTipWidth : 300
}, {
	id : "ID",
	width : 100,
	editable : false,
	header : "",
	hidden : true
}, {
	id : "MEMO",
	width : 200,
	editable : false,
	header : "备注",
	toolTip : true,
	toolTipWidth : 300
}, {
	id : "PRJ_ID",
	width : 100,
	editable : false,
	header : "项目ID",
	hidden : true
}, {
	id : "VALID",
	width : 100,
	editable : false,
	header : "",
	hidden : true
} ];

var gridOption = {
	id : "editunitall_grid",
	loadURL : MyURL + 'common/doPageQuery?sql=' + sql,
	width : "100%", // "100%", // 700,
	height : c - header - 40, // "100%", // 330,
	container : "gridbox_editunitall",
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

var editunitall_grid = new Sigma.Grid(gridOption);
editunitall_grid.render();
