<!-- 
 文件名:LinInfo.jsp
创建人:黄清华
类型:jsp
创建日期:
最新修改日期:
 -->
 <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>标准线路信息管理</title>
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
<script type="text/javascript"
	src="./js/function.js"></script>

<%
	String realPath1 = "http://" + request.getServerName() + ":"
			+ request.getServerPort() + "/truck_cloud/";
%>

<% if(request.getAttribute("message")!=null){
	if(request.getAttribute("message").equals("errs")){
	%>
	<script type="text/javascript">
		$.messager.alert("修改线路","修改失败,本线路已被绑定在班线，请先解绑","err");
	</script>
		<%	}else{%>
	<script type="text/javascript">
		$.messager.alert("修改线路","修改失败","err");
	</script>
<%}
} %>
</head>
<script type="text/javascript">
	var dialog;
	var grid;
	$(function() {
	//var fs=$("#functionname").val().split(",");
		grid = $("#dg").datagrid({
			url : 'maplin.do?method=getLin',
			border : false,
			rownumbers : true,
			fit : true,
			singleSelect : false,
			selectOnCheck : true,
			checkOnSelect : true,
			columns : [ [ {
				field : 'linid',
				checkbox : true
			}, {
				field : 'linname',
				title : '线路名称',
				width : 140,
				align : 'center'
			}, {
				field : 'linbh',
				title : '线路编号',
				width : 140,
				align : 'center'
			}, {
				field : 'ct',
				title : '绑定车辆数',
				width : 71,
				align : 'center',
				formatter : function(val, row, index) {
					if (val == 0) {
						return "0";
					}else{
						return "<a href='javascript:void(0)' color='blue' style='text-decoration: none;' onmouseover='showcar(this)' onmouseout='hidecar(this)'>"+val+"</a>";
					} 
				}
			}, {
				field : 'linfatypes',
				title : '类型',
				width : 0,
				align : 'center',
				hidden  : 'true'
			}, {
				field : 'linfatype',
				title : '类型',
				width : 120,
				align : 'center',
				formatter : function(val, row, index) {
					if (val == 0) {
						return "默认方案";
					} else if (val == 1) {
						return "避开高速";
					}
					if (val == 2) {
						return "最短时间";
					}
					if (val == 3) {
						return "最短距离";
					}
				}
			}, {
				field : 'scity',
				title : '开始城市',
				width : 200,
				align : 'center'
			}, {
				field : 'ecity',
				title : '结束城市',
				width : 200,
				align : 'center'
			}, {
				field : 'stoptime',
				title : '停止时间',
				width : 65,
				align : 'center'
			}, {
				field : 'longtime',
				title : '运行时间',
				width : 65,
				align : 'center'
			}, {
				field : 'lincd',
				title : '里程Km',
				width : 100,
				align : 'center'
			}, {
				field : 'linctime',
				title : '更新时间',
				width : 166,
				align : 'center'
			} , {
				field : 'linbz',
				title : '备注',
				width : 166,
				align : 'center'
			} ] ],
			pagination : true,//分页
			pageSize : 10,
			pageList : [ 5, 10, 15, 20 ],
			toolbar : '#tb'
		});

		$('#cc3')
				.combotree(
						{
							url : "depn.do?method=getTree&&id=",
							width : 150,
							onBeforeLoad : function(node, param) {

								if (node == null) {
									$('#cc3').combotree('tree').tree('options').url = "depn.do?method=getTree&&id=";//加载顶层节点
								} else {

									$('#cc3').combotree('tree').tree('options').url = "depn.do?method=getTree&&id="
											+ node.id;//加载下层节点
								}

							}
						});
		/*
		select框
		 */

		$("#dname").select2({
			placeholder : "请输入线路名称", //默认文本框显示信息
			minimumInputLength : 1, //最小输入字符长度
			multiple : false, //设置多项选择，false则只能单选
			allowClear : true, //允许清空	
			maximumSelectionSize : 5, //最大选择个数
			query : function(query) {
				$.ajax({
					type : "POST",
					url : "maplin.do?method=getLinName",
					data : {
						linname : query.term
					}, //传递你输入框中的值
					success : function(msg) {
						var msg = $.parseJSON(msg);
						var data = {
							results : []
						};
						$.each(msg, function(x, y) {
							data.results.push({
								id : y.id,
								text : y.name
							});
							;
						});
						query.callback(data);
					}
				});
			}
		});
	});
	function showcar(obj){
		//alert(obj.parentNode.parentNode.parentNode.parentNode.innerText)
	}
	function hidecar(){
		
	}
	//查询
	function searchDriver() {
		$("#dg").datagrid('load',{
 	 		linname :$.trim($("#dname").select2("val")),
 		});	  
	}
	//删除
	function deleteEver() {
		var checkarray = [];
		var array = $('#dg').datagrid('getSelections');
		for (var i = 0; i < array.length; i++) {
			checkarray.push(array[i].linid);
		}
		if (array != "") {
			$.messager.confirm('确认', '您确定要删除选中的记录吗？', function(r) {
				if (r) {
					$.ajax({
						url : "maplin.do?method=deletebyid",
						type : "POST",
						data : {
							del : checkarray.join(",")
						},
						success : function(data) {
							if (data.flag) {
								parent.$.messager.alert("线路删除", "线路删除成功",
										'info', function(r) {
											$('#dg').datagrid('reload');
										});
							}else if (data.and="hava"){
								parent.$.messager.alert("线路删除", "该线路已被车辆绑定",
										'info', function(r) {
											$('#dg').datagrid('reload');
										});
							}
						}
					});
				}
			});
		} else {
			$.messager.alert('线路维护', '请选择要删除的信息', 'info');
		}
	}
	/*
	修改查询
	 */
	function modify() {
		var row = $("#dg").datagrid('getSelections');
		try {
			if(row[0].ct!=0){
				$.messager.confirm('修改线路', '修改将会自动解绑所有车辆？', function(r) {
					if(r){
						if (row.length == 1) {
							$("#linid").val(row[0].linid);
							document.getElementById("xg").action="maplin.do?method=getLinbyid";
							document.getElementById("xg").submit(); 
						} else {
							$.messager.alert('线路维护', '请选择一行信息', 'info');
						}  
					}
				});
			}else{
				 if (row.length == 1) {
					$("#linid").val(row[0].linid);
					document.getElementById("xg").action="maplin.do?method=getLinbyid";
					document.getElementById("xg").submit(); 
				} else {
					$.messager.alert('线路维护', '请选择一行信息', 'info');
				}  
			}
		} catch (e) {
			$.messager.alert('线路维护', '请选择一行信息', 'info');
		}
		
	}
	function bdcar(){//绑定车辆
		var row = $("#dg").datagrid('getSelections');
		if (row.length == 1) {
			$("#linids").val(row[0].linid);
			document.getElementById("bd").action="maplin.do?method=getLinbyidforbd";
			document.getElementById("bd").submit(); 
		} else {
			$.messager.alert('线路维护', '请选择一行信息', 'info');
		} 
	}
	
	//导出
	function putoutfile() {
	/* 	var allRows = $("#dg").datagrid("getColumnFields");
		alert(JSON.stringify(allRows)); */
		var allRows2 = $("#dg").datagrid("getColumnFields");
		var colName = [];
		var fieldName=[];
		for (var i = 1; i < allRows2.length; i++) {
			var col = $('#dg').datagrid("getColumnOption", allRows2[i]);
			colName.push(col.title);//把title列名到数组里去 
			fieldName.push(col.field); //把field列属性名到数组里去
		}
		//$("#datas").val(JSON.stringify(allRows));
		$("#fieldName").val(fieldName.join(","));
		$("#headtitle").val(colName.join(","));
		var outputform = $("#outputform");
		outputform.submit();
	}

	function add() {
		document.getElementById("ad").action = "map.do?method=getmapbzxl";
		document.getElementById("ad").submit();
	};
</script>

<body class="easyui-layout">

 <form action="maplin.do" id="outputform" method="post">
	<div region="north" title="检索条件" class="st-north" border="false"
		collapsible="false">
		<lable>线路名称:</lable>
		<input type="hidden" id="dname" name="linname" style="width:140px;" > 
		<a class="easyui-linkbutton" onclick="searchDriver()"
			data-options="iconCls:'icon-search'">查询</a>
	</div>
	<div region="center">
		<table id="dg" title="标准线路信息"></table>
	</div>
	<div id="tb">
	</div>
	<input type="hidden" name="method" value="outputstaLine">
	<input type="hidden" id="fieldName" name="fieldName">
	<input type="hidden" id="headtitle" name="headtitle">
</form>

	<div>
		<form id="ad" method="post" action=""></form>
		<form id="xg" method="post" action="">
			<input type="hidden" id="linid" name="linid" value=""> 
		</form>
		<form id="bd" method="post" action="">
			<input type="hidden" id="linids" name="linids" value=""> 
		</form>
	</div>
</body>
</html>