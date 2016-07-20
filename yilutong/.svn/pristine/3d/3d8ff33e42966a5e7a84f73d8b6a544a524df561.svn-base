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
    <title>运单信息管理</title>
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
  <script type="text/javascript">
	  	var dialog;
 		var grid;
 		var editval;
 		var pid='<%=flg%>';
  		$(function(){
  	    $('#win').window({    
	     inline : false,
	       
	       });
	    $('#win').window('close'); 
  			grid=$("#dg").datagrid({
  			url : 'payable.do?method=getShippingChecked&pid='+pid,
  			border : false,
  			rownumbers : true,
  			fit : true,
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			multiSort:true,
  			columns : [[
  				{field : 'ck',checkbox : true},
  				{field : 'send_time',title : '发车时间',width : 120,align:'center',sortable:'true',
  				formatter: function(value,row,index){
  				if(value!=undefined){
  				value=value.substr(0,19);
  				}
  					return value;
  				} 				 
  				},
  				{field : 'send_station',title : '发站',width : 100,align:'center'},
  				{field : 'custom_name',title : '发货人',width : 80,align:'center'},
  				{field : 'shiping_order_num',title : '运单号',width : 60,align:'center'},
  				{field : 'end_address',title : '到站',width : 55,align:'center'},
  				{field : 'receipt',title : '收货人',width : 60,align:'center'},
  				{field : 'receipt_tel',title : '电话',width : 80,align:'center'},
  				{field : 'receipt_phone',title : '手机',width : 80,align:'center'},
  				{field : 'send_type',title : '交接方式',width : 70,align:'center',
  				formatter:function(val,row,index){
  						if(val==0){
  							return "自提";
  						}else if(val==1){
  						return "送货";
  						}
  					}
  				},
  				
  			    {field : 'goods_name',title : '品名',width : 60,align:'center'},
  				{field : 'goods_packing',title : '包装',width : 60,align:'center'},
  				{field : 'goods_num',title : '件数',width : 60,align:'center'},
  				{field : 'goods_weight',title : '重量',width : 60,align:'center'},
  				{field : 'goods_vol',title : '体积',width : 60,align:'center'},
  			/* 	{field : 'car_number',title : '车牌号',width : 70,align:'center'}, */
  				{field : 'receipt_address',title : '送货详细地址',width : 100,align:'center'},
  				{field : 'trade_agency',title : '代收款',width : 70,align:'center'},
  				{field : 'transport_pay',title : '运费总额',width : 70,align:'center'/* sortable: true */},
  				{field : 'pay_type',title : '付款方式',width : 70,align:'center',
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
  			/* {field : 'shipping_order_state',title : '运单状态',width : 70,align:'center',
  					formatter:function(val,row,index){
  						if(val==0){
  							return "未出库";
  						}else if(val==1){
  							return "配送中";
  						}else if(val==2){
  						return "转运中";
  						}else if(val==3){
  						return "到达";
  						}else if(val==4){
  						return "签收";
  						}
  					}	
  				},   */
  				{field : 'is_recept',title : '回单份数',width : 70,align:'center',
  					formatter:function(val,row,index){
  						if(val==0){
  							return "";
  						}else{
  						return val;
  						}
  					}
  				
  				},
  				{field : 'back_fee',title : '回扣',width : 70,align:'center'},
  				{field : 'remarks',title : '备注',width : 90,align:'center',sortable:'true'},
  				{field : 'change_fee',title : '中转费',width : 80,align:'center',sortable:'true'},
  				{field : 'take_fee',title : '应收送货费',width : 80,align:'center',sortable:'true'},
  					
  				{field : 'send_fee',title : '应收落地费',width : 80,align:'center',sortable:'true'},
  				
  				{field : 'adorn_fee',title : '应收其他费',width : 80,align:'center',sortable:'true'},
  				{field : 'receivable_ground_fee', title : '装卸费', width : 80,align :'center',sortable:'true'},
  				{field : 'upstairs_fee',title : '上楼费', width : 80,align :'center',sortable:'true'},
  				{field : 'deliver_fee',title : '直送费', width : 80,align :'center',sortable:'true'},
  				{field : 'inspect_fee',title : '开箱验货费', width : 80,align :'center',sortable:'true'},
  				{field : 'seized_fee',title : '理货费', width : 80,align :'center',sortable:'true'},
  				//{field : 'stocks_predestination',title : '库存天数', width : 80,align :'center',sortable:'true'},
  				{field : 'transport_mode',title : '运输方式', width : 80,align :'center',sortable:'true',
  				    formatter:function(val,row,index){
  						if(val==0){
  							return "普快";
  						}else if(val==1){
  						
  						return "特快";
  						}
  					}
  				},
  			    {field : 'change_recheck_state',title : '结算状态',width : 80,align:'center',
				  			formatter:function(val,row,index){
				  					if (val == 0) {
											return "未审核";
										} else if (val == 3) {
											return "审核中";
										} else if (val == 1) {
											return "审核通过";
										} else if (val == 2) {
											return "审核未通过";
										} 
									}
				  			},
				  {field : 'change_write_off',title : '结算方式',width : 80,align : 'center',
										formatter : function(val, row, index) {
											if (val == 0) {
												return "打卡";
											} else if (val == 1) {
												return "现金";
											} else if (val == 3) {
												return "未结算";
											}
										}
									}, 									
  				{field : 'shiping_check',title : '运单核对状态', width : 80,align :'center',sortable:'true',
  				    formatter:function(val,row,index){
  						if(val==0){
  							return "未核对";
  						}else if(val==1){
  						
  						return "已核对";
  						}
  					}
  				},
  				{field : 'invoice_state',title : '是否开票', width : 80,align :'center',sortable:'true',
  				formatter:function(val,row,index){
  						if(val==0){
  							return "否";
  						}else if(val==1){
  						
  						return "是";
  						}
  					}
  				},
               /* {field : 'phone_state',title : '电话预约', width : 80,align :'center',sortable:'true',
  				formatter:function(val,row,index){
  						if(val==0){
  							return "否";
  						}else if(val==1){
  						
  						return "是";
  						}
  					}
  				},   		 */		
  				{field : 'remarks_fee',title : '应收备注',width : 90,align:'center',sortable:'true'},
  				{field : 'appointment_remarks',title : '配送备注',width : 90,align:'center',sortable:'true'},
  				
  				/* {field : 'is_order_arrive',title : '是否实际到达',width : 90,align:'center',sortable:'true',
  					formatter: function(value,row,index){
  						if(value==0){
  							return "未到达";
  						}else if(value==1){
  							return "到达";
  						}
  					
  					}
  				
  				}, */
  				{field : 'creat_type',title : '创建方式', width : 80,align :'center',sortable:'true',
  				formatter:function(val,row,index){
  						if(val==0){
  							return "手录";
  						}else if(val==1){
  						
  						return "PC端导入";
  						}else if (val==2) {
							return "无缝对接";
						}else if (val==3) {
							return "APP端导入";
						}
  					}
  				},
  				/* {field : 'is_order_arrive',title : '到达状态', width : 80,align :'center',sortable:'true',
  				formatter:function(val,row,index){
  						if(val==0){
  							return "未到达";
  						}else if(val==1){
  						
  						return "到达";
  						}
  					}
  				}, */
  				
   				{field : 'order_time',title : '录入时间',width : 80,align:'center',sortable:'true'},
   				//{field : 'time_appointment',title : '配送时间',width : 80,align:'center',sortable:'true'},
   				//{field : 'order_arrive_time',title : '实际到达时间',width : 80,align:'center',sortable:'true'},
  				 	
  				{field : 'shipping_order_name',title : '制单人',width : 80,align:'center',sortable:'true'},
  				
  			]],
  			onBeforeEdit:function(index,row){ //可编辑之前
				editval=index;
		        row.editing = true;
		    },
		    onAfterEdit:function(index,row){//编辑关闭后
		    	$('#dg').datagrid("endEdit",editval);
					$.ajax({
           			 type: "post",
          				url : 'shipOrder.do?method=updateShipOrder',
           				data :  row,
            			success: function (data) {
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
    				if(editval!=rowIndex){
    					$('#dg').datagrid("endEdit", editval);
    					$('#dg').datagrid("beginEdit", rowIndex);
	                	editval=rowIndex;
    				}else{
    					editval=undefined;
    					$('#dg').datagrid("endEdit", rowIndex);
    				}
                	
            },

  			
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
	 	 		order_state:$.trim($("#order_state").combobox("getValue")),
	 	 		pay_type:$.trim($("#pay_type").combobox("getValue")),
	 	 		send_address:$.trim($("#send_address").val()),//发站
  				//institution:$.trim($("#cc3").combotree("getValue")),
  				type:$.trim($("#end_address").val())//到站
	 	});	  
	 	
  	}
  		//货物到达接收
  	function isArrive(){
  		var checkarray=[];
  		var checkanum=[];
  		var custom_id="";
	 	var array = $('#dg').datagrid('getSelections');
  		for(var i=0;i<array.length;i++){
  		if(array[i].is_order_arrive!=1){
  			checkarray.push(array[i].shiping_order_id);
  			checkanum.push(array[i].shiping_order_num);
  			custom_id=array[i].custom_id;
  			}
  		
	  		/*  if(array[i].shipping_order_state==0){
	  			checkarray.push(array[i].shiping_order_id);
	  			}else{
	  				$.messager.confirm('提示','您选中的运单号'+array[i].shiping_order_num+'不能执行删除！')
	  			} */
	  		}
  		if(checkarray.length>0){
  			$.messager.confirm('确认','您确定要处理选中的记录吗？',function(r){ 
    			if (r){ 
    				$.ajax({
						url: "shipOrder.do?method=isArrive",
						type: "POST",
						data:{del:checkarray.join(","),
						num:checkanum.join(","),
						custom_id:custom_id
						},
			  				success:function(data){
			  					if (data.flag) {
									parent.$.messager.alert("运单信息","运单信息到达 ",'info',
										function(r) {
											$('#dg').datagrid('reload');
 										});
  								} 
  						}
					});
				}  			
  			});
  		}else{
  			$.messager.alert("运单录入","请选择未到达信息","info");	
  		}	
  	}
  	
  	//货物到达取消
  	function isNotArrive(){
  		var checkarray=[];
	 	var array = $('#dg').datagrid('getSelections');
  		for(var i=0;i<array.length;i++){
  		if(array[i].is_order_arrive!=0){
  			checkarray.push(array[i].shiping_order_id);
  			}
  		
	  		/*  if(array[i].shipping_order_state==0){
	  			checkarray.push(array[i].shiping_order_id);
	  			}else{
	  				$.messager.confirm('提示','您选中的运单号'+array[i].shiping_order_num+'不能执行删除！')
	  			} */
	  		}
  		if(checkarray.length>0){
  			$.messager.confirm('确认','您确定要取消到达选中的记录吗？',function(r){ 
    			if (r){ 
    				$.ajax({
						url: "shipOrder.do?method=isNotArrive",
						type: "POST",
						data:{del:checkarray.join(","),
						},
			  				success:function(data){
			  					if (data.flag) {
									parent.$.messager.alert("运单信息","运单信息取消到达",'info',
										function(r) {
											$('#dg').datagrid('reload');
 										});
  								} 
  						}
					});
				}  			
  			});
  		}else{
  			$.messager.alert("运单录入","请选择已到达信息","info");	
  		}	
  	}  
  	
  	
  	//发短息
  	function sendMsg(){
  		var checkarray=[];
	 	var array = $('#dg').datagrid('getSelections');
  		for(var i=0;i<array.length;i++){
  			checkarray.push(array[i].shiping_order_id);
  		
	  		/*  if(array[i].shipping_order_state==0){
	  			checkarray.push(array[i].shiping_order_id);
	  			}else{
	  				$.messager.confirm('提示','您选中的运单号'+array[i].shiping_order_num+'不能执行删除！')
	  			} */
	  		}
  		if(checkarray.length>0){
  			$.messager.confirm('确认','您确定选中的记录发短信吗？',function(r){ 
    			if (r){ 
    				$.ajax({
						url: "shipOrder.do?method=isNotArrive",
						type: "POST",
						data:{del:checkarray.join(",")},
			  				success:function(data){
			  					if (data.flag) {
									parent.$.messager.alert("信息发送","信息发送成功",'info',
										function(r) {
											$('#dg').datagrid('reload');
 										});
  								} 
  						}
					});
				}  			
  			});
  		}else{
  			$.messager.alert("运单录入","请选择一行信息","info");	
  		}	
  	
  	}
  	//删除
  	function deleteEver(){
  		var checkarray=[];
  		var num=0;
	 	var array = $('#dg').datagrid('getSelections');
	 	if(array!=""){
	 		for(var i=0;i<array.length;i++){
  			//checkarray.push(array[i].shiping_order_id);
	  		 if(array[i].shipping_order_state==0){
	  			checkarray.push(array[i].shiping_order_id);
	  			}else{
	  					num++;
	  			}
	  		}
	  		 if(num>0){
	  				$.messager.alert('提示','您选中的运单有'+num+'个已经制作协议不能执行删除！','info',function(r){
											  	if(checkarray.length>0){
										  			$.messager.confirm('确认','您确定要删除选中未做协议的记录吗？',function(r){ 
										    			if (r){ 
										    				$.ajax({
																url: "shipOrder.do?method=deleteShipOrder",
																type: "POST",
																data:{del:checkarray.join(",")},
													  				success:function(data){
													  					if (data.flag) {
																			parent.$.messager.alert("运单信息删除","运单信息删除成功",'info',
																				function(r) {
																					$('#dg').datagrid('reload');
										 										});
										  								} 
										  						}
															});
														}  			
										  			});				  		
										  		}					  								
	  										});	  	
	  										num=0;
	  								}else{
	  										 	if(checkarray.length>0){
										  			$.messager.confirm('确认','您确定要删除选中的记录吗？',function(r){ 
										    			if (r){ 
										    				$.ajax({
																url: "shipOrder.do?method=deleteShipOrder",
																type: "POST",
																data:{del:checkarray.join(",")},
													  				success:function(data){
													  					if (data.flag) {
																			parent.$.messager.alert("运单信息删除","运单信息删除成功",'info',
																				function(r) {
																					$('#dg').datagrid('reload');
										 										});
										  								} 
										  						}
															});
														}  			
										  			});	  		
										  		}					
	  										}		  				
	 	
	 	}else{
  			$.messager.alert("运单录入","请选择一行信息","info");
  		}	
  	}
  	
  	/*
  	修改查询 
  	*/
  	function modify(){
  		var row=$("#dg").datagrid('getSelections');
  			if(row.length==1){
	  			for(var i=0;i<row.length;i++){		
		  		 if(row[i].shipping_order_state==0){
	  				var id=row[i].shiping_order_id;
					  		dialog = parent.jy.modalDialog({
								title : '运单修改',
								url : 'shipOrder.do?method=getEditShipOrderPage&pid=' + id,
								width : 680,
								buttons : [{
									text : '<input type="button" class="btncss" value="修改"/>',
									handler : function() {
										dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
									}
								}] 
							});
	  			}else{
	  				$.messager.confirm('提示','您选中的运单号'+row[i].shiping_order_num+'，已做协议，不能执行修改！')
	  				}
		  		}		
  		}else{
  			$.messager.alert("运单录入","请选择一行信息","info");	
  		}	
  	}
  	//详情查询
  	function xiangxixinxi(){
  		var row=$("#dg").datagrid('getSelections');
  			if(row.length==1){
	  			for(var i=0;i<row.length;i++){
		  			var id=row[i].shiping_order_id;
		  		}		
	  			dialog = parent.jy.modalDialog({
				title : '运单详情',
				url : 'shipOrder.do?method=getShipOrderPage&pid=' + id,
				width : 680,
				buttons : [{
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
					}
				}] 
			});
  		}else{
  			$.messager.alert("运单录入","请选择一行信息","info");	
  		}	
  	}
  	//修改
  	function updateUser(){
	 var myform=document.forms[1];
  	 myform.action="car_owner.do?method=updateCar_owner";
  	 myform.submit();
	
	}
  	
  	//导出
  		function putoutfile(){
		var allRows2 = $("#dg").datagrid("getColumnFields");
		var colName=[];
		var fieldName=[];
		for(i=1;i<allRows2.length;i++)
		{
			var col = $('#dg').datagrid( "getColumnOption" , allRows2[i] );
			if(col.field!="check_type"&&col.field!="send_type"&&col.field!="shipping_order_state"){
				colName.push(col.title);//把title列名到数组里去 
				fieldName.push(col.field); //把field列属性名到数组里去 
			} 
		} 
		$("#fieldName").val(fieldName.join(","));
  		 $("#headtitle").val(colName.join(","));
  		var outputform=$("#outputform");
  		outputform.submit(); 
  	}
  	
 	function add() {
		 /* alert(document.getElementById("addbuttons"));
		 alert(document.getElementById("upbuttons")); */
		dialog = parent.jy.modalDialog({
			title : '运单新增',
			url : 'shipOrder.do?method=addShipOrder&pid='+pid,
/* 				 buttons :'#addbuttons'
*/
			width : 680,
			buttons : [{
				text : '<input type="button" class="btncss" value="保存"/>',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$);
				}
			}] 
		});
	};
  	//打印
  	function dy(){
  		var row=$("#dg").datagrid('getSelections');
  			if(row.length==1){
	  			for(var i=0;i<row.length;i++){
		  			var pid=row[i].shiping_order_id;
		  		}	
							var url="shipOrder.do?method=getShipOrderPrint&pid="+pid;
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
  	//导入
  	function putintfile() {
		dialog = parent.jy.modalDialog({
			title : '导入运单',
			url : 'shipOrder.do?method=imp',
			width : 600,
			height: 300,
			buttons : [{
				text : '<input type="button" value="导入" class="btncss">',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$);
				}
			}] 
		});
	};
	//重置
	function reset(){
		$("#startDate").val("");
		$("#endDate").val("");
		$("#ddId").val("");
		$("#phone").val("");
		$("#send_address").val("");
		$("#end_address").val("");
		$("#perpole").val("");
		$("#pay_state").combobox("setValue","");
		$("#order_state").combobox("setValue","");
		
	}
	//一维打印
	function printYWM(){
		var row=$("#dg").datagrid('getSelections');
		if(row.length>=1){
			var checkarray=[];
	 		var array = $('#dg').datagrid('getSelections');
  			for(var i=0;i<array.length;i++){
  				checkarray.push(array[i].shiping_order_num);
  			}
  			$("#checkarray").val(checkarray.join(","));
  			$("#printywm").submit();
		}else{
			$.messager.alert("运单录入","请选择一行信息","info");	
		}	
		
	}
	//电话预约
	function phonebooking() {

	  	var checkarray=[];
	 	var array = $('#dg').datagrid('getSelections');
  		for(var i=0;i<array.length;i++){
  			   checkarray.push(array[i].shiping_order_id);
  	    }
		if (array !== "") {
			dialog = parent.jy.modalDialog({
				title : '电话预约',
			    url : 'shipOrder.do?method=phoneBooking&checkarray='+checkarray.join(","),
				width : 500,
				height : 300,
				buttons : [ {
					text : '<input type="button" class="btncss" value="确定"/>',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow
								.submitFormEdit(dialog, grid, parent.$);
					}
				} ]
			});
		} else {
			$.messager.alert("中转费核销", " 请选择正确的信息", "info");
		}
	}
   /* function phonebooking(){
   
   	var checkarray=[];
	 	var array = $('#dg').datagrid('getSelections');
  		for(var i=0;i<array.length;i++){
  		   // if(array[i].is_order_arrive!=0){
  			   checkarray.push(array[i].shiping_order_id);
  			   alert(array[i].shiping_order_id+"#####");
  			}
	 // }
	  if (array!="") {
       		dialog = parent.jy.modalDialog({
			title : '电话预约',
			url : 'shipOrder.do?method=phoneBooking&checkarray='+checkarray,
			width : 500,
			height: 250,
			type: "POST",
			data:{checkarray:checkarray.join(",")},
			buttons : [{
				text : '<input type="button" value="确定" class="btncss">',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitFormPhone(dialog, grid, parent.$);
				}
			}] 
		});
	} else {
        $.messager.alert("电话预约","请选择一行信息","info");	
	}
  
    } */

  </script>
  <body class="easyui-layout">
  	<form action="shipOrder.do" id="outputform" method="post">
  <!--   	<div region="north" title="检索" class="st-north" border="false"  height="60px" collapsible="false"  >
	    	<lable>发车日期:</lable>
			<input  id="startDate"  class="Wdate"  readonly="readonly" style="width:150px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			-
			<input id="endDate"  class="Wdate"  readonly="readonly" style="width:150px;height:22px;" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
	    	<lable class="divlabel">运单编号:</lable>
	    	 <input type="text" class="search-text" id="ddId"  style="width:150px"  >
	    	 	<lable class="divlabel">运单状态:</lable>
				<select class="easyui-combobox" id="order_state" name="agreement_type"
					style="width:150px;"
					data-options="panelHeight : 'auto',editable:false">
					<option id="" value="">全部</option>
					<option id="" value="0">未出库</option>
					<option id="" value="1">配送中</option>
					<option id="" value="2">转运中</option>
					<option id="" value="4">签收</option>
				</select>
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
			<lable>所属机构:</lable>
			<input id="cc3" name="did">
			<lable>到站:</lable>
			<input type="text" class="search-text" id="end_address" >
			<lable >发站:</lable>
	    	<input type="text"  class="search-text"style="width:150px"   id="send_adress" >
	    	<lable >电话:</lable>
	    	<input type="text"  class="search-text"style="width:150px"   id="phone" >
			</div>
    	</div> -->
    	<div region="center" >
    		<table id="dg" title="运单信息" ></table>
    	</div>
    	 <!--<div id="tb">
   		   <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true"   onclick="add()">添加</a>  
   		   <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true"   onclick="xiangxixinxi()">详细</a>
		   <a href="javascript:void(0)" class="easyui-linkbutton" id="getUpdateCar_owner" data-options="iconCls:'icon-edit',plain:true"onclick="modify()">修改</a>
		   <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true"   onclick="deleteEver()">删除</a>
		   <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true"onclick="printYWM()">一维码打印</a>
		   <a href="javascript:void(0)"	class="easyui-linkbutton" data-options="iconCls:'icon-input',plain:true" onclick="isArrive()" id="tbru" >到达</a>
		   <a href="javascript:void(0)" class="easyui-linkbutton" id="outputCar_owner" data-options="iconCls:'icon-output',plain:true" onclick="isNotArrive()">取消到达</a>
		   <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true"  onclick="phonebooking()">电话预约</a>
		   <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="reset()">重置</a> 	   
		</div>	-->
		<input type="hidden" name="method" value="outShipOrder">
		<input type="hidden" id="fieldName" name="fieldName">
		<input type="hidden" id="headtitle" name="headtitle">
		</form>
		 <form action="shipOrder.do" target="_blank" id="printywm" method="post">
		 	<input type="hidden" name="method" value="getShipOrderPrintYwm">
		 	<input type="hidden" id="checkarray" name="checkarray">
		 </form>
  </body>
</html>