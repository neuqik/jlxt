var c = $("#myContent").height();
var header = $("#showempprof_head").height();
var pageheader = $("#showempext_pageheader").height();
var sql = "select ID,EMP_ID,PROFTYPE,OBTAINTYPE,TO_CHAR(OBTAINDATE,'YYYY-MM-DD') OBTAINDATE,OBTAINDEPT,PROF_NUM,TO_CHAR(ENDDATE,'YYYY-MM-DD') ENDDATE,MEMO,VALID from V_HRD_EMP_PROF WHERE EMP_ID='"
		+ empId + "'";

// 定义数据类型
var dsOption = {
	fields : [ {
		name : 'ID'
	}, {
		name : 'EMP_ID'
	}, {
		name : 'PROFTYPE'
	}, {
		name : 'OBTAINTYPE'
	}, {
		name : 'OBTAINDATE'
	}, {
		name : 'OBTAINDEPT'
	}, {
		name : 'PROF_NUM'
	}, {
		name : 'ENDDATE'
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
	id : 'PROFTYPE',
	header : "职称类别",
	width : 100,
	editable : true,
	editor : {
		type : "select",
		options : {
			'10' : '教授级高级工程师',
			'11' : '高级工程师',
			'12' : '工程师',
			'13' : '助理工程师',
			'14' : '技工'
		},
		defaultText : '12'
	}
}, {
	id : 'OBTAINTYPE',
	header : "获得类别",
	width : 100,
	editable : true,
	editor : {
		type : "text"
	}
}, {
	id : 'OBTAINDATE',
	header : "获得日期",
	width : 100,
	editable : true,
	editor : {
		type : "date",
		validator : function(value, record, colObj, grid) {
			// 如果输入了值
			if (value.length > 0) {
				return true;
			} else {
				return "请输入获得日期";
			}
		}
	}
}, {
	id : 'ENDDATE',
	header : "有效截至日期",
	width : 100,
	editable : true,
	editor : {
		type : "date",
		validator : function(value, record, colObj, grid) {
			// 如果输入了值
			if (value.length > 0) {
				if (Date.parse(record.OBTAINDATE) - Date.parse(value) > 0)
					return "结束日期早于开始日期";
				else
					return true;
			}
		}
	}
}, {
	id : 'OBTAINDEPT',
	header : "发证单位",
	width : 150,
	editable : true,
	editor : {
		type : "text"
	}
}, {
	id : 'PROF_NUM',
	header : "职称证书编号",
	width : 150,
	editable : true,
	editor : {
		type : "text"
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
	id : "showempprof_grid",
	loadURL : MyURL + 'common/doPageQuery?sql=' + sql,
	saveURL : MyURL + 'hrs/saveEmpProf?empId=' + empId,
	width : "100%", // "100%", // 700,
	height : c - header - 50 - pageheader, // "100%", // 330,
	container : "gridbox_showempprof",
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

var showempprof_grid = new Sigma.Grid(gridOption);
showempprof_grid.render();
