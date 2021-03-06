var c = $("#myContent").height();
var header = $("#viewemptransfer_head").height();
var sql = "select ID,EMP_ID,TO_CHAR(TRANSFERDATE,'YYYY-MM-DD') TRANSFERDATE,fun_getcodedesc('TRANSFERTYPE',TRANSFERTYPE) TRANSFERTYPE,TRANSFERREASON,fun_getcodedesc('DEPT_ID',PREVDEPT_ID) PREVDEPT_ID, fun_getcodedesc('DEPT_ID',NEWDEPT_ID) NEWDEPT_ID,MEMO,VALID from V_HRD_EMP_TRANSFER WHERE EMP_ID='"
		+ empId + "'";

// 定义数据类型
var dsOption = {
	fields : [ {
		name : 'ID'
	}, {
		name : 'EMP_ID'
	}, {
		name : 'TRANSFERDATE'
	}, {
		name : 'TRANSFERTYPE'
	}, {
		name : 'TRANSFERREASON'
	}, {
		name : 'PREVDEPT_ID'
	}, {
		name : 'NEWDEPT_ID'
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
	id : 'TRANSFERDATE',
	header : "变动日期",
	width : 150,
	editable : false,
	editor : {
		type : "text"
	}
}, {
	id : 'TRANSFERTYPE',
	header : "变动类型",
	width : 150,
	editable : false,
	editor : {
		type : "text"
	}
}, {
	id : 'TRANSFERREASON',
	header : "变动原因",
	width : 150,
	editable : false,
	editor : {
		type : "text"
	}
}, {
	id : 'PREVDEPT_ID',
	header : "原部门(分公司)",
	width : 100,
	editable : false,
	editor : {
		type : "text"
	}
}, {
	id : 'NEWDEPT_ID',
	header : "新部门(分公司)",
	width : 150,
	editable : false,
	editor : {
		type : "text"
	}
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
	id : "viewemptransfer_grid",
	loadURL : MyURL + 'common/doPageQuery?sql=' + sql,
	// saveURL : MyURL + 'hrs/saveEmpCert?empId=' + empId,
	width : "100%", // "100%", // 700,
	height : c - header, // "100%", // 330,
	container : "gridbox_viewemptransfer",
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

var viewemptransfer_grid = new Sigma.Grid(gridOption);
viewemptransfer_grid.render();
