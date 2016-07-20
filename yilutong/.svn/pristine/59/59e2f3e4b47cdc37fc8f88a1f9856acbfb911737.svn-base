<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	String realPath1 = "http://" + request.getServerName() + ":" + request.getServerPort() +"/surmax/"; 
 %>
<%@ page import="com.jy.common.SessionInfo"%>
<%@ page import="com.jy.model.User"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>配送费结算审核模块</title>
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
  <% User user=(User)request.getSession().getAttribute(SessionInfo.SessionName);%>
  <script type="text/javascript">
	  	var dialog;
 		var grid;
 		var did= '<%=user.getDid()%>';
  		$(function(){
  		 $('#isdelivery').val(did);
  			$('#dlg1').dialog({
			title : '结算审核',
			width : 400,
			height : 200,
			closed : true,
			cache : false,
			modal : true,
			buttons : '#buttons',
			/* onClose:function(){
			$("#costomers").select2("val", "");
			$("#number_search2").select2("val", "");
			$("#flag").combobox("setValue", "4"); 
			} */
		});
  			grid=$("#dg").datagrid({
  			url : 'distribu.do?method=getSettlementYfSHInfo&isdelivery='+did,
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
  		rowStyler: function(index,row){
				if (row.payment_sh==1){
					/* return 'color:blue;';
				}else if (row.is_send==1&&row.is_receive==0){
					return 'color:rgb(221, 14, 211);';
				}else if(row.transpfree_sh==1){ */
					return 'color:rgb(255, 4, 4);';
				}
			},
				//审核双击
							onDblClickRow : function(rowIndex, rowData) {
								var agreement_id = rowData.agreement_id;
								dialog = parent.jy
										.modalDialog({
											title : '运单信息',
											url : 'distribu.do?method=settlementYfPage&pid='
													+ agreement_id,
											width : 1200,
											heght : 800,
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
													 $("#dg").datagrid('reload');																	
												}
											
										});
							},
  			columns : [[
  				{field : 'shiping_order_id',checkbox : true},
  				{field : 'transpfreeing',title : '记录详情',width : 90,align:'center',sortable:'true',
  						formatter: function(value,row,index){
			  					value = "<a href='javascript:void(0)'onclick= 'OrderUpdates(\""+row.agreement_id+"\")'>查看详情</a>&nbsp";
			  					return value;
			  				} 				 
			  			}, 
			  	{field : 'payment_sh',title : '审核状态', width : 80,align :'center',sortable:'true',
  				    formatter:function(val,row,index){
  						if(val==0||val==null){
  							return "未审核";
  						}else if(val==1){ 						
  						return "已提审";
  						}else if(val==2){ 						
  						return "审核通过";
  						}else if(val==3){ 						
  						return "审核未通过";
  						}
  					}
  				},
  				{
								field : 'agreement_number',
								title : '协议编号',
								width : 100,
								align : 'center'
							}, {
								field : 'lx',
								title : '托运部门',
								width : 100,
								align : 'center',
								hidden: true
				    		}, {
								field : 'agreement_type',
								title : '协议类型',
								width : 100,
								align : 'center',
								
								formatter : function(val, row, index) {
									if (val == 0) {
										return "班线";
									} else if (val == 1) {
										return "配送";
									} else if (val == 2) {
										return "转运";
									}
								},
							}, {
								field : 'department_name',
								title : '托运部门',
								width : 100,
								align : 'center'
				    		},{
								field : 'send_station',
								title : '起始地',
								width : 100,
								align : 'center'
							},{
								field : 'end_address',
								title : '到达地',
								width : 100,
								align : 'center'
							},{
								field : 'car_number1',
								title : '车牌号',
								width : 100,
								align : 'center'
							},{
								field : 'car_name',
								title : '司机',
								width : 70,
								align : 'center'
							}, {
								field : 'all_money',
								title : '应付配送费',
								width : 80,
								align : 'center',
								
							}, {
								field : 'receivable_fee',
								title : '实付配送费',
								width : 80,
								align : 'center',							
							}, {
								field : 'trade_cha', //trade_cha as cy
								title : '差异',
								width : 120,
								align : 'center',
							}, {
								field : 'yf',
								title : '预付',
								width : 80,
								align : 'center',
							}, {
								field : 'df',
								title : '到付',
								width : 80,
								align : 'center',
							},{
								field : 'sf',
								title : '实付',
								width : 80,
								align : 'center',
							},{
								field : 'payment_method',
								title : '付款方式',
								width : 100,
								align : 'center',
								formatter : function(val, row, index) {
									if (val == 1) {
										return "现金";
									} else if (val == 2) {
										return "油卡";
									} else if (val == 3) {
										return "转账";
									}
								},
							},{
								field : 'settlyf_th_times',
								title : '提审日期',
								width : 80,
								align : 'center',
							},{
								field : 'settlyf_time',
								title : '结算日期',
								width : 80,
								align : 'center',
							},
							
  			]],
  			pagination:true,//分页
		    pageSize:30,
		    pageList:[30,40,50,70,100],
  			toolbar : '#tb'
  		});
  		$("#types").combobox("setValue",""); 
		$("#types").combobox("setText","全部");
  		
  		
  		
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
			/* $("#types").combobox("setValue",""); 
			$("#types").combobox("setText","全部");
			$("#isdelivery").combobox("setValue",""); 
			$("#isdelivery").combobox("setText","全部");  */
			$("#startDate1").val("");
			$("#endDate1").val("");
			$("#startDate2").val("");
			$("#endDate2").val("");
		} else {
			$('.easyui-layout').layout('panel', 'north').panel('resize',{height:60});
			$('.easyui-layout').layout('resize');
			btnMoreSearch.text("更多条件");
			btnMoreSearch.attr("state", "close");
			$("#searchInfoId").css("display","none");
		}
	});
		
		$.trim($("#isdelivery").combobox("setText","全部")); 	 
		$.trim($("#types").combobox("setText","全部")); 	 
  	});
  		
  	//查询
  	function searchCar_owner(){
        var startDate1=document.getElementById("startDate1").value;
  		var endDate1=document.getElementById("endDate1").value;
  		var startDate2=document.getElementById("startDate2").value;
  		var endDate2=document.getElementById("endDate2").value; 
        var did='<%=user.getDid()%>';
  		$("#dg").datagrid('load',{
	 	 		agreement_number:$.trim($("#ddId").val()),
	 	 		payment_sh:$.trim($("#types").combobox("getValue")), //是否审核
  				create_time :startDate1,
	 	 		create1_time :endDate1,
	 	 		settl_times :startDate2,
	 	 		settl1_times :endDate2,
	 	});	  
  	}
  
  	//审核驳回
  	function dealNotBackBH(){
  		var ids=[];
  		var row=$("#dg").datagrid('getSelections');
  			if(row.length>0){
	  			for(var i=0;i<row.length;i++){
	  			if(row[i].payment_sh==1){
	  				ids.push(row[i].agreement_id);	  	
	  				}	  		
		  		}
		  	}		
  		/* 	if(array[i].is_receive==1){
  				checkarray.push(array[i].shiping_order_id);
  				}else{
  						checkip=checkip+array[i].shiping_order_num+"  ";
  						i++;
  				}
  			}
	  	if(checkip!=""){
	  			$.messager.confirm('提示','您选中的订单有'+i+'条，且单号'+checkip+'不能执行寄出！')	
	  			} */
  		if(ids != ""){
  			$.messager.confirm('确认','您确定要提交驳回吗？',function(r){ 
    			if (r){ 
    				$.ajax({
						url: "distribu.do?method=settlementYfBH",
						type: "POST",
						data:{ids:ids.join(",")},
			  				success:function(data){
			  					if (data.flag) {
									parent.$.messager.alert("结算审核","运单结算审核驳回成功",'info',
										function(r) {
										$("#dlg1").dialog('close');
											$('#dg').datagrid('reload');
 										});
  								} 
  						}
					});
				}  			
  			});
  		}
  	}
  	/**
       审核通过
  	**/
  		function dealOrderTG(){
  		var ids=[];
  		var row=$("#dg").datagrid('getSelections');
  			if(row.length>0){
	  			for(var i=0;i<row.length;i++){
	  			if(row[i].payment_sh==1){
	  				ids.push(row[i].agreement_id);	  	
	  				}	  		
		  		}
		  	}		
	if(ids != ""){
  			$.messager.confirm('确认','您确定要提交审核处理吗？',function(r){ 
    			if (r){ 
    				$.ajax({
						url: "distribu.do?method=settlementYfTG",
						type: "POST",
						data:{ids:ids.join(",")},
			  				success:function(data){
			  					if (data.flag) {
									parent.$.messager.alert("结算审核","运单结算审核通过成功",'info',
										function(r) {
										$("#dlg1").dialog('close');
											$('#dg').datagrid('reload');
 										});
  								} 
  						}
					});
				}  			
  			});
  		}
  	}
  	
  	/*
  	提交审核 
  	*/
  	function dealDelivery(){
  		var ids=[];
  		var row=$("#dg").datagrid('getSelections');
  			if(row.length==1){
	  			for(var i=0;i<row.length;i++){
	  			if(row[i].payment_sh==1){
	  				ids.push(row[i].agreement_id);	  	
	  				}	  		
		  		}
		  	}		
		  	if(ids.length>0){
	  			dialog = parent.jy.modalDialog({
				title : '结算审核',
				url : 'transpfree.do?method=shTraspfree&pid=' + ids.join(","),
				width : 600,
				height:370,
				buttons : [{
					text : '<input type="button" class="btncss" value="通过"/>',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
					}
				},
				 {
					text : '<input type="button" class="btncss" value="驳回" style="margin-left: 15px;"/>',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$);
					}
				}] 
			});
  		}else{
  				$.messager.alert("配送费结算","请选择已提审信息","info");
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
		var allRows2 = $("#dg").datagrid("getColumnFields");
		var colName=[];
		var fieldName=[];
		var checkarray=[];
		var array = $('#dg').datagrid("getSelections");
  	
  	    var allRows2 = $("#dg").datagrid("getColumnFields");
		
		for(i=1;i<allRows2.length;i++)
		{
			var col = $('#dg').datagrid( "getColumnOption" , allRows2[i] );
			if(col.field!="department_name"&&col.field!="ssss"){
				colName.push(col.title);//把title列名到数组里去 
				fieldName.push(col.field); //把field列属性名到数组里去 	
			}			
		} 	 
  		if(array != ""){
  		for(var i=0;i<array.length;i++){
  			checkarray.push(array[i].agreement_id);
  			
  			}
  			}	
		$("#fieldName").val(fieldName.join(","));
  		 $("#headtitle").val(colName.join(","));
  		  $("#checkarray").val(checkarray.join(","));
  		var outputform=$("#outputform");
  		outputform.submit(); 
  	}
  	
  	

	//重置
	function reset(){
		
		$("#ddId").val("");
		$("kname").val("");
		$("#types").val(""); 
	$("#types").combobox("setValue",""); 
		$("#types").combobox("setText","全部");

		$("#startDate1").val("");
		$("#endDate1").val("");
		$("#startDate2").val("");
		$("#endDate2").val("");
	}
	
	function shenhe() {
	var ids=[];
  		var row=$("#dg").datagrid('getSelections');
  			if(row.length==1){
	  			for(var i=0;i<row.length;i++){
	  			if(row[i].payment_sh==1){
	  				ids.push(row[i].agreement_id);	  	
	  				}	  		
		  		}
		  		
		  	if(ids.length>0){
	  			dialog = parent.jy.modalDialog({
				title : '结算审核',
				url : 'distribu.do?method=shSettlement&pid=' + ids.join(","),
				width : 600,
				height:420,
				buttons : [{
					text : '<input type="button" class="btncss" value="通过"/>',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
					}
				},
				 {
					text : '<input type="button" class="btncss" value="驳回" style="margin-left: 15px;"/>',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$);
					}
				}] 
			});
  		}else{
  				$.messager.alert("配送费结算","请选择已提审信息","info");
  		}			  		
		  	}else if(row.length>1){
		 
		  	for(var i=0;i<row.length;i++){
	  			if(row[i].payment_sh==1){
	  				ids.push(row[i].agreement_id);	  	
	  				}	  		
		  		}
			if(ids.length>0){
				$("#form").form('clear');
				$("#dlg1").dialog('open');
			}else{
				$.messager.alert("结算审核","请选择已提审的信息","info");	
			}		  	
		}else{
			$.messager.alert("结算审核","请选择一条或者多条已提审的信息","info");	
		}		
	}
	
	//查看审核详情
  		function OrderUpdates(ids){
  			dialog = parent.jy.modalDialog({
			title : '配送费结算审核记录',
			url : 'distribu.do?method=settlementShRC&pid='+ids,
/* 				 buttons :'#addbuttons'
*/
			width :800,
			height:600,
		});	
  	}
  </script>
  <body class="easyui-layout">
  	<form action="distribu.do" id="outputform" method="post">
    	<div region="north" title="检索" class="st-north" border="false" collapsible="false"  >
	   
	    	<lable class="divlabel">协议编号:</lable>
	    	 <input type="text" class="search-text" id="ddId"  name="ddId"   style="width:110px"  >
	    	 <lable>是否审核:</lable>
			<select  class="easyui-combobox"  id="types" name="types"  style="width:110px;height:22px"  data-options="panelHeight : 'auto',editable:false">
				<option  value="">全部</option>
				<option  value="0">未审核</option>
				<option  value="1">已提审</option>
				<option  value="2">审核通过</option>			
				<option  value="3">审核未通过</option>						
			</select>
	    	 <a class="easyui-linkbutton" onclick="searchCar_owner()" data-options="iconCls:'icon-search'" >查询</a>	
	    	 <a id="btnMoreSearch" class="btn btn-sm btn-link" type="button" style="margin-top:16px;" href="javascript:void(0)" state="close">更多条件</a>
	    	 <div id="searchInfoId" style="display: none">	    	
			<!--<lable>所属机构:</lable>
			<input id="cc3" name="did">-->
		<!-- 	<lable >是否提货:</lable>
			<select  class="easyui-combobox"  id="isdelivery"  name="isdelivery"style="width:110px;height:22px"  data-options="panelHeight : 'auto',editable:false">
				<option  value="">全部</option>
				<option  value="1">已提货</option>
				<option  value="0">未提货</option>
			</select> -->
			 	 <lable>提审日期:</lable>
			<input  id="startDate1"  class="Wdate" name="start_date1" readonly="readonly" style="width:110px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			-
			<input id="endDate1"  class="Wdate" name="end_date1" readonly="readonly" style="width:110px;height:22px;" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			<lable class="divlabel">结算日期:</lable>
			<input  id="startDate2"  class="Wdate" name="start_date2" readonly="readonly" style="width:110px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			-
			<input id="endDate2"  class="Wdate"  name="end_date2"  readonly="readonly" style="width:110px;height:22px;" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />		 	
    		</div>    		
    	</div>
    	<div region="center" >
    		<table id="dg" title="协议信息" ></table>
    	</div>
    	<div id="tb">
		     <!--  <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true"onclick="add()">新增</a>
		
		   <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true"   onclick="deleteShipOrder()">删除</a>
		 <a href="javascript:void(0)"	class="easyui-linkbutton" data-options="iconCls:'icon-input',plain:true" onclick="showIcons()" id="tbru"style="display: none">导入</a>-->
		     <!--  <a href="javascript:void(0)" class="easyui-linkbutton" id="outputCar_owner" data-options="iconCls:'icon-output',plain:true" onclick="putoutfile()">导出</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true"   onclick="getShipOrderPage()">详细</a> 
		     <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true"   onclick="dealDelivery()">单一审核</a> -->
	<!-- <a href="javascript:void(0)" class="easyui-linkbutton" id="getUpdateCar_owner" data-options="iconCls:'icon-edit',plain:true"onclick="shenhetranspfree()">审核</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" id="outputCar_owner" data-options="iconCls:'icon-output',plain:true" onclick="putoutfile()">导出</a> -->
		<!--  <a href="javascript:void(0)" class="easyui-linkbutton" id="outputCar_owner" data-options="iconCls:'icon-output',plain:true" onclick="putgouxuan()">勾选导出导出</a> -->
		    <div title='已提审' style='height: 16px;background:red;-moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;    float: right;
		    	margin: 5 0%;color: white;
		    padding-left: 10px;
		    padding-right: 10px; '><span>已提审</span></div>
		</div>	
		<input type="hidden" name="method" value="getSettlementYfSHout">
		<input type="hidden" id="fieldName" name="fieldName">
		<input type="hidden" id="headtitle" name="headtitle">
		<input type="hidden" id="checkarray" name="checkarray">
		<input type="hidden" id="isdelivery" name="isdelivery">
		</form>	
		<!-- <form action="ChangeO.do" id="formout" method="post">
		<input type="hidden" name="method" value="outShi">
		<input type="hidden" id="fieldName1" name="fieldName">
		<input type="hidden" id="headtitle1" name="headtitle">
		<input type="hidden" id=checkarray name="checkarray">
		</form> -->
		<div id="dlg1">
		<form action="ChangeO.do" id="form" method="">
		<fieldset>
		  	<table class="tableclass">
			    <tr>
					<td>审核备注:</td>
					<td colspan="3" class="td2">
							<textarea class="easyui-textarea" cols="28" rows="2.4"  id="remarks" name="remarks"></textarea>
					</td>
			    </tr>
			</table>
		    </fieldset>
			</form>
			<div id="buttons">
				<input type="button" onclick="dealOrderTG()" value="通过" class="btncss"/>  <input type="button" onclick="dealNotBackBH();"
					value="驳回" class="btncss" /> 
			</div>
		</div>
  </body>

  
</html>