<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
     <base href="<%=basePath%>">
    
    <title>车辆选择</title>
    
	<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="./css/main.css">
	<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
	<script type="text/javascript" src="./js/select2/select2.js"></script>
	<script type="text/javascript" src="./js/select2/select2_locale_zh-CN.js"></script>
	
<script type="text/javascript">
	var grid;
	var dialog;
	$(function(){
/* 	$('#cc2').combotree({    
		url: "depn.do?method=getTree&&id=",    
		width: 150,
		onBeforeLoad: function(node, param) {
		
	        if (node == null) {
	            $('#cc2').combotree('tree').tree('options').url = "depn.do?method=getTree&&id=";//加载顶层节点
	        } else {
	        
	            $('#cc2').combotree('tree').tree('options').url = "depn.do?method=getTree&&id=" + node.id;//加载下层节点
	        }
	      
	       }     
		});  */
		/* 根据车牌号查询 */
		  $("#number_search").select2({
		 placeholder: "请选择车辆",	//默认文本框显示信息
			 minimumInputLength: 1,	//最小输入字符长度
			 multiple: false,				//设置多项选择，false则只能单选
			 allowClear:true,
		 maximumSelectionSize: 5,
	
		 query: function (query) {
		    	$.ajax({
				   type: "POST",
				   url: "travel.do?method=getCarNum",
				   data: {search:query.term},   //传递输入框中的值
				   success: function(msg){
		 		   	var msg=$.parseJSON(msg);		
		 			var data = {results: []};		
					$.each(msg,function(x,y){
						data.results.push({id: y.id, text: y.name});
					});
			        query.callback(data);
				   }
				});
		    }
		    });
	
			/* 初始化页面 */
			grid=$("#dg").datagrid({
			url : 'unqualified.do?method=selectorder',
			border : false,
			rownumbers : true,
			idField:'driver_id',
			fit : true,
			singleSelect : true,
			
			selectOnCheck : true,
			checkOnSelect :true,
			columns : [[
				{field : 'ck',checkbox : true},
				{field : 'shiping_order_num',title : '运单号',width : 80,  align : 'center'},
				{field : 'goods_name',title : '货品名称',width : 80,  align : 'center'},
					{field : 'custom_name',title : '发货客户名',width : 120,align : 'center'},
				{field : 'send_station',title : '发站',width : 120,align : 'center'},
				{field : 'end_address',title : '到站',width : 140,  align : 'center'},
				{field : 'receipt',title : '收货人姓名',width : 120,  align : 'center'},
	 	
				{field : 'weituo_time',title : '委托时间',width : 125,align:'center',
  					formatter: function(value,row,index){
  				if(value!=undefined){
  				value=value.substr(0,19);
  				}
  					return value;
  				}
  				},
  				{field : 'send_shouji',title : '发货人电话',width : 160,  align : 'center'},
				{field : 'receipt_phone',title : '收货方电话',width : 80,  align : 'center'},
				{field : 'goods_num',title : '件数',width : 80,  align : 'center'},
				{field : 'goods_weight',title : '重量',width : 80,  align : 'center'},
				{field : 'goods_vol',title : '体积',width : 80,  align : 'center'},
				{field : 'insurance',title : '保险费',width : 80,  align : 'center',
				formatter : function(val, row, index) {
					if (val == null) {
						return "0.0";
					}
				},
				},
				{field : 'trade_agency',title : '代收款',width : 80,  align : 'center'},	
				
			]],
			onSelect:function(index,data){
  				$("#fieldName").val(data.fieldName);
  				$("#headtitle").val(data.headtitle);
  				$("#shiping_order_num").val(data.shiping_order_num);
  				$("#send_station").val(data.send_station);
  				$("#end_address").val(data.end_address);
  				if(data.insurance==null){
  				$("#insurance").val("0.0");
  				}else{
  				$("#insurance").val(data.insurance);
  				}
  				$("#custom_name").val(data.custom_name);
  				$("#receipt").val(data.receipt);
  				$("#trade_agency").val(data.trade_agency);
  				$("#goods_name").val(data.goods_name);
  				$("#send_time").val(data.weituo_time);

  				$("#customer_id").val(data.customer_id);
  				$("#send_shouji").val(data.send_shouji);
  				$("#receipt_phone").val(data.receipt_phone);
  				
  			},
  			
			pagination : true,
			pageSize : 10,
			pageList : [5, 10, 15, 20 ],
			toolbar : '#tb'
		});
			
			
			document.onkeydown = function(event) {
				e = event ? event : (window.event ? window.event : null);
				if (e.keyCode == 13) {
					//执行的方法 
					searchTruck();
				}
			};	
	});
 	var submitForm = function($dialog, $grid, $pjq, $mainMenu) {
 	
 			var companys=$(window.parent.document).find('#companys').get(0).contentWindow;
 			companys.document.getElementById('shiping_order_num').value=$("#shiping_order_num").val();
 			companys.document.getElementById('goods_name').value=$("#goods_name").val();
 		 	companys.document.getElementById('send_station').value=$("#send_station").val();
 		 	companys.document.getElementById('end_address').value=$("#end_address").val(); 
 		 	companys.document.getElementById('send_time').value=$("#send_time").val(); 
 		 	
 		  	companys.document.getElementById('insurance').value=$("#insurance").val(); 
 		   	companys.document.getElementById('custom_name').value=$("#custom_name").val(); 
 		   
 		    companys.document.getElementById('receipt').value=$("#receipt").val();
 		  	companys.document.getElementById('trade_agency').value=$("#trade_agency").val();
 		  	companys.document.getElementById('customer_id').value=$("#customer_id").val(); 			 	
 		  	
 		  		companys.document.getElementById('send_shouji').value=$("#send_shouji").val();
 		  	companys.document.getElementById('receipt_phone').value=$("#receipt_phone").val(); 		
 			$dialog.dialog('close');
 		};
 		/* 查询 */
 	  	function searchTruck(){
 	  		$('#dg').datagrid('load',{
 	  			orderid : $.trim($("#orderid").val()),
 	  			ordername:$.trim($("#ordername").val())
 	  		});
 	  	}
 	  	function reset() {
		$("#orderid").val("");
		$("#ordername").val("");


	}
 	</script>
 </head>
 <body class="easyui-layout">
  	<form action="shipOrder.do" id="outputform" method="post">
    	<div region="north" title="运单信息" class="st-north" border="false" data-options="collapsible:false">
			<div>
				<lable>运单号：</lable><input type="text" id="orderid" name="orderid"style="width: 140px"/>
				<lable  class="divlabel" >货品名称：</lable><input type="text" id="ordername" name="ordername"/><!-- 所属机构：</lable><input id="cc2" name="did" style="width: 130px"> -->
				&nbsp<a class="easyui-linkbutton" onclick="searchTruck()" data-options="iconCls:'icon-search'">查询</a>
			</div>
			<!-- <div id="cc">
				<lable>载货状态:</lable><input type="text" id="" placeholder="请选择载货状态">
				<lable>GPS状态:</lable><input type="text" id="" placeholder="全部">
			</div> -->
    	</div>
    	
    	<div region="center" title="订单信息列表" region="center" style="background:#eee;overflow-y:hidden">
    		<table id="dg"></table>
    	</div>
    	<div id="tb">
		 <!--   <a class="easyui-linkbutton" id="tbput" onclick="" data-options="iconCls:'icon-input',plain:true"style="display: none">导入</a> -->
		    <!--  <a class="easyui-linkbutton" id="tbhuifang" onclick="" data-options="plain:true"style="display: none">回放</a>
		  <a class="easyui-linkbutton" id="tbgenzong" onclick="" data-options="plain:true"style="display: none">跟踪</a>-->
		  <!--  <a class="easyui-linkbutton" onclick="tbgongxiang" data-options="plain:true"style="display: none">货运人共享</a> -->
		   <a class="easyui-linkbutton" id="tbreset" onclick="reset()"data-options="iconCls:'icon-reset',plain:true">重置</a>
		</div>
		<input type="hidden" name="method" value="outShipOrder">
		<input type="hidden" id="fieldName" name="fieldName">
		<input type="hidden" id="headtitle" name="headtitle">
		
		<input type="hidden" id="shiping_order_num" name="shiping_order_num"/>
		<input type="hidden" id="goods_name" name="goods_name"/>
		<input type="hidden" id="send_time" name="send_time"/>
		<input type="hidden" id="send_station" name="send_station"/>
		<input type="hidden" id="end_address" name="end_address"/>
		<input type="hidden" id="insurance" name="insurance"/>
		<input type="hidden" id="custom_name" name="custom_name"/>
		<input type="hidden" id="receipt" name="receipt"/>
		<input type="hidden" id="trade_agency" name="trade_agency"/>
		<input type="hidden" id="customer_id" name="customer_id"/>
		<input type="hidden" id="send_shouji" name="send_shouji"/>
		<input type="hidden" id="receipt_phone" name="receipt_phone"/>
		</form>
		<input id="functionname"type="hidden" value=${function}>
  </body>
</html>
