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
    <title>中转费核销</title>
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
  			url : 'write_off.do?method=getWrite_off',
  			border : false,
  			rownumbers : true,
  			fit : true,
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			multiSort:true,
  					columns : [[
  				{field : 'ck',checkbox : true},
  				{field : 'shiping_order_num',title : '订单编号',width : 90,align:'center'},
  				{field : 'start_address',title : '起运地',width : 90,align:'center'},
  				{field : 'end_address',title : '到达地',width : 90,align:'center'},
  				{field : 'check_time',title : '托运时间',width : 90,align:'center'},
  				{field : 'checkp',title : '托运方',width : 90,align:'center'},
  				{field : 'check_tel',title : '托运方电话',width : 90,align:'center'},
  				{field : 'receipt',title : '收货方',width : 90,align:'center'},
  				{field : 'receipt_phone',title : '货物方电话',width : 90,align:'center'},
  				{field : 'receipt_address',title : '收货地址',width : 90,align:'center'},
  				{field : 'updatetime',title : '录入时间',width : 90,align:'center'},
  				{field : 'shipping_order',title : '制单人',width : 90,align:'center'},
  				{field : 'write_off',title : '是否核销',width : 90,align:'center',
  					formatter:function(val,row,index){
  						if(val==0 ){
  							return "未完成核销";
  						}else if(val==1){
  						return "已核销";
  						}else if(val==null){
  						return "未核销";
  						}
  					}	
  				
  				},
  				
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
  		function modify(){
  		var row=$("#dg").datagrid('getSelections');
  			if(row.length==1){
	  			for(var i=0;i<row.length;i++){
		  			var id=row[i].shiping_order_id;
		  		}		
	  			dialog = parent.jy.modalDialog({
				title : '费用核销',
				url : 'write_off.do?method=getEditCompanyPage&pid=' + id,
				width : 680,
				buttons : [{
					text : '<input type="button" class="btncss" value="核销"/>',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
					}
				}] 
			});
  		}else{
  			$.messager.alert("中转费核销","请选择一行信息","info");
  		}	
  	}

  		//查询
  	function searchCar_owner(){
  		var check_time=document.getElementById("check_time").value;
  		var updatetime=document.getElementById("updatetime").value;
  		/* if($.trim($("#phone").select2("data"))!=""){
  		phone=$.trim($("#phone").select2("data").text);
  			} */
  		$("#dg").datagrid('load',{
  				check_time :check_time,
	 	 		updatetime :updatetime,
	 	 		shiping_order_num:$.trim($("#ddId").val()),
	 	});	  
	 	
  	}

  //重置
	function reset() {
		$("#updatetime").val("");
		$("#check_time").val("");
		$("#ddId").val("");
	}
  	
 	

  

  </script>
  <body class="easyui-layout">
  <form action="shipOrder.do" id="outputform" method="post">
    	<div region="north" title="检索" class="st-north" border="false" collapsible="false"  >
	    	<lable>录入时间:</lable>
			<input  id="updatetime"  class="Wdate"  readonly="readonly" style="width:150px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			<lable>托运时间:</lable>
			<input id="check_time"  class="Wdate"  readonly="readonly" style="width:150px;height:22px;" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
	    	<lable class="divlabel">订单编号:</lable>
	    	 <input type="text" class="search-text" id="ddId"  style="width:150px"  >
	    	 <a class="easyui-linkbutton" onclick="searchCar_owner()" data-options="iconCls:'icon-search'" >查询</a>	
	    
    	</div>
    	<div region="center" >
    		<table id="dg" title="汇总信息" ></table>
    	</div>
    	<div id="tb">
   <a href="javascript:void(0)" class="easyui-linkbutton"  data-options="iconCls:'icon-edit',plain:true"onclick="modify()">核销</a>
		</div>	
		</form>	
  </body>
</html>