<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>订单信息管理</title>
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
	<script type="text/javascript"	src="./js/function.js"></script>
  	<%
	String realPath1 = "http://" + request.getServerName() + ":" + request.getServerPort() +"/truck_cloud/"; 
 	%>
  </head>
  <script type="text/javascript">
  
	  	var dialog;
 		var grid;
  		$(function(){
  			grid=$("#dg").datagrid({
  			url : 'shipOrder.do?method=getSignShipOrder',
  			border : false,
  			rownumbers : true,
  			fit : true,
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			columns : [[
  				{field : 'ck',checkbox : true},
  				{field : 'shiping_order_num',title : '订单号',width : 80,align:'center'},
  				{field : 'shipping_order_state',title : '订单状态',width : 70,align:'center',
  	  				formatter:function(val,row,index){
  	  						if(val==0){
  	  						return "受理";
  	  						}else if(val==1){
  	  						return "在途";
  	  						}else if(val==2){
  	  						return "到达";
  	  						}else if(val==3){
  	  						return "配送";
  	  						}else if(val==4){
  	  						return "签收";
  	  						}
  	  				}	
  	  			},
  				{field : 'start_address',title : '起运地',width : 80,align:'center'},
  				{field : 'end_address',title : '到达地',width : 80,align:'center'},
  				{field : 'checkp',title : '托运方',width : 70,align:'center'},
  				{field : 'receipt',title : '收货方',width : 70,align:'center'},
  				{field : 'receipt_address',title : '收货地址',width : 100,align:'center'},
  				{field : 'goods_name',title : '货物',width : 100,align:'center'},
  				{field : 'transport_pay',title : '运费总额',width : 80,align:'center'},
  				{field : 'check_type',title : '发货方式',width : 100,align:'center',
  				formatter:function(val,row,index){
  						if(val==0){
  							return "发货人门点";
  						}else if(val==1){
  						return "起运货运站";
  						}
  					}	
  				},
  				{field : 'send_type',title : '送货方式',width : 70,align:'center',
  				formatter:function(val,row,index){
  						if(val==0){
  							return "自提";
  						}else if(val==1){
  							return "送货";
  						}
  					}
  				},
  				{field : 'check_time',title : '托运时间',width : 140,align:'center'},
  				{field : 'imageUrl',title : '签收图片',width : 80,align:'center',
  	  				formatter:function(val,row,index){
	  	  					if(val==null){
								return "订单未签收或无图片";
							}else{
								return "<a href='javascript:void(0)' style='color:red' title='点击查看签收图片' onclick=\"showimg('"+val+"')\">点击查看</a>";
							}
  	  					}
  	  				}
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
  	
		$("#carid").select2({
		    placeholder: "请输入车主电话",	//默认文本框显示信息
		    minimumInputLength: 1,	//最小输入字符长度
		    allowClear:true,
		    multiple: false,				//设置多项选择，false则只能单选
		    maximumSelectionSize: 5, //最大选择个数
			query: function (query) {
		    	$.ajax({
				   type: "POST",
				   url: "shipOrder.do?method=getPhoneLength",
				   data: {phones:query.term},   //传递你输入框中的值
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
  		var startDate=document.getElementById("startDate").value;
  		var endDate=document.getElementById("endDate").value;
  		/* if($.trim($("#phone").select2("data"))!=""){
  		phone=$.trim($("#phone").select2("data").text);
  			} */
  		$("#dg").datagrid('load',{
  				start_date :startDate,
	 	 		end_date :endDate,
	 	 		name:$.trim($("#ddId").val()),
	 	 		phone_number:$.trim($("#phone").val()),
  				//institution:$.trim($("#cc3").combotree("getValue")),
  				type:$.trim($("#drivingType").val()),
  				shipping_order_state:$.trim($("#shipping_order_state").val())
	 	});	  
	 	
  	}
  	//删除
  	function deleteEver(){
  		var checkarray=[];
	 	var array = $('#dg').datagrid('getSelections');
  		for(var i=0;i<array.length;i++){
  			checkarray.push(array[i].shiping_order_id);
  		}
  		if(array != ""){
  			$.messager.confirm('确认','您确定要删除选中的记录吗？',function(r){ 
    			if (r){ 
    				$.ajax({
						url: "shipOrder.do?method=deleteShipOrder",
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
  			$.messager.alert("订单签收","请选择一行信息","info");	
  		}
  	}
  	
  	
  	function showimg(obj){
  		dialog = parent.jy.modalDialog({
			title : '签收图片详情',
			url : 'shipOrder.do?method=getimgurl&iurl=' + obj,
			width : 680,
			buttons : [{
				text : '',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.qs(dialog, grid, parent.$);
				}
			}] 
		});
  	}
  	/*
  	修改查询 
  	*/
  	function modify(){
  		var row=$("#dg").datagrid('getSelections');
  			if(row.length==1){
	  			for(var i=0;i<row.length;i++){
		  			var id=row[i].shiping_order_id;
		  		}		
	  			dialog = parent.jy.modalDialog({
				title : '订单修改',
				url : 'shipOrder.do?method=getEditShipOrderPage&pid=' + id,
				width : 680,
				buttons : [{
					text : '<input type="button" class="btncss" value="修改"/>',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
					}
				}] 
			});
  		}else{
  			$.messager.alert("订单签收","请选择一行信息","info");	
  		}	
  	}
  	//详情查询
  	function xiangxixinxi(){
  		var isok=$("#shipping_order_state").val();
  		if(isok==4){
  			var row=$("#dg").datagrid('getSelections');
  			if(row.length==1){
	  			for(var i=0;i<row.length;i++){
		  			var id=row[i].shiping_order_id;
		  		}		
	  			dialog = parent.jy.modalDialog({
				title : '订单详情',
				url : 'shipOrder.do?method=getEditSignShipOrderPage&pid=' + id+'&isok=4',
				width : 680,
				buttons : [{
					text : '',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.qs(dialog, grid, parent.$);
					}
				}] 
			});
  			}else{
	  			$.messager.alert("订单签收", '请选择一行信息', 'info');
	  		}
  		}else{
	  		var row=$("#dg").datagrid('getSelections');
	  			if(row.length==1){
		  			for(var i=0;i<row.length;i++){
			  			var id=row[i].shiping_order_id;
			  		}		
		  			dialog = parent.jy.modalDialog({
					title : '订单详情',
					url : 'shipOrder.do?method=getEditSignShipOrderPage&pid=' + id+'&isok=0',
					width : 680,
					buttons : [{
						text : '<input type="button" id="btncss"  class="btncss" value="签收"/>',
						handler : function() {
							dialog.find('iframe').get(0).contentWindow.qs(dialog, grid, parent.$);
						}
					}] 
				});
	  		}else{
	  			$.messager.alert("订单签收", '请选择一行信息', 'info');
	  		}	
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
		for(i=1;i<allRows2.length;i++)
		{
			var col = $('#dg').datagrid( "getColumnOption" , allRows2[i] );
			colName.push(col.title);//把title列名到数组里去 
			fieldName.push(col.field); //把field列属性名到数组里去 
		} 
		$("#fieldName").val(fieldName.join(","));
  		 $("#headtitle").val(colName.join(","));
  		var outputform=$("#outputform");
  		outputform.submit(); 
  	}
  	
 	function addShipOrder() {
		 /* alert(document.getElementById("addbuttons"));
		 alert(document.getElementById("upbuttons")); */
		dialog = parent.jy.modalDialog({
			title : '订单新增',
			url : 'shipOrder.do?method=addShipOrder',
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
  	
  </script>
  <body class="easyui-layout">
  	<form action="driver.do" id="outputform" method="post">
    	<div region="north" title="检索" class="st-north" border="false" collapsible="false"  >
	    	<lable>托运日期:</lable>
			<input  id="startDate"  class="Wdate"  readonly="readonly" style="width:150px;height:22px; " onfocus="WdatePicker({skin:'twoer'})" />
			-
			<input id="endDate"  class="Wdate"  readonly="readonly" style="width:150px;height:22px;" onfocus="WdatePicker({skin:'twoer'})" />
	    	<lable class="divlabel">订单编号:</lable>
	    	 <input type="text" class="search-text" id="ddId"  style="width:150px"  >
	    	 <a class="easyui-linkbutton" onclick="searchCar_owner()" data-options="iconCls:'icon-search'" >查询</a>	
	    	 <a id="btnMoreSearch" class="btn btn-sm btn-link" type="button" style="margin-top:16px;" href="javascript:void(0)" state="close">更多条件</a>
	    	 <div id="searchInfoId" style="display: none">
	    	<lable >发货人手机:</lable>
	    	<input type="text"  class="search-text"style="width:150px"   id="phone" >
			<!--<lable>所属机构:</lable>
			<input id="cc3" name="did">-->
			<lable class="divlabel">到达地址:</lable>
			<input type="text" class="search-text" id="address" >
			<lable class="divlabel">是否签收:</lable>
				<select id='shipping_order_state' class="combobox" name="shipping_order_state" style="width:150px;height:22px"
						 data-options="panelHeight : 'auto',editable:false">
							<option id="" value="0" >未签收</option>
							<option id="" value="4">已签收</option>
					</select>
			</div>
    	</div>
    	<div region="center" >
    		<table id="dg" title="订单信息" ></table>
    	</div>
    	<div id="tb">

		</div>
		
	
		<input type="hidden" name="method" value="outShipOrder">
		<input type="hidden" id="fieldName" name="fieldName">
		<input type="hidden" id="headtitle" name="headtitle">
		</form>	
  </body>
</html>