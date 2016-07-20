<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	String realPath1 = "http://" + request.getServerName() + ":" + request.getServerPort() +"/surmax/"; 
 %>
 <%@ page import="com.jy.common.SessionInfo" %>
<%@ page import="com.jy.model.User" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>理赔结算审核</title>
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
	<script type="text/javascript" src="./js/function.js"></script><!--命名按钮方法  -->
	
  
  </head>
  <%
  	User user=(User)request.getSession().getAttribute(SessionInfo.SessionName);
   %>
  <script type="text/javascript">
 
  var costomersids='<%=user.getCostomersid()%>';
  var did='<%=user.getDid()%>'
		if(costomersids=='null'||costomersids==''||costomersids==null){
		costomersids='';
		}
		var s;
	  	var dialog;
 		var grid;
 		//显示列表
  		$(function(){
  			grid=$("#dg").datagrid({
  			url : 'claims.do?method=checkQuery&did='+did,
  			border : false,
  			rownumbers : true,
  			fit : true,
  			/* sortName:'transport_pay,check_time,shipping_order',
  			sortOrder:'desc', */
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			multiSort:true,
  		/* 	remoteSort:true, */
  		//颜色
  			  rowStyler:function(index,row){
								if (row.claims_state==0){
										return 'color:blue';
								}else if(row.claims_state==3){
								  return 'color:purple';
								}
							},
  			columns : [ [ {
				field : 'ck',
				checkbox : true
			},{
								field : 'shiping_order_num',
								title : '订单号',
								width : 100,
								align : 'center'
							}, {
								field : 'custom_name',
								title : '发货客户',
								width : 100,
								align : 'center'
							}, {
								field : 'send_shouji',
								title : '发货人联系电话',
								width : 100,
								align : 'center'
				    		},{
								field : 'goods_name',
								title : '货物名称',
								width : 100,
								align : 'center'
							},{
								field : 'receipt',
								title : '收货人',
								width : 100,
								align : 'center'
							},{
								field : 'receipt_phone',
								title : '收货人联系方式',
								width : 100,
								align : 'center'
							},{
								field : 'compensation_payments',
								title : '理赔金',
								width : 70,
								align : 'center'
							}, {
								field : 'claims_state',
								title : '理赔单状态',
								width : 80,
								align : 'center',
								formatter : function(val, row, index) {
									if (val == 0) {
										return "审核通过";
									} else if (val == 1) {
										return "未审核";
									} else if (val == 2) {
										return "审核未通过";
									} else if (val == 3) {
										return "待审核";
									}
								},
							}, {
								field : 'responsible_people',
								title : '理赔操作人',
								width : 80,
								align : 'center',							
							}, {
								field : 'claims_time',
								title : '理赔发起时间',
								width : 120,
								align : 'center',
							}, {
								field : 'damage_intensity',
								title : '事故分析及处理结果',
								width : 80,
								align : 'center'
							}, {
								field : 'audit_opinion',
								title : '审核意见',
								width : 80,
								align : 'center'
							},{
								field : 'arraign_remarks',
								title : '提审备注',
								width : 80,
								align : 'center'
							},{
								field : 'send_station',
								title : '发站',
								width : 100,
								align : 'center'
							},{
								field : 'end_address',
								title : '到站',
								width : 100,
								align : 'center'
							},{
								field : 'goods_num',
								title : '件数',
								width : 100,
								align : 'center'
							},{
								field : 'goods_weight',
								title : '重量',
								width : 100,
								align : 'center'
							},{
								field : 'goods_vol',
								title : '体积',
								width : 100,
								align : 'center'
							},{
								field : 'type',
								title : '付款方式',
								width : 80,
								align : 'center',
								formatter : function(val, row, index) {
									if (val == 0) {
										return "未结算";
									} else if (val == 1) {
										return "现金";
									} else if (val == 2) {
										return "转账";
									}
								},
							},{
								field : 'khbank',
								title : '开户行',
								width : 100,
								align : 'center'
							},{
								field : 'usernames',
								title : '开户名',
								width : 100,
								align : 'center'
							},{
								field : 'kahao',
								title : '银行卡号',
								width : 100,
								align : 'center'
							},

			] ],
  			pagination:true,//分页
		    pageSize:10,
		    pageList:[5,10,15,20],
  			toolbar : '#tb'
  		});
  		
  		
  		//能更多条件
		var btnMoreSearch = $("#btnMoreSearch");
	btnMoreSearch.click(function() {
		 if (btnMoreSearch.attr("state") == "close") {
		 //主要代码 
			$('.easyui-layout').layout('panel', 'north').panel('resize',{height:92});
			$('.easyui-layout').layout('resize');
			btnMoreSearch.text("收起");
			btnMoreSearch.attr("state", "open");
			$("#searchInfoId").css("display","block");
			$("#audit_state").val("");
			$("#startDate1").val("");
			$("#endDate2").val("");
			$("#phone").val("");
			$("#send_adress").val("");
		} else {
			$('.easyui-layout').layout('panel', 'north').panel('resize',{height:60});
			$('.easyui-layout').layout('resize');
			btnMoreSearch.text("更多");
			btnMoreSearch.attr("state", "close");
			$("#searchInfoId").css("display","none");
		}
});
  		$('#cc3').combotree({    
    		url: "depn.do?method=getTree&&id=",    
    		width: 150,
    		onBeforeLoad: function(node, param) {
    		
                if (node == null) {
                    $('#cc3').combotree('tree').tree('options').url = "depn.do?method=getTree&&id=";//加载顶层节点
                } else {
                
                    $('#cc3').combotree('tree').tree('options').url = "depn.do?method=getTree&&id=" + node.id;//加载下层节点
                }
              
               }     
		});
		
		/*
  		select框
  	*/
  	$("#custom_name").select2({
			placeholder : "请输入发货客户名称", //默认文本框显示信息
			minimumInputLength : 1, //最小输入字符长度
			allowClear : true,
			multiple : false, //设置多项选择，false则只能单选
			maximumSelectionSize : 5, //最大选择个数
			query : function(query) {
				$.ajax({
					type : "POST",
					url : "claims.do?method=inquireName",
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
  	});
 	//查询的方法
	function select() {
	
	var custom_name;
	 if($("#custom_name").select2('data')!=null){
	      custom_name=$("#custom_name").select2('data').text;
	    }
		$("#dg").datagrid('load', { 
			numbersid : $.trim($("#numbersid").val()),			
		    custom_name : $.trim(custom_name),
			claims_time : $.trim($("#claims_time").val()),
			claims_endtime : $.trim($("#claims_endtime").val()),
			claims_state : $.trim($("#claims_state").val()),
			receipt : $.trim($("#receipt").val())
		});
	}

	//重置
	function reset(){
		$("#numbersid").val("");
		$("#custom_name").select2("val",'');
		$("#claims_time").val("");
		$("#claims_endtime").val("");
		$("#claims_state").val("");
		$("#receipt").select2("val",'');
		
	}
	//一键审核
	function shenhe(){
		var array = $("#dg").datagrid('getSelections');//获取选中的数据
		var claimsid = [];//生命一个数组
		for ( var i = 0; i < array.length; i++) {
			claimsid.push(array[i].claimsid); //注意修改你的id列     把获取到的数据放入数组中
			s=array[i].claims_state;
		}	
		 if(claimsid.length==0){
		   $.messager.alert("审核", "请选择有效数据", "inf");
		 } 
		 else if(array.length==1){
			if(s!=0){
				dialog = parent.jy.modalDialog({
				title : '审核信息',
				url : 'claims.do?method=getupdate&claimsid='+claimsid,
				width : 700,
				height: 400,
				buttons : [ {
				text : '<input type="button" class="btncss" value="通过"> ',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow
								.submitFormtongguo(dialog, grid, parent.$);
					}
				},{				
					text : ' <input type="button" class="btncss" value="驳回" style="margin-left: 15px;"> ',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow
								.submitFormEdit(dialog, grid, parent.$);
					}
				} ]
			});
		  }else{
		  $.messager.alert("审核", "请选择一条有效数据", "inf");
		  }
		 }else{
		  if(s!=0){
				dialog = parent.jy.modalDialog({
				title : '审核信息',
				url : 'claims.do?method=duo&claimsid='+claimsid,
				width : 420,
				height: 200,
				buttons : [ {
				text : '<input type="button" onclick="shenhe()" class="btncss" value="通过"> ',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow
								.submitFormtongguo(dialog, grid, parent.$);
					}
				},{				
					text : ' <input type="button" onclick="bohui()" class="btncss" value="驳回" style="margin-left: 15px;"> ',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow
								.submitFormEdit(dialog, grid, parent.$);
					}
				} ]
			});
		  }else{
		  $.messager.alert("驳回", "请选择有效的数据", "inf");
		  } 
		 }
		 }
		
	

  </script>
  <body class="easyui-layout">
  	<form action="shipOrder.do" id="outputform" method="post">
  	<input type="hidden" id="claimsid" name="claimsid">
    	<div region="north" title="检索" class="st-north" border="false" collapsible="false"  height="60px">
	    	<lable>订单编号:</lable>
			<input type="text"  class="search-text"  id="numbersid" style="width:128px" >
	    	<lable class="divlabel">发货客户:</lable>
	    	 <input type="text" class="search-text" id="custom_name"  style="width:128px"  >
	    	 <lable>理赔发起时间:</lable>
			<input id="claims_time" class="Wdate" readonly="readonly"
				style="width:120px;height:22px; "
				onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			- <input id="claims_endtime" class="Wdate" readonly="readonly"
				style="width:120px;height:22px;"
				onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
	    	<input type="hidden" style="width:150px" id="carid2"> <a
				class="easyui-linkbutton" onclick="select()">查询</a> 
			  <a id="btnMoreSearch" class="btn btn-sm btn-link" type="button" style="margin-top:16px;" href="javascript:void(0)" state="close">更多条件</a>
			<br>
			<div id="searchInfoId" style="display: none">
			<lable>审核状态:</lable>
	    	 <select class="combobox"
						name="claims_state" id="claims_state" style="width:130px"
						data-options="panelHeight : 'auto',editable:false">
						    <option id="" value="">全部</option>
				            <option id="" value="1">未审核</option>
							<option id="" value="0">审核通过</option>
							<option id="" value="2">审核未通过</option>
							<option id="" value="3">待审核</option>
					</select>
					</td>
			<lable class="divlabel">收货客户:</lable>
			<input type="text" class="search-text" id="receipt" name="receipt" style="width:130px">
		</div>
			</div>
			
    	</div>
    	<div region="center" >
    		<table id="dg" title="理赔结算审核" ></table>
    		
    	</div>
    	<div id="tb">
		    <div title='审核通过' style='height: 16px;background:blue;-moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;    float: right;
		    	margin: 5 1%;color: white;
		    padding-left: 10px;
		    padding-right: 10px; '><span>审核通过</span></div>
		    <div title='待审核' style='height: 16px;background:purple;-moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;    float: right;
		    	margin: 5 1%;color: white;
		    padding-left: 10px;
		    padding-right: 10px; '><span>待审核</span></div>
		</div>	
		<input type="hidden" name="method" value="outShipOrder">
		<input type="hidden" id="customid" name="customid">
		<input type="hidden" id="custom_name1" name="custom_name1">
		</form>
		 <form action="shipOrder.do" target="_blank" id="printywm" method="post">
		 	<input type="hidden" name="method" value="getShipOrderPrintYwm">
		 	<input type="hidden" id="checkarray" name="checkarray">
		 </form>
  </body>
</html>

