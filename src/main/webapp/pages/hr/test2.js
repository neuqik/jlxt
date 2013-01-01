var c = $("#myContent").height();
var header = $("#myheader2").height();
// 定义数据类型
var dsOption = {
	fields : [ {
		name : 'ORDER_NO',
		type : 'int'
	}, {
		name : 'EMPLOYEE'
	}, {
		name : 'COUNTRY'
	}, {
		name : 'CUSTOMER'
	}, {
		name : 'ORDER2005',
		type : 'float'
	}, {
		name : 'ORDER2006',
		type : 'float'
	}, {
		name : 'ORDER2007',
		type : 'float'
	}, {
		name : 'ORDER2008',
		type : 'float'
	}, {
		name : 'DELIVERY_DATE',
		type : 'date'
	}

	],
	uniqueField : 'ORDER_NO',
	recordType : 'json'
};
// 定义列选项
var colsOption = [ {
	id : 'chk',
	isCheckColumn : true,
}, {
//	grid : "mygrid2",
//	gridId : "mygrid2",
	id : 'ORDER_NO',
	header : "订单号",
	width : 55
}, {
	id : 'EMPLOYEE',
	header : "员工",
	width : 100,
	editable : false,
	editor : {
		type : "text",
		validRule : [ 'required' ]
	}
}, {
	id : 'COUNTRY',
	header : "国家",
	width : 100,
	editable : false,
	editor : {
		type : "text"
	}
}, {
	id : 'CUSTOMER',
	header : "客户",
	width : 100,
	editor : {
		type : "text",
		validRule : [ 'required' ]
	}
}, {
	id : 'ORDER2005',
	header : "2005年订单",
	width : 100,
	editable : false,
	editor : {
		type : "text",
		validRule : [ 'float' ]
	},
	inChart : true,
	chartColor : 'eecc99'
}, {
	id : 'ORDER2006',
	header : "2006年订单",
	width : 100,
	editable : false,
	editor : {
		type : "text",
		validRule : [ 'float' ]
	},
	inChart : true,
	chartColor : '77aa33'
}, {
	id : 'ORDER2007',
	header : "2007年订单",
	width : 100,
	editable : false,
	editor : {
		type : "text",
		validRule : [ 'float' ]
	},
	inChart : true,
	chartColor : 'bb0066'
}, {
	id : 'ORDER2008',
	header : "2008年订单",
	width : 100,
	editable : false,
	editor : {
		type : "text",
		validRule : [ 'float' ]
	},
	inChart : true,
	chartColor : '99bb88'
}, {
	id : 'DELIVERY_DATE',
	header : "交货日期",
	width : 100,
	editor : {
		type : "date",
		format : 'yyyy-MM-dd',
		validRule : [ 'date' ]
	}
}

];

var gridOption = {
	id : "mygrid2",
	loadURL : MyURL + 'hrs/queryAllList',
	saveURL : MyURL + 'hrs/saveOrder',
	width : "100%", // "100%", // 700,
	height : c - header - 8, // "100%", // 330,
	container : "gridbox2",
	toolbarPosition : 'bottom',
	toobarContent : 'nav | pagesize | reload | add del save | print csv xls xml pdf filter chart | state',
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
	exportURL : '',// 导出URL
	exportFileName : 'file',
	remotePaging : true, // 服务器分页
	remoteFilter : true, // 发送请求到LoadURL中，并且填写filterInfo
	remoteSort : true, // 发送排序请求到LoadURL中，并且填写SortInfo
	submitUpdatedFields : true, // 只提交变动的数据
	autoLoad : true, // 窗口打开时是否自动加载URL
	defaultRecord : {
		order_no : '-',
		employee : '-',
		country : '-',
		customer : '(name)',
		order2005 : 0.1,
		order2006 : 0.1,
		order2007 : 0.1,
		order2008 : 0.1,
		delivery_date : '1901-01-01'
	},
	parameters : {
		a : 123,
		b : 222,
		c : [ 8, 9 ]
	}
};

var mygrid = new Sigma.Grid(gridOption);
mygrid.render();
// mygrid.onshow();
Sigma.Utils.onLoad(function() {
	mygrid.render();
});

function doClick() {
	mygrid.loadURL = MyURL + 'hrs/list';
	mygrid.reload();
	// alert($("#searchName").val());
	// $.ajax({
	// type : "post", // 请求方式
	// url : MyURL + 'hrs/list', // 发送请求地址
	// data : { // 发送给数据库的数据
	// user : $("#searchName").val()
	// },
	// dataType : "json",
	// // 请求成功后的回调函数有两个参数
	// success : function(data, textStatus) {
	// alert(dsOption.data);
	// mygrid.loadURL=MyURL + 'hrs/list';
	// mygrid.reload();
	// }
	// });
}
// 过滤
function doFilter() {
	var filterInfo = [ {
		fieldName : "EMPLOYEE",
		logic : "startWith",
		value : Sigma.Util.getValue("searchName")
	} ]
	var grid = Sigma.$grid("mygrid2");
	var rowNOs = grid.applyFilter(filterInfo);
}
// checkbox
function doTest() {
	// 获取当前蓝条选中的行
	var recs = mygrid.getSelectedRecords();
	// alert(mygrid.checkedRows);
	// 如果指定uniqueField，则checkedRows的key是对应的列值，如果不指定，则是行号，从0开始
	console.log(mygrid.checkedRows);
	// 显示值
	$.each(mygrid.checkedRows, function(key, value) {
		alert("key:" + key + "value:" + value);
	});
}