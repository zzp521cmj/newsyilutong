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
   <body class="easyui-layout"  >
  
       <script type="text/javascript">    
       Date.prototype.Format = function(formatStr)   
			{   
			    var str = formatStr;   
			    var Week = ['日','一','二','三','四','五','六'];  
			  
			    str=str.replace(/yyyy|YYYY/,this.getFullYear());   
			    str=str.replace(/yy|YY/,(this.getYear() % 100)>9?(this.getYear() % 100).toString():'0' + (this.getYear() % 100));   
			  
			    str=str.replace(/MM/,this.getMonth()>9?this.getMonth().toString():'0' + this.getMonth());   
			    str=str.replace(/M/g,this.getMonth());   
			  
			    str=str.replace(/w|W/g,Week[this.getDay()]);   
			  
			    str=str.replace(/dd|DD/,this.getDate()>9?this.getDate().toString():'0' + this.getDate());   
			    str=str.replace(/d|D/g,this.getDate());   
			  
			    str=str.replace(/hh|HH/,this.getHours()>9?this.getHours().toString():'0' + this.getHours());   
			    str=str.replace(/h|H/g,this.getHours());   
			    str=str.replace(/mm/,this.getMinutes()>9?this.getMinutes().toString():'0' + this.getMinutes());   
			    str=str.replace(/m/g,this.getMinutes());   
			  
			    str=str.replace(/ss|SS/,this.getSeconds()>9?this.getSeconds().toString():'0' + this.getSeconds());   
			    str=str.replace(/s|S/g,this.getSeconds());   
			  
			    return str;   
			}
         	 function daysBetween(DateOne,DateTwo)  
			{   
			    var OneMonth = DateOne.substring(5,DateOne.lastIndexOf ('-'));  
			    var OneDay = DateOne.substring(DateOne.length,DateOne.lastIndexOf ('-')+1);  
			    var OneYear = DateOne.substring(0,DateOne.indexOf ('-'));  
			  
			    var TwoMonth = DateTwo.substring(5,DateTwo.lastIndexOf ('-'));  
			    var TwoDay = DateTwo.substring(DateTwo.length,DateTwo.lastIndexOf ('-')+1);  
			    var TwoYear = DateTwo.substring(0,DateTwo.indexOf ('-'));  
			  
			    var cha=((Date.parse(OneMonth+'/'+OneDay+'/'+OneYear)- Date.parse(TwoMonth+'/'+TwoDay+'/'+TwoYear))/86400000);   
			    return Math.abs(cha);  
			} 
		function add(num,nums){
			var dom = document.getElementById("container");
			var myChart = echarts.init(dom);
			var app = {};
			option = null;
			option = {
			    title: {
			        text: '单周签收量',
			        subtext: '单日签收量'
			    },
			    tooltip: {
			        trigger: 'axis'
			    },
			    legend: {
			        data:['日签收']//'预购队列'
			    },
			    toolbox: {
						 feature: {
			            dataView: {show: true, readOnly: false},
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
			            data:['周一','周二','周三','周四','周五','周六','周日'],
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
			            name:'日签收',
			            type:'line',
			             stack: '总量',
			            data:[num.split(",")[0],num.split(",")[1],num.split(",")[2],num.split(",")[3],num.split(",")[4],num.split(",")[5],num.split(",")[6]],
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
      		Date dNow = new Date();
			 Calendar calendar = Calendar.getInstance(); //得到日历
			calendar.setTime(dNow);//把当前时间赋给日历
			calendar.add(Calendar.DAY_OF_MONTH, -1);  //设置为前一天   
			String data2 = new SimpleDateFormat("yyyy-MM-dd").format(calendar.getTime());
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
				   url: "receiptB.do?method=getOrderInfoD",
				   data: 
				   {
				   end:$("#endDate").val()
				   },   //传递你输入框中的值
				   success: function(msg){
				 		 	if(msg.ans=="err"){
				 		 	$.messager.alert("周签收图","没有对应的数据值","info");
				 		 	}else{
				 		 		add(msg.ans.split(";")[0],msg.ans.split(";")[1]);
				 		 	}
					}
				});
      				
   			}    			
       </script>
        <div region="north" class="st-north" border="false"  height="28px" collapsible="false"  >
	    	<lable style=" color: black;font-size: 10px;" >签收截止日期:</lable>
			<input id="endDate"  name="end_date"  class="Wdate"  readonly="readonly" style="width:120px;height:21px;" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd'})" />
	     <a class="easyui-linkbutton" onclick="searcher()" data-options="iconCls:'icon-search'" >查询</a>
	    </div>
   		<div  region="center"  style="height: 92%;margin-top: 0;" >
       <div id="container" style="height: 100%"></div>
       </div>     
       </body>
</html>
