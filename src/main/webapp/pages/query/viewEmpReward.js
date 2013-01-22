var c = $("#myContent").height();
var header = $("#viewempreward_head").height();
var sql = "select ID,EMP_ID,fun_getcodedesc('REWARDTYPE',REWARDTYPE) REWARDTYPE,TO_CHAR(REWARDDATE,'YYYY-MM-DD') REWARDDATE,REWARDDEPT,REWARD,MEMO,VALID,fun_getcodedesc('REWARD_PERSON',REWARD_PERSON) REWARD_PERSON from V_HRD_EMP_REWARD WHERE EMP_ID='"
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
	header : "奖励",
	width : 150,
	editable : false,
	editor : {
		type : "text"
	}
}, {
	id : 'REWARD_PERSON',
	header : "个人获奖证书",
	width : 150,
	editable : false,
	editor : {
		type : "text"
	}
}, {
	id : 'REWARDDATE',
	header : "奖惩日期",
	width : 150,
	editable : false

}, {
	id : 'REWARDDEPT',
	header : "奖惩单位",
	width : 150,
	editable : false,
	editor : {
		type : "text"
	}
}, {
	id : 'REWARD',
	header : "奖惩内容",
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
	id : "viewempreward_grid",
	loadURL : MyURL + 'common/doPageQuery?sql=' + sql,
	// saveURL : MyURL + 'hrs/saveEmpReward?empId=' + empId,
	width : "100%", // "100%", // 700,
	height : c - header, // "100%", // 330,
	container : "gridbox_viewempreward",
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

var viewempreward_grid = new Sigma.Grid(gridOption);
viewempreward_grid.render();
