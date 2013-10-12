var c = $("#myContent").height();
var header = $("#remindersetup_head").height();
var sql = "SELECT ID, MAIL, MEMO, PARAM, PROGRAM, RESULT, SUBJECT, VALID FROM ADM_REMIND";
// 定义数据类型
var dsOption = {
	fields : [ {
		name : "ID"
	}, {
		name : "MAIL"
	}, {
		name : "MEMO"
	}, {
		name : "PARAM"
	}, {
		name : "PROGRAM"
	}, {
		name : "RESULT"
	}, {
		name : "SUBJECT"
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
	editable : true,
	editor : {
		type : "text"
	},
	header : "ID"
}, {
	id : "MAIL",
	width : 300,
	header : "邮件地址,多个人用,分割",
	editable : true,
	editor : {
		type : "text"
	}
}, {
	id : "MEMO",
	width : 200,
	header : "提醒用途",
	editable : true,
	editor : {
		type : "text"
	}
}, {
	id : "SUBJECT",
	width : 200,
	header : "邮件主题",
	editable : true,
	editor : {
		type : "text"
	}
}, {
	id : "PROGRAM",
	width : 200,
	header : "检查程序,存储过程名",
	editable : true,
	editor : {
		type : "text"
	}
},  {
	id : "VALID",
	width : 100,
	header : "有效标志",
	editable : true,
	editor : {
		type : "text"
	}
}, {
	id : "PARAM",
	width : 100,
	editable : false,
	header : "程序入参"
}, {
	id : "RESULT",
	width : 300,
	editable : false,
	header : "程序结果"
} ];

var gridOption = {
	id : "remindersetup_grid",
	loadURL : MyURL + 'common/doPageQuery?sql=' + sql,
	saveURL : MyURL + 'mgr/saveremindersetup',
	width : "100%", // "100%", // 700,
	height : c - header, // "100%", // 330,
	container : "gridbox_remindersetup",
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
	},
	customRowAttribute : function(record, rn, grid) {
		if (record['VALID'] == '0') {
			return 'style="color:#ff0000"';
		} else {
			return 'style="color:#000000"';
		}
	}
};

var remindersetup_grid = new Sigma.Grid(gridOption);
remindersetup_grid.render();
