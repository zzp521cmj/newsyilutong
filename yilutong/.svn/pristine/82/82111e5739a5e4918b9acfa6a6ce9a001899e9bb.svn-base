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
    
    <title>需求发布的全部司机竞价的全部详细信息</title>
    <jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
   	<jsp:include page="/inc/incbootstrap.jsp"></jsp:include>
	<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
  	<script type="text/javascript" src="./js/select2/select2.js"></script>
	<link rel="stylesheet" type="text/css" href="./css/main.css">
	<script type="text/javascript" src="./js/select2/select2_locale_zh-CN.js"></script>
  	<script type="text/javascript" src="./js/loyout.js"></script>
  </head>
  <%String demandReleaseId = (String)request.getAttribute("flg2"); %>
   <script type="text/javascript">
   var pid='<%=demandReleaseId%>';
	var grid;
	var dialog;
 	$(function(){
  		grid=$("#dg").datagrid({
  			url : 'detemineveh.do?method=getdetermineVehicle&pid=' + pid,
  			border : false,
  			rownumbers : true,
  			fit : true,
  			singleSelect:true,
  			columns : [[
  				{field : 'ck',checkbox : true},
  				//{field : 'demandReleaseId',title : 'UUID',width : 60,align:'center'},
  				//{field : 'temporary_car_id',title : '车牌号UUID',width : 60,align:'center'},
  				{field : 'plate_number',title : '车牌号',width : 80,align:'center',
  					formatter: function(index,row,value){
  					
  						value = "<a href='javascript:void(0)'onclick= 'openwindow(\""+row.travel_card_id+"\")'>"+row.plate_number+"</a>&nbsp";
  						return value;
  					}
  				},
  				{field : 'car_owner',title : '车主姓名',width : 70,align:'center'},
  				{field : 'tels',title : '手机',width : 100,align:'center'},
  				{field : 'length_name',title : '车长',width : 70,align:'center'},
  				{field : 'price',title : '价格',width : 70,align:'center'},
  				{field : 'zuidi',title : '历史最低竞价',width : 80,align:'center'},
				{field : 'cou',title : '竞价历史次数',width : 80,align:'center'},
  				{field : 'determine',title : '是否确定车辆',width : 100,align:'center',
  					formatter: function(index,row,value){
  						if(row.determine==1){
	  						return "是";
  						}else{
  							var ss="";
	 						ss+="<a href='javascript:void(0)' onclick= 'Determine(\""+row.vehicleAuctionId+"\")'>确定</a>&nbsp";
	        				return ss;
  					}
  					}
				},
				
  			]],
  			pagination : true,
  			pageSize : 10,
  			pageList : [1, 10, 15, 20 ],
  		});
  		
  	});
  	
  	//确定操作
  	function Determine(demandReleaseId){
		var pid = demandReleaseId;
		var sss='<%=demandReleaseId%>';
  		$.messager.confirm('确定', '确定要使用车辆吗?', function(p) {
			if (p) {
			$.ajax({
					type : "POST",
					url : 'detemineveh.do?method=checkDetermineVehicle',
					data:{sss:sss},
		  			success:function(data){
		  			 if(data.flag){
		  			parent.$.messager.alert("提示","竞价已确定",'info');
		  			 }else{
		  			 	$.ajax({
					type : "POST",
					url : 'detemineveh.do?method=getDetermineVehicle1',
					data:{pid:pid,
						  sss:sss},
		  			success:function(data){
		  				if (data.flag) {
							parent.$.messager.alert('确定', '确定成功', 'info',
							function(r) {
								$('#dg').datagrid('reload');
							
							});
						} 
		  			}	
				});
		  			 }
		  			}	
				});
			
			}
		});
  	}
  	
  	//查询车牌号详细信息
  	function openwindow(plate_number)
	{
		var url="car_b_rec.do?method=Car_bid_InfoPage&menu_id=69&plate_number="+plate_number;
		var name; //网页名称，可为空;
		var iWidth=400; //弹出窗口的宽度;
		var iHeight=400; //弹出窗口的高度;
		var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
		var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
		window.open('<%=realPath1%>'+url,name,'height='+iHeight+',,innerHeight='+iHeight+',width='+iWidth+',innerWidth='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=auto,resizeable=no,location=no,status=no');
	}
  </script>
  <body>
  </body><body class="easyui-layout">
   	 <div region="center" title="信息" region="center" style="background: #eee; overflow-y:hidden">
	 	<table id="dg"></table>
	 </div>
  </body>
</html>
