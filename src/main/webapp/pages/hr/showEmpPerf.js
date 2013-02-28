var c = $("#myContent").height();
var header = $("#showempperf_head").height();
var pageheader = $("#showempext_pageheader").height();
var sql = "SELECT ID,EMP_ID,PERIOD,PERFORMANCE,PROF_PERF,WORK_PERF,MANAGE_PERF,MEMO FROM V_HRD_EMP_PERF WHERE EMP_ID='"
		+ empId + "'";

// 定义数据类型
var dsOption = {
	fields : [ {
		name : 'ID'
	}, {
		name : 'EMP_ID'
	}, {
		name : 'PERIOD'
	}, {
		name : 'PERFORMANCE'
	}, {
		name : 'PROF_PERF'
	}, {
		name : 'WORK_PERF'
	}, {
		name : 'MANAGE_PERF'
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
	id : 'PERIOD',
	header : "考评期间",
	width : 100,
	editable : true,
	editor : {
		type : "text"
	}
}, {
	id : 'PERFORMANCE',
	header : "综合评价",
	width : 100,
	editable : true,
	editor : {
		type : "select",
		options : {
			'A' : '优秀',
			'B' : '良好',
			'C' : '合格',
			'D' : '不合格'
		},
		defaultText : '合格'
	}
}, {
	id : 'PROF_PERF',
	header : "专业水平",
	width : 100,
	editable : true,
	editor : {
		type : "select",
		options : {
			'A' : '优秀',
			'B' : '良好',
			'C' : '合格',
			'D' : '不合格'
		},
		defaultText : 'C'
	}
}, {
	id : 'WORK_PERF',
	header : "工作态度",
	width : 100,
	editable : true,
	editor : {
		type : "select",
		options : {
			'A' : '优秀',
			'B' : '良好',
			'C' : '合格',
			'D' : '不合格'
		},
		defaultText : 'C'
	}
}, {
	id : 'MANAGE_PERF',
	header : "管理能力",
	width : 100,
	editable : true,
	editor : {
		type : "select",
		options : {
			'A' : '优秀',
			'B' : '良好',
			'C' : '合格',
			'D' : '不合格'
		},
		defaultText : 'C'
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
	id : "showempperf_grid",
	loadURL : MyURL + 'common/doPageQuery?sql=' + sql,
	saveURL : MyURL + 'hrs/saveEmpPerf?empId=' + empId,
	width : "100%", // "100%", // 700,
	height : c - header - 50 - pageheader, // "100%", // 330,
	container : "gridbox_showempperf",
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

var showempperf_grid = new Sigma.Grid(gridOption);
showempperf_grid.render();
