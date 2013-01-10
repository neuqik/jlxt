var c = $("#myContent").height();
var header = $("#viewempfamily_head").height();

var sql = "select ID,EMP_ID,RELATION_NAME,fun_getcodedesc('RELATION_TYPE',RELATION_TYPE) RELATION_TYPE,RELATION_TEL,WORKDEPT,WORKROLE,MEMO,VALID from V_HRD_EMP_FAMILY WHERE EMP_ID='"
		+ empId + "'";

// 定义数据类型
var dsOption = {
	fields : [ {
		name : 'ID'
	}, {
		name : 'EMP_ID'
	}, {
		name : 'RELATION_NAME'
	}, {
		name : 'RELATION_TYPE'
	}, {
		name : 'RELATION_TEL'
	}, {
		name : 'WORKDEPT'
	}, {
		name : 'WORKROLE'
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
	id : 'RELATION_NAME',
	header : "成员姓名",
	width : 100,
	editable : false,
	editor : {
		type : "text",
		validator : function(value, record, colObj, grid) {
			// 如果输入了值
			if (value.length > 0) {
				return true;
			} else {
				return "请输入成员姓名";
			}

		}
	}
}, {
	id : 'RELATION_TYPE',
	header : "与本人关系",
	width : 100,
	editable : false,
	editor : {
		type : "select",
		options : {
			'1' : '父亲',
			'2' : '母亲',
			'3' : '亲属',
			'4' : '好友',
			'5' : '配偶',
			'9' : '其他'
		},
		defaultText : '5'
	}
}, {
	id : 'RELATION_TEL',
	header : "联系电话",
	width : 100,
	editable : false,
	editor : {
		type : "text"
	}
}, {
	id : 'WORKDEPT',
	header : "工作部门",
	width : 150,
	editable : false,
	editor : {
		type : "text"
	}
}, {
	id : 'WORKROLE',
	header : "职务",
	width : 100,
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
	id : "viewempfamily_grid",
	loadURL : MyURL + 'common/doPageQuery?sql=' + sql,
	// saveURL : MyURL + 'hrs/saveEmpFamily?empId=' + empId,
	width : "100%", // "100%", // 700,
	height : c - header, // "100%", // 330,
	container : "gridbox_viewempfamily",
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

var viewempfamily_grid = new Sigma.Grid(gridOption);
viewempfamily_grid.render();
