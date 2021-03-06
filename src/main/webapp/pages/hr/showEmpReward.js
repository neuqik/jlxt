var c = $("#myContent").height();
var header = $("#showempreward_head").height();
var pageheader = $("#showempext_pageheader").height();
var sql = "select ID,EMP_ID,REWARDTYPE,TO_CHAR(REWARDDATE,'YYYY-MM-DD') REWARDDATE,REWARDDEPT,REWARD,MEMO,VALID,REWARD_PERSON from V_HRD_EMP_REWARD WHERE EMP_ID='"
		+ empId + "'";

// 定义数据类型
var dsOption = {
	fields : [ {
		name : 'ID'
	}, {
		name : 'EMP_ID'
	}, {
		name : 'REWARDTYPE'
	}, {
		name : 'REWARDDATE'
	}, {
		name : 'REWARDDEPT'
	}, {
		name : 'REWARD'
	}, {
		name : 'MEMO'
	}, {
		name : 'REWARD_PERSON'
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
	id : 'REWARDTYPE',
	header : "奖项",
	width : 150,
	editable : true,
	editor : {
		type : "select",
		options : {
			'01' : '国家级重点奖项',
			'02' : '鲁班奖',
			'03' : '世纪杯',
			'04' : '三省观摩',
			'05' : '优质主体',
			'06' : '玫瑰杯',
			'07' : '新貌杯',
			'08' : '重点工程'
		}
	}
}, {
	id : 'REWARD_PERSON',
	header : "个人获奖证书",
	width : 150,
	editable : true,
	editor : {
		type : "select",
		options : {
			'01' : '国家优总理工程师',
			'02' : '国家优理工程师',
			'03' : '省优总监理工程师',
			'04' : '省优监理工程师',
			'05' : '市优总监理工程师',
			'06' : '市优监理工程师'
		}
	}
}, {
	id : 'REWARDDATE',
	header : "奖惩日期",
	width : 150,
	editable : true,
	editor : {
		type : "date",
		validator : function(value, record, colObj, grid) {
			// 如果输入了值
			if (value.length > 0) {
				return true;
			} else {
				return "请输入奖惩日期";
			}
		}
	}
}, {
	id : 'REWARDDEPT',
	header : "奖惩项目",
	width : 150,
	editable : true,
	editor : {
		type : "text"
	}
}, {
	id : 'REWARD',
	header : "奖惩内容",
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
	id : "showempreward_grid",
	loadURL : MyURL + 'common/doPageQuery?sql=' + sql,
	saveURL : MyURL + 'hrs/saveEmpReward?empId=' + empId,
	width : "100%", // "100%", // 700,
	height : c - header - 50 - pageheader, // "100%", // 330,
	container : "gridbox_showempreward",
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

var showempreward_grid = new Sigma.Grid(gridOption);
showempreward_grid.render();
