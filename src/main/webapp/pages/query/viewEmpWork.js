var c = $("#myContent").height();
var header = $("#viewempwork_head").height();

var sql = "select ID,EMP_ID,TO_CHAR(BEGIN,'YYYY-MM-DD') BEGIN,TO_CHAR(END,'YYYY-MM-DD') END,UNIT,DEPT,JOBROLE,MEMO,VALID from V_HRD_EMP_WORK WHERE EMP_ID='"
		+ empId + "'";

// 定义数据类型
var dsOption = {
	fields : [ {
		name : 'ID'
	}, {
		name : 'EMP_ID'
	}, {
		name : 'BEGIN'
	}, {
		name : 'END'
	}, {
		name : 'UNIT'
	}, {
		name : 'DEPT'
	}, {
		name : 'JOBROLE'
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
	id : 'BEGIN',
	header : "工作起始时间",
	width : 100,
	editable : false,
	editor : {
		type : "date",
		validator : function(value, record, colObj, grid) {
			// 如果输入了值
			if (value.length > 0) {
				return true;
			} else {
				return "工作起始时间";
			}
		}
	}
}, {
	id : 'END',
	header : "工作终止时间",
	width : 100,
	editable : false,
	editor : {
		type : "date",
		validator : function(value, record, colObj, grid) {
			// 如果输入了值
			if (value.length > 0) {
				if (Date.parse(record.BEGIN) - Date.parse(value) > 0)
					return "结束日期早于开始日期";
				else
					return true;
			}
		}
	}
}, {
	id : 'UNIT',
	header : "工作单位",
	width : 150,
	editable : false,
	editor : {
		type : "text"
	}
}, {
	id : 'DEPT',
	header : "工作部门",
	width : 150,
	editable : false,
	editor : {
		type : "text"
	}
}, {
	id : 'JOBROLE',
	header : "担任职务",
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
	id : "viewempwork_grid",
	loadURL : MyURL + 'common/doPageQuery?sql=' + sql,
//	saveURL : MyURL + 'hrs/saveEmpWork?empId=' + empId,
	width : "100%", // "100%", // 700,
	height : c - header, // "100%", // 330,
	container : "gridbox_viewempwork",
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

var viewempwork_grid = new Sigma.Grid(gridOption);
viewempwork_grid.render();
