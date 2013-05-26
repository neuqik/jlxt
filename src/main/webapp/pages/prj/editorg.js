var c = $("#myContent").height();
var header = $("#editorg_head").height();
var sql = "SELECT EMP_ID,(SELECT EMP_NAME FROM HRD_EMP WHERE EMP_ID=A.EMP_ID) EMP_NAME, TO_CHAR(ENTERTIME,'YYYY-MM-DD') ENTERTIME, ID, TO_CHAR(LEAVETIME,'YYYY-MM-DD') LEAVETIME, MEMO, PRJ_ID, FUN_GETCODEDESC('PRJ_ROLE',PRJ_ROLE) PRJ_ROLE, FUN_GETCODEDESC('DEPT_ID',(SELECT DEPT_ID FROM HRD_EMP WHERE EMP_ID = A.EMP_ID)) DEPT_ID, RESPONSBILITY, FUN_GETCODEDESC('VALID',VALID) VALID FROM V_PRJ_ORG A WHERE PRJ_ID="
		+ prjId;
// 定义数据类型
var dsOption = {
	fields : [ {
		name : "EMP_ID"
	}, {
		name : "EMP_NAME"
	}, {
		name : "ENTERTIME"
	}, {
		name : "ID"
	}, {
		name : "LEAVETIME"
	}, {
		name : "MEMO"
	}, {
		name : "PRJ_ID"
	}, {
		name : "PRJ_ROLE"
	}, {
		name : "DEPT_ID"
	}, {
		name : "RESPONSBILITY"
	}, {
		name : "VALID"
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
	id : "PRJ_ROLE",
	width : 150,
	editable : false,
	header : "项目职务"
}, {
	id : "EMP_ID",
	width : 100,
	editable : false,
	header : "员工编号"
}, {
	id : "EMP_NAME",
	width : 150,
	editable : false,
	header : "员工姓名"
}, {
	id : "RESPONSBILITY",
	width : 200,
	editable : false,
	header : "项目分工"
}, {
	id : "DEPT_ID",
	width : 200,
	editable : false,
	header : "部门/分公司"
}, {
	id : "ENTERTIME",
	width : 150,
	editable : false,
	header : "进场时间"
}, {
	id : "ID",
	width : 100,
	editable : false,
	header : "",
	hidden : true
}, {
	id : "LEAVETIME",
	width : 150,
	editable : false,
	header : "离场时间"
}, {
	id : "MEMO",
	width : 300,
	editable : false,
	header : "备注"
}, {
	id : "PRJ_ID",
	width : 100,
	editable : false,
	header : "项目ID",
	hidden : true
}, {
	id : "VALID",
	width : 100,
	editable : false,
	header : "",
	hidden : true
} ];

var gridOption = {
	id : "editorg_grid",
	loadURL : MyURL + 'common/doPageQuery?sql=' + sql,
	width : "100%", // "100%", // 700,
	height : c - header - 40, // "100%", // 330,
	container : "gridbox_editorg",
	toolbarPosition : 'bottom',
	toolbarContent : 'nav | pagesize | reload | print | xls | filter chart | state',
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
		$.pdialog.open(MyURL + 'prj/editprjorg?PRJ_ID=' + prjId + '&ID='
				+ record.ID, 'xgjs', "修改角色", {
			width : 640,
			height : 480,
			max : false,
			mask : true,
			mixable : true,
			minable : true,
			resizable : true,
			drawable : true,
			fresh : true,
			close : function() {
				// 对话框关闭时执行刷新
				editorg_grid.reload();
				editorg_grid.checkedRows = {};
				return true;
			}
		});
	}
};

var editorg_grid = new Sigma.Grid(gridOption);
editorg_grid.render();
