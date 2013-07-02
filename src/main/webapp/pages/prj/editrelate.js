var c = $("#myContent").height();
var header = $("#editrelate_head").height();
var sql = "SELECT DEPT_ID, ID, MEMO, PRJ_ID FROM V_PRJ_UNIT_RELATE WHERE PRJ_ID="
		+ prjId;
// 定义数据类型
var dsOption = {
	fields : [ {
		name : "DEPT_ID"
	}, {
		name : "ID"
	}, {
		name : "MEMO"
	}, {
		name : "PRJ_ID"
	} ],
	uniqueField : 'ID',
	recordType : 'json'
};
// 定义列选项
var colsOption = [ {
	id : "chk",
	isCheckColumn : true,
	frozen : true
}, {
	id : "DEPT_ID",
	width : 200,
	editable : true,
	header : "分公司",
	editor : {
		type : "select",
		options : {
			'A00' : '总部',
			'A01' : '直属部',
			'B01' : '第一分公司',
			'B02' : '第二分公司',
			'B03' : '第三分公司',
			'B04' : '第四分公司',
			'B05' : '第五分公司',
			'B06' : '第六分公司',
			'B07' : '第七分公司',
			'B08' : '第八分公司',
			'B09' : '第九分公司',
			'B10' : '第十分公司'
		},
		defaultText : 'A00'
	}
}, {
	id : "ID",
	width : 100,
	editable : false,
	header : "",
	hidden : true
}, {
	id : "MEMO",
	width : 500,
	editable : true,
	header : "备注",
	toolTip : true,
	toolTipWidth : 150,
	editor : {
		type : "textarea",
		width : "300px",
		height : "200px"
	}
}, {
	id : "PRJ_ID",
	width : 100,
	editable : false,
	header : "项目ID",
	hidden : true
} ];

var gridOption = {
	id : "editrelate_grid",
	loadURL : MyURL + 'common/doPageQuery?sql=' + sql,
	saveURL : MyURL + 'prj/saverelate?PRJ_ID=' + prjId,
	width : "100%", // "100%", // 700,
	height : c - header - 40, // "100%", // 330,
	container : "gridbox_editrelate",
	toolbarPosition : 'bottom',
	toolbarContent : 'nav | pagesize | reload | add del save | print | xls | filter chart | state',
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
	exportFileName : 'emp_info',
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
	onMouseOver : function(value, record, cell, row, colNo, rowNo, columnObj,
			grid) {
		if (columnObj && columnObj.toolTip) {
			grid.showCellToolTip(cell, columnObj.toolTipWidth);
		} else {
			grid.hideCellToolTip();
		}
	},
	onMouseOut : function(value, record, cell, row, colNo, rowNo, columnObj,
			grid) {
		grid.hideCellToolTip();
	},
	onCellDblClick : function(value, record, cell, row, colNO, rowNO,
			columnObj, grid) {
		// TODO:双击行事件
	}
};

var editrelate_grid = new Sigma.Grid(gridOption);
editrelate_grid.render();
