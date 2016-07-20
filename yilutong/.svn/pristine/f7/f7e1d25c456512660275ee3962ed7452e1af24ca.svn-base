<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	String realPath1 = "http://" + request.getServerName() + ":" + request.getServerPort() +"/surmax/"; 
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>订单运费结算信息管理</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	
	<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
	<jsp:include page="../../../ValidationEngine/Validation.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="./css/main.css">
	<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
	<script type="text/javascript" src="./js/select2/select2.js"></script>
	<script type="text/javascript" src="./js/select2/select2_locale_zh-CN.js"></script>
	<script type="text/javascript" src="./js/function.js"></script><!--命名按钮方法  -->
	
  
  </head>
  <% String flg=(String)request.getAttribute("pid") ; %>
  <script type="text/javascript">
	  	var dialog;
 		var grid;
 		var editval;
  		$(function(){
  		$('#dlg1').dialog({
			title : '调整金额',
			width : 450,
			height : 260,
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
			$("#kname").val('<%=flg%>');
  			grid=$("#dg").datagrid({
  			url : 'settleDFYF_fu.do?method=getSettlementYf&kname='+'<%=flg%>',
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
				if (row.settleds_tz!=2||row.is_settleds==0||row.settleds_sh==3||(row.settleds_sh==2&&(parseFloat(row.back_fee)!=parseFloat(row.paid_fu)))){
					return 'color:blue;';
				}else if (row.settleds_sh==0){
					return 'color:rgb(221, 14, 211);';
				}else if(row.settleds_sh==1){
					return 'color:red;';
				}
			},
  			columns : [[
  				{field : 'ck',checkbox : true}, 		
  				{field : 'transpfreeing',title : '记录详情',width : 90,align:'center',sortable:'true',
  						formatter: function(value,row,index){
			  					value = "<a href='javascript:void(0)'onclick= 'OrderUpdates(\""+row.shiping_order_id+"\")'>查看详情</a>&nbsp";
			  					return value;
			  				} 				 
			  			}, 
  				{field : 'send_time',title : '发车时间',width : 140,align:'center',sortable:'true',
  				formatter: function(value,row,index){
  				if(value!=undefined){
  				value=value.substr(0,19);
  				}
  					return value;
  				} 				 
  				},				
  				{field : 'shiping_order_num',title : '运单号',width : 60,align:'center'}, 	
  				{field : 'custom_name',title : '发货客户',width : 80,align:'center'},
  				{field : 'send_phone',title : '发货联系电话',width : 80,align:'center'}, 	
  				{field : 'goods_name',title : '货物名称',width : 60,align:'center'},
  				{field : 'goods_num',title : '件数',width : 60,align:'center'},		
  				{field : 'goods_weight',title : '重量',width : 60,align:'center'},
  				{field : 'goods_vol',title : '体积',width : 60,align:'center'},
  				
  				{field : 'back_fee',title : '应付运费总额',width : 100,align:'center'/* sortable: true */},
  				{field : 'paid_fu',title : '实付运费总额',width : 100,align:'center'
  						/* ,editor:{
	                		type : 'numberbox',
		  				    options : {
		  				    precision : '2',
		  				    validType :'reality_sum'
	                	}} */
  				/* sortable: true */},	  	
  				{field : 'trade_cha',title : '差异',width : 70,align:'center',
  				/* formatter:function(val,row,index){			
		  					if(isNaN(parseFloat(row.reality_sum))){
					  		 val=row.transport_pay;
					  		}else{
					  		 val=parseFloat(row.transport_pay)-parseFloat(row.reality_sum); 	
					  		}	  		
  							return val;		
  					} */
  			
  				},  
  				{field : 'settleds_tz',title : '结算调整', width : 80,align :'center',sortable:'true',
  				    formatter:function(val,row,index){
  							 if(val==1){ 						
  						return "调整未结算";
  						}else if(val==2){ 						
  						return "调整已结算";
  						}else{
  						return "未调整";
  						}
  					}
  				},	 						
  					{field : 'settleds_sh',title : '是否审核', width : 80,align :'center',sortable:'true',
  				    formatter:function(val,row,index){
  						if(val==0||val==null){
  							return "未审核";
  						}else if(val==1){ 						
  						return "已提审";
  						}else if(val==2){ 						
  						return "审核通过";
  						}else if(val==3){ 						
  						return "审核驳回";
  						
  						}
  					}
  				}, 	
  				{field : 'department_name',title : '提审部门',width : 90,align:'center'},  			
  				{field : 'is_settleds',title : '结算方式', width : 80,align :'center',sortable:'true',
  				    formatter:function(val,row,index){
  							if(val==0){
  							return "未结算";
  						}else if(val==1){ 						
  						return "现金";
  						}else if(val==2){ 						
  						return "转账";
  						}else if(val==3){ 						
  						return "支票";
  						}else if(val==4){ 						
  						return "其他";
  						}
  					}
  				},			
  				{field : 'settlyf_remaks',title : '结算备注',width : 90,align:'center',sortable:'true'}, 
  				{field : 'username',title : '结算操作人',width : 90,align:'center',sortable:'true'}, 
  				{field : 'settlyf_time',title : '结算时间',width : 90,align:'center',sortable:'true',
  					formatter: function(value,row,index){
		  				if(value!=undefined){
		  				value=value.substr(0,19);
		  				}
		  					return value;
		  				} 		
	  				},	  								  			
  				{field : 'send_station',title : '发站',width : 80,align:'center'},
  				{field : 'end_address',title : '到站',width : 75,align:'center'},
  				{field : 'receipt',title : '收货人',width : 60,align:'center'},
  				{field : 'receipt_tel',title : '收货联系电话',width : 80,align:'center'}, 			
  				/* 	{field : 'plate_number',title : '发短信',width : 80,align:'center',
  					formatter: function(val,row,index){
  					
  						value = "<a href='javascript:void(0)'onclick= 'openwindow(\""+row.travel_card_id+"\")'>"+row.plate_number+"</a>&nbsp";
  						return value;
  					}
  				},  */	
  				{field : 'send_type',title : '交接方式',width : 70,align:'center',
  				formatter:function(val,row,index){
  						if(val==0){
  							return "客户自提";
  						}else if(val==1){
  						    return "专车送货";
  						}else if(val==2){
  							return "送货进仓";
  						}else if(val==3){
  						    return "送货上楼";
  						}else if(val==4){
  						    return "送货上门";
  						}
  					}
  				},	
  				{field : 'shipping_order_state',title : '订单状态',width : 70,align:'center',
	  					formatter:function(val,row,index){
	  						if(val==0){
	  							return "未出库";
	  						}else if(val==1){
	  							return "配送中";
	  						}else if(val==2){
	  						return "转运中";
	  						}else if(val==3){
	  						return "到达";
	  						}else if(val==4){
	  						return "签收";
	  						}
	  					}	
	  				},  	  		
  				{field : 'xf',title : '	现返',width : 80,align:'center'}, 			
  				{field : 'hdqf',title : '欠返',width : 80,align:'center'},
  				{field : 'fankuan_stata',title : '返款方式',width : 70,align:'center',
  					formatter:function(val,row,index){
  						if(val==0){
  							return "现返";
  						}else if(val==1){
  							return "欠返"; 								
  						}
  					}	
  				}, 
	  			
 				{field : 'order_time',title : '制单时间',width : 140,align:'center',sortable:'true',
  				formatter: function(value,row,index){
  				if(value!=undefined){
  				value=value.substr(0,19);
  				}
  					return value;
  				} 				 
  				},		
  			
  		
   			
  			/* 	{field : 'shipping_orde',title : '制单人',width : 80,align:'center',sortable:'true',
  				formatter:function(val,row,index){
  				return '<a href="#" onclick="constructionManager(\'' + row.id+ '\')">电话预约</a>  ';
  				}
  				}, */
  				
  			]],
  			pagination:true,//分页
		    pageSize:20,
		    pageList:[20,30,50,70],
  			toolbar : '#tb'
  		});
  		//回车查询
  		document.onkeydown = function(event) {
			e = event ? event : (window.event ? window.event : null);
			if (e.keyCode == 13) {
				//执行的方法 
				searchCar_owner();
			}
		};
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
			$("#isdelivery").combobox("setValue",""); 
		$("#isdelivery").combobox("setText","全部");  
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
		
		 
		$.trim($("#types").combobox("setText","全部")); 	 
		$.trim($("#types").combobox("setValue","")); 	 
  	});
  		
  	//查询
  	function searchCar_owner(){
 
  		/* if($.trim($("#phone").select2("data"))!=""){
  		phone=$.trim($("#phone").select2("data").text);
  			} */
  		$("#dg").datagrid('load',{
  				start_date :$.trim($("#start_date").val()),
	 	 		end_date :$.trim($("#end_date").val()),
	 	 		ddId:$.trim($("#ddId").val()),
	 	 	//	phone_number:$.trim($("#phone").val()),
	 	 		types:$.trim($("#types").combobox("getValue")), //寄出
  				//institution:$.trim($("#cc3").combotree("getValue")),
  				isdelivery:$.trim($("#isdelivery").combotree("getValue")),//差异是未0 
  				start_date1 :$.trim($("#start_date1").val()),
	 	 		end_date1 :$.trim($("#end_date1").val()),
	 	 		start_date2 :$.trim($("#start_date2").val()),
	 	 		end_date2 :$.trim($("#end_date2").val()),
	 	});	  
	 	
  	}
  	//接收处理
  	function dealDelivery(){
  		var checkarray=[];
  		var checkip='';
  		var i=0;
	 	var array = $('#dg').datagrid('getSelections');
	 	if(array.length>0){
  		for(var i=0;i<array.length;i++){
  		if(array[i].is_print==1&&array[i].is_takes==0){
  			checkarray.push(array[i].shiping_order_id);
  			}else{
  				checkip=checkip+array[i].shiping_order_num+"  ";
  			i++;
  			}
  		}	
	  	if(checkip!=""){
	  			$.messager.confirm('提示','您选中的运单有'+i+'条，且单号'+checkip+'不能执行提货！',function(r){    
				    if (r){    
				      if(array != ""){
				  			$.messager.confirm('确认','您确定要接收选中的记录吗？',function(r){ 
				    			if (r){ 
				    				$.ajax({
										url: "ChangeO.do?method=updateFreeOrder",
										type: "POST",
										data:{deal:checkarray.join(",")},
							  				success:function(data){
							  					if (data.flag) {
													parent.$.messager.alert("客户提货","客户提货成功",'info',
														function(r) {
															$('#dg').datagrid('reload');
				 										});
				  								} 
				  						}
									});
								}  			
				  			});
			  		}else{
			  			$.messager.alert("客户提货","请选择要提货的订单","info");
			  		}
				        } 
				    }   
	  			);	
		  	}			  			
		  	}else{
				$.messager.alert("客户提货","请选择要提货的运单","info");		
				}
		}		 
  	/*
  	结算提审
  	*/
  	function settlementSh(){
  		var ids=[];
  		var row=$("#dg").datagrid('getSelections');
  			if(row.length>0){
	  			for(var i=0;i<row.length;i++){
	  			if(row[i].settleds_sh==0&&row[i].settleds_tz==2){
	  				ids.push(row[i].shiping_order_id);	  	
	  				}	  		
		  		}
		  	}		
		  	if(ids.length>0){
	  			dialog = parent.jy.modalDialog({
				title : '结算提审',
				url : 'settleDFYF_fu.do?method=thSettlement&pid=' + ids.join(","),
				width :450,
				height:300,
				buttons : [{
					text : '<input type="button" class="btncss" value="确定"/>',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
					}
				}] 
			});
  		}else{
  				$.messager.alert("运费调整","请选择已结算未审核信息","info");
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
		var row=$("#dg").datagrid('getSelections');
  			if(row.length>0){
	  			for(var i=0;i<row.length;i++){
					checkarray.push(row[i].shiping_order_id);	  				
		  			}		  			
		  		}	
		for(i=1;i<allRows2.length;i++)
		{
			var col = $('#dg').datagrid( "getColumnOption" , allRows2[i] );
				if(col.field!="transpfreeing"&&col.field!="ssss"){
				colName.push(col.title);//把title列名到数组里去 
				fieldName.push(col.field); //把field列属性名到数组里去 	
			}
					
			
		} 
		$("#fieldName").val(fieldName.join(","));
  		 $("#headtitle").val(colName.join(","));
  		  $("#checkarray").val(checkarray.join(","));
  		var outputform=$("#outputform");
  		outputform.submit(); 
  	}
  
 	function settlementYfs() {
		 /* alert(document.getElementById("addbuttons"));
		 alert(document.getElementById("upbuttons")); */
		 var ids=[];
		  var wids=[];
		 	var row=$("#dg").datagrid('getSelections');
  			if(row.length>0){
	  			for(var i=0;i<row.length;i++){
	  		//&&(parseFloat(row[i].transport_pay)!=parseFloat(row[i].reality_sum)
		  			if(row[i].is_settleds==0||(row[i].is_settleds!=0&&row[i].settleds_sh==3&&row[i].settleds_tz!=2)||(row[i].settleds_tz!=2&&row[i].is_settleds!=0)){
			  				ids.push(row[i].shiping_order_id);	  				
		  				}		  			
		  			}	
		  if(ids.length>0){
				  dialog= parent.jy.modalDialog({
					title : '运费结算',
					url : 'settleDFYF_fu.do?method=edSettlement&pid='+ids.join(","),
		/* 				 buttons :'#addbuttons'
		*/
					width : 530,
					height: 270,
					buttons : [{
						text : '<input type="button" class="btncss" value="确定"/>',
						handler : function() {
							dialog.find('iframe').get(0).contentWindow.submitFormEditss(dialog, grid, parent.$);
						}
					}] 
				});	
		  }else{
		  	$.messager.alert("运费结算","请选择未结算或者已调整未结算的信息","info");
		  }
	
		}else {
			$.messager.alert("运费结算","请选择未结算或者已调整未结算信息","info");
		}
	};
  	//打印
  	function dy(){
  	var pid=[];
  		var row=$("#dg").datagrid('getSelections');
  			if(row.length>0){
	  			for(var i=0;i<row.length;i++){
		  			if(row[i].is_takes==0){
		  				pid.push(row[i].shiping_order_id);
		  			}	  			
		  		}
							var url="ChangeOrder.do?method=getShipOrderPrint&pid="+pid.join(",");
							ow(url);
  		}else{
  			$.messager.alert("客户回单","请选择一行信息","info");
  		}	
  	
  	}
  	function ow(owurl){ 
			var tmp=window.open("about:blank","","fullscreen=1");
			tmp.moveTo(0,0); 
			tmp.resizeTo(screen.width+20,screen.height); 
			tmp.focus(); 
			tmp.location=owurl; 
			} 
  	//导入
  	function putintfile() {
		dialog = parent.jy.modalDialog({
			title : '导入运单',
			url : 'ChangeOrder.do?method=imp',
			width : 600,
			height: 300,
			buttons : [{
				text : '<input type="button" value="导入" class="btncss">',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
				}
			}] 
		});
	};
	//重置
	function reset(){
		$("#startDate").val("");
		$("#endDate").val("");
		$("#ddId").val("");
		$("#types").combobox("setValue",""); 
		$("#types").combobox("setText","全部");
		$("#isdelivery").combobox("setValue",""); 
		$("#isdelivery").combobox("setText","全部"); 
		$("#startDate1").val("");
		$("#endDate1").val("");
		$("#startDate2").val("");
		$("#endDate2").val("");
	}
	//调整金额
		function changemoney(){
			 var ids="";
				var row=$("#dg").datagrid('getSelections');
		  			if(row.length==1){
			  			for(var i=0;i<row.length;i++){		  			
			  			if(row[i].is_settleds==0||row[i].settleds_tz!=2||row[i].settleds_sh==3||(row[i].settleds_sh==2&&(parseFloat(row[i].back_fee)!=parseFloat(row[i].paid_fu)))){
			  				ids=row[i].shiping_order_id;	  				  								
			  				}	  		
				  		}
					if(ids!=""){
						$("#form").form('clear');			
						if(row[0].is_settleds==0||row[0].trade_cha==0){
			  					$("#yingshou").val(row[0].back_fee);
			  				}else if(isNaN(parseFloat(row[0].paid_fu))){
			  					$("#yingshou").val(row[0].back_fee);	
			  				}else{
			  					$("#yingshou").val(parseFloat(row[0].back_fee)-parseFloat(row[0].paid_fu));
			  					}	  									
						$("#dlg1").dialog('open');
						}else{
						$.messager.alert("结算调整","请选未结算或者调整未结算的信息","info");	
					}	
					}else{
						$.messager.alert("结算调整","请选择一行可结算的信息","info");	
					}		
		}
		function dealOrder(){
	  		var row=$("#dg").datagrid('getSelections');
	  		var reality_sum;
	  		if(isNaN(parseFloat(row[0].paid_fu))||(row[0].is_settleds==0&&row[0].settleds_tz==0)){
	  		 reality_sum=parseFloat($("#shishou").val());
	  		}else{
	  		 reality_sum=parseFloat($("#shishou").val())+parseFloat(row[0].paid_fu);
	  		}	  		
				  			$.messager.confirm('确认','您确定要提交处理吗？',function(r){ 
			    			if (r){ 
			    				$.ajax({									
									type: "POST",
									url : 'settleDFYF_fu.do?method=changePrice',
				           			data :  {
				           				dds:row[0].shiping_order_id,
				           				price:reality_sum	
				           				},
						  				success:function(data){
						  					if (data.flag) {
												parent.$.messager.alert("结算调整","运单结算调整成功",'info',
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
	  		
	  		//查看审核详情
  		function OrderUpdates(ids){
  			dialog = parent.jy.modalDialog({
			title : '运费结算记录',
			url : 'settlementYf.do?method=setlRcordInfo&pid='+ids+'&state='+1,
/* 				 buttons :'#addbuttons'
*/
			width : 690,
			height:500,
		});	
  	}
  </script>
  <body class="easyui-layout">
  	<form action="settleDFYF_fu.do" id="outputform" method="post">
    	<div region="north" title="检索" class="st-north" border="false"  height="60px" collapsible="false"  >
	    	<lable>发车日期 :</lable>
			<input  id="start_date"  class="Wdate"  name="start_date"  readonly="readonly" style="width:150px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			-
			<input id="end_date"  class="Wdate" name="end_date"    readonly="readonly" style="width:150px;height:22px;" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
	    	<lable class="divlabel">运单编号:</lable>
	    	 <input type="text" class="search-text" id="ddId"  name="ddId"   style="width:150px"  >
	    	 <input type="hidden" class="search-text" id="kname" name="kname"  >
	    	 <lable>是否结算:</lable>
			<select  class="easyui-combobox"  id="types" name="types"  style="width:150px;height:22px"  data-options="panelHeight : 'auto',editable:false">
				<option  value="">全部</option>
				<option  value="0">未结算</option>
				<option  value="1">已结算</option>	
				<!-- <option  value="2">刷卡</option>	
				<option  value="3">支票</option>	
				<option  value="4">其他</option> -->					
			</select>
	    	 <a class="easyui-linkbutton" onclick="searchCar_owner()" data-options="iconCls:'icon-search'" >查询</a>	
	    	 <a id="btnMoreSearch" class="btn btn-sm btn-link" type="button" style="margin-top:16px;" href="javascript:void(0)" state="close">更多条件</a>
	    	 <div id="searchInfoId" style="display: none">	    	
			<!--<lable>所属机构:</lable>
			<input id="cc3" name="did">-->
			<lable >差异是否为0:</lable>
			<select  class="easyui-combobox"  id="isdelivery"  name="isdelivery"style="width:150px;height:22px"  data-options="panelHeight : 'auto',editable:false">
				<option  value="">全部</option>
				<option  value="0">否</option>
				<option  value="1">是</option>
			</select>
			 <lable class="divlabel">结算日期:</lable>
			<input  id="start_date1"  class="Wdate" name="start_date1" readonly="readonly" style="width:150px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			-
			<input id="end_date1" class="Wdate" name="end_date1" readonly="readonly" style="width:150px;height:22px;" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
		
				<lable class="divlabel">制单日期:</lable>
			<input  id="start_date2"  class="Wdate" name="start_date2" readonly="readonly" style="width:150px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			-
			<input id="end_date2"  class="Wdate"  name="end_date2"  readonly="readonly" style="width:150px;height:22px;" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />		 	
    	</div>
    	</div>
    	<div region="center" >
    	<table id="dg" title="运单信息" ></table>
    	</div>
    	<div id="tb">
    	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true"   onclick="changemoney()">编辑</a> 
    	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true"   onclick="settlementYfs()">结算</a>	   		      
	<a href="javascript:void(0)" class="easyui-linkbutton" id="getUpdateCar_owner" data-options="iconCls:'icon-edit',plain:true"onclick="settlementSh()">提审</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" id="outputCar_owner" data-options="iconCls:'icon-output',plain:true" onclick="putoutfile()">导出</a>	
	<!-- 		<a href="javascript:void(0)" class="easyui-linkbutton" id="getUpdateCar_owner" data-options="iconCls:'icon-edit',plain:true"onclick="dealOrderUpdate()">取消寄出</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" id="outputCar_owner" data-options="iconCls:'icon-output',plain:true" onclick="putgouxuan()">勾选导出导出</a> -->
		<div title='可编辑结算' style='height: 16px;background:blue;-moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;    float: right;
		    	margin: 5 1%;color: white;
		    padding-left: 10px;
		    padding-right: 10px; '><span>可编辑结算</span></div>
		<div title='未审核' style='height: 16px;background:rgb(221, 14, 211);-moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;    float: right;
		    	margin: 5 0%;color: white;
		    padding-left: 10px;
		    padding-right: 10px; '><span>未审核</span></div>
		    <div title='已提审' style='height: 16px;background:red;-moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;    float: right;
		    	margin: 5 0%;color: white;
		    padding-left: 10px;
		    padding-right: 10px; '><span>已提审</span></div>
		</div>	
		<input type="hidden" name="method" value="getSettlementYfout">
		<input type="hidden" id="fieldName" name="fieldName">
		<input type="hidden" id="headtitle" name="headtitle">
		<input type="hidden" id="checkarray" name="checkarray">
		</form>			
		
		<div id="dlg1">
		<form action="ChangeO.do" id="form" method="">
		<fieldset>
		  	<table class="tableclass">
		  	<tr><th colspan="2">调整结算金额</th></tr>
			    <tr>
			    <td>应付代收运费:</td>
					<td colspan="1" class="td2">
							<input  class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"  type="text"   readonly="readonly"  id="yingshou" name="remarks">
					</td>
					</tr>
					<tr>
					<td>实付代收运费:</td>
					<td colspan="1" class="td2">
							<input type="text"  id="shishou"   class="validate[required,custom[number],max[99999.99],custom[dd]]"  name="remarks">
					</td>
			    </tr>
			</table>
		    </fieldset>
			</form>
			<div id="buttons">
				<input type="button" onclick="dealOrder()" value="确定" class="btncss"/> 
			</div>
		</div>
		
		<script type="text/javascript">
		 $("#form").validationEngine('attach', { 
				 promptPosition:'topRight:-15,0'
				 });
		
		</script>
  </body>
</html>