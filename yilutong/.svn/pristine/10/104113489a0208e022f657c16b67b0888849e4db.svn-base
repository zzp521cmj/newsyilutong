<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String change_fee1 = request.getParameter("change_fee1");
%>
<%
	String realPath1 = "http://" + request.getServerName() + ":" + request.getServerPort() +"/surmax/"; 
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>专线公司结算</title>
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
   <% 	String dd = (String) request.getAttribute("sl.getWrite_id()"); 
        String pid = (String) request.getAttribute("flg");
   %>
  <script type="text/javascript">
	  	var dialog;
 		var grid;
 		var editval;
 		var id = '<%=pid%>';
  		$(function(){
  			grid=$("#dg").datagrid({
  			url : 'Handling.do?method=getSettleShRc&ddids='+id,
  			border : false,
  			rownumbers : true,
  			fit : true,
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			multiSort:true,
  		    rowStyler : function(index, row) {
  		    //未结算未审核
				if (row.destination_stata==0) {
				
					return 'color:blue;';
				};
			 	if (row.des_sh_stata==0&&row.destination_stata!=0) {
					return 'color:rgb(221, 14, 211);';
				}; 
				 if (row.des_sh_stata==1) {
					return 'color:red;';
				}; 
			}, 
  			columns : [[
  				{field : 'ck',checkbox : true},
  				{field : 'settlyf_time',title : '审核操作时间',width : 140,align:'center',
  				formatter: function(value,row,index){
		  				if(value!=undefined){
		  				value=value.substr(0,19);
		  				}
		  					return value;
		  				} 				 
  				},
  				{field : 'shiping_order_num',title : '运单号',width : 80,align:'center'},  				
  				//{field : 'formerchange',title : '原调整金额',width : 125,align:'center'},
  				{field : 'settlyf_type',title : '审核类型',width : 90,align:'center',
  					formatter: function(value,row,index){
		  				if(value==1){
		  				return '审核操作';
		  				}else if(value==0){
		  				return '提审操作';
		  				}
		  			} 	
  				},
  				{field : 'settlyf_state',title : '审核状态',width : 90,align:'center',
  					formatter: function(value,row,index){
		  				if(value==1){
		  				return '审核通过';
		  				}else if(value==0){
		  				return '审核驳回';
		  				}else if(value==2){
		  				return '有效提审'; 
		  				}	  				
		  			} 	
  				},
  				{field : 'usernamecz',title : '操作人',width : 80,align:'center'},//方位（m³）
  				{field : 'settlyf_remaks',title : '备注信息',width : 140,align:'center'},				
  
  			]],onBeforeEdit:function(index,row){ //可编辑之前
				editval=index;
		        row.editing = true;
		    },  
		    onAfterEdit:function(index,row){//编辑关闭后
		    $('#dg').datagrid("endEdit",editval);
					$.ajax({
           			 type: "post",
          				url : 'collect.do?method=updateShippiOrCo',
           				data :  row
           				,
            			success: function (data) {
            			//console.log(data);
                		// Play with returned data in JSON format
            },
            error: function (msg) {
                            }
        });
  				/* $('#dg').datagrid("updateRow", {index:index,row:{gain_total:price}}); */
		        row.editing = false;  
		    },
		    //双击事件
            onDblClickRow: function (rowIndex,rowData) {
                //双击开启编辑行
    				if(editval!=rowIndex&&rowData.customs_recheck_state!=2){
    					$('#dg').datagrid("endEdit", editval);
    					$('#dg').datagrid("beginEdit", rowIndex);
	                	editval=rowIndex;
    				}else{
    					editval=undefined;
    					$('#dg').datagrid("endEdit", rowIndex);
    				}
                	
            },
  			 onLoadSuccess:function(){
  			/*  $('#dg').datagrid('appendRow', {
                Saler: '<span class="subtotal">合计</span>',
                TotalOrderCount: '<span class="subtotal">' + compute("TotalOrderCount") + '</span>',
                TotalOrderMoney: '<span class="subtotal">' + compute("TotalOrderMoney") + '</span>',
                TotalOrderScore: '<span class="subtotal">' + compute("TotalOrderScore") + '</span>',
                TotalTrailCount: '<span class="subtotal">' + compute("TotalTrailCount") + '</span>',
                Rate: '<span class="subtotal">' + ((compute("TotalOrderScore") / compute("TotalTrailCount")) * 100).toFixed(2) + '</span>'
            });
            	 compute(); */
            },
  				
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
  	
  	});	  
  function compute(colName) {
            var rows = $('#dg').datagrid('getRows');
            var total = 0;
            for (var i = 0; i < rows.length; i++) {
                total += parseFloat(rows[i][colName]);
            }
            return total;
        }
  		//查询
  	function searchCar_owner(){
  		  		var startDate=document.getElementById("startDate").value;
  		var endDate=document.getElementById("endDate").value;
  				$("#dg").datagrid('load',{
  					start_date :startDate,
	 	 			end_date :endDate,
			 	});	  
	 	
  	}
     //详细信息
    function CheckManager(pid){
        dialog = parent.jy.modalDialog({
			title : '费用结算',
			url : 'Handling.do?method=getJyShenHeJiLu&pid='+pid,
			width : 1200,
			heght: 700,				
		});
    }	
  //重置
	function reset() {
		$("#custom_name").val("");
		$("#car_time").val("");
		$("#kuhu_date").val("");
		$("#write_off3").val("");
		$("#send_time").val("");
		$("#receipt_time").val("");
		$("#car_number").val("");
		$("#driver_name").val("");
		$("#kuhu_dates").val("");
		$("#send_times").val("");
		$("#receipt_times").val("");
	}
      document.onkeydown = function(event) {
  				e = event ? event : (window.event ? window.event : null);
  				if (e.keyCode == 13) {
  					//执行的方法 
  					searchCar_owner();
  				}
  			};		
  </script>
  <body class="easyui-layout">
  <form action="shipOrder.do" id="outputform" method="post">
    	<div region="north" title="检索" class="st-north" border="false" collapsible="false">
    		 <label class="divlabel">审核日期:</label> 
	    	<input  id="startDate"  class="Wdate" name="start_date" readonly="readonly" style="width:150px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			-
			<input id="endDate"  class="Wdate" name="end_date" readonly="readonly" style="width:150px;height:22px;" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />		
			
	    	 <a class="easyui-linkbutton" onclick="searchCar_owner()" data-options="iconCls:'icon-search'" >查询</a>	
	         
			</div>
    
    	<div region="center" >
    		<table id="dg" title="汇总信息" ></table>
    	</div>    	
		</form>	
  </body>
</html>