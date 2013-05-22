var c = $("#myContent").height();
var header = $("#projectcheck_head").height();
var sql = "SELECT ACT_SCORE, TO_CHAR(BEGINDATE,'YYYY-MM-DD') BEGINDATE, TO_CHAR(CHECKDATE,'YYYY-MM-DD') CHECKDATE, CHECKITEM, FUN_GETCODEDESC('CONSTRUCT_TYPE',CONSTRUCT_TYPE) CONSTRUCT_TYPE, DEPT_ID1, DEPT_ID10, DEPT_ID2, DEPT_ID3, DEPT_ID4, DEPT_ID5, DEPT_ID6, DEPT_ID7, DEPT_ID8, DEPT_ID9, EMP_ID, TO_CHAR(ENDDATE,'YYYY-MM-DD') ENDDATE, ID, JSDW_ID, MEMO, PRJ_ID, PRJ_PROGRESS, SGDW_ID, FUN_GETCODEDESC('VALID',VALID) VALID FROM V_PRJ_CHECK";
// 定义数据类型
var dsOption = {
	fields : [{name:"ACT_SCORE"},{name:"BEGINDATE"},{name:"CHECKDATE"},{name:"CHECKITEM"},{name:"CONSTRUCT_TYPE"},{name:"DEPT_ID1"},{name:"DEPT_ID10"},{name:"DEPT_ID2"},{name:"DEPT_ID3"},{name:"DEPT_ID4"},{name:"DEPT_ID5"},{name:"DEPT_ID6"},{name:"DEPT_ID7"},{name:"DEPT_ID8"},{name:"DEPT_ID9"},{name:"EMP_ID"},{name:"ENDDATE"},{name:"ID"},{name:"JSDW_ID"},{name:"MEMO"},{name:"PRJ_ID"},{name:"PRJ_PROGRESS"},{name:"SGDW_ID"},{name:"VALID"}],
	uniqueField : 'ID',
	recordType : 'json'
};
// 定义列选项
var colsOption = [{id:"chk",isCheckColumn:true,frozen:true},{id:"ACT_SCORE",width:100,editable:false,header:"扣分"},{id:"BEGINDATE",width:100,editable:false,header:"开工时间"},{id:"CHECKDATE",width:100,editable:false,header:"检查时间"},{id:"CHECKITEM",width:100,editable:false,header:"检查项目"},{id:"CONSTRUCT_TYPE",width:100,editable:false,header:"结构类型"},{id:"DEPT_ID1",width:100,editable:false,header:"分公司1"},{id:"DEPT_ID10",width:100,editable:false,header:"分公司10"},{id:"DEPT_ID2",width:100,editable:false,header:"分公司2"},{id:"DEPT_ID3",width:100,editable:false,header:"分公司3"},{id:"DEPT_ID4",width:100,editable:false,header:"分公司4"},{id:"DEPT_ID5",width:100,editable:false,header:"分公司5"},{id:"DEPT_ID6",width:100,editable:false,header:"分公司6"},{id:"DEPT_ID7",width:100,editable:false,header:"分公司7"},{id:"DEPT_ID8",width:100,editable:false,header:"分公司8"},{id:"DEPT_ID9",width:100,editable:false,header:"分公司9"},{id:"EMP_ID",width:100,editable:false,header:"项目总监员工编号"},{id:"ENDDATE",width:100,editable:false,header:"竣工日期"},{id:"ID",width:100,editable:false,header:""},{id:"JSDW_ID",width:100,editable:false,header:"建设单位ID"},{id:"MEMO",width:100,editable:false,header:"备注"},{id:"PRJ_ID",width:100,editable:false,header:"项目ID"},{id:"PRJ_PROGRESS",width:100,editable:false,header:"项目进展情况"},{id:"SGDW_ID",width:100,editable:false,header:"施工单位ID"},{id:"VALID",width:100,editable:false,header:""}];

var gridOption = {
	id : "projectcheck_grid",
	loadURL : MyURL + 'common/doPageQuery?sql=' + sql,
	width : "100%", // "100%", // 700,
	height : c - header, // "100%", // 330,
	container : "gridbox_projectcheck",
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
			// TODO:双击行事件
	}
};

var projectcheck_grid = new Sigma.Grid(gridOption);
projectcheck_grid.render();
