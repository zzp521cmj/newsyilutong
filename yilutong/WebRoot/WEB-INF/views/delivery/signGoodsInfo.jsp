<%@page import="com.jy.common.SessionInfo"%>
<%@page import="com.jy.model.User"%>
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
    <title>提货信息管理</title>
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
	<script type="text/javascript" src="./js/function.js"></script><!-- 命名按钮方法   -->
	 <%@ page import="com.jy.common.SessionInfo" %>
	<%@ page import="com.jy.model.User" %>
	
  </head>
  <% 	String flg = (String) request.getAttribute("flg"); %>
  <% User user=(User)request.getSession().getAttribute(SessionInfo.SessionName); %>
  <script type="text/javascript">
	  	var dialog;
 		var grid;
 		var cid='<%=user.getCostomersid()%>';
 		if(cid==null||cid=='null'||cid==""){
 		cid="";
 		}
 		var pid='<%=flg%>';
  		$(function(){
  			grid=$("#dg").datagrid({
  			url : 'delivery.do?method=getSign&customid='+cid,
  			border : false,
  			rownumbers : true,
  			fit : true,
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			multiSort:true,			
  			columns : [[ 				
				{field : 'ck',checkbox : true},
				{field : 'cname',title : '客户名称',width : 80,align:'center'},
				{field:'send_station',title:'发站',width:80,align:'center',  },
				{field : 'car_time',title : '发车批次',width : 80,align:'center'},
				{field : 'car_number',title : '车牌号',width : 80,align:'center'},		
				{field : 'send_time',title : '发车日期',width : 120,align:'center'},
  				{field : 'receipt_time',title : '到车日期',width : 120,align:'center'},
  				
  				{field : 'shiping_order_num',title : '运单号',width : 80,align:'center'},
  				{field : 'custom_name',title : '发货人',width : 80,align:'center'},
  				{field : 'receipt',title : '收货人',width : 80,align:'center'},
  				{field : 'goods_name',title : '品名',width : 80,align:'center'}, 				
  				{field : 'goods_num',title : '件数',width : 80,align:'center'},
  				{field : 'practiacl_num',title : '实际送货件数件数',width : 80,align:'center'},
  				{field : 'goods_weight',title : '重量',width : 80,align:'center'},
  				{field : 'goods_vol',title : '体积',width : 80,align:'center'},
  				{field : 'paytype',title : '付款方式',width : 80,align:'center',hidden:true},
  				{field : 'pay_type',title : '付款方式',width : 80,align:'center',
  					formatter:function(val,row,index){
  						if(val==0){
  							return "回付";
  						}else if(val==1){
  						return "提付";
  						}else if(val==2){
  						return"现付";
  						}else if(val==3){
  						return"货到前付款";		
  						}
  					}
  				},
  				{field : 'paid_fee',title : '实收运费',width : 80,align:'center'},
  				{field : 'trade_agency',title : '代收货款',width : 80,align:'center'},
  				{field : 'is_recept',title : '回单',width : 80,align:'center'},
  				{field : 'back_fee',title : '回扣',width : 80,align:'center'},
  				{field : 'send_fee1',title : '实际送货费',width : 80,align:'center'}, 		
  				{field : 'sign_user',title : '签收人',width : 80,align:'center'},  			
  				{field : 'sign_usernumber',title : '签收人证件',width : 80,align:'center'},
  				{field : 'sign_name',title : '签收代理人',width : 80,align:'center'},
  				{field : 'sign_number',title : '签收代理人证件',width : 120,align:'center'},		
  				{field : 'sign_time',title : '签收日期',width :120,align:'center'},
  				{field : 'sign_remarks',title : '签收备注',width : 80,align:'center'},
		
  			]],
  			pagination:true,//分页
		    pageSize:10,
		    pageList:[5,10,15,20],
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
			$("#phone").val("");
			$("#address").val("");
		} else {
			$('.easyui-layout').layout('panel', 'north').panel('resize',{height:60});
			$('.easyui-layout').layout('resize');
			btnMoreSearch.text("更多条件");
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
  	
		$("#carnum").select2({
		    placeholder: "请输入车牌号",	//默认文本框显示信息
		    minimumInputLength: 1,	//最小输入字符长度
		    allowClear:true,
		    multiple: false,				//设置多项选择，false则只能单选
		    maximumSelectionSize: 5, //最大选择个数
			query: function (query) {
		    	$.ajax({
				   type: "POST",
				   url: "delivery.do?method=selectCarNumber",
				   data: {custom_id:query.term},   //传递你输入框中的值
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
  		
  	//查询
  	function searchCar_owner(){
  		var send_time=document.getElementById("send_time").value;
  		var end_date=document.getElementById("end_date").value;
  		/* if($.trim($("#phone").select2("data"))!=""){
  		phone=$.trim($("#phone").select2("data").text);
  			} */
  /* 		var carnum=document.getElementById("carnum").value;	*/
 			/* alert($("#num").val()),  */
  		$("#dg").datagrid('load',{
  				send_time :send_time,
	 	 		end_date :end_date,					  			
	 	 		num:$.trim($("#num").val()),	 	 		
	 	 		carnum:$.trim($("#carnum").select2("val")),  				
  				receipt:$.trim($("#receipt").val()),
  				signperson:$.trim($("#signperson").val()),
  				goods_name:$.trim($("#goods_name").val()), 			
  				goods_num:$.trim($("#goods_num").val()),
  				pay_type:$.trim($("#pay_type").combobox("getValue")), 	
  							 	
	 	});	  
	 	
  	}
  	//删除
  	function deleteEver(){
  		var checkarray=[];
	 	var array = $('#dg').datagrid('getSelections');
  		for(var i=0;i<array.length;i++){
  			checkarray.push(array[i].shiping_order_id);
	  		 if(array[i].shipping_order_state==0){
	  			checkarray.push(array[i].shiping_order_id);
	  			}else{
	  				$.messager.confirm('提示','您选中的订单号'+array[i].shiping_order_num+'不能执行删除！')
	  			}
	  		}
  		if(array != ""){
  			$.messager.confirm('确认','您确定要删除选中的记录吗？',function(r){ 
    			if (r){ 
    				$.ajax({
						url: "delivery.do?method=deleteDelivery",
						type: "POST",
						data:{del:checkarray.join(",")},
			  				success:function(data){
			  					if (data.flag) {
									parent.$.messager.alert("订单信息删除","订单信息删除成功",'info',
										function(r) {
											$('#dg').datagrid('reload');
 										});
  								} 
  						}
					});
				}  			
  			});
  		}else{
  			$.messager.alert("运单录入","请选择一行信息","info");	
  		}
  	}
  	
  	/*
  	修改查询 
  	*/
  	function modify(){
  		var row=$("#dg").datagrid('getSelections');
  			if(row.length==1){
	  			for(var i=0;i<row.length;i++){		
		  		 if(row[i].shipping_order_state==0){
	  				var id=row[i].shiping_order_id;
					  		dialog = parent.jy.modalDialog({
								title : '订单修改',
								url : 'Delivery.do?method=getEditDeliveryPage&pid=' + id,
								width : 680,
								buttons : [{
									text : '<input type="button" class="btncss" value="修改"/>',
									handler : function() {
										dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
									}
								}] 
							});
	  			}else{
	  				$.messager.confirm('提示','您选中的订单号'+row[i].shiping_order_num+'，已出库，不能执行修改！')
	  				}
		  		}		
  		}else{
  			$.messager.alert("运单录入","请选择一行信息","info");	
  		}	
  	}
  	//详情查询
  	function xiangxixinxi(){
  		var row=$("#dg").datagrid('getSelections');
  			if(row.length==1){
	  			for(var i=0;i<row.length;i++){
		  			var id=row[i].shiping_order_id;
		  		}		
	  			dialog = parent.jy.modalDialog({
				title : '订单详情',
				url : 'delivery.do?method=getDeliveryPage&pid=' + id,
				width : 680,
				buttons : [{
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
					}
				}] 
			});
  		}else{
  			$.messager.alert("运单录入","请选择一行信息","info");	
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
		var sp=cid;
		for(i=1;i<allRows2.length;i++)		
		{
			var col = $('#dg').datagrid( "getColumnOption" , allRows2[i] );
		 	if(col.field!="send_type"&&col.field!="shipping_order_state"&&col.field!="pay_type"){ 
				colName.push(col.title);//把title列名到数组里去 
				fieldName.push(col.field); //把field列属性名到数组里去 
		 	}
		} 
		$("#fieldName").val(fieldName.join(","));
  		 $("#headtitle").val(colName.join(","));
  		 $("#did").val(sp);
  		var outputform=$("#outputform");
  		outputform.submit(); 
  	} 
  	
 	function add() {
		 /* alert(document.getElementById("addbuttons"));
		 alert(document.getElementById("upbuttons")); */
		dialog = parent.jy.modalDialog({
			title : '订单新增',
			url : 'delivery.do?method=addDelivery&pid='+pid,
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
  	//打印
  	function dy(){
  		var row=$("#dg").datagrid('getSelections');
  			if(row.length==1){
	  			for(var i=0;i<row.length;i++){
		  			var pid=row[i].shiping_order_id;
		  		}	
							var url="delivery.do?method=getvDeliveryPrint&pid="+pid;
							ow(url);
  		}else{
  			$.messager.alert("运单录入","请选择一行信息","info");	
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
			title : '导入订单',
			url : 'delivery.do?method=imp',
			width : 600,
			height: 300,
			buttons : [{
				text : '<input type="button" value="导入" class="btncss">',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$);
				}
			}] 
		});
	};
	//重置
	function reset(){

	
	    $("#send_time").val("");
	 	$("#end_date").val("");
		$("#num").val("");		
		$("#carnum").select2("val",'');
		$("#receipt").val("");
		$("#signperson").val("");
		$("#goods_name").val("");		
		$("#goods_num").val("");
		$("#pay_type").combobox("setValue","");
		
	}
	//一维打印
	function printYWM(){
		var row=$("#dg").datagrid('getSelections');
		if(row.length>=1){
			var checkarray=[];
	 		var array = $('#dg').datagrid('getSelections');
  			for(var i=0;i<array.length;i++){
  				checkarray.push(array[i].shiping_order_num);
  			}
  			$("#checkarray").val(checkarray.join(","));
  			$("#printywm").submit();
		}else{
			$.messager.alert("运单录入","请选择一行信息","info");	
		}		
	}
  </script>
  <body class="easyui-layout">
  	<form action="delivery.do" id="outputform" method="post">
    	<div region="north" title="检索" class="st-north" border="false" collapsible="false"  >
    		 <lable>提货日期:</lable>
			<input  id="send_time" name="send_time" class="Wdate"  readonly="readonly" style="width:150px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			-
			<input id="end_date"  name="end_date"class="Wdate"  readonly="readonly" style="width:150px;height:22px;" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
	    	<lable >订单编号:</lable>
	    	 <input type="text" class="search-text" id="num" name="num" style="width:150px;margin-right:0px"  >   	
	    	 <lable >收货人:</lable>
	    	 <input type="text" class="search-text" id="receipt" name="receipt" style="width:150px"  >	  	    	
	    	 <a class="easyui-linkbutton " onClick="searchCar_owner()" data-options="iconCls:'icon-search'"  style="margin-left: 10px">查询</a>	
	    	 <a id="btnMoreSearch" class="btn btn-sm btn-link" type="button" style="margin-top:16px;" href="javascript:void(0)" state="close">更多条件</a>
	    	 <div id="searchInfoId" style="display: none">	
	    	 <lable >品名:</lable>
	    	 <input type="text" class="search-text" id="goods_name" name="goods_name" style="width:150px;margin-right:0px"  >     
	    	 <lable >件数:</lable>
	    	 <input type="text" class="search-text" id="goods_num" name="goods_num" style="width:150px;margin-right:0px"  >
	    	   <lable >付款方式:</lable>
				<select class="easyui-combobox" id="pay_type" name="pay_type"
					style="width:150px;"
					data-options="panelHeight : 'auto',editable:false">
					<option id="" value="">全部</option>
					<option id="" value="0">回付</option>
					<option id="" value="1">提付</option>
					<option id="" value="2">现付</option>
					<option id="" value="3">货到前付</option>
				</select> 	
				<!-- <lable >订单状态:</lable>
				<select class="easyui-combobox" id="order_state" name="shipping_order_state"
					style="width:130px;"
					data-options="panelHeight : 'auto',editable:false">
					<option id="" value="">全部</option>
					<option id="" value="0">未出库</option>
					<option id="" value="1">配送中</option>
					<option id="" value="2">转运中</option>
					<option id="" value="4">签收</option>
				</select> 	  	  -->   		    	  	 	  	    	
	    	 <lable >签收人:</lable>
	    	 <input type="text" class="search-text" id="signperson"  name="signperson"style="width:150px"  >     
  	    	  <lable >车牌号:</lable>
	    	 <input  type="hidden" class="search-text" id="carnum" name="carnum" style="width:150px"  >
			</div>
    	</div>
    	<div region="center" >
    		<table id="dg" title="提货信息" ></table>
    	</div>
    	<div id="tb">
   		<!--  <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true"   onclick="add()">添加</a> 
   		    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true"   onclick="xiangxixinxi()">详细</a>
		    <a href="javascript:void(0)" class="easyui-linkbutton" id="getUpdateCar_owner" data-options="iconCls:'icon-edit',plain:true"onclick="modify()">修改</a>
		  	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true"   onclick="deleteEver()">删除</a>
		   	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true"onclick="printYWM()">一维码打印</a>
		   	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reset',plain:true"onclick="reset()">重置</a>
	  		<a href="javascript:void(0)"	class="easyui-linkbutton" data-options="iconCls:'icon-input',plain:true" onclick="showIcons()" id="tbru"style="display: none">导入</a>
		   <a href="javascript:void(0)" class="easyui-linkbutton" id="outputCar_owner" data-options="iconCls:'icon-output',plain:true" onclick="putoutfile()">导出</a>
		  -->

		</div>	
		<input type="hidden" name="method" value="outgetSign">
		<input type="hidden" id="fieldName" name="fieldName">
		<input type="hidden" id="headtitle" name="headtitle">
		<input type="hidden" id="id" name="customid">
		</form>
		 <form action="shipOrder.do" target="_blank" id="printywm" method="post">
		 	<input type="hidden" name="method" value="getShipOrderPrintYwm">
		 	<input type="hidden" id="checkarray" name="checkarray">
		 </form>
  </body>
</html>