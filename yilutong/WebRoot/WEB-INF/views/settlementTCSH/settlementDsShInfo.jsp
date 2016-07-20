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
    <title>中转费结算审核模块</title>
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
  			url : 'settleTC_fu.do?method=getSettlementYfSHInfo&isdelivery='+did,
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
				if (row.settltc_sh==1){
					/* return 'color:blue;';
				}else if (row.is_send==1&&row.is_receive==0){
					return 'color:rgb(221, 14, 211);';
				}else if(row.transpfree_sh==1){ */
					return 'color:rgb(255, 4, 4);';
				}
			},
  			columns : [[
  				{field : 'shiping_order_id',checkbox : true},
  				{field : 'transpfreeing',title : '记录详情',width : 90,align:'center',sortable:'true',
  						formatter: function(value,row,index){
			  					value = "<a href='javascript:void(0)'onclick= 'OrderUpdates(\""+row.shiping_order_id+"\")'>查看详情</a>&nbsp";
			  					return value;
			  				} 				 
			  			}, 
			  	{field : 'settltc_sh',title : '审核状态', width : 80,align :'center',sortable:'true',
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
  				{field : 'change_pay',title : '应付中转费',width : 100,align:'center'},
  				{field : 'paidtc_fu',title : '实付中转费',width : 100,align:'center'},
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
  				{field : 'is_settltc',title : '是否结算', width : 80,align :'center',sortable:'true',
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
  				  {field : 'settlyf_time',title : '结算时间',width : 120,align:'center',sortable:'true',
  				formatter: function(value,row,index){
  				if(value!=undefined){
  				value=value.substr(0,19);
  				}
  					return value;
  				} 				
  				}, 	  	
  				
  			/* 	{field : 'settleds_kahao',title : '银行卡号',width : 90,align:'center',sortable:'true'}, 
  				{field : 'settleds_khbank',title : '开户行',width : 90,align:'center',sortable:'true'}, 
  				{field : 'settleds_username',title : '开户名',width : 70,align:'center',sortable:'true'},
  				{field : 'settleds_zpnum',title : '支票编码',width : 70,align:'center',sortable:'true'},   */
  				{field : 'settlyf_remaks',title : '结算备注',width : 90,align:'center',sortable:'true'}, 
  				{field : 'username',title : '结算操作人',width : 90,align:'center',sortable:'true'}, 
  				{field : 'settlyf_th_remaks',title : '结算提审备注',width : 90,align:'center',sortable:'true'}, 
  				 {field : 'settlyf_th_times',title : '结算提审时间',width : 120,align:'center',sortable:'true',
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
  				{field : 'receipt_tel',title : '电话',width : 80,align:'center'},
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
  				{field : 'hf',title : '回付',width : 80,align:'center'}, 	
  				{field : 'xf',title : '现付',width : 80,align:'center'}, 	
  				{field : 'df',title : '到付',width : 80,align:'center'}, 			
  				{field : 'chanage_pay_type',title : '付款方式',width : 70,align:'center',
  					formatter:function(val,row,index){
  						if(val==0){
  							return "回付";
  						}else if(val==1){
  							return "到付"; 	
  							}else if(val==2){
  							return "现付"; 								
  						}
  					}	
  				}, 
  			]],
  			pagination:true,//分页
		    pageSize:30,
		    pageList:[30,40,50,70,100],
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
			 $("#types").combobox("setValue",""); 
		$.trim($("#isdelivery").combobox("setText","全部")); 	 
		$.trim($("#types").combobox("setText","全部")); 	 
  	});
  		
  	//查询
  	function searchCar_owner(){		
  		var startDate2=document.getElementById("startDate2").value;
  		var endDate2=document.getElementById("endDate2").value;
  		/* if($.trim($("#phone").select2("data"))!=""){
  		phone=$.trim($("#phone").select2("data").text);
  			} */
  			var did= '<%=user.getDid()%>';
  		$("#dg").datagrid('load',{
  				start_date :$.trim($("#startDate").val()),
	 	 		end_date :$.trim($("#endDate").val()),
	 	 		ddId:$.trim($("#ddId").val()),
	 	 		kname:$.trim($("#kname").val()),
	 	 	//	phone_number:$.trim($("#phone").val()),
	 	 		types:$.trim($("#types").combobox("getValue")), //是否审核
  				//institution:$.trim($("#cc3").combotree("getValue")),
  				//isdelivery:did,//部门
  				start_date1 :$.trim($("#startDate1").val()),
	 	 		end_date1 :$.trim($("#endDate1").val()),
	 	 		start_date2 :startDate2,
	 	 		end_date2 :endDate2,
	 	});	  
	 	
  	}
  
  	//审核驳回
  	function dealNotBackBH(){
  		var ids=[];
  		var row=$("#dg").datagrid('getSelections');
  			if(row.length>0){
	  			for(var i=0;i<row.length;i++){
	  			if(row[i].settlyf_sh==1){
	  				ids.push(row[i].shiping_order_id);	  	
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
  			$.messager.confirm('确认','您确定要提交审核吗？',function(r){ 
    			if (r){ 
    				$.ajax({
						url: "settlementYf.do?method=settlementYfBH",
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
	  			if(row[i].settlyf_sh==1){
	  				ids.push(row[i].shiping_order_id);	  	
	  				}	  		
		  		}
		  	}		
	if(ids != ""){
  			$.messager.confirm('确认','您确定要提交审核处理吗？',function(r){ 
    			if (r){ 
    				$.ajax({
						url: "settlementYf.do?method=settlementYfTG",
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
	  			if(row[i].settlyf_sh==1){
	  				ids.push(row[i].shiping_order_id);	  	
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
  				$.messager.alert("中转费结算","请选择已提审信息","info");
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
			if(col.field!="transpfreeing"&&col.field!="ssss"){
				colName.push(col.title);//把title列名到数组里去 
				fieldName.push(col.field); //把field列属性名到数组里去 	
			}
						
		} 	 
  		if(array != ""){
  		for(var i=0;i<array.length;i++){
  			checkarray.push(array[i].shiping_order_id);
  			
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
		$("#startDate").val("");
		$("#endDate").val("");
		$("#ddId").val("");
		$("#kname").val("");
		$("#startDate1").val("");
		$("#endDate1").val("");
		$("#startDate2").val("");
		$("#endDate2").val("");
		$("#types").combobox("setValue",""); 
		$("#types").combobox("setText","全部");

		
	}
	
	function shenhetranspfree() {
	var ids=[];
  		var row=$("#dg").datagrid('getSelections');
  			if(row.length==1){
	  			for(var i=0;i<row.length;i++){
	  			if(row[i].settltc_sh==1){
	  				ids.push(row[i].shiping_order_id);	  	
	  				}	  		
		  		}
		  	if(ids.length>0){
	  			dialog = parent.jy.modalDialog({
				title : '结算审核',
				url : 'settleTC_fu.do?method=shSettlement&pid=' + ids.join(","),
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
  				$.messager.alert("中转结算","请选择已提审信息","info");
  		}			  		
		  	}else if(row.length>1){
		 
		  	for(var i=0;i<row.length;i++){
	  			if(row[i].settltc_sh==1){
	  				ids.push(row[i].shiping_order_id);	  	
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
			title : '中转费结算审核记录',
			url : 'settleTC_fu.do?method=settlementShRC&pid='+ids,
/* 				 buttons :'#addbuttons'
*/
			width : 690,
			height:500,
		});	
  	}
  </script>
  <body class="easyui-layout">
  	<form action="settleTC_fu.do" id="outputform" method="post">
    	<div region="north" title="检索" class="st-north" border="false" collapsible="false"  >
	    	<lable>发车日期 :</lable>
			<input  id="startDate"  class="Wdate"  name="start_date"  readonly="readonly" style="width:110px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			-
			<input id="endDate"  class="Wdate" name="end_date"    readonly="readonly" style="width:110px;height:22px;" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
	    	<lable class="divlabel">运单编号:</lable>
	    	 <input type="text" class="search-text" id="ddId"  name="ddId"   style="width:110px"  >
	    	 <lable >客户名称:</lable>
	    	 <input type="text" class="search-text" id="kname" name="kname"   style="width:110px"  >
	    	 <lable>是否审核:</lable>
			<select  class="easyui-combobox"  id="types" name="types"  style="width:110px;height:22px"  data-options="panelHeight : 'auto',editable:false">
				<option  value="">全部</option>
				<option  value="0">未审核</option>
				<option  value="1">已提审</option>
				<option  value="2">审核通过</option>			
				<option  value="3">审核驳回</option>						
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
    		<table id="dg" title="运单信息" ></table>
    	</div>
    	<div id="tb">
	<!-- <a href="javascript:void(0)" class="easyui-linkbutton" id="getUpdateCar_owner" data-options="iconCls:'icon-edit',plain:true"onclick="shenhetranspfree()">审核</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" id="outputCar_owner" data-options="iconCls:'icon -output',plain:true" onclick="putoutfile()">导出</a>-->
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