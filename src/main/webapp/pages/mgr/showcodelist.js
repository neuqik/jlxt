var c = $("#myContent").height();
var header = $("#showcodelist_head").height();
var sql = "SELECT CODE_DESC, CODE_TYPE, CODE_TYPE_DESC, CODE_VALUE, ID, MEMO,  VALID FROM T_CODELIST";
// 定义数据类型
var dsOption = {
	fields : [ {
		name : "ID"
	}, {
		name : "CODE_TYPE"
	}, {
		name : "CODE_TYPE_DESC"
	}, {
		name : "CODE_DESC"
	}, {
		name : "CODE_VALUE"
	}, {
		name : "MEMO"
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
	id : "ID",
	width : 100,
	header : "ID",
	editable : false,
	editor : {
		type : "text"
	}
}, {
	id : "CODE_TYPE",
	width : 150,
	header : "代码大类",
	editable : true,
	editor : {
		type : "text"
	}
}, {
	id : "CODE_TYPE_DESC",
	width : 150,
	header : "代码大类中文",
	editable : true,
	editor : {
		type : "text"
	}
}, {
	id : "CODE_DESC",
	width : 150,
	header : "代码中文",
	editable : true,
	editor : {
		type : "text"
	}
}, {
	id : "CODE_VALUE",
	width : 100,
	header : "代码值",
	editable : true,
	editor : {
		type : "text"
	}
}, {
	id : "MEMO",
	width : 150,
	header : "备注",
	editable : true,
	editor : {
		type : "text"
	}
}, {
	id : "VALID",
	width : 80,
	header : "有效标志",
	editable : true,
	editor : {
		type : "text"
	}
} ];

var gridOption = {
	id : "showcodelist_grid",
	loadURL : MyURL + 'common/doPageQuery?sql=' + sql,
	saveURL : MyURL + 'mgr/savecodelist',
	width : "100%", // "100%", // 700,
	height : c - header, // "100%", // 330,
	container : "gridbox_showcodelist",
	toolbarPosition : 'bottom',
	toolbarContent : 'nav | pagesize | reload |  add del save | print xls | filter chart | state',
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
	exportFileName : 'code_info',
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
	},
	customRowAttribute : function(record, rn, grid) {
		if (record['VALID'] == '0') {
			return 'style="color:#ff0000"';
		} else {
			return 'style="color:#000000"';
		}
	}
};

var showcodelist_grid = new Sigma.Grid(gridOption);
showcodelist_grid.render();
