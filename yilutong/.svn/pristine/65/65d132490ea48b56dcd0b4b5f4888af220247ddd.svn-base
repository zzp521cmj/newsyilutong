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
    <title>客户车辆管理</title>
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
  			url : 'margin.do?method=getSourceShip',
  			border : false,
  			rownumbers : true,
  			fit : true,
  			/* sortName:'transport_pay,check_time,shipping_order',
  			sortOrder:'desc', */
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			multiSort:true,
  		/* 	remoteSort:true, */
  			/* onDblClickRow:function(rowIndex, rowData){
				  			var pid=rowData.custom_id;
							dialog = parent.jy.modalDialog({
									title : '运单查看',
									url : 'orderC.do?method=getShipOrderInfo&pid='+pid,
						 				 buttons :'#addbuttons'
						
									width : 1100,
									buttons : [{
										handler : function() {
											dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$);
										}
									}] 
								}); 		
  				}, */
  			columns : [
  			
  			    [
  			         {title : '本票利润信息' ,"colspan":6},
  			         {title : '本票应收款信息' ,"colspan":3},  
  			         {title : '本票应付款信息' ,"colspan":3},  
  			         {title : '票单信息' ,"colspan":9} 
  			    ],
  			[
  				{field : 'ck',checkbox : true},
  					{field : 'sum',title : '合计',width : 80,align:'center',
  					formatter:function(val,row,index){
						return ;//Number(Number(row.adorn_fee_c)+Number(row.send_other)).toFixed(2);
					}	
  				},
  					{field : 'trunk',title : '中转费',width : 80,align:'center',
  					formatter:function(val,row,index){
						return ;//Number(Number(row.trunk_fee_c)-Number(row.change_fee1)).toFixed(2);
					}	
  				},
  				{field : 'send_fee',title : '送货费',width : 80,align:'center',
  					formatter:function(val,row,index){
						return ;//Number(Number(row.take_fee_c)+Number(row.send_fee1)).toFixed(2);
					}	
  				},
  				{field : 'loading',title : '装卸费',width : 80,align:'center',
  					formatter:function(val,row,index){
						return ;//Number(Number(row.adorn_fee1)+Number(row.adorn_fee1)).toFixed(2);
					}	
  				},
  				{field : 'chayi_daifukuan ',title : '代收运费差异',width : 90,align:'center',
  				    formatter:function(val,row,index){
  				       return Number(Number(row.paid1)-Number(row.trade_agency)).toFixed(2) ;
  				    },
  				},
  				
  			    {field : 'trunk_fee_c',title : '应收中转费',width : 90,align:'center'},
  				{field : 'take_fee_c',title : '应收送货费',width : 90,align:'center'},
  				
  				{field : 'born_fee',title : '应收装卸费',width : 90,align:'center'},
  				
  			    {field : 'change_pay',title : '应付中转费',width : 90,align:'center'},
  				{field : 'send_fee',title : '应付送货费',width : 90,align:'center'},
  				{field : 'adorn_fee2',title : '应付装卸费',width : 90,align:'center'},
  				
  				{field : 'fee_sum_c',title : '代收运费应收',width : 90,align:'center',
  				   /*   formatter:function(val,row,index){
  				         return Number(Number());
  				     } */
  				},
  				{field : 'reality_fee_sum_c',title : '代收运费实收',width : 90,align:'center',
  				     /* formatter:function(val,row,index){
  				         return Number(Number());
  				     } */
  				},
  				
  				{field : 'shiping_order_num',title : '运单号',width : 80,align:'center'},
  				{field : 'people_song',title : '发货人',width : 80,align:'center'},
  				{field : 'receipt',title : '收货人',width : 80,align:'center'},
  				{field : 'receipt_phone',title : '电话',width : 80,align:'center'},
  				{field : 'end_address',title : '到站',width : 80,align:'center'},
  				{field : 'send_type',title : '交接方式',width : 80,align:'center'},
  				{field : 'goods_name',title : '品名',width : 80,align:'center'},
  				{field : 'goods_packing',title : '包装',width : 80,align:'center'},
  				{field : 'goods_num',title : '数量',width : 80,align:'center'},
  				{field : 'goods_weight',title : '重量',width : 80,align:'center'},
  				{field : 'goods_vol',title : '体积',width : 80,align:'center'},
  				{field : 'pay_type',title : '付款方式',width : 80,align:'center',
  				 formatter:function(val,row,index){
  						if(val==0){
  							return "回付";
  						}else if(val==1){
  							return "提付";
  						}else if(val==2){
  						return "现付";
  						}else if(val==3){
  						return "货到前付";
  						}
  					}	
  				
  				},
  				{field : 'order_arrive_time',title : '货物实际到达时间',width : 80,align:'center'},
  				{field : 'is_receive',title : '回单状态',width : 80,align:'center',
  				
  				 formatter:function(val,row,index){
  						if(val==0){
  							return "未接收";
  						}else if(val==1){
  							return "已接收";
  						}
  					}	
  				
  				},
  				/* 
  				{field : 'custom_name',title : '客户名称',width : 80,align:'center'},
  				{field : 'send_station',title : '发站',width : 80,align:'center'},
  				{field : 'car_time',title : '客户发车车次',width : 90,align:'center'},
  				{field : 'car_type',title : '大车车型',width : 90,align:'center'},
  				{field : 'car_number',title : '车牌号',width : 80,align:'center'},
  				{field : 'driver_name',title : '司机姓名',width : 80,align:'center'},
  				{field : 'driver_phone',title : '电话',width : 90,align:'center'},
  				{field : 'send_time',title : '发车日期',width : 120,align:'center',
  					formatter: function(value,row,index){
  				if(value!=undefined){
  				value=value.substr(0,19);
  				}
  					return value;
  				} 				 
  				},
  				{field : 'receipt_time',title : '车到日期',width : 120,align:'center',
  					formatter: function(value,row,index){
		  				if(value!=undefined){
		  					value=value.substr(0,19);
		  				}
	  					return value;
	  				} 				 
  				},
  				{field : 'car_remarks',title : '大车备注',width : 90,align:'center'},
  				{field : 'paid_fee',title : '总运费',width : 90,align:'center'},
  				{field : 'paid',title : '提付实收',width : 90,align:'center'},
  				{field : 'paid1',title : '回付实收',width : 90,align:'center'},
  				{field : 'paid3',title : '到付实收',width : 90,align:'center'},
  				{field : 'trade_agency',title : '代收款',width : 90,align:'center'},
  				{field : 'paid_fee',title : '总运费',width : 90,align:'center'}, 
  				{field : 'trade_sum',title : '代收合计',width : 90,align:'center',
  					formatter:function(val,row,index){
						return Number(Number(row.paid)+Number(row.trade_agency)).toFixed(2);
					}	
  				},
  				{field : 'reality_sum',title : '实收合计',width : 90,align:'center',
  					formatter:function(val,row,index){
						return Number(Number(row.paid1)+Number(row.paid)).toFixed(2);
					}	
  				},
  			
  				{field : 'payble_other',title : '应付其他费',width : 90,align:'center'},
  				{field : 'pay_sum',title : '应付款合计',width : 90,align:'center',
  					formatter:function(val,row,index){
						return Number(Number(row.change_pay)+Number(row.adorn_fee2)+Number(row.send_fee)+Number(row.payble_other)).toFixed(2);
					}	
  				},
  				{field : 'change_fee1',title : '实付中转费',width : 90,align:'center',hidden:"true"},
  				{field : 'send_fee1',title : '实付送货费',width : 90,align:'center',hidden:"true"},
  				{field : 'adorn_fee1',title : '实付装卸费',width : 90,align:'center',hidden:"true"},
  				{field : 'send_other',title : '实付其他费',width : 90,align:'center',hidden:"true"},
  				{field : 'reality_pay_sum',title : '实付款合计',width : 90,align:'center',
  					formatter:function(val,row,index){
						return Number(Number(row.change_fee1)+Number(row.send_fee1)+Number(row.adorn_fee1)+Number(row.send_other)).toFixed(2);
					}	
  				},
  				{field : 'remarks_fee2',title : '应付款备注',width : 300,align:'center'
  					,editor:{
	                	type:'text',
	                	options:{
	                    	validType:'remarks_fee2'
	                	}
           			}	
  				},
  			
  				{field : 'adorn_fee_c',title : '应收其他费',width : 90,align:'center'},
  				{field : 'fee_sum_c',title : '应收款合计',width : 90,align:'center',
  					formatter:function(val,row,index){
						return Number(Number(row.trunk_fee_c)+Number(row.take_fee_c)+Number(row.born_fee)+Number(row.adorn_fee_c)).toFixed(2);
					}
  				},
  				{field : 'trunk_fee1_c',title : '实收中转费',width : 80,align:'center',hidden:"true"},
  				{field : 'take_fee1_c',title : '实收送货费',width : 80,align:'center',hidden:"true"},
  				{field : 'born_fee1',title : '实收装卸费',width : 80,align:'center',hidden:"true"},
  				{field : 'adorn_fee1_c',title : '实收其他费',width : 80,align:'center',hidden:"true"},
  				{field : 'reality_fee_sum_c',title : '实收款合计',width : 80,align:'center',
  					formatter:function(val,row,index){
						return Number(Number(row.trunk_fee1_c)+Number(row.take_fee1_c)+Number(row.adorn_fee1_c)+Number(row.born_fee)).toFixed(2);
					}
  				},
  				{field : 'remarks_fee1',title : '应收款备注',width : 300,align:'center'
  					,editor:{
	                	type:'text',
	                	options:{
	                    	validType:'remarks_fee1'
	                	}
           			}	
  				},
  				
  			
  				{field : 'adorn',title : '其他费',width : 80,align:'center',
  					formatter:function(val,row,index){
						return ;//Number(Number(row.adorn_fee_c)+Number(row.send_other)).toFixed(2);
					}	
  				}, */
  			
  				
  			]],
  			rowStyler : function(index, row) {
				//合计行颜色
				if (row.shiping_order_num == '合计') {
					return 'background-color:yellow;font-weight:bold;color:blue';
				}
				if (row.shiping_order_num != '合计') {
					return 'color:blue;';
				}
			},
  			onBeforeEdit:function(index,row){ //可编辑之前
				editval=index;
		        row.editing = true;
		    }, 
		    onAfterEdit:function(index,row){//编辑关闭后
				$.ajax({url:'margin.do?method=updataRemarkCustom',data:{id:row.custom_id,remarks_fee1:row.remarks_fee1,remarks_fee2:row.remarks_fee2}
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
  			onLoadSuccess:function(data){
  				//添加合计行
				$('#dg').datagrid('appendRow', {
					shiping_order_num : '合计',
					paid_fee : compute("paid_fee"),
					paid : compute("paid"),
					paid1 : compute("paid1"),
					paid3 : compute("paid3"),
					trade_agency : compute("trade_agency"),
					paid_fee : compute("paid_fee"),
					trade_sum : compute("trade_sum"),
					reality_sum : compute("reality_sum"),
					change_pay : compute("change_pay"),
					send_fee : compute("send_fee"),
					adorn_fee2 : compute("adorn_fee2"),
					payble_other : compute("payble_other"),
					pay_sum : compute("pay_sum"),
					reality_sum : compute("reality_sum"),
					change_fee1 : compute("change_fee1"),
					send_fee1 : compute("send_fee1"),
					send_other : compute("send_other"),
					reality_pay_sum : compute("reality_pay_sum"),
					trunk : compute("trunk"),
					take : compute("take"),
					loading : compute("loading"),
					adorn : compute("adorn"),
					sum : compute("sum")
				});
				//合并单元格
				var merges2 = [ {
					field : 'shiping_order_num',
					index : data.rows.length - 1,
					colspan : 1,
					rowspan : 1
				}]
				for ( var i = 0; i < merges2.length; i++)
					$('#dg').datagrid('mergeCells', {
						index : merges2[i].index,
						field : merges2[i].field,
						colspan : merges2[i].colspan,
						rowspan : merges2[i].rowspan
					});
           },
  			pagination:true,//分页
		    pageSize:10,
		    pageList:[5,10,15,20],
  			toolbar : '#tb'
  		});
  		
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
			$("#car_number").val("");
			$("#startDate1").val("");
			$("#endDate2").val("");
			$("#phone").val("");
			$("#send_adress").val("");
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
  	//回车查询事件
  		
		$("#ddId").select2({
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
						data.results.push({id: y.id, text: y.name});;
					});
			        query.callback(data);
				   }
				});
		    }
		})
  	});
  		
  	//查询
  	function searchCar_owner(){
  		var startDate=document.getElementById("startDate").value;
  		var endDate=document.getElementById("endDate").value;
  		var startDate1=document.getElementById("startDate1").value;
  		var endDate2=document.getElementById("endDate2").value;
  		/* if($.trim($("#phone").select2("data"))!=""){
  		phone=$.trim($("#phone").select2("data").text);
  			} */
  		$("#dg").datagrid('load',{
  				start_date :startDate,
	 	 		end_date :endDate,
	 	 		start_date1 :startDate1,
	 	 		end_date2 :endDate2,
	 	 /* 		name:$.trim($("#ddId").val()), */
	 			 phone:$.trim($("#phone").val()),
	 	 		send_address:$.trim($("#send_adress").val()),//发站
  				//institution:$.trim($("#cc3").combotree("getValue")),
  				type:$.trim($("#driver_name").val()),//到站
	 	 		car_number:$.trim($("#car_number").val()),
  				//institution:$.trim($("#cc3").combotree("getValue")),
  				 name:$.trim($("#ddId").select2("val"))
	 	});	  
	 	
  	}  	
  	//导出
  		function putoutfile(){
		var allRows2 = $("#dg").datagrid("getColumnFields");
		var colName=[];
		var fieldName=[];
		for(i=1;i<allRows2.length;i++)
		{
			var col = $('#dg').datagrid( "getColumnOption" , allRows2[i] );
			if(col.field!="change_fee1"&&col.field!="send_fee1"&&col.field!="adorn_fee1"&&col.field!="send_other"&&col.field!="trunk_fee1_c"&&col.field!="take_fee1_c"&&col.field!="born_fee1"&&col.field!="adorn_fee1_c"){
				colName.push(col.title);//把title列名到数组里去 
				fieldName.push(col.field); //把field列属性名到数组里去 
			} 
		}
		$("#fieldName").val(fieldName.join(","));
  		 $("#headtitle").val(colName.join(","));
  		var outputform=$("#outputform");
  		outputform.submit(); 
  	}
  	//详细信息
  	function xiangxixinxi(){
  	var data = $("#dg").datagrid("getSelections");
  	   if(data.length==1){
  	        var customId=data[0].custom_id;
  	       	dialog = parent.jy.modalDialog({
				title : '客户修改',
				url : 'margin.do?method=getSearchShipMargin&custom_id='+customId,
				width : 1120,
				height : 545,
			});
  	   }else{
  	   $.messager.alert('单票信息', '请选择一行信息!', 'info');
  	   }
  	}
	//重置
	function reset(){
		$("#startDate").val("");
		$("#endDate").val("");
		$("#startDate1").val("");
		$("#endDate2").val("");
		$("#ddId").val("");
		$("#car_number").val("");
		$("#phone").val("");
		$("#send_adress").val("");
		$("#driver_name").val("");
	}

  </script>
  <body class="easyui-layout">
  	<form action="margin.do" id="outputform" method="post">
    	<div region="north" title="检索" class="st-north" border="false" collapsible="false"  >
	    	<lable>发车日期:</lable>
			<input  id="startDate"  class="Wdate"  readonly="readonly" style="width:150px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			-
			<input id="endDate"  class="Wdate"  readonly="readonly" style="width:150px;height:22px;" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
	    	<lable class="divlabel">客户名称:</lable>
	    	 <input type="text" class="search-text" id="ddId"  style="width:150px"  >
	    	 <lable class="divlabel">司机姓名:</lable>
			<input type="text" class="search-text" id="driver_name" >
	    	 <a class="easyui-linkbutton" onclick="searchCar_owner()" data-options="iconCls:'icon-search'"  >查询</a>	
	    	 <a id="btnMoreSearch" class="btn btn-sm btn-link" type="button" style="margin-top:16px;" href="javascript:void(0)" state="close">更多条件</a>
	    	 <div id="searchInfoId" style="display: none">
	    	 <lable>到车日期:</lable>
			<input  id="startDate1"  class="Wdate"  readonly="readonly" style="width:150px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			-
			<input id="endDate2"  class="Wdate"  readonly="readonly" style="width:150px;height:22px;" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
	    	<lable class="divlabel">&nbsp;车牌号:</lable>
	    	<input type="text"  class="search-text"style="width:150px"   id="car_number" >
			<!--<lable>所属机构:</lable>
			<input id="cc3" name="did">-->
			<lable >发站:</lable>
	    	<input type="text"  class="search-text"style="width:150px"   id="send_adress" >
	    	<lable >电话:</lable>
	    	<input type="text"  class="search-text"style="width:150px"   id="phone" >
			</div>
    	</div>
    	<div region="center" >
    		<table id="dg" title="客户车辆信息" ></table>
    	</div>
    	<div id="tb">
    		
    		<a href="javascript:void(0)" class="easyui-linkbutton" id="outputCar_owner" data-options="iconCls:'icon-output',plain:true" onclick="xiangxixinxi()">详细信息</a>
		</div>	
		<input type="hidden" name="method" value="outSourceShip">
		<input type="hidden" id="fieldName" name="fieldName">
		<input type="hidden" id="headtitle" name="headtitle">
		</form>
		 <form action="shipOrder.do" target="_blank" id="printywm" method="post">
		 	<input type="hidden" name="method" value="getShipOrderPrintYwm">
		 	<input type="hidden" id="checkarray" name="checkarray">
		 </form>
  </body>
</html>