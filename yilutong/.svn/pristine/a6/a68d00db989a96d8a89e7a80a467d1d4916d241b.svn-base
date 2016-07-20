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
<title>异常产品上报</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">


<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
<script type="text/javascript" src="./js/select2/select2.js"></script>

	<script type="text/javascript" src="./js/select2/select2_locale_zh-CN.js"></script>
<script type="text/javascript" src="./js/function.js"></script>
</head>
<script type="text/javascript">
	var dialog;
	var grid;
	
			//回车查询
  		document.onkeydown = function(event) {
			e = event ? event : (window.event ? window.event : null);
			if (e.keyCode == 13) {
				//执行的方法 
				searchCar_owner();
			}
		};
	$(function() {
		grid = $("#dg").datagrid({
			url : 'unqualified.do?method=selectunqualifieds',
			border : false,
			rownumbers : true,
			fit : true,
			singleSelect : false,
			selectOnCheck : true,
			checkOnSelect : true,
			multiSort : true,
			
           onDblClickRow:function(rowIndex, rowData){
				  			var pid=rowData.abnormalid;
							dialog = parent.jy.modalDialog({
									title : '不合格品查看',
									url : 'unqualified.do?method=skip&abnormalid='+pid,
						/* 				 buttons :'#addbuttons'
						*/
									width : 1200,
									heght: 700,
									buttons : [{
										handler : function() {
											dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$);
										}
									}] 
								}); 		
  				},
  				rowStyler:function(index,row){
								if (row.audit_state==0){
										return 'color:black';
								}else if(row.audit_state==1){
								  return 'color: purple';
								}else if(row.audit_state==2){
								  return 'color: blue';
								}else if(row.audit_state==3){
								  return 'color: red';
								}
							},
			columns : [ [ {
				field : 'ck',
				checkbox : true
			}, {
				field : 'shiping_order_num',
				title : '运单号',
				width : 100,
				align : 'center'
			}, {
				field : 'goods_name',
				title : '货品名称',
				width : 100,
				align : 'center'
			}, {
				field : 'types_id',
				title : '异常类型',
				width : 110,
				align : 'center'
			}, {
				field : 'unqualified_number',
				title : '不合格件数',
				width : 80,
				align : 'center'
			}, {
				field : 'report_date',
				title : '上报时间',
				width : 140,
				align : 'center'
			}, {
				field : 'report_people',
				title : '上报人',
				width : 90,
				align : 'center'
			}, {
				field : 'audit_state',
				title : '审核标志',
				width : 80,
				align : 'center',
				formatter : function(val, row, index) {
					if (val == 0) {
						return "未审核";
					} else if (val == 1) {
						return "审核中";
					} else if (val == 2) {
						return "审核通过";
					} else if (val == 3) {
						return "审核未通过";
					}
				}
				},
		{
				field : 'documents_state',
				title : '单据状态',
				width : 120,
				align : 'center',
				formatter : function(val, row, index) {
					if (val == 0) {
						return "已提交";
					} else if (val == 1) {
						return "未提交";
					}
				},

			}, 

			{field : 'submission_time',title : '提交日期',width : 140,align:'center',
				formatter : function(val, row, index) {
					if (val == null) {
						return "未提交";
					} else {		
									return val;
					}
				},},

			] ],
			pagination : true,//分页
			pageSize : 10,
			pageList : [ 5, 10, 15, 20 ],
			toolbar : '#tb'
		});

	//能更多条件
		var btnMoreSearch = $("#btnMoreSearch");
	btnMoreSearch.click(function() {
		 if (btnMoreSearch.attr("state") == "close") {
		 //主要代码 
			$('.easyui-layout').layout('panel', 'north').panel('resize',{height:92});
			$('.easyui-layout').layout('resize');
			btnMoreSearch.text("收起条件");
			btnMoreSearch.attr("state", "open");
			$("#searchInfoId").css("display","block");
			$("#auditsign").combobox("setValue",""); 
			$("#auditsign").combobox("setText","全部");
			$("#documents_state").combobox("setValue",""); 
			$("#documents_state").combobox("setText","全部"); 
			
		} else {
			$('.easyui-layout').layout('panel', 'north').panel('resize',{height:60});
			$('.easyui-layout').layout('resize');
			btnMoreSearch.text("更多条件");
			btnMoreSearch.attr("state", "close");
			$("#searchInfoId").css("display","none");
		}
});
	});		
  	
	//查询
	function searchCar_owner() {
		var reportedfrontdate = document.getElementById("reportedfrontdate").value;
		var reportedqueendate = document.getElementById("reportedqueendate").value;
		var submitfrontdate = document.getElementById("submitfrontdate").value;
		var submintdqueendate = document.getElementById("submintdqueendate").value;
		$("#dg").datagrid(
				'load',
				{
					reportedfrontdate : reportedfrontdate, //上报时间
					reportedqueendate : reportedqueendate,
					submitfrontdate : submitfrontdate, //提交时间
					submintdqueendate : submintdqueendate,
					shiping_order_num : $.trim($("#shiping_order_num").val()),//运单号

					auditsign : $.trim($("#auditsign").combobox('getValue')),//审核状态
				
				});

	}
	//货物到达接收
	function isArrive(orderId) {
		var checkarray = [];
		var array = $('#dg').datagrid('getSelections');
		for ( var i = 0; i < array.length; i++) {
			checkarray.push(array[i].shiping_order_id);
			/*  if(array[i].shipping_order_state==0){
				checkarray.push(array[i].shiping_order_id);
				}else{
					$.messager.confirm('提示','您选中的运单号'+array[i].shiping_order_num+'不能执行删除！')
				} */
		}
		if (array != "") {
			$.messager.confirm('确认', '您确定要处理选中的记录吗？', function(r) {
				if (r) {
					$.ajax({
						url : "shipManual.do?method=isArrive",
						type : "POST",
						data : {
							del : checkarray.join(",")
						},
						success : function(data) {
							if (data.flag) {
								parent.$.messager.alert("上报信息", "上报信息到达 ",
										'info', function(r) {
											$('#dg').datagrid('reload');
										});
							}
						}
					});
				}
			});
		} else {
			$.messager.alert("产品上报", "请选择一行信息", "info");
		}
	}

	//删除
	function deleteEver() {
		var checkarray = [];
		var num = 0;
		var array = $('#dg').datagrid('getSelections');
		if (array != "") {
			for ( var i = 0; i < array.length; i++) {
				//checkarray.push(array[i].shiping_order_id);
				if (array[i].documents_state == 1) {
					checkarray.push(array[i].abnormalid);
				} else {
					num++;
				}
			}
			if (num > 0) {
				$.messager.alert('提示', '您选中的运单有' + num + '个已经提交不能执行删除！',
						'info', function(r) {

						});
				num = 0;
			} else {
				if (checkarray.length > 0) {
					$.messager
							.confirm(
									'确认',
									'您确定要删除选中未提交的记录吗？',
									function(r) {
										if (r) {
											$
													.ajax({
														url : "unqualified.do?method=deleteunqualifieds",
														type : "POST",
														data : {
															del : checkarray
																	.join(",")
														},
														success : function(data) {
															if (data.flag) {
																parent.$.messager
																		.alert(
																				"信息删除",
																				"信息删除成功",
																				'info',
																				function(
																						r) {
																					$(
																							'#dg')
																							.datagrid(
																									'reload');
																				});
															}
														}
													});
										}
									});
				}
			}

		} else {
			$.messager.alert("产品上报", "请选择一行信息", "info");
		}
	}

	//提交
	function tijiao() {
		var a=0;
  		var ids=[];
  		var row=$("#dg").datagrid('getSelections');

  			if (row.length > 0) {

			for ( var i = 0; i < row.length; i++) {
				if (row[i].documents_state == 0 ) {
				a=a+1;
				}else{
					ids.push(row[i].abnormalid);
					
			}	
			}
			if(a>0){
				$.messager.confirm('提示', '您选中的运单中有'	+a+ '条，已提交，不能再次提交！');
				}else{

	  			dialog = parent.jy.modalDialog({
				title : '上报提审',
				url : 'unqualified.do?method=shSettlement&pid=' + ids.join(","),
				width :450,
				height:300,
				buttons : [{
					text : '<input type="button" class="btncss" value="确定"/>',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
					}
				}] 
			});
			
	}
	}
		else{
				$.messager.alert("提交", "请至少选择一行信息", "info");
			}	
	}
	/*
	修改查询 
	 */
	function modify() {
		var row = $("#dg").datagrid('getSelections');
		if (row.length == 1) {
			for ( var i = 0; i < row.length; i++) {
				if (row[i].documents_state == 1) {
					var pid = row[i].abnormalid;
					dialog = parent.jy
							.modalDialog({
								title : '上报修改',
								url : 'unqualified.do?method=getupdateunqualified&pid='
										+ pid,
								id : 'companys',
								width : 680,
								
								buttons : [ {
									text : '<input type="button" class="btncss" value="修改"/>',
									handler : function() {
										dialog.find('iframe').get(0).contentWindow
												.submitForm(dialog, grid,
														parent.$);
									}
								} ]
							});
				} else {
					$.messager.confirm('提示', '您选中的运单号'
							+ row[i].shiping_order_num + '，已提交，不能执行修改！');
				}
			}
		} else {
			$.messager.alert("修改", "请选择一行信息", "info");
		}
	}
	//详情查询
	function xiangxixinxi() {
		var row = $("#dg").datagrid('getSelections');
		if (row.length == 1) {
			for ( var i = 0; i < row.length; i++) {
				var id = row[i].shiping_order_id;
			}
			dialog = parent.jy.modalDialog({
				title : '运单详情',
				url : 'shipManual.do?method=getShipManualPage&pid=' + id,
				width : 680,
				buttons : [ {
					handler : function() {
						dialog.find('iframe').get(0).contentWindow
								.submitFormEdit(dialog, grid, parent.$);
					}
				} ]
			});
		} else {
			$.messager.alert("产品上报", "请选择一行信息", "info");
		}
	}
	//修改
	function updateUser() {
		var myform = document.forms[1];
		myform.action = "car_owner.do?method=updateCar_owner";
		myform.submit();
	}

	//导出
	function putoutfile() {
			var checkarray=[];
		var allRows2 = $("#dg").datagrid("getColumnFields");
		var array = $('#dg').datagrid("getSelections");
		var colName = [];
		var fieldName = [];
		
			if(array != ""){
  		for(var i=0;i<array.length;i++){
  			checkarray.push(array[i].abnormalid);
  			}
  			}		
		for (i = 1; i < allRows2.length; i++) {
			var col = $('#dg').datagrid("getColumnOption", allRows2[i]);
			if (col.field != "check_type" && col.field != "send_type"
					&& col.field != "shipping_order_state") {
				colName.push(col.title);//把title列名到数组里去 
				fieldName.push(col.field); //把field列属性名到数组里去 
			}
		}
		$("#fieldName").val(fieldName.join(","));
		$("#headtitle").val(colName.join(","));
		 $("#checkarray").val(checkarray.join(","));		
		var outputform = $("#outputform");		
		outputform.submit();
}
	function add() {
		/* alert(document.getElementById("addbuttons"));
		alert(document.getElementById("upbuttons")); */
		dialog = parent.jy.modalDialog({
			title : '上报新增',
			url : 'unqualified.do?method=unqualifiedadd',
			/* 				 buttons :'#addbuttons'
			 */
			 id : 'companys',
			width : 780,
			hight:700,
			buttons : [ {
				text : '<input type="button" class="btncss" value="保存"/>',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(
							dialog, grid, parent.$);
				}
			} ]
		});
	};
	//打印
	function dy() {
		var row = $("#dg").datagrid('getSelections');
		if (row.length == 1) {
			for ( var i = 0; i < row.length; i++) {
				var pid = row[i].shiping_order_id;
			}
			var url = "shipManual.do?method=getShipManualPrint&pid=" + pid;
			ow(url);
		} else {
			$.messager.alert("产品上报", "请选择一行信息", "info");
		}

	}
	function ow(owurl) {
		var tmp = window.open("about:blank", "", "fullscreen=1");
		tmp.moveTo(0, 0);
		tmp.resizeTo(screen.width + 20, screen.height);
		tmp.focus();
		tmp.location = owurl;
	}
	//导入
	function putintfile() {
		dialog = parent.jy.modalDialog({
			title : '导入运单',
			url : 'shipManual.do?method=imp',
			width : 600,
			height : 300,
			buttons : [ {
				text : '<input type="button" value="导入" class="btncss">',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(
							dialog, grid, parent.$);
				}
			} ]
		});
	};
	//重置
	function reset() {
		$("#reportedfrontdate").val("");
		$("#reportedqueendate").val("");
		$("#submitfrontdate").val("");
		$("#submintdqueendate").val("");
		$("#shiping_order_num").val("");
		$("#auditsign").combobox("setValue",""); 
		$("#auditsign").combobox("setText","全部"); 

	}
	//一维打印
	function printYWM() {
		var row = $("#dg").datagrid('getSelections');
		if (row.length >= 1) {
			var checkarray = [];
			var array = $('#dg').datagrid('getSelections');
			for ( var i = 0; i < array.length; i++) {
				checkarray.push(array[i].shiping_order_num);
			}
			$("#checkarray").val(checkarray.join(","));
			$("#printywm").submit();
		} else {
			$.messager.alert("产品上报", "请选择一行信息", "info");
		}
	}
</script>
<body class="easyui-layout">
	<form action="unqualified.do" id="outputform" method="post">
		<div region="north" title="检索" class="st-north" border="false"
		collapsible="false">
			<lable>上报时间:</lable>
			<input id="reportedfrontdate" class="Wdate" readonly="readonly"
				style="width:120px;height:22px;" name="reportedfrontdate"
				onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			- <input id="reportedqueendate" class="Wdate" readonly="readonly"
				style="width:120px;height:22px;" name="reportedqueendate"
				onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			<lable>提交时间:</lable>
			<input id="submitfrontdate" class="Wdate" readonly="readonly"
				style="width:120px;height:22px; " name="submitfrontdate"
				onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			- <input id="submintdqueendate" class="Wdate" readonly="readonly"
				style="width:120px;height:22px;" name="submintdqueendate"
				onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />


			<lable>运单编号:</lable>
			<input type="text" class="search-text" id="shiping_order_num" name="shiping_order_num"
				style="width:120px; margin-right:0px"> <a
				class="easyui-linkbutton" id="" onclick="searchCar_owner()"
				data-options="iconCls:'icon-search'">查询</a> 
		 <a id="btnMoreSearch" class="btn btn-sm btn-link" type="button" style="margin-top:16px;" href="javascript:void(0)" state="close">更多条件</a><br/>
	    	  <div id="searchInfoId" style="display: none" >	 
			<lable>审核标志:</lable>
			<select class="easyui-combobox" id="auditsign" name="auditsign"  style="width:130px;height:22px"  data-options="panelHeight : 'auto',editable:false">
				<option id="" value="">全部</option>
				<option id="" value="0">未审核</option>
				<option id="" value="1">审核中</option>
				<option id="" value="2">审核通过</option>
				<option id="" value="3">审核未通过</option>
			</select>
		</div> 
		</div>
		<div region="center">
			<table id="dg" title="异常上报信息"></table>
		</div>
		<div id="tb">		
			
<!-- 			<a href="javascript:void(0)" class="easyui-linkbutton"	data-options="iconCls:'icon-add',plain:true" onclick="add()"> 添加</a>


			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true"	onclick="deleteEver()">删除</a> 
			<a href="javascript:void(0)" class="easyui-linkbutton" id="getUpdateCar_owner"	data-options="iconCls:'icon-edit',plain:true" onclick="modify()">修改</a>

			<a href="javascript:void(0)" class="easyui-linkbutton" id="outputCar_owner" data-options="iconCls:'icon-output',plain:true" onclick="putoutfile()">导出</a> -->
				<!-- 					   <a href="javascript:void(0)" class="easyui-linkbutton"	data-options="iconCls:'icon-remove',plain:true" onclick="tijiao()">提交</a> -->
<!-- 			 <a href="javascript:void(0)" class="easyui-linkbutton" id="outputCar_owner" data-options="iconCls:'icon-output',plain:true" onclick="putgouxuan()">勾选导出</a> -->
<!-- 	      <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reset',plain:true"onclick="reset()">重置</a> -->
		<!--  <a href="javascript:void(0)"	class="easyui-linkbutton" data-options="iconCls:'icon-input',plain:true" onclick="isArrive()" id="tbru" >到达</a>
	      <a href="javascript:void(0)" class="easyui-linkbutton" id="outputCar_owner" data-options="iconCls:'icon-output',plain:true" onclick="isNotArrive()">取消到达</a>

		  <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reset',plain:true"onclick=" dy()">打印</a>		   	   -->
		   <div title='审核未通过' style='height: 16px;background:red;-moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;    float: right;
		    	margin: 5 1%;color: white;
		    padding-left: 10px;
		    padding-right: 10px; '><span>审核未通过</span></div>
		    <div title='审核通过' style='height: 16px;background:blue;-moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;    float: right;
		    	margin: 5 1%;color: white;
		    padding-left: 10px;
		    padding-right: 10px; '><span>审核通过</span></div>
		    <div title='待审核' style='height: 16px;background:purple;-moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;    float: right;
		    	margin: 5 1%;color: white;
		    padding-left: 10px;
		    padding-right: 10px; '><span>审核中</span></div>
		  <div title='未审核' style='height: 16px;background:black;-moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;    float: right;
		    	margin: 5 1%;color: white;
		    padding-left: 10px;
		    padding-right: 10px; '><span>未审核</span></div>
		</div>
			<input type="hidden" name="method"  value="outShipunqualified"> 
			<input type="hidden" id="fieldName" name="fieldName"> 
			<input type="hidden" id="headtitle" name="headtitle">
			 <input type="hidden" id="checkarray" name="checkarray">
	</form>
	
</body>
</html>