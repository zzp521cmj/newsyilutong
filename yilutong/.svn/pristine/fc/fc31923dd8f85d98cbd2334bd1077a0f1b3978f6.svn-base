<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/btntaglib" prefix="ls"%>

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
    <title>客户车辆管理</title>
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
  
  </head>
  <%
  String function="";
   User user=(User)request.getSession().getAttribute(SessionInfo.SessionName);
   if(request.getAttribute("function")!=null){
   		function=request.getAttribute("function").toString();
   }
   %>
  <script type="text/javascript">
  var costomersids='<%=user.getCostomersid()%>';
  var functions='<%=function%>';
		if(costomersids=='null'||costomersids==''||costomersids==null){
		costomersids='';
		}
	  	var dialog;
 		var grid;
  		$(function(){
  			grid=$("#dg").datagrid({
  			url : 'orderC.do?method=getOrderCustom&costomersid='+costomersids,
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
  			rowStyler:function(index,row){
								if (row.is_arrived==1){
										return 'color:blue;';
								}
							},
  			
  			onDblClickRow:function(rowIndex, rowData){
				  			var pid=rowData.custom_id;
							dialog = parent.jy.modalDialog({
									title : '运单查看',
									url : 'orderC.do?method=getShipOrderInfo&pid='+pid+'&functions='+functions,
						/* 				 buttons :'#addbuttons'
						*/			width : 1200,
									heght: 700,
									buttons : [{
										handler : function() {
											dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$);
										}
									}] 
								}); 		
  				},
  			columns : [[
  				{field : 'ck',checkbox : true},
  				{field : 'custom_name',title : '客户名称',width : 80,align:'center'},
  				{field : 'car_time',title : '客户发车车次',width : 90,align:'center'},
  				{field : 'send_station',title : '发站',width : 80,align:'center'},
  				{field : 'car_type',title : '大车车型',width : 90,align:'center'},
  				{field : 'car_number',title : '车牌号',width : 80,align:'center'},
  				{field : 'driver_name',title : '司机姓名',width : 80,align:'center'},
  				{field : 'driver_phone',title : '电话',width : 90,align:'center'},
  				{field : 'send_time',title : '发车日期',width : 125,align:'center',
  					formatter: function(value,row,index){
  				if(value!=undefined){
  				value=value.substr(0,19);
  				}
  					return value;
  				} 				 
  				},
  				{field : 'receipt_time',title : '到车日期',width : 125,align:'center',
  					formatter: function(value,row,index){
  				if(value!=undefined){
  				value=value.substr(0,19);
  				}
  					return value;
  				} 				 
  				
  				/* sortable: true */},
  				 {field : 'customer_grade',title : '客户层级',width : 90,align:'center',
  				formatter:function(val,row,index){
  						if(val==0){
  							return "散货";
  						}else if(val==1){
  						    return "大宗";
  						}else if(val==2){
  						    return "项目落仓";
  						}
  					}	
  				},/**
  				{field : 'send_type',title : '送货方式',width : 70,align:'center',
  				formatter:function(val,row,index){
  						if(val==0){
  							return "自提";
  						}else if(val==1){
  						return "送货";
  						}
  					}
  				},
  				{field : 'shipping_order_state',title : '状态',width : 50,align:'center',
  					formatter:function(val,row,index){
  						if(val==0){
  							return "未出库";
  						}else if(val==1){
  							return "已出库";
  						}else if(val==2){
  						return "到达";
  						}else if(val==3){
  						return "签收";
  						}
  					}	
  				},  */

  				{field : 'adorn_fee2',title : '应付装卸费',width : 80,align:'center',
  				formatter:function(val,row,index){ 			
  						if(row.uid==null||row.uid==''){
  							return val;
  						}else if(row.uid!=null){
  							return " ";
  						}
  					}
  				},
  				{field : 'born_fee',title : '应收落地费',width : 80,align:'center'},
  				{field : 'car_remarks',title : '大车备注',width : 90,align:'center'},
  				//{field : 'updateDate',title : '更新日期',width : 80,align:'center'},
  				
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
			$("#car_number").val("");
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
  	//回车查询事件
  		document.onkeydown = function(event) {
			e = event ? event : (window.event ? window.event : null);
			if (e.keyCode == 13) {
				//执行的方法 
				searchCar_owner();
			}
		};
		$("#ddId").select2({
		    placeholder: "请输入客户名称",	//默认文本框显示信息
		    minimumInputLength: 1,	//最小输入字符长度
		    allowClear:true,
		    multiple: false,				//设置多项选择，false则只能单选
		    maximumSelectionSize: 5, //最大选择个数
			query: function (query) {
		    	$.ajax({
				   type: "POST",
				   url: "orderC.do?method=getCustomer",
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
		$("#is_arrive").combobox('setValue',"");
			$("#is_arrive").combobox('setText',"请选择");
  	});
  		
  	//查询
  	function searchCar_owner(){
  		var startDate=document.getElementById("startDate").value;
  		var endDate=document.getElementById("endDate").value;
  		var startDate1=document.getElementById("startDate1").value;
  		var endDate2=document.getElementById("endDate2").value;
  		var is_arrive= document.getElementById("is_arrive").value;
  		/* if($.trim($("#phone").select2("data"))!=""){
  		phone=$.trim($("#phone").select2("data").text);
  			} */
  		$("#dg").datagrid('load',{
  				start_date :startDate,
	 	 		end_date :endDate,
	 	 		start_date1 :startDate1,
	 	 		end_date2 :endDate2,
	 	 /* 		name:$.trim($("#ddId").val()), */
	 			 phone:$.trim($("#phone").val()),
	 	 		send_address:$.trim($("#send_adress").val()),//发站
  				//institution:$.trim($("#cc3").combotree("getValue")),
  				type:$.trim($("#driver_name").val()),//到站
	 	 		car_number:$.trim($("#car_number").val()),
  				//institution:$.trim($("#cc3").combotree("getValue")),
  				 name:$.trim($("#ddId").select2("val")),
  			     is_arrive:is_arrive/* $.trim($("#is_arrive").combobox('getValue')) */
	 	});	  
	 	
  	}
  	//删除
  	function deleteEver(){
  		var checkarray=[];
	 	var array = $('#dg').datagrid('getSelections');
  		for(var i=0;i<array.length;i++){
  			checkarray.push(array[i].custom_id);
  			}
	  		/* if(array[i].shipping_order_state=0){
	  			checkarray.push(array[i].shiping_order_id);
	  			}else{
	  				$.messager.confirm('提示','您选中的运单号'+array[i].shiping_order_num+'不能执行删除！')
	  			}*/
  		if(array != ""){
  			$.ajax({
						url: "orderC.do?method=OrderMsgNum",
						type: "POST",
						data:{del:checkarray.join(",")},
			  				success:function(data){
			  					if (data.flag) {
									parent.$.messager.confirm("信息删除","选择客户车辆下有运单信息，确定要删除？",
										function(r) {
										if(r){
												$.ajax({
												url: "orderC.do?method=deleteOrderCustom",
												type: "POST",
												data:{del:checkarray.join(",")},
									  				success:function(data){
									  					if (data.flag) {
															parent.$.messager.alert("信息删除","客户车辆信息删除成功",'info',
																function(r) {
																	$('#dg').datagrid('reload');
						 										});
						  								} 
						  						}
											});											
										}		
										});
										}else{
											$.messager.confirm('确认','您确定要删除选中的记录吗？',function(r){ 
									    			if (r){ 
									    				$.ajax({
															url: "orderC.do?method=deleteOrderCustom",
															type: "POST",
															data:{del:checkarray.join(",")},
												  				success:function(data){
												  					if (data.flag) {
																		parent.$.messager.alert("信息删除","客户车辆信息删除成功",'info',
																			function(r) {
																				$('#dg').datagrid('reload');
									 										});
									  								} 
									  						}
														});
													}  			
									  			});
										}
									}
								});	
  		}else{
  			$.messager.alert("信息删除","请选择一行信息","info");	
  		}
  	}
  	
  	/*
  	修改查询 
  	*/
  	function modify(){
  		var row=$("#dg").datagrid('getSelections');
  			if(row.length==1){
	  			for(var i=0;i<row.length;i++){
		  			var id=row[i].custom_id;
		  		}		
	  			dialog = parent.jy.modalDialog({
				title : '修改信息',
				url : 'orderC.do?method=getEditorderCustom&pid=' + id,
				width : 680,
				buttons : [{
					text : '<input type="button" class="btncss" value="修改"/>',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
					}
				}] 
			});
  		}else{
  			$.messager.alert("修改信息","请选择一行信息","info");	
  		}	
  	}
  
  	//修改
  	function updateUser(){
	 var myform=document.forms[1];
  	 myform.action="car_owner.do?method=updateCar_owner";
  	 myform.submit();
	
	}
  	
  	//导出
  		function putoutfile(){
	    var row = $("#dg").datagrid('getSelections');
	   var checkarray=[];
	   for(var i = 0;i<row.length;i++){
	        checkarray.push(row[i].custom_id);
	        
	   }
	   
	    if(row.length==0){
	      $.messager.alert("用户管理","请选择一行信息","info");	
	      return;
	    }
	    $("#customid").val(row[0].custom_id);
  		$("#custom_name1").val(row[0].custom_name);
  		$("#checkarray").val(checkarray.join(","));
  		var outputform=$("#outputform");
  		outputform.submit(); 
		
  	}
  	
  	//查看订单
  	function searchMsg() {
  			var row=$("#dg").datagrid('getSelections');
  			if(row.length==1){
  			
	  			for(var i=0;i<row.length;i++){
		  			var pid=row[i].custom_id;
		  		}
		  			dialog = parent.jy.modalDialog({
							title : '导入运单',
							url : 'orderC.do?method=imp&pid='+pid,
							width : 600,
							height: 300,
							buttons : [{
								text : '<input type="button" value="导入" class="btncss">',
								handler : function() {
									dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$);
								}
							}] 
						});
		  		}else{
		  		$.messager.alert("运单导入","请选择一行信息","info");	
		  		}		
	};
 	function add() {
		 /* alert(document.getElementById("addbuttons"));
		 alert(document.getElementById("upbuttons")); */
		dialog = parent.jy.modalDialog({
			title : '新增信息',
			url : 'orderC.do?method=addOrderCustom',
/* 				 buttons :'#addbuttons'
*/
			width : 680,
			buttons : [{
				text : '<input type="button" class="btncss" value="保存"/>',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$);
				}
			}] 
		});
	};
 
  	//导入
  	function putintfile() {
  				var row=$("#dg").datagrid('getSelections');
  			if(row.length==1){
	  			for(var i=0;i<row.length;i++){
		  			var pid=row[i].custom_id;
		  		}
		  			dialog = parent.jy.modalDialog({
							title : '导入运单',
							url : 'orderC.do?method=imp&pid='+pid,
							width : 600,
							height: 300,
							buttons : [{
								text : '<input type="button" value="导入" class="btncss">',
								handler : function() {
									dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$);
								}
							}] 
						});
		  		}else{
		  		$.messager.alert("运单导入","请选择一行信息","info");	
		  		}		
	};
	//重置
	function reset(){
		$("#startDate").val("");
		$("#endDate").val("");
		$("#startDate1").val("");
		$("#endDate2").val("");
		$("#car_number").val("");
		$("#ddId").select2("val",'');
		$("#phone").val("");
		$("#driver_name").val("");
		$("#send_adress").val("");
		$("#is_arrive").val("");
	}

  </script>
  <body class="easyui-layout">
  	<form action="shipOrder.do" id="outputform" method="post">
    	<div region="north" title="检索" class="st-north" border="false" collapsible="false"  height="60px">
	    	<lable>发车日期:</lable>
			<input  id="startDate"  class="Wdate"  readonly="readonly" style="width:128px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			-
			<input id="endDate"  class="Wdate"  readonly="readonly" style="width:128px;height:22px;" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
	    	<lable class="divlabel">客户名称:</lable>
	    	 <input type="text" class="search-text" id="ddId"  style="width:128px"  >
	    	 <lable class="divlabel">司机姓名:</lable>
			<input type="text" class="search-text" id="driver_name" style="width:128px">
			 <lable>到 达:</lable>
			<select id='is_arrive' class="combobox" name="gender" style="width:128px;height:22px"
						 data-options="panelHeight : 'auto',editable:false">
							<option  value="">请选择</option>
							<option  value="1">到达</option>
							<option  value="0">未到达</option>
					</select>
	    	 <a class="easyui-linkbutton" onclick="searchCar_owner()" data-options="iconCls:'icon-search'"  style="margin-left: 5px">查询</a>	
	    	 <a id="btnMoreSearch" class="btn btn-sm btn-link" type="button" style="margin-top:16px;" href="javascript:void(0)" state="close">更多</a>
	    	 
	    	 <div id="searchInfoId" style="display: none">
	    	 <lable>到车日期:</lable>
			<input  id="startDate1"  class="Wdate"  readonly="readonly" style="width:128px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			-
			<input id="endDate2"  class="Wdate"  readonly="readonly" style="width:128px;height:22px;" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
	    	<lable class="divlabel">&nbsp;车牌号:</lable>
	    	<input type="text"  class="search-text"  id="car_number" style="width:128px" >
			<!--<lable>所属机构:</lable>
			<input id="cc3" name="did">-->
			<lable >发&nbsp;站:</lable>
	    	<input type="text"  class="search-text" id="send_adress" style="width:128px" >
	    	<lable >电&nbsp;话:</lable>
	    	<input type="text"  class="search-text"   id="phone" style="width:128px" >
			</div>
    	</div>
    	<div region="center" >
    		<table id="dg" title="客户车辆信息" ></table>
    		
    	</div>
    	<div id="tb">
    		<ls:ButtonRole	menu_id="${param.menu_id}"/>
    		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reset',plain:true" onclick="reset()">重置</a>	   
    		
    		<div title='车辆到达' style='height: 16px;background:blue;-moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;    float: right;
		    	margin: 5 1%;color: white;
		    padding-left: 10px;
		    padding-right: 10px; '><span>车辆到达</span></div>
		</div>	
			<input type="hidden" name="method" value="outShipOrder">
			<input type="hidden" id="customid" name="customid">
			<input type="hidden" id="custom_name1" name="custom_name1">
			<input type="hidden" id="checkarray" name="checkarray">
		</form>
		 <form action="shipOrder.do" target="_blank" id="printywm" method="post">
		 	<input type="hidden" name="method" value="getShipOrderPrintYwm">
		 	<input type="hidden" id="checkarray" name="checkarray">
		 </form>
  </body>
</html>