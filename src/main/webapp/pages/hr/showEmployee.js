var c = $("#myContent").height();
var header = $("#showemployee_head").height();
var sql = "SELECT ID,EMP_ID,EMP_NAME,fun_getcodedesc('EMPTYPE',EMPTYPE) EMPTYPE,TO_CHAR(BIRTH,'YYYY-MM-DD') BIRTH,AGE,fun_getcodedesc('DEPT_ID',DEPT_ID) DEPT_ID,fun_getcodedesc('GENDER',GENDER) GENDER,IDCARD,fun_getcodedesc('ROLENAME',ROLENAME) ROLENAME,TO_CHAR(WORKDATE,'YYYY-MM-DD') WORKDATE,TO_CHAR(JOINDATE,'YYYY-MM-DD') JOINDATE,TEL,EMERGENCY,fun_getloc(LOCATION1) LOCATION1,fun_getloc(LOCATION2) LOCATION2,fun_getloc(LOCATION3) LOCATION3,fun_getcodedesc('ARCHIVEKEEP',ARCHIVEKEEP) ARCHIVEKEEP,PENSION_NO,MEDICA_NO,MEMO,fun_getcodedesc('POLITIC',POLITIC) POLITIC,fun_getcodedesc('NATION',NATION) NATION,JOINAGE,EDUCATION,GRADUATE,fun_getcodedesc('MASTER',MASTER) MASTER,fun_getcodedesc('TITLEWORK',TITLEWORK) TITLEWORK,fun_getcodedesc('TITLE_ID',TITLE_ID) TITLE_ID,fun_getcodedesc('TITLENAME',TITLENAME) TITLENAME FROM V_HRD_EMP";
// 定义数据类型
var dsOption = {
	fields : [ {
		name : 'ID'
	}, {
		name : 'EMP_ID'
	}, {
		name : 'EMP_NAME'
	}, {
		name : 'EMPTYPE'
	}, {
		name : 'BIRTH',
		type : 'date'
	}, {
		name : 'AGE'
	}, {
		name : 'DEPT_ID'
	}, {
		name : 'GENDER'
	}, {
		name : 'IDCARD'
	}, {
		name : 'ROLENAME'
	}, {
		name : 'WORKDATE',
		type : 'date'
	}, {
		name : 'JOINDATE',
		type : 'date'
	}, {
		name : 'TEL'
	}, {
		name : 'EMERGENCY'
	}, {
		name : 'LOCATION1'
	}, {
		name : 'LOCATION2'
	}, {
		name : 'LOCATION3'
	}, {
		name : 'ARCHIVEKEEP'
	}, {
		name : 'PENSION_NO'
	}, {
		name : 'MEDICA_NO'
	}, {
		name : 'MEMO'
	}, {
		name : 'POLITIC'
	}, {
		name : 'NATION'
	}, {
		name : 'JOINAGE'
	}, {
		name : 'EDUCATION'
	}, {
		name : 'GRADUATE'
	}, {
		name : 'MASTER'
	}, {
		name : 'TITLEWORK'
	}, {
		name : 'TITLE_ID'
	}, {
		name : 'TITLENAME'
	} ],
	uniqueField : 'EMP_ID',
	recordType : 'json'
};
// 定义列选项
var colsOption = [ {
	id : 'chk',
	isCheckColumn : true,
	frozen : true
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
	frozen : true
}, {
	id : 'EMP_NAME',
	header : "姓名",
	width : 100,
	editable : false,
	frozen : true
}, {
	id : 'EMPTYPE',
	header : "员工状态",
	width : 100,
	editable : false
}, {
	id : 'BIRTH',
	header : "出生日期",
	width : 100,
	editable : false
}, {
	id : 'AGE',
	header : "年龄",
	width : 50,
	editable : false
}, {
	id : 'DEPT_ID',
	header : "分公司",
	width : 100,
	editable : false
}, {
	id : 'GENDER',
	header : "性别",
	width : 30,
	editable : false
}, {
	id : 'IDCARD',
	header : "身份证号码",
	width : 150,
	editable : false
}, {
	id : 'ROLENAME',
	header : "岗位",
	width : 100,
	editable : false
}, {
	id : 'WORKDATE',
	header : "参加工作日期",
	width : 100,
	editable : false
}, {
	id : 'JOINDATE',
	header : "进入本单位日期",
	width : 100,
	editable : false
}, {
	id : 'TEL',
	header : "联系电话",
	width : 100,
	editable : false
}, {
	id : 'EMERGENCY',
	header : "紧急联系电话",
	width : 100,
	editable : false
}, {
	id : 'LOCATION1',
	header : "常住地址(省)",
	width : 100,
	editable : false,
	toolTip : true,
	toolTipWidth : 150,
	editor : {
		type : "textarea",
		width : "300px",
		height : "200px"
	}
}, {
	id : 'LOCATION2',
	header : "常住地址(市)",
	width : 100,
	editable : false,
	toolTip : true,
	toolTipWidth : 150,
	editor : {
		type : "textarea",
		width : "300px",
		height : "200px"
	}
}, {
	id : 'LOCATION3',
	header : "常住地址(县区)",
	width : 100,
	editable : false,
	toolTip : true,
	toolTipWidth : 150,
	editor : {
		type : "textarea",
		width : "300px",
		height : "200px"
	}
}, {
	id : 'ARCHIVEKEEP',
	header : "档案存放地",
	width : 100,
	editable : false
}, {
	id : 'PENSION_NO',
	header : "养老保险编号",
	width : 150,
	editable : false
}, {
	id : 'MEDICA_NO',
	header : "医疗保险编号",
	width : 150,
	editable : false
}, {
	id : 'MEMO',
	header : "备注",
	width : 150,
	editable : false
}, {
	id : 'POLITIC',
	header : "政治面貌",
	width : 100,
	editable : false,
	toolTip : true,
	toolTipWidth : 150,
	editor : {
		type : "textarea",
		width : "300px",
		height : "200px"
	}
}, {
	id : 'NATION',
	header : "民族",
	width : 100,
	editable : false,
	toolTip : true,
	toolTipWidth : 150,
	editor : {
		type : "textarea",
		width : "300px",
		height : "200px"
	}
}, {
	id : 'JOINAGE',
	header : "本单位工龄",
	width : 100,
	editable : false
}, {
	id : 'EDUCATION',
	header : "文化程度",
	width : 100,
	editable : false,
	toolTip : true,
	toolTipWidth : 150,
	editor : {
		type : "textarea",
		width : "300px",
		height : "200px"
	}
}, {
	id : 'GRADUATE',
	header : "毕业院校",
	width : 100,
	editable : false,
	toolTip : true,
	toolTipWidth : 150,
	editor : {
		type : "textarea",
		width : "300px",
		height : "200px"
	}
}, {
	id : 'MASTER',
	header : "主修专业",
	width : 100,
	editable : false,
	toolTip : true,
	toolTipWidth : 150,
	editor : {
		type : "textarea",
		width : "300px",
		height : "200px"
	}
}, {
	id : 'TITLEWORK',
	header : "从事专业",
	width : 100,
	editable : false,
	toolTip : true,
	toolTipWidth : 150,
	editor : {
		type : "textarea",
		width : "300px",
		height : "200px"
	}
}, {
	id : 'TITLE_ID',
	header : "职称",
	width : 100,
	editable : false,
	toolTip : true,
	toolTipWidth : 150,
	editor : {
		type : "textarea",
		width : "300px",
		height : "200px"
	}
}, {
	id : 'TITLENAME',
	header : "职称专业",
	width : 100,
	editable : false,
	toolTip : true,
	toolTipWidth : 150,
	editor : {
		type : "textarea",
		width : "300px",
		height : "200px"
	}
}

];

var gridOption = {
	id : "showemployee_grid",
	loadURL : MyURL + 'common/doPageQuery?sql=' + sql,
	// saveURL : MyURL + 'hrs/deleteEmp',
	width : "100%", // "100%", // 700,
	height : c - header, // "100%", // 330,
	container : "gridbox_showemployee",
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
		navTab.openTab("xgjbxx", MyURL + "hrs/editEmpBase?empId="
				+ record.EMP_ID, {
			title : "基本信息",
			fresh : false,
			data : {}
		});
	}
};

var showemployee_grid = new Sigma.Grid(gridOption);
showemployee_grid.render();
