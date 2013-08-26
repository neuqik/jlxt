var c = $("#myContent").height();
var header = $("#showdepartcheck_head").height();
var sql = "SELECT TO_CHAR(ACT_BEGIN,'YYYY-MM-DD') ACT_BEGIN, TO_CHAR(ACT_END,'YYYY-MM-DD') ACT_END, BATCHNO, TO_CHAR(CHECKDATE,'YYYY-MM-DD') CHECKDATE, CHECKGROUP_NO, CHECK_USER, CONSTRUCT, CONSTRUCTION, CONSTRUCTION_COMMENT, CONSTRUCTION_RATIO, CONSTRUCTION_SUM, DEPT_ID, ELECTRIC, ELECTRIC_COMMENT, ELECTRIC_RATIO, ELECTRIC_SUM, ID, MEMO, PRJ_AREA, PRJ_ID, FUN_GETCODEDESC('PRJ_LEVEL',PRJ_LEVEL) PRJ_LEVEL, PROGRESS, SECURITY, SECURITY_COMMENT, SECURITY_RATIO, SECURITY_SUM, TOTAL_SUM, WATER, WATER_COMMENT, WATER_RATIO, WATER_SUM FROM V_PRJ_SUPERVISOR_MAJORCHECK";
// 定义数据类型
var dsOption = {
	fields : [{name:"ACT_BEGIN"},{name:"ACT_END"},{name:"BATCHNO"},{name:"CHECKDATE"},{name:"CHECKGROUP_NO"},{name:"CHECK_USER"},{name:"CONSTRUCT"},{name:"CONSTRUCTION"},{name:"CONSTRUCTION_COMMENT"},{name:"CONSTRUCTION_RATIO"},{name:"CONSTRUCTION_SUM"},{name:"DEPT_ID"},{name:"ELECTRIC"},{name:"ELECTRIC_COMMENT"},{name:"ELECTRIC_RATIO"},{name:"ELECTRIC_SUM"},{name:"ID"},{name:"MEMO"},{name:"PRJ_AREA"},{name:"PRJ_ID"},{name:"PRJ_LEVEL"},{name:"PROGRESS"},{name:"SECURITY"},{name:"SECURITY_COMMENT"},{name:"SECURITY_RATIO"},{name:"SECURITY_SUM"},{name:"TOTAL_SUM"},{name:"WATER"},{name:"WATER_COMMENT"},{name:"WATER_RATIO"},{name:"WATER_SUM"}],
	uniqueField : 'ID',
	recordType : 'json'
};
// 定义列选项
var colsOption = [{id:"chk",isCheckColumn:true,frozen:true},{id:"ACT_BEGIN",width:100,editable:false,header:"实际开工日期"},{id:"ACT_END",width:100,editable:false,header:"计划结束"},{id:"BATCHNO",width:100,editable:false,header:"轮次"},{id:"CHECKDATE",width:100,editable:false,header:"检查时间"},{id:"CHECKGROUP_NO",width:100,editable:false,header:"评分单编号"},{id:"CHECK_USER",width:100,editable:false,header:"检查人员"},{id:"CONSTRUCT",width:100,editable:false,header:"结构类型CONSTRUCT_TYPE"},{id:"CONSTRUCTION",width:100,editable:false,header:"土建说明，占比等"},{id:"CONSTRUCTION_COMMENT",width:100,editable:false,header:"土建问题"},{id:"CONSTRUCTION_RATIO",width:100,editable:false,header:"占比"},{id:"CONSTRUCTION_SUM",width:100,editable:false,header:"土建实得"},{id:"DEPT_ID",width:100,editable:false,header:"部门分公司"},{id:"ELECTRIC",width:100,editable:false,header:"电气说明，占比等"},{id:"ELECTRIC_COMMENT",width:100,editable:false,header:"电气问题"},{id:"ELECTRIC_RATIO",width:100,editable:false,header:"占比"},{id:"ELECTRIC_SUM",width:100,editable:false,header:"电气实得"},{id:"ID",width:100,editable:false,header:""},{id:"MEMO",width:100,editable:false,header:"备注"},{id:"PRJ_AREA",width:100,editable:false,header:"项目面积(平方米)"},{id:"PRJ_ID",width:100,editable:false,header:"项目ID"},{id:"PRJ_LEVEL",width:100,editable:false,header:"项目等级"},{id:"PROGRESS",width:100,editable:false,header:"形象进度"},{id:"SECURITY",width:100,editable:false,header:"安全说明，占比等"},{id:"SECURITY_COMMENT",width:100,editable:false,header:"安全问题"},{id:"SECURITY_RATIO",width:100,editable:false,header:"占比"},{id:"SECURITY_SUM",width:100,editable:false,header:"安全实得"},{id:"TOTAL_SUM",width:100,editable:false,header:"实得总分"},{id:"WATER",width:100,editable:false,header:"水暖说明，占比等"},{id:"WATER_COMMENT",width:100,editable:false,header:"水暖问题"},{id:"WATER_RATIO",width:100,editable:false,header:"占比"},{id:"WATER_SUM",width:100,editable:false,header:"水暖实得"}];

var gridOption = {
	id : "showdepartcheck_grid",
	loadURL : MyURL + 'common/doPageQuery?sql=' + sql,
	width : "100%", // "100%", // 700,
	height : c - header, // "100%", // 330,
	container : "gridbox_showdepartcheck",
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

var showdepartcheck_grid = new Sigma.Grid(gridOption);
showdepartcheck_grid.render();
