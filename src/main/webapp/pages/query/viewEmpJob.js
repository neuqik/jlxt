var c = $("#myContent").height();
var header = $("#viewempjob_head").height();

var sql = "SELECT a.id,a.emp_id,b.pension_no,b.medica_no,b.emp_name,b.idcard,b.TEL,fun_getcodedesc('EMPTYPE',b.emptype) emptype, fun_getcodedesc('GENDER',b.gender) gender,fun_getcodedesc('DEPT_ID',b.dept_id) dept_id,to_char(a.job_start,'YYYY-MM-DD') job_start,to_char(a.job_end,'YYYY-MM-DD') job_end,to_char(a.accident_start,'YYYY-MM-DD') accident_start,to_char(a.accident_end,'YYYY-MM-DD') accident_end,a.pension,a.medica,a.bear,a.unemp,a.insu,a.memo FROM v_hrd_emp_job a, v_hrd_emp b WHERE a.emp_id = b.emp_id and  a.EMP_ID='"
		+ empId + "'";

// 定义数据类型
var dsOption = {
	fields : [ {
		name : 'ID'
	}, {
		name : 'EMP_ID'
	}, {
		name : 'EMP_NAME'
	}, {
		name : 'PENSION_NO'
	}, {
		name : 'MEDICA_NO'
	}, {
		name : 'IDCARD'
	}, {
		name : 'EMPTYPE'
	}, {
		name : 'GENDER'
	}, {
		name : 'DEPT_ID'
	}, {
		name : 'JOB_START'
	}, {
		name : 'JOB_END'
	}, {
		name : 'ACCIDENT_START'
	}, {
		name : 'ACCIDENT_END'
	}, {
		name : 'PENSION'
	}, {
		name : 'MEDICA'
	}, {
		name : 'BEAR'
	}, {
		name : 'UNEMP'
	}, {
		name : 'INSU'
	}, {
		name : 'TEL'
	}, {
		name : 'MEMO'
	} ],
	uniqueField : 'EMP_ID',
	recordType : 'json'
};
// 定义列选项
var colsOption = [ {
	id : 'chk',
	isCheckColumn : true,
	frozen : true
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
	frozen : true
}, {
	id : 'EMP_NAME',
	header : "姓名",
	width : 100,
	editable : false,
	frozen : true
}, {
	id : 'PENSION_NO',
	header : "养老保险编号",
	width : 100,
	editable : false
}, {
	id : 'MEDICA_NO',
	header : "医疗保险编号",
	width : 100,
	editable : false
}, {
	id : 'IDCARD',
	header : "身份证号",
	width : 150,
	editable : false
}, {
	id : 'EMPTYPE',
	header : "员工类型",
	width : 100,
	editable : false
}, {
	id : 'DEPT_ID',
	header : "分公司",
	width : 100,
	editable : false
}, {
	id : 'GENDER',
	header : "性别",
	width : 30,
	editable : false
}, {
	id : 'JOB_START',
	header : "劳动合同起始时间",
	width : 150,
	editable : false
}, {
	id : 'JOB_END',
	header : "劳动合同终止时间",
	width : 100,
	editable : false
}, {
	id : 'ACCIDENT_START',
	header : "意外险起始时间",
	width : 100,
	editable : false
}, {
	id : 'ACCIDENT_END',
	header : "意外险终止时间",
	width : 100,
	editable : false
}, {
	id : 'TEL',
	header : "联系电话",
	width : 100,
	editable : false
}, {
	id : 'PENSION',
	header : "养老参加标志",
	width : 100,
	editable : false
}, {
	id : 'MEDICA',
	header : "医疗参加标志",
	width : 100,
	editable : false
}, {
	id : 'BEAR',
	header : "生育参加标志",
	width : 100,
	editable : false
}, {
	id : 'UNEMP',
	header : "失业参加标志",
	width : 100,
	editable : false
}, {
	id : 'INSU',
	header : "意外险参加标志",
	width : 100,
	editable : false
}, {
	id : 'MEMO',
	header : "备注",
	width : 150,
	editable : false
} ];

var gridOption = {
	id : "viewempjob_grid",
	loadURL : MyURL + 'common/doPageQuery?sql=' + sql,
	// saveURL : MyURL + 'hrs/saveEmpJob?empId=' + empId,
	width : "100%", // "100%", // 700,
	height : c - header, // "100%", // 330,
	container : "gridbox_viewempjob",
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

var viewempjob_grid = new Sigma.Grid(gridOption);
viewempjob_grid.render();
