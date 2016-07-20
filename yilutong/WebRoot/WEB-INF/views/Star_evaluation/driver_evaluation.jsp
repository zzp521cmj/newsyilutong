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
<title>司机评价</title>
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
<!-- <script type="text/javascript" src="./js/function.js"></script> -->


</head>
<%
  String flg = (String) request.getAttribute("flg");
 %>
<script type="text/javascript">
  var driverId='<%=flg%>';
	var dialog;
	var grid;
	$(function() {
		grid = $("#dg").datagrid({
			url : 'Driver.do?method=inquire&driverId='+driverId,
			border : false,
			rownumbers : true,
			fit : true,
			singleSelect : false,
			selectOnCheck : true,
			checkOnSelect : true,
			multiSort : true,
			rowStyler: function(index,row){
				if (row.grade!=null && row.ggrade!=""){
					return 'color:red;';
				}
			},	
			columns : [ [ {
				field : 'shiping_order_id',
				checkbox : true
			}, {
				field : 'shiping_order_num',
				title : '运单号',
				width : 70,
				align : 'center'	
			}, {
				field : 'send_station',
				title : '发站',
				width : 100,
				align : 'center'
			}, {
				field : 'end_address',
				title : '到站',
				width : 100,
				align : 'center'
			}, {
				field : 'send_time',
				title : '发车时间',
				width : 100,
				align : 'center',
			}, {
				field : 'goods_name',
				title : '货物名称',
				width : 100,
				align : 'center'
			},{
				field : 'receipt',
				title : '收货人',
				width : 100,
				align : 'center'
			}, {
				field : 'grade',
				title : '调度员评价分数',
				width : 120,
				align : 'center'
			},  {
				field : 'content',
				title : '调度员评价内容',
				width : 120,
				align : 'center',
			}, {
				field : 'bouns',
				title : '调度员评价时间',
				width : 120,
				align : 'center',
			}, {
				field : 'customer_grade',
				title : '发货客户评价分数',
				width : 120,
				align : 'center'
			},  {
				field : 'receiving_grade',
				title : '收货客户评价分数',
				width : 120,
				align : 'center',
			},
			{
				field : 'bounsd',
				title : '评价',
				width : 100,
				align : 'center',
				formatter: function(value,row,index){  				
  				value = "<a href='javascript:void(0)'onclick= 'OrderUpdates(\""+row.shiping_order_id+","+row.grade+"\")'>评价</a>&nbsp";			  					  				
  					return value;
  				}
			},
			] ],
			pagination : true,//分页
			pageSize : 10,
			pageList : [ 5, 10, 15, 20 ],
			toolbar : '#tb'
		});

     
		//查询收货客户
		$("#receipt").select2({
			placeholder : "请输入收货客户名称", //默认文本框显示信息
			minimumInputLength : 1, //最小输入字符长度
			allowClear : true,
			multiple : false, //设置多项选择，false则只能单选
			maximumSelectionSize : 5, //最大选择个数
			query : function(query) {
				$.ajax({
					type : "POST",
					url : "claims_settlement.do?method=inquireName1",
					data : {
						name : query.term
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
						});
						query.callback(data);
					}
				});
			}
		}).on("select2-selecting", function(f) {
			$("#receiptid").val(f.object.id);
			$("#cname").val(f.object.text);
		});

		/*
		 *查询发货客户select2
		 */
		$("#car_number1").select2({
			placeholder : "请输入车牌号", //默认文本框显示信息
			minimumInputLength : 1, //最小输入字符长度
			allowClear : true,
			multiple : false, //设置多项选择，false则只能单选
			maximumSelectionSize : 5, //最大选择个数
			query : function(query) {
				$.ajax({
					type : "POST",
					url : "Driver.do?method=carp",
					data : {
						custom_name : query.term
					}, //传递你输入框中的值
					success : function(msg) {
						var msg = $.parseJSON(msg);
						var data = {
							results : []
						};
						$.each(msg, function(x, y) {
							data.results.push({
								id : y.name,
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

	//查询
	function searchCar_owner() {
		$("#dg").datagrid('load', {
			shiping_order_num : $.trim($("#shiping_order_num").val()),
			grade : $.trim($("#grade").val()),
			bouns : $.trim($("#bouns").val()),
			goods_name : $.trim($("#goods_name").val()),
		});
	}
 
	//删除
	function deleteEver() {
		var checkarray = [];
		var num = 0;
		var array = $('#dg').datagrid('getSelections');
		if (array != "") {
			for ( var i = 0; i < array.length; i++) {
				//checkarray.push(array[i].claimsid);
				if (array[i].grade ==null) {
					checkarray.push(array[i].agreement_id);
				} else {
					num++;
				}
			}
			if (num > 0) {
				$.messager.alert('提示', '您选中的有' + num + '个已经评价不能执行删除！',
						'info', function(r) {

						});
				num = 0;
			} else {
				if (checkarray.length > 0) {
					$.messager
							.confirm(
									'确认',
									'您确定要删除选中的记录吗？',
									function(r) {
										if (r) {
											$
													.ajax({
														url : 'Driver.do?method=deleteTravel',
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
			$.messager.alert("司机评价", "请选择一行信息", "info");
		}
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
		$("#shiping_order_num").val("");
		$("#grade").val("");
		$("#bouns").val("");
		$("#goods_name").val("");
	}
	  //司机评价
  		function OrderUpdates(shiping_order_id){
  		if(shiping_order_id.split(",")[1]=='null'||shiping_order_id.split(",")[1]==''){ //判断星数   (\""+row.agreement_id+","+row.grade+"\")  [0]  [1] 
  			dialog = parent.jy.modalDialog({
			title : '司机评价',
			url : 'Driver.do?method=getclaims&agreement_id='+shiping_order_id.split(",")[0],
			width : 690,
			height:500,
			buttons : [ {
							text : '<input type="button" class="btncss" value="提交"/>',
							handler : function() {
							dialog.find('iframe').get(0).contentWindow
								.submitForm(dialog, grid, parent.$);
								}
							} ]
		});	
		 }else{
		$.messager.alert("司机评价", "不能多次评价", "info");
		} 
  	}
</script>
<body class="easyui-layout">
	<form action="claims_settlement.do" id="outputform" method="post">
      
		<div region="north" title="检索" class="st-north" border="false"
			height="75px" collapsible="false">
			<input type="hidden" id="agreement_id" name="agreement_id">
			<lable>运单号:</lable>
			<input type="text" class="search-text" id="shiping_order_num"
				style="width:120px; margin-right:0px">
			<lable>分数:</lable>
			<select class="combobox" id="grade" name="grade"
				style="width:120px;"
				data-options="panelHeight : 'auto',editable:false">
				<option id="" value="">全部</option>
				<option id="" value="5">5分</option>
				<option id="" value="4">4分</option>
				<option id="" value="3">3分</option>
				<option id="" value="2">2分</option>
				<option id="" value="1">1分</option>
			</select>
			<lable>评价时间:</lable>
			<input id="bouns" class="Wdate" readonly="readonly"
				style="width:120px;height:22px; "
				onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			 <!-- <lable class="divlabel">货物名称:</lable>
			<input type="text" class="search-text" id="goods_name" name="goods_name"
				style="width:128px"> -->
			 
			<a class="easyui-linkbutton" id="" onclick="searchCar_owner()"
				data-options="iconCls:'icon-search'">查询</a> 
				<!--  <a id="btnMoreSearch" class="btn btn-sm btn-link" type="button" style="margin-top:16px;" href="javascript:void(0)" state="close">更多条件</a> -->
			<br>
	</div>
		<div region="center">
			<table id="dg" title="司机评价"></table>
		</div>
		<div id="tb">
           <!--   <a href="javascript:void(0)"
				class="easyui-linkbutton"
				data-options="iconCls:'icon-reset',plain:true" onclick=" deleteEver()">删除</a> -->
				 <a href="javascript:void(0)"
				class="easyui-linkbutton"
				data-options="iconCls:'icon-reset',plain:true" onclick="reset()">清空查询条件</a>
			<div title='已评价' style='height: 16px;background:red;-moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;    float: right;
		    	margin: 5 1%;color: white;
		    padding-left: 10px;
		    padding-right: 10px; '><span>已评价</span></div>
		</div>
		<input type="hidden" name="method" value="exportunqualified">
		<input type="hidden" id="fieldName" name="fieldName"> <input
			type="hidden" id="headtitle" name="headtitle">
	</form>
</body>
</html>
