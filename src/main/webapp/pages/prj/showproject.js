var c = $("#myContent").height();
var header = $("#showproject_head").height();
var sql = "SELECT BUILDINGCOUNT, CONTRACTAREA, CONTRACTNO, ID, FUN_GETLOC(LOCATION1) LOCATION1, FUN_GETLOC(LOCATION2) LOCATION2, FUN_GETLOC(LOCATION3) LOCATION3, FUN_GETLOC(LOCATION4) LOCATION4, MEMO, PRJNO, FUN_GETCODEDESC('PRJ_ARCHIVE',PRJ_ARCHIVE) PRJ_ARCHIVE, TO_CHAR(PRJ_ARCHIVETIME,'YYYY-MM-DD') PRJ_ARCHIVETIME, PRJ_AREA, TO_CHAR(PRJ_ENDTIME,'YYYY-MM-DD') PRJ_ENDTIME, PRJ_INVEST, FUN_GETCODEDESC('PRJ_LEVEL',PRJ_LEVEL) PRJ_LEVEL, PRJ_MAP, PRJ_NAME, PRJ_PIC, PRJ_PROGRESS, PRJ_REGION, TO_CHAR(PRJ_STARTTIME,'YYYY-MM-DD') PRJ_STARTTIME, PRJ_TIME, FUN_GETCODEDESC('PRJ_TYPE',PRJ_TYPE) PRJ_TYPE, FUN_GETCODEDESC('QUALITY_TARGET',QUALITY_TARGET) QUALITY_TARGET, FUN_GETCODEDESC('VALID',VALID) VALID, FUN_GETCODEDESC('WEEKMEETING',WEEKMEETING) WEEKMEETING, FUN_GETCODEDESC('WEEKMEETINGTIME',WEEKMEETINGTIME) WEEKMEETINGTIME FROM V_PRJ_INFO";
// 高级查询
var projectwhere = $("#projectwhere").val();
if (projectwhere.length > 0) {
	sql = sql + projectwhere;
}
// 定义数据类型
var dsOption = {
	fields : [ {
		name : "BUILDINGCOUNT"
	}, {
		name : "CONTRACTAREA"
	}, {
		name : "CONTRACTNO"
	}, {
		name : "ID"
	}, {
		name : "LOCATION1"
	}, {
		name : "LOCATION2"
	}, {
		name : "LOCATION3"
	}, {
		name : "LOCATION4"
	}, {
		name : "MEMO"
	}, {
		name : "PRJNO"
	}, {
		name : "PRJ_ARCHIVE"
	}, {
		name : "PRJ_ARCHIVETIME"
	}, {
		name : "PRJ_AREA"
	}, {
		name : "PRJ_ENDTIME"
	}, {
		name : "PRJ_INVEST"
	}, {
		name : "PRJ_LEVEL"
	}, {
		name : "PRJ_MAP"
	}, {
		name : "PRJ_NAME"
	}, {
		name : "PRJ_PIC"
	}, {
		name : "PRJ_PROGRESS"
	}, {
		name : "PRJ_REGION"
	}, {
		name : "PRJ_STARTTIME"
	}, {
		name : "PRJ_TIME"
	}, {
		name : "PRJ_TYPE"
	}, {
		name : "QUALITY_TARGET"
	}, {
		name : "VALID"
	}, {
		name : "WEEKMEETING"
	}, {
		name : "WEEKMEETINGTIME"
	} ],
	uniqueField : 'ID',
	recordType : 'json'
};
function my_renderer(value, record, columnObj, grid, colNo, rowNo) {
	var href = "<a  target=\"_blank\" href=\"" + MyURL
			+ "pages/prj/baidumap.jsp?PRJ_MAP=" + value + "&PRJNO="
			+ record.PRJNO + "\" >" + value + "</a>";
	return href;
}
// 定义列选项
var colsOption = [ {
	id : "chk",
	isCheckColumn : true,
	frozen : true
}, {
	id : "ID",
	width : 100,
	editable : false,
	header : "",
	hidden : true,
	frozen : true
}, {
	id : "PRJNO",
	width : 100,
	editable : true,
	header : "项目编号",
	frozen : true
}, {
	id : "PRJ_NAME",
	width : 100,
	editable : false,
	header : "项目名称",
	frozen : true,
	toolTip : true,
	toolTipWidth : 350
}, {
	id : "CONTRACTNO",
	width : 100,
	editable : false,
	header : "合同编号"
}, {
	id : "CONTRACTAREA",
	width : 100,
	editable : false,
	header : "合同面积"
}, {
	id : "BUILDINGCOUNT",
	width : 100,
	editable : false,
	header : "单体数量"
}, {
	id : "PRJ_AREA",
	width : 100,
	editable : false,
	header : "项目面积(平方米)"
}, {
	id : "PRJ_TYPE",
	width : 100,
	editable : false,
	header : "项目类别"
}, {
	id : "PRJ_STARTTIME",
	width : 100,
	editable : false,
	header : "项目开工时间"
}, {
	id : "PRJ_ENDTIME",
	width : 100,
	editable : false,
	header : "项目结束时间"
}, {
	id : "PRJ_PROGRESS",
	width : 100,
	editable : false,
	header : "项目进展情况",
	toolTip : true,
	toolTipWidth : 350,
	editor : {
		type : "textarea",
		width : "300px",
		height : "200px"
	}
}, {
	id : "PRJ_INVEST",
	width : 100,
	editable : false,
	header : "项目总投资"
}, {
	id : "PRJ_LEVEL",
	width : 100,
	editable : false,
	header : "项目等级"
}, {
	id : "QUALITY_TARGET",
	width : 100,
	editable : false,
	header : "质量目标"
}, {
	id : "WEEKMEETING",
	width : 100,
	editable : false,
	header : "周例会星期"
}, {
	id : "WEEKMEETINGTIME",
	width : 100,
	editable : false,
	header : "周例会时间"
}, {
	id : "LOCATION1",
	width : 100,
	editable : false,
	header : "项目地址(省)",
	toolTip : true,
	toolTipWidth : 150,
	editor : {
		type : "textarea",
		width : "300px",
		height : "200px"
	}
}, {
	id : "LOCATION2",
	width : 100,
	editable : false,
	header : "项目地址(市)",
	toolTip : true,
	toolTipWidth : 150,
	editor : {
		type : "textarea",
		width : "300px",
		height : "200px"
	}
}, {
	id : "LOCATION3",
	width : 100,
	editable : false,
	header : "项目地址(县/区)",
	toolTip : true,
	toolTipWidth : 150,
	editor : {
		type : "textarea",
		width : "300px",
		height : "200px"
	}
}, {
	id : "LOCATION4",
	width : 100,
	editable : false,
	header : "项目地址(街道)",
	toolTip : true,
	toolTipWidth : 350
}, {
	id : "PRJ_ARCHIVE",
	width : 100,
	editable : false,
	header : "档案归档标志"
}, {
	id : "PRJ_ARCHIVETIME",
	width : 100,
	editable : false,
	header : "档案归档时间"
}, {
	id : "PRJ_MAP",
	width : 150,
	editable : false,
	header : "项目地图",
	renderer : my_renderer,
	toolTip : true,
	toolTipWidth : 350
}, {
	id : "PRJ_PIC",
	width : 100,
	editable : false,
	header : "项目图片"
}, {
	id : "PRJ_REGION",
	width : 100,
	editable : false,
	header : "施工区域",
	toolTip : true,
	toolTipWidth : 150,
	editor : {
		type : "textarea",
		width : "300px",
		height : "200px"
	}
}, {
	id : "PRJ_TIME",
	width : 100,
	editable : false,
	header : "项目工期"
}, {
	id : "MEMO",
	width : 100,
	editable : false,
	header : "备注",
	toolTip : true,
	toolTipWidth : 150,
	editor : {
		type : "textarea",
		width : "300px",
		height : "200px"
	}
}, {
	id : "VALID",
	width : 100,
	editable : false,
	header : "",
	hidden : true
} ];

var gridOption = {
	id : "showproject_grid",
	loadURL : MyURL + 'common/doPageQuery?sql=' + sql,
	width : "100%", // "100%", // 700,
	height : c - header, // "100%", // 330,
	container : "gridbox_showproject",
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
		navTab.openTab("xgxm", MyURL + "prj/editproject?PRJ_ID=" + record.ID, {
			title : "维护项目",
			fresh : false,
			data : {}
		});
	}
};

var showproject_grid = new Sigma.Grid(gridOption);
showproject_grid.render();
