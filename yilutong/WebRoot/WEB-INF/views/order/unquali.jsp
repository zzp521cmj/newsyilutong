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
    <title>不合格品审核</title>
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
		if(costomersids=='null'||costomersids==''||costomersids==null){
		costomersids='';
		}
		var s;
	  	var dialog;
 		var grid;
 		//显示列表
  		$(function(){
  			grid=$("#dg").datagrid({
  			url : 'inf.do?method=inquire',
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
							     if(row.audit_state==2){
								  return 'color: blue';
								}else if(row.audit_state==1){
								  return 'color: purple';
								}
							},
  			columns : [[
  				{field : 'ck',checkbox : true},
  				{field : 'shiping_order_num',title : '运单号',width : 80,align:'center'},
  				
  				{field : 'send_station',title : '发站',width : 80,align:'center'},
  				{field : 'end_address',title : '到站',width : 80,align:'center'},
  				{field : 'custom_name',title : '发货客户',width : 90,align:'center'},
  				{field : 'receipt',title : '收货客户',width : 80,align:'center'},
  				{field : 'types_id',title : '异常类型',width : 80,align:'center'},
  				{field : 'goods_name',title : '货品名称',width : 90,align:'center'},
  				{field : 'unqualified_number',title : '不合适件数',width : 90,align:'center'},
  				{field : 'send_time',title : '发货时间',width : 120,align:'center',
  					formatter: function(value,row,index){
  				if(value!=undefined){
  				value=value.substr(0,19);
  				}
  					return value;
  				}
               },				 
  				{field : 'responsible_people',title : '负责人',width : 80,align:'center'},
  				{field : 'report_people',title : '上报人姓名',width : 90,align:'center'},
  				{field : 'report_date',title : '上报时间',width : 80,align:'center'},
  				{field : 'audit_state',title : '审核状态',width : 80,align:'center',
  				formatter:function(val,row,index){
  						if(val==0){
  							return "未审核";
  						}else if(val==1){
  							return "审核中";
  						}else if(val==2){
  						return "审核通过";
  						}else if(val==3){
  						return "审核未通过";
  						}
  		            }
  				},
  				{field : 'abnormal_situation',title : '异常情况',width : 80,align:'center'},
  				{field : 'idea',title : '是否被驳回',width : 80,align:'center',
  				 	formatter:function(val,row,index){
  				 	if(val==0){
  				 	 return "否";
  				 	}else if(val==1){
  				 	return "是";
  				 	}
  				  }
  				},
  			]],
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
			$("#report_date").val("");
			$("#report1_date").val("");
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
		$("#carid1").select2({
		    placeholder: "请输入客户名称",	//默认文本框显示信息
		    minimumInputLength: 1,	//最小输入字符长度
		    allowClear:true,
		    multiple: false,				//设置多项选择，false则只能单选
		    maximumSelectionSize: 5, //最大选择个数
			query: function (query) {
		    	$.ajax({
				   type: "POST",
				   url: "inf.do?method=inquireName",
				   data: {name:query.term},   //传递你输入框中的值
				   success: function(msg){
		 		   	var msg=$.parseJSON(msg);		
		 			var data = {results: []};		
					$.each(msg,function(x,y){
						data.results.push({id: y.id, text: y.name});;
					});
			        query.callback(data);
				   }
				});
		    }
		});
		
  	});
 
  
 	//查询的方法
	function select() {
	//var endDate=document.getElementById("endDate").value;
		$("#dg").datagrid('load', {
 
			shiping_order_num : $.trim($("#startDate").val()),
			custom_name : $.trim($("#carid1").val()),
			send_time : $.trim($("#endDate").val()),
			send1_time : $.trim($("#endDate1").val()),
			//send_time : endDate,
			audit_state : $.trim($("#audit_state").val()),
            report_date : $.trim($("#report_date").val()),
			report1_date : $.trim($("#report1_date").val()),
		});
	}
  	
	//重置
	function reset(){
		$("#startDate").val("");
		$("#endDate").val("");
		$("#endDate1").val("");
		$("#audit_state").val("");
		$("#carid1").select2("val",'');
		$("#report_date").val("");
		$("#report1_date").val("");
	}
	//一件审核
	function shenhe(){
		var array = $("#dg").datagrid('getSelections');//获取选中的数据
		var abnormalid1 = [];//生命一个数组
		
		for ( var i = 0; i < array.length; i++) {
			abnormalid1.push(array[i].abnormalid); //注意修改你的id列     把获取到的数据放入数组中
			s=array[i].audit_state;
		}
				
		if(abnormalid1.length==0){
		  $.messager.alert("驳回", "请选择有效数据", "inf");
		}
		else if(array.length==1){
			if(s!=2){
				dialog = parent.jy.modalDialog({
				title : '驳回信息',
				url : 'inf.do?method=getupdate&abnormalid='+abnormalid1,
				width : 720,
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
		  $.messager.alert("驳回", "请选择一条有效数据", "inf");
		  }
		 }else{
		  if(s!=2){
				dialog = parent.jy.modalDialog({
				title : '驳回记录',
				url : 'inf.do?method=duo&abnormalid='+abnormalid1,
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
    	<div region="north" title="检索" class="st-north" border="false" collapsible="false"  height="60px">
	    	<lable>运单编号:</lable>
			<input type="text"  class="search-text"  id="startDate" style="width:128px" >
	    	<lable class="divlabel">发货客户:</lable>
	    	 <input type="text" class="search-text" id="carid1"  style="width:128px"  >
	    	 <lable>发货时间:</lable>
			<input  id="endDate"  class="Wdate"   style="width:128px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
	    	-
	    	<input  id="endDate1"  class="Wdate"   style="width:128px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
	    	<lable class="divlabel">&nbsp;审核状态:</lable>
	    	 <!--  <input type="text"  class="search-text"  id="car_number" style="width:128px" > -->
	    	 <td><select class="combobox"
						name="audit_state" id="audit_state" style="width:150px"
						data-options="panelHeight : 'auto',editable:false">
						    <option id="" value="">全部</option>
				            <option id="" value="1">审核中</option>
							<option id="" value="2">审核通过</option>
					</select>
					</td>
					 
	    	<input type="hidden" style="width:150px" id="carid2"> <a
				class="easyui-linkbutton" onclick="select()">查询</a> 
				<a id="btnMoreSearch"
				class="btn btn-sm btn-link" type="button" style="margin-top:16px;"
				href="javascript:void(0)" state="close">更多条件</a>
				<div id="searchInfoId" style="display: none">
				<lable>上报时间:</lable>
			<input  id="report_date"  class="Wdate"   style="width:128px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
	    	-
	    	<input  id="report1_date"  class="Wdate"   style="width:128px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
				</div>
			</div>
			
    	</div>
    	<div region="center" >
    		<table id="dg" title="不合格商品审核" ></table>
    	</div>
    	<div id="tb">
		 <div title='审核通过' style='height: 16px;background:blue;-moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;    float: right;
		    	margin: 5 1%;color: white;
		    padding-left: 10px;
		    padding-right: 10px; '><span>审核通过</span>
		    </div>
		   <div title='审核中' style='height: 16px;background:purple;-moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;    float: right;
		   margin: 5 1%;color: white;
		    padding-left: 10px;
		    padding-right: 10px; '><span>审核中</span>
		    </div>
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
