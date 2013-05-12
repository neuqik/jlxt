var c = $("#myContent").height();
var header = $("#editbuilding_head").height();
var tabheader = $("#addprojectall_tabcontent").height();
var sql = "SELECT ABOVEFLOOR, TO_CHAR(ACT_BEGIN,'YYYY-MM-DD') ACT_BEGIN, TO_CHAR(ACT_END,'YYYY-MM-DD') ACT_END, ACT_TIME, BUILDER_LICENSE, BUILDING_AREA, BUILDING_ID, BUILDING_TYPE, CONSTRUCT_TYPE, HEIGHT, ID, IMAGE_PROGRESS, TO_CHAR(LICENSE_DATE,'YYYY-MM-DD') LICENSE_DATE, MEMO, PRJ_ID, PROGRESS, SECURITY_LEVEL, UNDERFLOOR, VALID FROM V_PRJ_BUILDING WHERE PRJ_ID="
		+ prjId;
// 定义数据类型
var dsOption = {
	fields : [ {
		name : "ABOVEFLOOR"
	}, {
		name : "ACT_BEGIN"
	}, {
		name : "ACT_END"
	}, {
		name : "ACT_TIME"
	}, {
		name : "BUILDER_LICENSE"
	}, {
		name : "BUILDING_AREA"
	}, {
		name : "BUILDING_ID"
	}, {
		name : "BUILDING_TYPE"
	}, {
		name : "CONSTRUCT_TYPE"
	}, {
		name : "HEIGHT"
	}, {
		name : "ID"
	}, {
		name : "IMAGE_PROGRESS"
	}, {
		name : "LICENSE_DATE"
	}, {
		name : "MEMO"
	}, {
		name : "PRJ_ID"
	}, {
		name : "PROGRESS"
	}, {
		name : "SECURITY_LEVEL"
	}, {
		name : "UNDERFLOOR"
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
	id : "ID",
	width : 100,
	editable : false,
	header : "",
	hidden : true
}, {
	id : "PRJ_ID",
	width : 100,
	editable : false,
	header : "",
	hidden : true
}, {
	id : "BUILDING_ID",
	width : 100,
	editable : true,
	header : "单体编号/楼号",
	editor : {
		type : "text",
		validator : function(value, record, colObj, grid) {
			// 如果输入了值
			if (value.length > 0) {
				return true;
			} else {
				return "请输入单体编号或楼号";
			}
		}
	}
}, {
	id : "BUILDING_AREA",
	width : 100,
	editable : true,
	header : "单栋建筑面积",
	editor : {
		type : "text",
		validator : function(value, record, colObj, grid) {
			// 如果输入了值
			if (value.length > 0) {
				return true;
			} else {
				return "请输入单栋建筑面积";
			}
		}
	}
}, {
	id : "ABOVEFLOOR",
	width : 100,
	editable : true,
	header : "地上层数",
	editor : {
		type : "text"
	}
}, {
	id : "UNDERFLOOR",
	width : 100,
	editable : true,
	header : "地下层数",
	editor : {
		type : "text"
	}
}, {
	id : "HEIGHT",
	width : 100,
	editable : true,
	header : "建筑高度",
	editor : {
		type : "text"
	}
}, {
	id : "CONSTRUCT_TYPE",
	width : 100,
	editable : true,
	header : "结构类型",
	editor : {
		type : "select",
		options : {
			'01' : '砖混',
			'02' : '框架',
			'03' : '排架',
			'04' : '剪力墙',
			'05' : '框剪',
			'06' : '框筒',
			'07' : '筒体',
			'08' : '钢结构',
			'09' : '装配式'
		},
		defaultText : '01'
	}
}, {
	id : "BUILDING_TYPE",
	width : 100,
	editable : true,
	header : "工程分类",
	editor : {
		type : "select",
		options : {
			'1' : '多层',
			'2' : '小高层',
			'3' : '高层',
			'4' : '超高层'
		},
		defaultText : '1'
	}
}, {
	id : "ACT_BEGIN",
	width : 100,
	editable : true,
	header : "实际开工日期",
	editor : {
		type : "date"
	}
}, {
	id : "ACT_END",
	width : 100,
	editable : true,
	header : "实际竣工日期",
	editor : {
		type : "date"
	}
}, {
	id : "ACT_TIME",
	width : 100,
	editable : true,
	header : "实际工期",
	editor : {
		type : "text"
	}
}, {
	id : "BUILDER_LICENSE",
	width : 100,
	editable : true,
	header : "施工许可证",
	editor : {
		type : "text"
	}
}, {
	id : "LICENSE_DATE",
	width : 100,
	editable : true,
	header : "施工许可证日期",
	editor : {
		type : "text"
	}
}, {
	id : "IMAGE_PROGRESS",
	width : 100,
	editable : true,
	header : "形象进度",
	editor : {
		type : "select",
		options : {
			'01' : '±0以下',
			'02' : '主体',
			'03' : '装饰',
			'04' : '初验',
			'05' : '配套',
			'06' : '收尾',
			'07' : '竣工'
		},
		defaultText : '01'
	}
}, {
	id : "PROGRESS",
	width : 100,
	editable : true,
	header : "进度情况",
	toolTip : true,
	toolTipWidth : 150,
	editor : {
		type : "textarea",
		width : "300px",
		height : "200px"
	}
}, {
	id : "SECURITY_LEVEL",
	width : 100,
	editable : true,
	header : "安全等级",
	editor : {
		type : "select",
		options : {
			'01' : 'A级',
			'02' : 'B级',
			'03' : 'C级'
		},
		defaultText : '01'
	}
}, {
	id : "MEMO",
	width : 200,
	editable : true,
	header : "备注",
	toolTip : true,
	toolTipWidth : 150,
	editor : {
		type : "textarea",
		width : "300px",
		height : "200px"
	}
} ];

var gridOption = {
	id : "editbuilding_grid",
	loadURL : MyURL + 'common/doPageQuery?sql=' + sql,
	saveURL : MyURL + 'prj/savebuilding?PRJ_ID=' + prjId,
	width : "100%", // "100%", // 700,
	height : c - header - 30, // "100%", // 330,
	container : "gridbox_editbuilding",
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

var editbuilding_grid = new Sigma.Grid(gridOption);
editbuilding_grid.render();
