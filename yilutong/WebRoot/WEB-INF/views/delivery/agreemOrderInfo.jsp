<%@page import="com.jy.common.SessionInfo"%>
<%@page import="com.jy.model.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>配送结算信息管理</title>
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
	<script type="text/javascript" src="./js/function.js"></script><!-- 命名按钮方法 -->
  </head>
  <% 	String flg = (String) request.getAttribute("flg"); %>
  <% User user=(User)request.getSession().getAttribute(SessionInfo.SessionName) ;%>
  
  <script type="text/javascript">
	  	var dialog;
 		var grid;
 		var pid='<%=flg%>';
  		$(function(){
  			grid=$("#dg").datagrid({
  			url : 'delivery.do?method=deliverGoods',
  			border : false,
  			rownumbers : true,
  			fit : true,
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			multiSort:true,			
  			columns : [[ 				
				{field : 'ck',checkbox : true},
  				{field : 'agreement_number',title : '协议号',width :100,align:'center'},
  				{field : 'end_address',title : '发站',width : 80,align:'center'}, 				
  				{field : 'send_station',title : '到站',width : 80,align:'center'},
  				{field : 'car_number1',title : '车牌号',width : 80,align:'center'},
  				{field : 'agreement_types',title : '协议类型',width : 80,align:'center'},
  				{field : 'all_money',title : '总金额',width : 80,align:'center',
  				/* 	formatter:function(val,row,index){
  							if(val==0){
  							return "自提";
  						}else if(val==1){
  							return "配送中";
  						}else if(val==2){
  						return "转运中";
  						}else if(val==4){
  						return "签收";
  						}
  					}	 */
  				},
  				{field : 'receivable_fee',title : '结算金额',width : 80,align:'center',},
  				{field : 'trade_cha',title : '差额',width : 80,align:'center',},	
  				{field : 'send_date',title : '配送时间',width : 130,align:'center',sortable:'true',
  					formatter: function(value,row,index){
		  				if(value!=undefined){
		  				value=value.substr(0,19);
		  				}
		  					return value;
		  				} 				 
  				},			
  					{field : 'settlyf_time',title : '结算时间',width : 130,align:'center',sortable:'true',
  					formatter: function(value,row,index){
		  				if(value!=undefined){
		  				value=value.substr(0,19);
		  				}
		  					return value;
		  				} 				 
  				},
  				
  			]],
  				onLoadSuccess:function(data){ 				
  			//添加合计行
				$('#dg').datagrid('appendRow', {
					agreement_number : '本页合计',
					all_money : compute("all_money"),
					receivable_fee : compute("receivable_fee"),		
					trade_cha : compute("trade_cha"),				
				});
				//合并单元格
				var merges2 = [ {
					field : 'agreement_number',
					index : data.rows.length - 1,
					colspan : 5,
					rowspan : 1
				}]
				for ( var i = 0; i < merges2.length; i++)
					$('#dg').datagrid('mergeCells', {
						index : merges2[i].index,
						field : merges2[i].field,
						colspan : merges2[i].colspan,
						rowspan : merges2[i].rowspan
					});	
					var datas=$('#dg').datagrid('getRows');
					 $("input[type='checkbox']").eq(datas.length).attr("type","hidden");
					
           },
           rowStyler : function(index, row) {           	
				//合计行颜色
				if (row.agreement_number == '本页合计') {
					return 'background-color:yellow;font-weight:bold;color:blue';
				}
				if (row.agreement_number != '本页合计') {
					return 'color:blue;';
				}			
			},
  			pagination:true,//分页
		    pageSize:10,
		    pageList:[5,10,15,20],
  			toolbar : '#tb'
  		});
  			//回车查询
  		document.onkeydown = function(event) {
			e = event ? event : (window.event ? window.event : null);
			if (e.keyCode == 13) {
				//执行的方法 
				searchCar_owner();
			}
		};
  		
  		//累加
	function compute(colName) {
		var rows = $('#dg').datagrid('getRows');
		var total = 0;
		for ( var i = 0; i < rows.length; i++) {

			if (isNaN(parseFloat(rows[i][colName]))) {
				total += 0;
			} else {
				total += parseFloat(rows[i][colName]);
			}
		}
		return total;
	}
  		//能更多条件
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
  	
		$("#carnum").select2({
		    placeholder: "请输入车牌号",	//默认文本框显示信息
		    minimumInputLength: 1,	//最小输入字符长度
		    allowClear:true,
		    multiple: false,				//设置多项选择，false则只能单选
		    maximumSelectionSize: 5, //最大选择个数
			query: function (query) {
		    	$.ajax({
				   type: "POST",
				   url: "delivery.do?method=selectSendCar",
				   data: {car_id:query.term},   //传递你输入框中的值
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
			$("#table_type").combobox("setText",'运费');
  	});
  		
  	//查询
  	function searchCar_owner(){
  		/* if($.trim($("#phone").select2("data"))!=""){
  		phone=$.trim($("#phone").select2("data").text);
  			} */		
  		$("#dg").datagrid('load',{			
  				start_time :$("#start_time").val(),
	 	 		end_time :$("#end_time").val(),		 		
	 	 		num:$.trim($("#num").val()),//订单号	 	 	
  				table_type:null,				
	 	});	  			
  
	 	
  	}
 
 
  	//导出
  	function putoutfile(){
		var allRows2 = $("#dg").datagrid("getColumnFields");
		var colName=[];
		var fieldName=[];
		var  checkarray=[];
		var array = $('#dg').datagrid('getSelections');
  			for(var i=0;i<array.length;i++){
  				checkarray.push(array[i].agreement_id);
  			}  		
		for(i=1;i<allRows2.length;i++)
		{
			var col = $('#dg').datagrid( "getColumnOption" , allRows2[i] );
		 	if(col.field!="send_type"&&col.field!="shipping_order_state"&&col.field!="pay_type"&&col.field!="write_off1"){ 
				colName.push(col.title);//把title列名到数组里去 
				fieldName.push(col.field); //把field列属性名到数组里去 
		 	}
		} 
		$("#fieldName").val(fieldName.join(","));
  		 $("#headtitle").val(colName.join(","));
  		 $("#checkarray").val(checkarray.join(","));
 /*  		 $("#name").val($('#table_type').combobox("getText")); */
  		var outputform=$("#outputform");
  		outputform.submit(); 
  	}
  	
 	
  	//打印
  	function dy(){
  		var row=$("#dg").datagrid('getSelections');
  			if(row.length==1){
	  			for(var i=0;i<row.length;i++){
		  			var pid=row[i].shiping_order_id;
		  		}	
							var url="delivery.do?method=getvDeliveryPrint&pid="+pid;
							ow(url);
  		}else{
  			$.messager.alert("运单录入","请选择一行信息","info");	
  		}	
  	
  	}
  	function ow(owurl){ 
var tmp=window.open("about:blank","","fullscreen=1");
tmp.moveTo(0,0); 
tmp.resizeTo(screen.width+20,screen.height); 
tmp.focus(); 
tmp.location=owurl;
} 
  
	
	//重置
	function reset(){
		$("#start_time").val("");
		$("#end_time").val("");
		$("#num").val("");	
		//$("#pay_type").combobox("setValue","");
		//$("#pay_type").combobox("setValue","");		
	}
  </script>
  <body class="easyui-layout">
  	<form action="delivery.do" id="outputform" method="post">
  	<input type="hidden"   name="name"   id="name">	
    	<div region="north" title="检索" class="st-north" border="false" collapsible="false"  >    
    	 <lable>结算日期:</lable>
			<input  id="start_time" name="start_time" class="Wdate"  readonly="readonly" style="width:130px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			-
			<input id="end_time" name="end_time" class="Wdate"  readonly="readonly" style="width:130px;height:22px;" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" /> 	
	    	 <lable >协议号:</lable>
	    	 <input type="text" class="search-text" id="num" name="num" style="width:130px;margin-right:0px"  >    
	    		<!-- <lable >结算费用:</lable>
				<select class="easyui-combobox" id="table_type" name="table_type"
					style="width:130px;"
					data-options="panelHeight : 'auto',editable:false">
					<option id="" value="">配送费应付</option>					
					<option id="" value="6"></option>
				</select>    	 -->
	    	 <a class="easyui-linkbutton" onClick="searchCar_owner()" data-options="iconCls:'icon-search'" >查询</a>	
	    <!-- 	 <a id="btnMoreSearch" class="btn btn-sm btn-link" type="button" style="margin-top:16px;" href="javascript:void(0)" state="close">更多条件</a>
	    	 <div id="searchInfoId" style="display: none">	
	    	 --> 
	   		
			</div>
    	<div region="center" >
    		<table id="dg" title="结算信息" ></table>
    	</div>
    	<input type="hidden" name="method" value="outDeliveryout">
		<input type="hidden" id="fieldName" name="fieldName">
		<input type="hidden" id="headtitle" name="headtitle">
		<input type="hidden" id="checkarray" name="checkarray">
    	<div id="tb">
   	  <!-- a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true"   onclick="add()">添加</a>
   		   <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true"   onclick="xiangxixinxi()">详细</a>
		    <a href="javascript:void(0)" class="easyui-linkbutton" id="getUpdateCar_owner" data-options="iconCls:'icon-edit',plain:true"onclick="modify()">修改</a>
		    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true"   onclick="deleteEver()">删除</a>  
		    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true"onclick="printYWM()">一维码打印</a>
		    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reset',plain:true"onclick="reset()">重置</a>
	 	   <a href="javascript:void(0)"	class="easyui-linkbutton" data-options="iconCls:'icon-input',plain:true" onclick="showIcons()" id="tbru"style="display: none">导入</a>
		    	     -->		    	     <a href="javascript:void(0)" class="easyui-linkbutton" id="outputCar_owner" data-options="iconCls:'icon-output',plain:true" onclick="putoutfile()">导出</a>  
	
		</div>	
	
		</form>
  </body>
</html>