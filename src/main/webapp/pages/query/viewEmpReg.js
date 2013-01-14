var c = $("#myContent").height();
var header = $("#viewempreg_head").height();

var sql = "select ID,EMP_ID,fun_getcodedesc('REGTYPE',REGTYPE) REGTYPE,fun_getcodedesc('REGLEVEL',REGLEVEL) REGLEVEL, fun_getcodedesc('REGMAJOR',REGMAJOR1) REGMAJOR1, fun_getcodedesc('REGMAJOR',REGMAJOR2) REGMAJOR2,fun_getcodedesc('REGMAJOR',REGMAJOR3) REGMAJOR3,REGNO,CERTIFICATE,TO_CHAR(VALIDDATE,'YYYY-MM-DD') VALIDDATE,TO_CHAR(ISSUEDATE,'YYYY-MM-DD') ISSUEDATE,CERTNUMBER,TO_CHAR(CERTDATE,'YYYY-MM-DD') CERTDATE,TO_CHAR(CERTVALIDDATE,'YYYY-MM-DD') CERTVALIDDATE,MEMO from V_HRD_EMP_REG WHERE EMP_ID='"
		+ empId + "'";

// 定义数据类型
var dsOption = {
	fields : [ {
		name : 'ID'
	}, {
		name : 'EMP_ID'
	}, {
		name : 'REGTYPE'
	}, {
		name : 'REGLEVEL'
	}, {
		name : 'REGMAJOR1'
	}, {
		name : 'REGMAJOR2'
	}, {
		name : 'REGMAJOR3'
	}, {
		name : 'REGNO'
	}, {
		name : 'CERTIFICATE'
	}, {
		name : 'VALIDDATE'
	}, {
		name : 'ISSUEDATE'
	}, {
		name : 'CERTDATE'
	}, {
		name : 'CERTVALIDDATE'
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
	id : 'REGTYPE',
	header : "注册类别",
	width : 100,
	editable : false
}, {
	id : 'REGLEVEL',
	header : "注册级别",
	width : 100,
	editable : false
}, {
	id : 'REGMAJOR1',
	header : "注册专业1",
	width : 150,
	editable : false
}, {
	id : 'REGMAJOR2',
	header : "注册专业2",
	width : 150,
	editable : false
}, {
	id : 'REGMAJOR3',
	header : "注册专业3",
	width : 150,
	editable : false
}, {
	id : 'REGNO',
	header : "注册号",
	width : 100,
	editable : false
}, {
	id : 'CERTIFICATE',
	header : "证书编号",
	width : 100,
	editable : false
}, {
	id : 'ISSUEDATE',
	header : "发证日期",
	width : 100,
	editable : false
}, {
	id : 'VALIDDATE',
	header : "截至日期",
	width : 100,
	editable : false
}, {
	id : 'CERTNUMBER',
	header : "资格证号",
	width : 100,
	editable : false
}, {
	id : 'CERTDATE',
	header : "资格证号发证日期",
	width : 100,
	editable : false
}, {
	id : 'CERTVALIDDATE',
	header : "资格证有效期",
	width : 150,
	editable : false
}, {
	id : 'MEMO',
	header : "备注",
	width : 250,
	editable : false,
	editor : {
		type : "text"
	}
} ];

var gridOption = {
	id : "viewempreg_grid",
	loadURL : MyURL + 'common/doPageQuery?sql=' + sql,
	// saveURL : MyURL + 'hrs/saveEmpReg?empId=' + empId,
	width : "100%", // "100%", // 700,
	height : c - header, // "100%", // 330,
	container : "gridbox_viewempreg",
	toolbarPosition : 'bottom',
	toolbarContent : 'nav | pagesize | reload | print xls | filter chart | state',
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

var viewempreg_grid = new Sigma.Grid(gridOption);
viewempreg_grid.render();
