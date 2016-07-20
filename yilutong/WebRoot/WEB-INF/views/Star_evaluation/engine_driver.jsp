<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	String realPath1 = "http://" + request.getServerName() + ":"
			+ request.getServerPort() + "/surmax/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>司机</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">


<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
<script type="text/javascript" src="./js/select2/select2.js"></script>
<script type="text/javascript"
	src="./js/select2/select2_locale_zh-CN.js"></script>
<!-- <script type="text/javascript" src="./js/function.js"></script>  -->


</head>
<%
	String flg = (String) request.getAttribute("flg");
%>
<script type="text/javascript">
	var dialog;
	var grid;
	$(function() {
		grid = $("#dg")
				.datagrid(
						{
							url : 'Driver.do?method=listdriver',
							border : false,
							rownumbers : true,
							fit : true,
							singleSelect : false,
							selectOnCheck : true,
							checkOnSelect : true,
							multiSort : true,
							//双击
							onDblClickRow : function(rowIndex, rowData) {
								var driverId = rowData.driverId;
								dialog = parent.jy
										.modalDialog({
											title : '司机评价',
											url : 'Driver.do?method=gettiao&driverId='
													+ driverId,
											width : 1000,
											heght : 700,
											buttons : [ {
												handler : function() {
													dialog.find('iframe')
															.get(0).contentWindow
															.submitForm(dialog,
																	grid,
																	parent.$);
												}
											} ],
									onDestroy:function(){
                                      $('#dg').datagrid('reload');
                                          }
										});
							},
							columns : [ [ {
								field : 'ck',
								checkbox : true,

							}, {
								field : 'driverName',
								title : '司机姓名',
								width : 70,
								align : 'center'
							}, {
								field : 'phoneNumber',
								title : '手机号',
								width : 100,
								align : 'center'
							}, {
								field : 'address',
								title : '住址',
								width : 100,
								align : 'center'
							}, {
								field : 'ptype',
								title : '类别',
								width : 100,
								align : 'center',
								formatter : function(val, row, index) {
									if (val == 0) {
										return "司机";
									} else if (val == 1) {
										return "车主";
									} else if (val == 2) {
										return "司机,车主";
									}
								},
							}, {
								field : 'grade',
								title : '总分数',
								width : 100,
								align : 'center'
							},{
								field : 'average',
								title : '平均分数',
								width : 100,
								align : 'center'
							}, ] ],
							pagination : true,//分页
							pageSize : 10,
							pageList : [ 5, 10, 15, 20 ],
							toolbar : '#tb'
						});
	});
       /*
         select框
         */
        document.onkeydown = function(event) {
            e = event ? event : (window.event ? window.event : null);
            if (e.keyCode == 13) {
                //执行的方法 
                searchCar_owner();
            }
        };
	//查询
	function searchCar_owner() {
		$("#dg").datagrid('load', {
			driverName : $.trim($("#driverName").val()),
			ptype : $.trim($("#ptype").val()),
			bouns : $.trim($("#bouns").val()),
			bouns_time : $.trim($("#bouns_time").val())
		});
	}

	function ow(owurl) {
		var tmp = window.open("about:blank", "", "fullscreen=1");
		tmp.moveTo(0, 0);
		tmp.resizeTo(screen.width + 20, screen.height);
		tmp.focus();
		tmp.location = owurl;
	}
	//重置
	function reset() {
		$("#driverName").val("");
		$("#ptype").val("");
		$("#bouns").val("");
		$("#bouns_time").val("");
	}

	//导出
	function gxderive() {
		var checkarray = [];
		var checkip = '';
		var colName = [];
		var fieldName1 = [];
		var array = $('#dg').datagrid("getSelections");
		var allRows2 = $("#dg").datagrid("getColumnFields");
		 if (array != "") {
			for ( var i = 0; i < array.length; i++) {
				checkarray.push(array[i].driverId);
			
			}
		 } 
		for (i = 1; i < allRows2.length; i++) {
			var col = $('#dg').datagrid("getColumnOption", allRows2[i]);
			colName.push(col.title);//把title列名到数组里去 
			fieldName1.push(col.field); //把field列属性名到数组里去 			
		}
		$("#fieldName").val(fieldName1.join(","));
		$("#headtitle").val(colName.join(","));
		$("#checkarray").val(checkarray.join(","));
		var formout = $("#outputform");
		formout.submit();
	}
</script>
<body class="easyui-layout">
	<form action="Driver.do" id="outputform" method="post">

		<div region="north" title="检索" class="st-north" border="false"
			height="75px" collapsible="false">
			<input type="hidden" id=driverid name="driverid">
			<lable>司机姓名:</lable>
			<input type="text" class="search-text" id="driverName"
				style="width:120px; margin-right:0px">
			<lable>类型:</lable>
			<select class="combobox" id="ptype" name="ptype" style="width:120px;"
				data-options="panelHeight : 'auto',editable:false">
				<option id="" value="">全部</option>
				<option id="" value="0">司机</option>
				<option id="" value="1">车主</option>
				<option id="" value="2">司机,车主</option>
			</select>
		<!-- 	<lable>司机评价时间:</lable>
			<input id="bouns" class="Wdate" readonly="readonly"
				style="width:120px;height:22px; "
				onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			- <input id="bouns_time" class="Wdate" readonly="readonly"
				style="width:120px;height:22px;"
				onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
 -->
			<a class="easyui-linkbutton" id="" onclick="searchCar_owner()"
				data-options="iconCls:'icon-search'">查询</a> <br>
		</div>
		<div region="center">
			<table id="dg" title="司机评价"></table>
		</div>
		<div id="tb">
			<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-reset',plain:true" onclick="gxderive()">导出</a>
			<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-reset',plain:true" onclick="reset()">清空查询条件</a>
			<div title='双击评价'
				style='height: 16px;background:gray;-moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;    float: right;
		    	margin: 5 1%;color: white;
		    padding-left: 10px;
		    padding-right: 10px; '>
				<span>双击评价</span>
			</div>
		</div>
		<input type="hidden" name="method" value="exportunqualified2"> <input
			type="hidden" id="fieldName" name="fieldName"> <input
			type="hidden" id="headtitle" name="headtitle"> <input
			type="hidden" id="checkarray" name="checkarray">
	</form>
</body>
</html>
