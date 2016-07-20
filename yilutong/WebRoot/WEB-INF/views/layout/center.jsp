<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ page import="com.jy.model.Agreement" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<base href="<%=basePath%>">
       <meta charset="utf-8">
       <title>易路通速配管理系统</title>
   </head>
     	<link rel="stylesheet" type="text/css" href="./css/main.css">
      <script type="text/javascript"  src="./vendors/echarts.min.js"></script>     
      <script type="text/javascript">
      	function add(num,nums,numy){
			var dom = document.getElementById("container");
			var myChart = echarts.init(dom);
			var app = {};
			option = null;
			option = {
			    title: {
			        text: '今日收发量',
			        subtext: '4小时收发量'
			    },
			    tooltip: {
			        trigger: 'axis'
			    },
			    legend: {
			        data:['4小时签收量','4小时发货量']//'预购队列'
			    },
			    toolbox: {
						 feature: {
			            dataView: {show: true, readOnly: true},
			            magicType: {show: true, type: ['bar']},
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
			            name:'日期',
			            nameLocation: 'end',
			            data:['4','8','12','16','20','24'],
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
			   
			        {
			            name:'4小时签收量',
			            type:'line',
			             stack: '总量',
			            data:[num.split(",")[0],num.split(",")[1],num.split(",")[2],num.split(",")[3],num.split(",")[4],num.split(",")[5]],
			        },
			          {
			            name:'4小时发货量',
			            type:'line',
			             stack: '总量',
			            data:[numy.split(",")[0],numy.split(",")[1],numy.split(",")[2],numy.split(",")[3],numy.split(",")[4],numy.split(",")[5]],
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
      		<%
					String data2 = new SimpleDateFormat("yyyy-MM-dd")
							.format(Calendar.getInstance().getTime());
				%>
				var  ans=""; 
					var  anss=""; 
      		$("#endDate").val('<%=data2%>');  		
 	       if($("#endDate").val()==null||$("#endDate").val()==''){
			   			$("#endDate").val('<%=data2%>');
			   		}
			   		 $.ajax({
				   type: "POST",
				   url: "receiptB.do?method=getOrderInfoT",
				   data: 
				   {
				   end:$("#endDate").val()
				   },   //传递你输入框中的值
				   success: function(msg){
				    $.ajax({
				   type: "POST",
				   url: "coustomB.do?method=getOrderInfoT",
				   data: 
				   {
				   end:$("#endDate").val()
				   },   //传递你输入框中的值
				   success: function(msgs){
				   	if(msg.ans=="err"&&msgs.ans=="err"){
				 		 add("0,0,0,0,0,0",50,"0,0,0,0,0,0");
				 		 	}else if(msg.ans!="err"&&msgs.ans=="err"){
				 		 	add(msg.ans.split(";")[0],msg.ans.split(";")[1],"0,0,0,0,0,0");
				 		 	}else if(msg.ans=="err"&&msgs.ans!="err"){
				 		 	add("0,0,0,0,0,0",msgs.ans.split(";")[1],msgs.ans.split(";")[0]);
				 		 	}else{
				 		 		add(msg.ans.split(";")[0],msgs.ans.split(";")[1],msgs.ans.split(";")[0]);
				 		 	}
				 	 	}
					});								 		 			 	     							
					}
				});
				 
				 		   
				});		

      </script>
</head>
<body>
<div style="margin-left: 5%;">
<iframe src="http://www.thinkpage.cn/weather/weather.aspx?uid=UE7510BF21&cid=CHBJ000000&l=zh-CHS&p=SMART&a=1&u=C&s=3&m=2&x=1&d=3&fc=&bgc=&bc=&ti=1&in=1&li=" frameborder="0" scrolling="no" width="500" height="110" allowTransparency="true"></iframe>
<!-- 	<iframe allowtransparency="true" frameborder="0" width="565" height="98" scrolling="no" src="http://tianqi.2345.com/plugin/widget/index.htm?s=2&z=1&t=1&v=0&d=3&bd=0&k=000000&f=&q=1&e=1&a=1&c=54527&w=565&h=98&align=center"></iframe>
 -->	</div> <input id="endDate"  name="end_date" type="hidden" >	
	<div   style="height: 70%,;width: 70%; margin:5%;background-color: rgb(247, 247, 255);">
	 <div id="container" style="height: 60%"></div>  
	</div>
</body>
</html>
