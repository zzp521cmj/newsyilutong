<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>配送费结算历史记录</title>
<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
<script type="text/javascript" src="./js/select2/select2.js"></script>
<script type="text/javascript"
	src="./js/select2/select2_locale_zh-CN.js"></script>
</head>
<%
	String pid = (String) request.getAttribute("pid");
	String settl_order = (String) request.getAttribute("state");
%>
<script type="text/javascript">  
  	var pid='<%=pid%>';
  		$(function(){
		 $("#dg").datagrid({
			url : 'distribu.do?method=getSettleRc&order_id='+pid+'&settl_order='+'<%=settl_order%>',
  			border : false,
  			rownumbers : true,
  			fit : true,
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			columns : [[
  				{field : 'clearingid',checkbox : true},
  				{field : 'settl_times',title : '操作时间',width : 140,align:'center',
  				formatter: function(value,row,index){
		  				if(value!=undefined){
		  				value=value.substr(0,19);
		  				}
		  					return value;
		  				} 				 
  				},
{
								field : 'shiping_order_num',
								title : '协议编号',
								width : 100,
								align : 'center'
							},  {
								field : 'allmoney',
								title : '应付配送费',
								width : 80,
								align : 'center',
								
							}, {
								field : 'settl_money',
								title : '实付配送费',
								width : 80,
								align : 'center',							
							}, {
								field : 'over_money', //trade_cha as cy
								title : '差异',
								width : 120,
								align : 'center',						
							},{
								field : 'payment_method',
								title : '付款方式',
								width : 100,
								align : 'center',
								formatter : function(val, row, index) {
									if (val == 0) {
										return "现金";
									} else if (val == 1) {
										return "油卡";
									} else if (val == 2) {
										return "转账";
									}
								},
							},{field : 'settl_zpnum',title : '支票编号',width : 80,align:'center'},
  				          {field : 'settl_khbank',title : '开户行',width : 80,align:'center'},
  				         {field : 'settl_username',title : '开户人',width : 80,align:'center'},
  				         {field : 'settl_kahao',title : '卡号',width : 80,align:'center'},  				
  				/* {field : 'settl_order',title : '结算类型',width : 90,align:'center',
  					formatter: function(value,row,index){
		  				if(value==0){
		  				return '应收';
		  				}else if(value==1){
		  				return '应付';
		  				}
		  			} 	
  				}, */
  				
  				{field : 'usernamecz',title : '操作人',width : 80,align:'center'},//方位（m³）
  				{field : 'settl_notes',title : '备注信息',width : 140,align:'center'},	
  				{field : 'payment_bz',title : '付款备注',width : 140,align:'center'},
  					{field : 'settl_state',title : '结算状态',width : 90,align:'center',
  					formatter: function(value,row,index){
		  				if(value==0){
		  				return '未审核';
		  				}else if(value==1){
		  				return '已提审';
		  				}else if(value==2){
		  				return '审核通过';
		  				}else if(value==3){
		  				return '审核驳回';
		  				}
		  			} 	
  				}, 	
	
  			]],
  			pagination:true,//分页
		    pageSize:10,
		    pageList:[10,20,35,20],
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
		$("#startDate").val("");
		$("#endDate").val("");
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
		<div region="center">
			<table id="dg" title="结算记录信息"></table>
		</div>

		<input type="hidden" name="method" value="outputCar"> <input
			type="hidden" id="fieldName" name="fieldName"> <input
			type="hidden" id="headtitle" name="headtitle">
	</form>

</body>
</html>
