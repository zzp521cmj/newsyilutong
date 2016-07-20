<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>历史调整记录</title>
    <jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="./css/main.css">
	<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
  	<script type="text/javascript" src="./js/select2/select2.js"></script>
	<script type="text/javascript" src="./js/select2/select2_locale_zh-CN.js"></script>
  </head>
  <% String pid=(String)request.getAttribute("pid");%>
  <script type="text/javascript">  
  	var pid='<%=pid%>';
  		$(function(){
		 $("#dg").datagrid({
			url : 'transpfree.do?method=getTransportfreeRc&ddids='+pid,
  			border : false,
  			rownumbers : true,
  			fit : true,
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			columns : [[
  				{field : 'changefreeid',checkbox : true},
  				{field : 'changetime',title : '调整时间',width : 120,align:'center',
  				formatter: function(value,row,index){
		  				if(value!=undefined){
		  				value=value.substr(0,19);
		  				}
		  					return value;
		  				} 				 
  				},
  				{field : 'shiping_order_num',title : '运单号',width : 80,align:'center'},  				
  				//{field : 'formerchange',title : '原调整金额',width : 125,align:'center'},
  				{field : 'formerfree',title : '原金额',width : 100,align:'center'},
  				{field : 'downfree',title : '冲减金额',width : 80,align:'center'},
  				{field : 'newfree',title : '现金额',width : 100,align:'center'},
  				{field : 'newchange',title : '现调整金额',width : 120,align:'center'},
  				{field : 'usernametz',title : '调整人',width : 80,align:'center'},//方位（m³）
  				{field : 'changeremark',title : '调整原因',width : 120,align:'center'},
  				
  			]],
  			pagination:true,//分页
		    pageSize:10,
		    pageList:[10,20,35,20],
  			toolbar : '#tb'
 			});
 			$("#carid").select2({
		    placeholder: "请输入车牌号",	//默认文本框显示信息
		    minimumInputLength: 1,	//最小输入字符长度
		    allowClear:true,
		    multiple: false,				//设置多项选择，false则只能单选
		    maximumSelectionSize: 5, //最大选择个数
			query: function (query) {
		    	$.ajax({
				   type: "POST",
				   url: "car_b_rec.do?method=getCar_idLength",
				   data: {plate_number :query.term},   //传递你输入框中的值
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
	<%-- 	var number='<%= number%>';
			if(number!="null"){
				$("#dg").datagrid('load',{ 	 		
		 	 		plate_number:number	
		 	});	  	
		 	$("#plid").val(number);	 
			}
	 	 --%>
  		});
  		
 		//查询
  	function searchCar_bid_record(){
  		var startDate=document.getElementById("startDate").value;
  		var endDate=document.getElementById("endDate").value;
  				$("#dg").datagrid('load',{
  					start_date :startDate,
	 	 			end_date :endDate,
	 	 			//plate_number:$.trim($("#carid").select2("val"))
			 	});	  
 	 	
	 	
  	}
 	//重置按钮
	function equimentRuset(){
		//$("#carid").select2("val", "");
		document.getElementById("userName").value="";
		document.getElementById("contactInformation").value="";
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
  </script>
  <body class="easyui-layout">
   <form action="car_b_rec.do" id="outputform" method="post">
  	<div region="north" title="检索" class="st-north" border="false" collapsible="false"  >
   	<lable >调整日期:</lable>
			<input  id="startDate"  class="Wdate" name="start_date" readonly="readonly" style="width:150px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			-
			<input id="endDate"  class="Wdate" name="end_date" readonly="readonly" style="width:150px;height:22px;" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />		
			<a class="easyui-linkbutton " onclick="searchCar_bid_record()" data-options="iconCls:'icon-search'" style="margin-left: 10px;">查询</a>		
    	</div>
    	<div region="center" >
    		<table id="dg" title="运费调整记录信息"></table>
    	</div>
    	<div id="tb">
    	<a href="javascript:void(0)" class="easyui-linkbutton " onclick="equimentRuset()" data-options="iconCls:'icon-reset',plain:true" >重置</a>
		   <!-- <a href="javascript:void(0)" class="easyui-linkbutton" id="outputAgreement" data-options="iconCls:'icon-output',plain:true" onclick="putoutfile()">导出</a>
	 -->	</div>	
			<input type="hidden" name="method" value="outputCar">
			<input type="hidden" id="fieldName" name="fieldName">
			<input type="hidden" id="headtitle" name="headtitle">
		</form>
	
  </body>
</html>
