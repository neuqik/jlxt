var c = $("#myContent").height();
var header = $("#showempcert_head").height();
var pageheader = $("#showempext_pageheader").height();
var sql = "select ID,EMP_ID,CERT,CERTNO,TO_CHAR(OBTDATE,'YYYY-MM-DD') OBTDATE,CERTDEPT,TO_CHAR(CLOSEDATE,'YYYY-MM-DD') CLOSEDATE,MEMO,VALID from V_HRD_EMP_CERT WHERE EMP_ID='"
		+ empId + "'";

// 定义数据类型
var dsOption = {
	fields : [ {
		name : 'ID'
	}, {
		name : 'EMP_ID'
	}, {
		name : 'CERT'
	}, {
		name : 'CERTNO'
	}, {
		name : 'OBTDATE'
	}, {
		name : 'CLOSEDATE'
	}, {
		name : 'CERTDEPT'
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
	id : 'CERT',
	header : "证书名称",
	width : 150,
	editable : true,
	editor : {
		type : "select",
		options : {
			'01' : '省监理工程师证书',
			'02' : '安全生产培训证书',
			'03' : '监理员证书',
			'04' : '房屋建筑见证人证书',
			'05' : '市政工程见证人证书',
			'06' : '评价员证书',
			'07' : '辽宁省人防监理资格证'
		}
	}
}, {
	id : 'CERTNO',
	header : "证书编号",
	width : 150,
	editable : true,
	editor : {
		type : "text"
	}
}, {
	id : 'OBTDATE',
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
	id : 'CLOSEDATE',
	header : "有效截至日期",
	width : 100,
	editable : true,
	editor : {
		type : "date",
		validator : function(value, record, colObj, grid) {
			// 如果输入了值
			if (value.length > 0) {
				if (Date.parse(record.OBTDATE) - Date.parse(value) > 0)
					return "结束日期早于开始日期";
				else
					return true;
			}
		}
	}
}, {
	id : 'CERTDEPT',
	header : "发证单位",
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
	id : "showempcert_grid",
	loadURL : MyURL + 'common/doPageQuery?sql=' + sql,
	saveURL : MyURL + 'hrs/saveEmpCert?empId=' + empId,
	width : "100%", // "100%", // 700,
	height : c - header - 50 - pageheader, // "100%", // 330,
	container : "gridbox_showempcert",
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

var showempcert_grid = new Sigma.Grid(gridOption);
showempcert_grid.render();
