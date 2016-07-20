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
    <title>运单修改记录查询</title>
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
 		var editval;
 	
  		$(function(){
  			grid=$("#dg").datagrid({
  			url : 'Handling.do?method=getXiugaijilu',
  			border : false,
  			rownumbers : true,
  			fit : true,
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			multiSort:true,
  			columns : [[
  				{field : 'ck',checkbox : true},
 /*  				{field : 'shipping_orde',title : '记录详情',width : 80,align:'center',sortable:'true',
  				formatter:function(val,row,index){
  				return '<a href="javascript:void(0)" onclick="CheckManager(\'' + row.shiping_order_id+ '\')">查看详细信息</a>  ';
  				} 
  				},*/
  			{field : 'xiugaitime',title : '调整时间',width : 120,align:'center'},
  			{field : 'shiping_order_num',title : '运单编号',width : 120,align:'center'},  				 			
  			{field : 'xiugainame',title : '调整人',width : 120,align:'center'},			
  			{field : 'jilu_lishi',title : '调整记录',width :700,align:'center'},
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
  		$("#dg").datagrid('load',{

  		    xiugaitimes:$.trim($("#jiesuantimes").val()),
	 	 	xiugaitime:$.trim($("#jiesuantime").val()),
	 	 	 num:$.trim($("#shipindi").val()),

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
    function putoutfile(){
		var allRows2 = $("#dg").datagrid("getColumnFields");
		var colName=[];
		var fieldName=[];
		var checkarray=[];
		var row=$("#dg").datagrid('getSelections');
  			if(row.length>0){
	  			for(var i=0;i<row.length;i++){
					checkarray.push(row[i].jilu_id);	  				
		  			}		  			
		  		}	
		for(i=1;i<allRows2.length;i++)
		{
			var col = $('#dg').datagrid( "getColumnOption" , allRows2[i] );
			
				colName.push(col.title);//把title列名到数组里去 
				fieldName.push(col.field); //把field列属性名到数组里去 
			    	   
		} 
		$("#fieldName").val(fieldName.join(","));
  		$("#headtitle").val(colName.join(","));
  		$("#checkarray").val(checkarray.join(","));
  		var outputform=$("#outputform");
  		outputform.submit(); 
  	}	
  //重置
	function reset() {
		$("#jiesuantime").val("");
		$("#jiesuantimes").val("");
		$("#shipindi").val("");
		
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
  <form action="Handling.do" id="outputform" method="post">
    	<div region="north" title="检索" class="st-north" border="false" collapsible="false">
    		 <label class="divlabel">调整时间:</label> 
	    	 <input id="jiesuantime"  class="Wdate"   style="width:150px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd '})" />
	    	 -
	    	 <input  id="jiesuantimes"  class="Wdate"   style="width:150px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd '})" />	    	 
	    	 <lable class="divlabel">运单编号:</lable>
	    	 <input type="text" id="shipindi" class="search-text" style="width:150px;height:22px;"/>
    	 <a class="easyui-linkbutton" onclick="searchCar_owner()" data-options="iconCls:'icon-search'" >查询</a>	
		</div>
    	<div region="center" >
    		<table id="dg" title="汇总信息" ></table>
    	</div>
    	<div id="tb">
    	   <a href="javascript:void(0)" class="easyui-linkbutton" id="outputCar_owner" data-options="iconCls:'icon-output',plain:true" onclick="putoutfile()">导出</a>  	    
		</div>
	   <input type="hidden" name="method" value="getXiuGaiJuInput">
		<input type="hidden" id="fieldName" name="fieldName">
		<input type="hidden" id="headtitle" name="headtitle">
		<input type="hidden" id="checkarray" name="checkarray">	
		</form>	
  </body>
</html>