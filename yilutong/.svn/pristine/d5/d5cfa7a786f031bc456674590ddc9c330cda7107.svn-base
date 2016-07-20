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
    <title>订单信息管理</title>
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
	<!-- <script type="text/javascript" src="./js/function.js"></script>命名按钮方法  -->
	
  
  </head>
  <% 	String flg = (String) request.getAttribute("flg"); %>
   <% 	String custom_id = (String) request.getAttribute("custom_id");%>
   
  <script type="text/javascript">
	  	var dialog;
 		var grid;
 		var pid='<%=flg%>';
 		var custom_id='<%=custom_id%>';
 		var editval;
  		$(function(){
  			grid=$("#dg").datagrid({
  			url : 'margin.do?method=getShipOrder&custom_id='+custom_id,
  			border : false,
  			rownumbers : true,
  			fit : true,
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			multiSort:true,
  			columns : [[
  				{field : 'ck',checkbox : true},
  				{field : 'shiping_order_num',title : '订单号',width : 60,align:'center'},
  				{field : 'custom_name',title : '发货人',width : 80,align:'center'},
  				{field : 'receipt',title : '收货人',width : 60,align:'center'},
  				{field : 'receipt_tel',title : '电话',width : 80,align:'center'},
  				{field : 'end_address',title : '到站',width : 55,align:'center'},
  				{field : 'sendType',title : '交接方式',width : 70,align:'center'},
  				{field : 'goods_name',title : '品名',width : 60,align:'center'},
  				{field : 'goods_packing',title : '包装',width : 60,align:'center'},
  				{field : 'goods_num',title : '件数',width : 60,align:'center'},
  				{field : 'goods_weight',title : '重量',width : 60,align:'center'},
  				{field : 'goods_vol',title : '体积',width : 60,align:'center'},
  				{field : 'receipt_address',title : '送货地址',width : 100,align:'center'},
  				{field : 'payType',title : '付款方式',width : 70,align:'center'},
  				{field : 'trade_agency',title : '代收款',width : 70,align:'center'},
  				{field : 'paid',title : '付款方式实收',width : 70,align:'center',hidden:'true'},
  				{field : 'paid1',title : '实际代收货款',width : 70,align:'center',hidden:'true'},
  				{field : 'trade_sum',title : '代收总运费',width : 120,align:'center',
  					formatter: function(value,row,index){
	  					return Number(Number(row.trade_agency)-Number(row.paid)).toFixed(2);
	  				} 
  				},
  				{field : 'reality_sum',title : '实收总运费',width : 120,align:'center',
  					formatter: function(value,row,index){
	  					return Number(Number(row.paid)-Number(row.paid1)).toFixed(2);
	  				} 	
  				},
  				{field : 'fee_date',title : '货物实际到达时间',width : 120,align:'center',sortable:'true',
	  				formatter: function(value,row,index){
		  				if(value!=undefined){
		  					value=value.substr(0,19);
		  				}
	  					return value;
	  				} 				 
  				},
  				{field : 'isReceive',title : '回单状态',width : 70,align:'center'},
  				{field : 'remarks',title : '备注',width : 90,align:'center',sortable:'true'},
  				{field : 'change_pay',title : '应付中转费',width : 90,align:'center',sortable:'true'},
  				{field : 'change_fee1',title : '实付中转费',width : 90,align:'center',sortable:'true'},
  				{field : 'send_fee',title : '应付送货费',width : 90,align:'center',sortable:'true'},
  				{field : 'send_fee1',title : '实付送货费',width : 90,align:'center',sortable:'true'},
  				{field : 'payble_coolie',title : '应付装卸费',width : 90,align:'center',sortable:'true'},
  				{field : 'unloading_fee1',title : '实付装卸费',width : 90,align:'center',sortable:'true'},
  				{field : 'payble_other',title : '应付其他费',width : 90,align:'center',sortable:'true'},
  				{field : 'send_other',title : '实付其他费',width : 90,align:'center',sortable:'true'},
  				{field : 'charge_remark1',title : '应付款备注',width : 300,align:'center',sortable:'true'
  					,editor:{
	                	type:'text',
	                	options:{
	                    	validType:'charge_remark1'
	                	}
           			}	
  				},
  				{field : 'trunk_fee',title : '应收中转费',width : 90,align:'center',sortable:'true'},
  				{field : 'trunk_fee1',title : '实收中转费',width : 90,align:'center',sortable:'true'},
  				{field : 'take_fee',title : '应收送货费',width : 90,align:'center',sortable:'true'},
  				{field : 'take_fee1',title : '实收送货费',width : 90,align:'center',sortable:'true',hidden:'true'},
  				{field : 'ys_unloading_fee',title : '应收装卸费',width : 90,align:'center',sortable:'true'},
  				{field : 'ys_unloading_fee1',title : '实收装卸费',width : 90,align:'center',sortable:'true',hidden:'true'},
  				{field : 'adorn_fee',title : '应收其他费',width : 90,align:'center',sortable:'true'},
  				{field : 'adorn_fee1',title : '实收其他费',width : 90,align:'center',sortable:'true',hidden:'true'},
  				{field : 'charge_remark2',title : '应收款备注',width : 300,align:'center',sortable:'true'
  					,editor:{
	                	type:'text',
	                	options:{
	                    	validType:'charge_remark2'
	                	}
           			}	
  				},
  				{field : 'trunk',title : '中转费',width : 80,align:'center',
  					formatter:function(val,row,index){
						return ;//Number(Number(row.trunk_fee_c)-Number(row.change_fee1)).toFixed(2);
					}	
  				},
  				{field : 'take',title : '送货费',width : 80,align:'center',
  					formatter:function(val,row,index){
						return ;//Number(Number(row.take_fee_c)+Number(row.send_fee1)).toFixed(2);
					}	
  				},
  				{field : 'loading',title : '落地费',width : 80,align:'center',
  					formatter:function(val,row,index){
						return ;//Number(Number(row.adorn_fee1)+Number(row.adorn_fee1)).toFixed(2);
					}	
  				},
  				{field : 'adorn',title : '其他费',width : 80,align:'center',
  					formatter:function(val,row,index){
						return ;//Number(Number(row.adorn_fee_c)+Number(row.send_other)).toFixed(2);
					}	
  				},
  				{field : 'sum',title : '合计',width : 80,align:'center',
  					formatter:function(val,row,index){
						return ;//Number(Number(row.adorn_fee_c)+Number(row.send_other)).toFixed(2);
					}	
  				}
  			]],
  			onBeforeEdit:function(index,row){ //可编辑之前
				editval=index;
		        row.editing = true;
		    },  
		    onAfterEdit:function(index,row){//编辑关闭后
				$.ajax({url:'margin.do?method=updataRemarkShip',data:{id:row.shiping_order_id,charge_remark1:row.charge_remark1,charge_remark2:row.charge_remark2}
					,success:function(){}
				});
		        row.editing = false;  
		    },
		    //单击事件
            onClickRow: function (rowIndex,rowData) {
                //单击开启编辑行
    				if(editval!=rowIndex){
    					$("#dg").datagrid("endEdit", editval);
    					$("#dg").datagrid("beginEdit", rowIndex);
	                	editval=rowIndex;
    				} else{
    					editval=undefined;
    					$('#dg').datagrid("endEdit", rowIndex);
    				} 
            },
            /* onLoadSuccess:function(data){
      			//添加合计行
    				$("#dg").datagrid('appendRow', {
    					shiping_order_num : '合计',
    					trade_agency : compute("trade_agency"),
    					trade_sum : compute("trade_sum")
    				});
    				//合并单元格
    				var merges2 = [ {
    					field : 'shiping_order_num',
    					index : data.rows.length - 1,
    					colspan : 14,
    					rowspan : 1
    				}]
    				for ( var i = 0; i < merges2.length; i++)
    					$('#dg').datagrid('mergeCells', {
    						index : merges2[i].index,
    						field : merges2[i].field,
    						colspan : merges2[i].colspan,
    						rowspan : merges2[i].rowspan
    					});
               }, */
               /* rowStyler : function(index, row) {
    				//合计行颜色
    				if (row.shiping_order_num == '合计') {
    					return 'background-color:yellow;font-weight:bold;color:blue';
    				}
    				if (row.shiping_order_num != '合计') {
    					return 'color:blue;';
    				}
    			}, */
  			pagination:true,//分页
		    pageSize:10,
		    pageList:[5,10,15,20],
  			toolbar : '#tb'
  		});
  		//	回车查询
  		document.onkeydown = function(event) {
			e = event ? event : (window.event ? window.event : null);
			if (e.keyCode == 13) {
				//执行的方法 
				searchCar_owner();
			}
		};
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
				$("#send_address").val("");
				$("#end_address").val("");
				$("#perpole").val("");
				$("#pay_state").combobox("setValue","");
		} else {
			$('.easyui-layout').layout('panel', 'north').panel('resize',{height:60});
			$('.easyui-layout').layout('resize');
			btnMoreSearch.text("更多条件");
			btnMoreSearch.attr("state", "close");
			$("#searchInfoId").css("display","none");
		}
});
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
  	
		$("#carid").select2({
		    placeholder: "请输入车主电话",	//默认文本框显示信息
		    minimumInputLength: 1,	//最小输入字符长度
		    allowClear:true,
		    multiple: false,				//设置多项选择，false则只能单选
		    maximumSelectionSize: 5, //最大选择个数
			query: function (query) {
		    	$.ajax({
				   type: "POST",
				   url: "shipOrder.do?method=getPhoneLength",
				   data: {phones:query.term},   //传递你输入框中的值
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
  	function searchCar_owner(){
  		var startDate=document.getElementById("startDate").value;
  		var endDate=document.getElementById("endDate").value;
  		/* if($.trim($("#phone").select2("data"))!=""){
  		phone=$.trim($("#phone").select2("data").text);
  			} */
  		$("#dg").datagrid('load',{
  				start_date :startDate,
	 	 		end_date :endDate,
	 	 		name:$.trim($("#ddId").val()),
	 	 		phone_number:$.trim($("#perpole").val()),//发货人
	 	 		phone:$.trim($("#phone").val()),
	 	 		order_state:$.trim($("#userName").val()),
	 	 		pay_type:$.trim($("#pay_type").combobox("getValue")),
	 	 		send_address:null,//发站
  				//institution:$.trim($("#cc3").combotree("getValue")),
  				type:$.trim($("#end_address").val())//到站
	 	});	  
	 	
  	}
  	//导出
  		function putoutfile(){
		var allRows2 = $("#dg").datagrid("getColumnFields");
		var colName=[];
		var fieldName=[];
		var coustom_id='<%=custom_id%>';
		for(i=1;i<allRows2.length;i++)
		{
			var col = $('#dg').datagrid( "getColumnOption" , allRows2[i] );
			if(col.field!="paid"&&col.field!="paid1"&&col.field!="take_fee1"&&col.field!="ys_unloading_fee1"&&col.field!="adorn_fee1"){
				colName.push(col.title);//把title列名到数组里去 
				fieldName.push(col.field); //把field列属性名到数组里去 
			} 
		} 
		$("#fieldName").val(fieldName.join(","));
  		 $("#headtitle").val(colName.join(","));
  		 $("#custom_id").val(custom_id);
  		var outputform=$("#outputform");
  		outputform.submit(); 
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
		$("#startDate").val("");
		$("#endDate").val("");
		$("#ddId").val("");
		$("#phone").val("");
		$("#end_address").val("");
		$("#perpole").val("");
		$("#pay_state").combobox("setValue","");
		$("#userName").val("");
		
	}
	
  </script>
  <body class="easyui-layout">
  	<form action="margin.do" id="outputform" method="post">
    	<div region="north" title="检索" class="st-north" border="false"  height="60px" collapsible="false"  >
	    	<lable>发车日期:</lable>
			<input  id="startDate"  class="Wdate"  readonly="readonly" style="width:150px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			-
			<input id="endDate"  class="Wdate"  readonly="readonly" style="width:150px;height:22px;" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
	    	<lable class="divlabel">订单编号:</lable>
	    	 <input type="text" class="search-text" id="ddId"  style="width:150px"  >
	    	 	<lable class="divlabel">客户名称:</lable>
				<input type="text" class="search-text" id="userName"  style="width:150px"  >
	    	 <a class="easyui-linkbutton" onclick="searchCar_owner()" data-options="iconCls:'icon-search'" >查询</a>	
	    	 <a id="btnMoreSearch" class="btn btn-sm btn-link" type="button" style="margin-top:16px;" href="javascript:void(0)" state="close">更多条件</a>
	    	 <div id="searchInfoId" style="display: none">
	    	 <lable >付款方式:</lable>
				<select class="easyui-combobox" id="pay_type" name="agreement_type"
					style="width:150px;"
					data-options="panelHeight : 'auto',editable:false">
					<option id="" value="">全部</option>
					<option id="" value="0">回付</option>
					<option id="" value="1">提付</option>
					<option id="" value="2">现付</option>
					<option id="" value="3">货到前付</option>
				</select>
	    	<lable class="divlabel">收货人:</lable>
	    	<input type="text"  class="search-text"style="width:150px"   id="perpole" >
			<!--<lable>所属机构:</lable>
			<input id="cc3" name="did">-->
			<lable>到站:</lable>
			<input type="text" class="search-text" id="end_address" >
	    	<lable >电话:</lable>
	    	<input type="text"  class="search-text"style="width:150px"   id="phone" >
			</div>
    	</div>
    	<div region="center" >
    		<table id="dg" title="订单信息" ></table>
    	</div>
    	<div id="tb">
   		    <a href="javascript:void(0)" class="easyui-linkbutton" id="outputCar_owner" data-options="iconCls:'icon-output',plain:true" onclick="putoutfile()">导出</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reset',plain:true"onclick="reset()">重置</a>
		</div>	
		<input type="hidden" name="method" value="outShipOrder">
		<input type="hidden" id="fieldName" name="fieldName">
		<input type="hidden" id="headtitle" name="headtitle">
		<input type="hidden" name="custom_id" id="custom_id">
		<!-- </form>
		 <form action="shipOrder.do" target="_blank" id="printywm" method="post">
		 	<input type="hidden" name="method" value="getShipOrderPrintYwm">
		 	<input type="hidden" id="checkarray" name="checkarray">
		 </form> -->
  </body>
</html>