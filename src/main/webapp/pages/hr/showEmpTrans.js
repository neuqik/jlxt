var c = $("#myContent").height();
var header = $("#showemptrans_head").height();
var pageheader = $("#showemptransperf_pageheader").height();
var sql = "SELECT ID,EMP_ID,TO_CHAR(TRAININGDATE,'YYYY-MM-DD') TRAININGDATE,TRAINING,KNOWLEDGE,TRAININGDEPT,FEE,INTERTRAINING,MEMO FROM V_HRD_EMP_TRAIN WHERE EMP_ID='"
		+ empId + "'";

// 定义数据类型
var dsOption = {
	fields : [ {
		name : 'ID'
	}, {
		name : 'EMP_ID'
	}, {
		name : 'TRAININGDATE'
	}, {
		name : 'TRAINING'
	}, {
		name : 'KNOWLEDGE'
	}, {
		name : 'TRAININGDEPT'
	}, {
		name : 'FEE'
	}, {
		name : 'INTERTRAINING'
	}, {
		name : 'MEMO'
	} ],
	uniqueField : 'ID',
	recordType : 'json'
};
// 定义列选项
var colsOption = [
		{
			id : 'chk',
			isCheckColumn : true
		},
		{
			id : 'ID',
			header : "ID",
			width : 55,
			editable : false,
			hidden : true
		},
		{
			id : 'EMP_ID',
			header : "员工编号",
			width : 100,
			editable : false,
			hidden : true
		},
		{
			id : 'TRAININGDATE',
			header : "培训时间",
			width : 100,
			editable : true,
			editor : {
				type : "date"
			}
		},
		{
			id : 'TRAINING',
			header : "培训内容",
			width : 200,
			editable : true,
			editor : {
				type : "text"
			}
		},
		{
			id : 'KNOWLEDGE',
			header : "培训专业",
			width : 200,
			editable : true,
			editor : {
				type : "text"
			}
		},
		{
			id : 'TRAININGDEPT',
			header : "培训单位",
			width : 200,
			editable : true,
			editor : {
				type : "text"
			}
		},
		{
			id : 'FEE',
			header : "培训费用",
			width : 100,
			editable : true,
			editor : {
				type : "text",
				validator : function(value, record, colObj, grid) {
					var re = new RegExp(
							"^(([0-9]+\\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\\.[0-9]+)|([0-9]*[1-9][0-9]*))$");
					if (re.test(value)) {
						return true;
					} else {
						return "请输入正确的金额";
					}

				}
			}
		}, {
			id : 'INTERTRAINING',
			header : "是否内部培训",
			width : 100,
			editable : true,
			editor : {
				type : "select",
				options : {
					'1' : '是',
					'0' : '否'
				},
				defaultText : '0'
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
	id : "showemptrans_grid",
	loadURL : MyURL + 'common/doPageQuery?sql=' + sql,
	saveURL : MyURL + 'hrs/saveEmpTrans?empId=' + empId,
	width : "100%", // "100%", // 700,
	height : c - header - 50 - pageheader, // "100%", // 330,
	container : "gridbox_showemptrans",
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

var showemptrans_grid = new Sigma.Grid(gridOption);
showemptrans_grid.render();
