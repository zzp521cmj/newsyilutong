<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html style="height: 100%">
   <head>
       <meta charset="utf-8">
   </head>
     <jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
     	<link rel="stylesheet" type="text/css" href="./css/main.css">
      <script type="text/javascript"  src="./vendors/echarts.min.js"></script>
      	<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
	<script type="text/javascript" src="./js/select2/select2.js"></script>
	<script type="text/javascript" src="./js/select2/select2_locale_zh-CN.js"></script>
   <body class="easyui-layout"  >
    
       <script type="text/javascript">    
		function add(num,nums){
			var dom = document.getElementById("container");
			var myChart = echarts.init(dom);
			var app = {};
			option = null;
			option = {
			    title: {
			        text: '年发货量',
			        subtext: '季度发货量'
			    },
			    tooltip: {
			        trigger: 'axis'
			    },
			    legend: {
			        data:['每季度发货量']//'预购队列'
			    },
			    toolbox: {
						 feature: {
			            dataView: {show: true, readOnly: false},
			            magicType: {show: true, type: ['bar']},//  magicType: {show: true, type: ['line', 'bar']},
			            restore: {show: true},
			            saveAsImage: {show: true}
			        }
			    },
			    dataZoom: {
			        show: false,
			        start: 0,
			        end: 100
			    },
			    xAxis: {
			            type: 'category',
			            data:['第一季度','第二季度','第三季度','第四季度'],
			        },
			    yAxis: [
			        {
			            type: 'value',
			            scale: true,
			            name: '数量',
			            max: nums,
			            min: 0,
			            boundaryGap: [0.2, 0.2]
			        },
			 /*       {
			            type: 'value',
			            scale: true,
			            name: '预购量',
			            max: 1200,
			            min: 0,
			            boundaryGap: [0.2, 0.2]
			        }  */
			    ],
			    series: [
			     /*   {
			            name:'每日柱状',
			            type:'bar',
			          	yAxisIndex: 1,
			            data:[num.split(",")[0],num.split(",")[1],num.split(",")[2],num.split(",")[3],num.split(",")[4],num.split(",")[5],num.split(",")[6]],
			        },  */
			        {
			            name:'每季度发货量',
			            type:'line',
			             stack: '总量',
			            data:[num.split(",")[0],num.split(",")[1],num.split(",")[2],num.split(",")[3]],
			        }
			    ]
			};
				if (option && typeof option === "object") {
				    var startTime = +new Date();
				    myChart.setOption(option, true);
				    var endTime = +new Date();
				    var updateTime = endTime - startTime;
				    console.log("Time used:", updateTime);
				}
			}      		
      	$(function(){    
      	      		$("#receiptid").select2({
		    placeholder: "请输入客户名称",	//默认文本框显示信息
		    minimumInputLength: 1,	//最小输入字符长度
		    allowClear:true,
		    multiple: false,				//设置多项选择，false则只能单选
		    maximumSelectionSize: 5, //最大选择个数
			query: function (query) {
		    	$.ajax({
				   type: "POST",
				   url: "orderC.do?method=getCustomer",
				   data: {name:query.term},   //传递你输入框中的值
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
      		<%     	
			String data2 = new SimpleDateFormat("yyyy").format(Calendar.getInstance().getTime());
				/* 	String data2 = new SimpleDateFormat("yyyy-MM-dd")
							.format(Calendar.getInstance().getTime()); */
				%>
      		$("#endDate").val('<%=data2%>');  		
 	     		searcher();
      		});
   function searcher(){
	  	 if($("#endDate").val()==null||$("#endDate").val()==''){
				   			$("#endDate").val('<%=data2%>');
				   		}
  			 $.ajax({
				   type: "POST",
				   url: "coustomB.do?method=getOrderInfoY",
				   data: 
				   {
				   end:$("#endDate").val().substr(0,4),
				    name: $("#receiptid").select2("val")
				   },   //传递你输入框中的值
				   success: function(msg){
				 		 	if(msg.ans=="err"){
				 		 	$.messager.alert("年发货量图","没有对应的数据值","info");
				 		 	}else{
				 		 		add(msg.ans.split(";")[0],msg.ans.split(";")[1]);
				 		 	}
					}
				});
      				
   }    			
       </script>
        <div region="north" class="st-north" border="false"  height="28px" collapsible="false"  >
	    		<lable style=" color: black;font-size: 10px;" >发货截止日期:</lable>
			<input id="endDate"  name="end_date"  class="Wdate"  readonly="readonly" style="width:120px;height:21px;" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy'})" />
			<lable style=" color: black;font-size: 10px; margin-left: 10px;" >发货客户:</lable>
			<input id="receiptid"  name="name"  style="width:120px;height:21px;" />   
			  <a class="easyui-linkbutton" onclick="searcher()" style="margin-left: 10px;"data-options="iconCls:'icon-search'" >查询</a>
	    </div>
   		<div  region="center"  style="height: 92%;margin-top: 0;" >
       <div id="container" style="height: 100%"></div>
       </div>   
       </body>
</html>
