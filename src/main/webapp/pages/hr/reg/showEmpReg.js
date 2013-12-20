var c = $("#myContent").height();
var header = $("#showempreg_head").height();
var sql = "select ID,EMP_ID,EMP_NAME, IDCARD, AGE, fun_getcodedesc('INSUSTATUS',INSUSTATUS) INSUSTATUS, PENSION_NO, fun_getcodedesc('DEPT_ID',DEPT_ID) DEPT_ID, fun_getcodedesc('EMPTYPE',EMPTYPE) EMPTYPE, fun_getcodedesc('GENDER',GENDER) GENDER, fun_getcodedesc('ROLENAME',ROLENAME) ROLENAME, fun_getcodedesc('TITLENAME',TITLENAME) TITLENAME, fun_getcodedesc('TITLE_ID',TITLE_ID) TITLE_ID, EDUCATION, fun_getcodedesc('REGTYPE',REGTYPE) REGTYPE,fun_getcodedesc('REGLEVEL',REGLEVEL) REGLEVEL, fun_getcodedesc('REGMAJOR',REGMAJOR1) REGMAJOR1, fun_getcodedesc('REGMAJOR',REGMAJOR2) REGMAJOR2,fun_getcodedesc('REGMAJOR',REGMAJOR3) REGMAJOR3,REGNO,CERTIFICATE,TO_CHAR(VALIDDATE,'YYYY-MM-DD') VALIDDATE,TO_CHAR(ISSUEDATE,'YYYY-MM-DD') ISSUEDATE,CERTNUMBER,TO_CHAR(CERTDATE,'YYYY-MM-DD') CERTDATE,TO_CHAR(CERTVALIDDATE,'YYYY-MM-DD') CERTVALIDDATE,MEMO,TO_CHAR(CONTINUE_DATE,'YYYY-MM-DD') CONTINUE_DATE,CONTINUE_EDU from V_HRD_EMP_REG_SHOW ";

// 定义数据类型
var dsOption = {
	fields : [ {
		name : 'ID'
	}, {
		name : 'EMP_ID'
	}, {
		name : 'IDCARD'
	}, {
		name : 'AGE'
	}, {
		name : 'EMPTYPE'
	}, {
		name : 'INSUSTATUS'
	}, {
		name : 'PENSION_NO'
	}, {
		name : 'EMP_NAME'
	}, {
		name : 'GENDER'
	}, {
		name : 'ROLENAME'
	}, {
		name : 'TITLE_ID'
	}, {
		name : 'TITLENAME'
	}, {
		name : 'EDUCATION'
	}, {
		name : 'DEPT_ID'
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
		name : 'CONTINUE_DATE'
	}, {
		name : 'CONTINUE_EDU'
	}, {
		name : 'MEMO'
	} ],
	uniqueField : 'ID',
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
	frozen : true
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
	id : 'DEPT_ID',
	header : "分公司",
	width : 150,
	editable : false,
	frozen : true
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
	id : 'VALIDDATE',
	header : "有效日期",
	width : 100,
	editable : false
}, {
	id : 'ISSUEDATE',
	header : "发证日期",
	width : 100,
	editable : false
}, {
	id : 'CONTINUE_DATE',
	header : "继续教育时间",
	width : 100,
	editable : false
}, {
	id : 'CONTINUE_EDU',
	header : "继续教育专业",
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
	editable : false,
	hidden : true
}, {
	id : 'TITLE_ID',
	header : "职称",
	width : 100,
	editable : false
}, {
	id : 'TITLENAME',
	header : "职称专业",
	width : 100,
	editable : false
}, {
	id : 'EDUCATION',
	header : "学历",
	width : 100,
	editable : false
}, {
	id : 'IDCARD',
	header : "身份证号",
	width : 150,
	editable : false
}, {
	id : 'AGE',
	header : "年龄",
	width : 70,
	editable : false
}, {
	id : 'GENDER',
	header : "性别",
	width : 70,
	editable : false
}, {
	id : 'ROLENAME',
	header : "岗位",
	width : 100,
	editable : false
}, {
	id : 'EMPTYPE',
	header : "员工类型",
	width : 100,
	editable : false
}, {
	id : 'INSUSTATUS',
	header : "保险状态",
	width : 100,
	editable : false
}, {
	id : 'PENSION_NO',
	header : "养老保险编号",
	width : 100,
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
	id : "showempreg_grid",
	loadURL : MyURL + 'common/doPageQuery?sql=' + sql,
	// saveURL : MyURL + 'hrs/saveEmpReg?empId=' + empId,
	width : "100%", // "100%", // 700,
	height : c - header, // "100%", // 330,
	container : "gridbox_showempreg",
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
	},
	customRowAttribute : function(record, rn, grid) {
		if (record['EMPTYPE'] == '挂职') { // 挂职
			return 'style="color:#0000ff"';
		} else {
			if (record['EMPTYPE'] == '终止') { // 终止
				return 'style="color:#ff0000"';
			}
			return 'style="color:#000000"';
		}
	}
};

var showempreg_grid = new Sigma.Grid(gridOption);
showempreg_grid.render();
