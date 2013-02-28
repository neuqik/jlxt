var c = $("#myContent").height();
var header = $("#showempjob_head").height();
var pageheader = $("#showempext_pageheader").height();
var sql = "select ID,EMP_ID,CONTRACT_ID,CONTRACT_NAME,CONTRACTTYPE,CONTRACTPROP,TO_CHAR(BEGINDATE,'YYYY-MM-DD') BEGINDATE,TO_CHAR(ENDDATE,'YYYY-MM-DD') ENDDATE,ADDITION,TO_CHAR(ACCIDENT_START,'YYYY-MM-DD') ACCIDENT_START,TO_CHAR(ACCIDENT_END,'YYYY-MM-DD') ACCIDENT_END,INSU,MEMO,VALID from V_HRD_EMP_CONTRACT WHERE EMP_ID='"
		+ empId + "'";

// 定义数据类型
var dsOption = {
	fields : [ {
		name : 'ID'
	}, {
		name : 'EMP_ID'
	}, {
		name : 'CONTRACT_ID'
	}, {
		name : 'CONTRACT_NAME'
	}, {
		name : 'CONTRACTTYPE'
	}, {
		name : 'CONTRACTPROP'
	}, {
		name : 'BEGINDATE'
	}, {
		name : 'ENDDATE'
	}, {
		name : 'ADDITION'
	}, {
		name : 'ACCIDENT_START'
	}, {
		name : 'ACCIDENT_END'
	}, {
		name : 'INSU'
	}, {
		name : 'MEMO'
	} ],
	uniqueField : 'ID',
	recordType : 'json'
};
// 定义列选项
var colsOption = [ {
	id : 'chk',
	isCheckColumn : true
}, {
	id : 'ID',
	header : "ID",
	width : 55,
	editable : false,
	hidden : true
}, {
	id : 'EMP_ID',
	header : "员工编号",
	width : 100,
	editable : false,
	hidden : true
}, {
	id : 'BEGINDATE',
	header : "劳动合同起始日期",
	width : 150,
	editable : true,
	editor : {
		type : "date",
		validator : function(value, record, colObj, grid) {
			// 如果输入了值
			if (value.length > 0) {
				return true;
			} else {
				return "请输入劳动合同起始日期";
			}
		}
	}
}, {
	id : 'ENDDATE',
	header : "劳动合同终止日期",
	width : 150,
	editable : true,
	editor : {
		type : "date",
		validator : function(value, record, colObj, grid) {
			// 如果输入了值
			if (value.length > 0) {
				if (Date.parse(record.BEGINDATE) - Date.parse(value) > 0)
					return "结束日期早于开始日期";
				else
					return true;
			} else {
				return "请输入劳动合同终止日期";
			}
		}
	}
}, {
	id : 'CONTRACT_ID',
	header : "合同编号",
	width : 150,
	editable : true,
	editor : {
		type : "text"
	}
}, {
	id : 'CONTRACT_NAME',
	header : "合同名称",
	width : 150,
	editable : true,
	editor : {
		type : "text"
	}
}, {
	id : 'CONTRACTTYPE',
	header : "合同类型",
	width : 150,
	editable : true,
	editor : {
		type : "text"
	}
}, {
	id : 'CONTRACTPROP',
	header : "合同性质",
	width : 150,
	editable : true,
	editor : {
		type : "text"
	}
}, {
	id : 'ADDITION',
	header : "附加条款",
	width : 150,
	editable : true,
	editor : {
		type : "text"
	}
}, {
	id : 'ACCIDENT_START',
	header : "意外险起始日期",
	width : 150,
	editable : true,
	editor : {
		type : "date",
		validator : function(value, record, colObj, grid) {
			// 如果输入了值
			if (value.length > 0) {
				return true;
			} else {
				return "请输入意外险起始日期";
			}
		}
	}
}, {
	id : 'ACCIDENT_END',
	header : "意外险终止日期",
	width : 150,
	editable : true,
	editor : {
		type : "date",
		validator : function(value, record, colObj, grid) {
			// 如果输入了值
			if (value.length > 0) {
				if (Date.parse(record.ACCIDENT_START) - Date.parse(value) > 0)
					return "结束日期早于开始日期";
				else
					return true;
			} else {
				return "请输入劳动合同终止日期";
			}
		}
	}
}, {
	id : 'INSU',
	header : "意外险参加标志",
	width : 100,
	editable : true,
	editor : {
		type : "select",
		options : {
			'1' : '已参加',
			'0' : '未参加'
		},
		defaultText : '0'
	}
}, {
	id : 'MEMO',
	header : "备注",
	width : 250,
	editable : true,
	editor : {
		type : "text"
	}
} ];

var gridOption = {
	id : "showempjob_grid",
	loadURL : MyURL + 'common/doPageQuery?sql=' + sql,
	saveURL : MyURL + 'hrs/saveEmpJob?empId=' + empId,
	width : "100%", // "100%", // 700,
	height : c - header - 50 - pageheader, // "100%", // 330,
	container : "gridbox_showempjob",
	toolbarPosition : 'bottom',
	toolbarContent : 'nav | pagesize | reload |  print xls | filter chart | state',
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
	exportFileName : 'file',
	remotePaging : true, // 服务器分页
	remoteFilter : true, // 发送请求到LoadURL中，并且填写filterInfo
	remoteSort : true, // 发送排序请求到LoadURL中，并且填写SortInfo
	submitUpdatedFields : true, // 只提交变动的数据
	autoLoad : true, // 窗口打开时是否自动加载URL
	parameters : {
		a : 123,
		b : 222,
		c : [ 8, 9 ]
	}
};

var showempjob_grid = new Sigma.Grid(gridOption);
showempjob_grid.render();
