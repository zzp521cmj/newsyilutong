<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>临时信息</title>
    <jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="./css/main.css">
	<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
  	<script type="text/javascript" src="./js/select2/select2.js"></script>
	<script type="text/javascript" src="./js/select2/select2_locale_zh-CN.js"></script>
  </head>
  <% String number=(String)request.getAttribute("number");%>
  <script type="text/javascript">
  		$(function(){
		 $("#dg").datagrid({
			url : 'cityTarmAgreem.do?method=getcityTarmAgreement',
  			border : false,
  			rownumbers : true,
  			fit : true,
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			columns : [[
  				{field : 'ck',checkbox : true},
  				{field : 'code',title : '编号',width : 90,align:'center'},
  				{field : 'state',title : '类型',width : 90,align:'center',
  				formatter:function(val,row,index){
  				if(val=='null'){
  					
  					return '';
  				}else{
  						return val;
  				}
  				}
  				},
  				
  				{field : 'pcd_code',title : '派车单编号',width : 150,align:'center'},
  				{field : 'car_id',title : '车牌号',width : 80,align:'center'},
  				{field : 'department_name',title : '制作机构',width : 110,align:'center'},
  				{field : 'lastname',title : '下一机构',width : 110,align:'center'},
  				{field : 'arrive',title : '到达时间',width : 140,align:'center'},
  				{field : 'models',title : '车长（m）',width : 70,align:'center'},
  				{field : 'isArrive',title : '是否到达',width : 60,align:'center',
  					formatter:function(val,row,index){
  						if(val==0){
  							return "否";
  						}else{
  							return "是";
  						}
  					}
  				},
  				{field : 'createtime',title : '协议制作时间',width : 140,align:'center'},
  				{field : 'createtime',title : '协议制作时间',width : 140,align:'center'},
  				
  			]],
  			pagination:true,//分页
		    pageSize:10,
		    pageList:[5,10,15,20],
  			//toolbar : '#tb'
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
				   url: "cityAgreem.do?method=getCar_idLength",
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
  		});
  		
 		//查询
  	function searchCar_bid_record(){
		  		var car_id="";
		  		if($.trim($("#carid").select2("data"))!=""){
		  		car_id=$.trim($("#carid").select2("data").text);
		  			}
		  			
		  		var date1=document.getElementById("date1").value;	
		  	if(date1!=''){
		   		 var str =date1; 
				// 转换日期格式 
				str = str.replace(/-/g, '/'); // "2010/08/01"; 
				// 创建日期对象 
				var date = new Date(str); 
				// 加一天 
				date.setDate(date.getDate() + 1); 
				// 没有格式化的功能，只能一个一个取 
				date1 = date.getFullYear() + '-' 
				    // 因为js里month从0开始，所以要加1 
				    + (parseInt(date.getMonth()) + 1) + '-' 
				    + date.getDate(); 
				    
		    }
  				$("#dg").datagrid('load',{
  					pcd_code:$.trim($("#pcd_code").val()),
	 	 			car_id:car_id,
	 	 			//isCar: $.trim($("#isCar").val()),
	 	 			iadate:date1,
			 	});	  
 	 	
	 	
  	}
  </script>
  <body class="easyui-layout">
  	<div region="north" title="检索" class="st-north" border="false" style="height:62px" collapsible="false"  >
	    	<lable>编号：</lable>
	    	 <input type="text"  class="search-text" id="pcd_code"  >
	    	 <labl>车牌号：</lable>
			<input type="text"   class="search-text" style="margin-right: 10px;" id="carid" >
			<lable calss="divlabel">制作时间：</lable>
	    	 <input id="date1"  class="Wdate"  readonly="readonly" style="width:150px;height:22px; margin: 5px 10px 5px 5px;" onfocus="WdatePicker({skin:'twoer'})"  >
			<a class="easyui-linkbutton" onclick="searchCar_bid_record()" data-options="iconCls:'icon-search'">查询</a>		
    	</div>
    	<div region="center" >
    		<table id="dg" title="车辆承运协议信息"></table>
    	</div>
    	<div id="tb">
		   <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true"onclick="addAgreement()">新增</a>
		   <a href="javascript:void(0)" class="easyui-linkbutton" id="getUpdateAgreement" data-options="iconCls:'icon-edit',plain:true"onclick="getUpdateAgreement()">修改</a>
		   <a href="javascript:void(0)" class="easyui-linkbutton" id="outputAgreement" data-options="iconCls:'icon-output',plain:true" onclick="putoutfile()">导出</a>
		   <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true"   onclick="deleteAgreement()">删除</a>
		</div>	
    
  </body>
</html>
