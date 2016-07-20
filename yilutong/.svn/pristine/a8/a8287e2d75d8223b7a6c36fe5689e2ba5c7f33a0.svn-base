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
    <title>明细表</title>
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
  <script type="text/javascript">
	  	var dialog;
 		var grid;
  		$(function(){
  			grid=$("#dg").datagrid({
  			url : 'detailed.do?method=getShippingOrder',
  			border : false,
  			rownumbers : true,
  			fit : true,
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			multiSort:true,
  				columns : [[
  				{field : 'ck',checkbox : true},
  				{field : 'shiping_order_num',title : '订单号',width : 90,align:'center'},
  			 	{field : 'start_address',title : '起运地',width : 90,align:'center'},
  				{field : 'end_address',title : '到达地',width : 90,align:'center'},
  				{field : 'checkp',title : '托运方',width : 90,align:'center'},
  				{field : 'receipt',title : '收货方',width : 90,align:'center'},
  				{field : 'receipt_tel',title : '收货方电话',width : 80,align:'center'},
  				  {field : 'receipt_address',title : '收货地址',width : 140,align:'center'}, 
  				{field : 'goods_name',title : '货物',width : 80,align:'center'},
  				{field : 'transport_pay',title : '运费总额',width : 80,align:'center'},
  			
  			]],
  				
  			pagination:true,//分页
		    pageSize:10,
		    pageList:[5,10,15,20],
  			toolbar : '#tb'
  		});
  		
  		
  		
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
		    placeholder: "请输入车牌号",	//默认文本框显示信息
		    minimumInputLength: 1,	//最小输入字符长度
		    allowClear:true,
		    multiple: false,				//设置多项选择，false则只能单选
		    maximumSelectionSize: 5, //最大选择个数
			query: function (query) {
		    	$.ajax({
				   type: "POST",
				   url: "income.do?method=IncemCarid",
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
  		
//删除
  	function deleteEver(){
  		var checkarray=[];
  		var che=[];
	 	var array = $('#dg').datagrid('getSelections');
  		for(var i=0;i<array.length;i++){
  			checkarray.push(array[i].shiping_order_id);
  			che.push(array[i].shiping_order_id);
  			}
  		if(array != ""){
  			$.messager.confirm('确认','您确定要删除选中的记录吗？',function(r){ 
    			if (r){ 
    				$.ajax({
						url: "detailed.do?method=deleteDetailed",
						type: "POST",
						data:{	
								del:checkarray.join(","),
								che:che.join(",")
						},
			  				success:function(data){
			  					if (data.flag) {
									parent.$.messager.alert("中转公司信息删除","中转公司信息删除成功",'info',
										function(r) {
											$('#dg').datagrid('reload');
 										});
  								} 
  						}
					});
				}  			
  			});
  		}else{
  			$.messager.alert("明细表","请选择要删除的信息","info");
  		}
  	}
  	//修改查询 
	function modify(){
  		var row=$("#dg").datagrid('getSelections');
  			if(row.length==1){
	  			for(var i=0;i<row.length;i++){
		  			var id=row[i].shiping_order_id;
		  		}		
	  			dialog = parent.jy.modalDialog({
				title : '明细表编辑',
				url : 'detailed.do?method=getEditIncomePage&pid=' + id,
				width : 680,
			
  				
				buttons : [{
					text : '<input type="button" class="btncss" value="编辑"/>',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
					}
				}] 
			});
  		}else{
  			$.messager.alert("明细表","请选择一行信息","info");
  		}	
  	}
  		//查询
 	function searchCar_owner() {
		$("#dg").datagrid('load', { 
			shiping_order_num:$.trim($("#shiping_order_num").val()),
		});
	}
	
  //重置
	function reset() {
		$("#shiping_order_num").val("");
	}
  	
 	

  

  </script>
  <body class="easyui-layout">
  <form action="shipOrder.do" id="outputform" method="post">
    <div region="north" title="检索" class="st-north" border="false" collapsible="false"  >
     	<lable >订单编号:</lable>
	    	<input type="text"  class="search-text"style="width:150px"   id="shiping_order_num" >
	    	
	    	 <a class="easyui-linkbutton" onclick="searchCar_owner()" data-options="iconCls:'icon-search'" >查询</a>	
    	</div>
    	<div region="center" >
    		<table id="dg" title="汇总信息" ></table>
    	</div>
    	<div id="tb">
   <!-- <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true"onclick="add()">新增</a> -->
		   <a href="javascript:void(0)" class="easyui-linkbutton"  data-options="iconCls:'icon-edit',plain:true"onclick="modify()">编辑</a>
		  <!--  <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true"   onclick="deleteEver()">删除</a> -->
		</div>	
		</form>	
  </body>
</html>