<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>接货费核销</title>
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
 		document.onkeydown = function(event) {
  				e = event ? event : (window.event ? window.event : null);
  				if (e.keyCode == 13) {
  					//执行的方法 
  					searchCar_owner();
  				}
  			};	
 		
  		$(function(){
  			grid=$("#dg").datagrid({
  			url : 'payablefee.do?method=getDeliveryfeeList',
  			border : false,
  			rownumbers : true,
  			fit : true,
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			multiSort:true,
  				
  					columns : [[
  			{field : 'ck',checkbox : true},
  			/* {field : 'shiping_order_num',	title : '订单编号',width : 80,	align : 'center'}, 
			{field : 'trade_agency',title : '代收款',	width : 80,	align : 'center'},
			{field : 'send_type',title : '交接方式',width : 80,align : 'center',
			formatter : function(val, row, index) {
					if (val == 0) {
						return "自提";
					} else if (val == 1) {
						return "送货";
					}
				}},
									
			{field : 'pay_type',title : '付款方式',width : 80,align : 'center',
			formatter : function(val, row, index) {
					if (val == 0) {
						return "回付";
					} else if (val == 1) {
						return "提付";
					} else if (val == 2) {
						return "现付";
					} else if (val == 3) {
						return "货到前付";
					}
				}}, 
				{	field : 'paid',title : '应收',	width : 80,align : 'center'},
				{field : 'paid_chayi',title : '实收',width : 80,align : 'center',
										editor : {
											type : 'numberbox',
											options : {
												precision : 2,
												validType : 'paid_chayi'
											}
										},
										formatter : function(val, row, index) {

											if (val == null || val == "") {
												return row.paid;
											} else {
												return row.paid_chayi;
											}
										}
									},
				{field : 'tifu_chayi',	title : '差异',width : 80,align : 'center',
										formatter : function(val, row, index) {
											if (row.paid_chayi == null || val == "") {
												 return Number(Number(row.paid)
														- Number(row.paid));
											} else {
												return Number(Number(row.paid_chayi)
														- Number(row.paid));
											}
										}
										},
				
				{field : 'send_time',title : '送货日期',width : 80,align : 'center'},
				{field : 'car_name',title : '送货司机',width : 80,align : 'center'},
				{field : 'send_remarks',title : '送货备注',width : 120,align : 'center',
								editor : {
									type : 'text',
									options : {

										validType : 'send_remarks'
									}
								}
							},
  				{field : 'delivery_fee',title : '应付接货费',width : 80,align:'center'},
  				{field : 'delivery_fee1',title : '实付接货费',width : 80,align:'center',editor:{
	                	type:'numberbox',
	                	options:{
	                		precision:2,
	                    	validType:'delivery_fee1'
	                	}
	           		},formatter:function(val,row,index){
	           		
	           		   if(val==null){
	           		 		return row.delivery_fee;
	           		   }else{
	           		   return row.delivery_fee1;
	           		   }
  					}
  				},
  				{field : 'fee_remarks1',title : '应付接货费核销备注',width : 120,align:'center',editor:{
	                	type:'text',
	                	options:{
	                    	validType:'fee_remarks1'
	                	}
           			}},
           		{field : 'send_station',	title : '发站',width : 80,align : 'center'	},
				{field : 'end_address',title : '到达地',width : 80,align : 'center'	},
				{field : 'receipt',title : '收货人',width : 80,align : 'center'},
				{field : 'goods_name',title : '品名',width : 80,align : 'center'	},
				{field : 'goods_num',title : '件数',width : 80,align : 'center'},
				{field : 'receipt_address',	title : '送货地址',width : 80,align : 'center'},
  				{field : 'fee_writeoff',title : '核销方式',width : 80,align:'center',
  					formatter:function(val,row,index){
  						if(val==0 ){
  							return "打卡";
  						}else if(val==1){
  						return "现金";
  						}else if(val==3){
  						return "未核销";
  						}
  					}	 },
  					
  				{field : 'send_date_fee',title : '核销日期',width : 80,align : 'center'},
				{field : 'create_time',title : '协议制作日期',width : 80,	align : 'center'},
				{field : 'people_jie',	title : '核销人',width : 80,align : 'center'} */
				{
										field : 'shiping_order_num',
										title : '订单编号',
										width : 80,
										align : 'center'
									},

									
									{
										field : 'send_type',
										title : '交接方式',
										width : 80,
										align : 'center',
										formatter : function(val, row, index) {
											if (val == 0) {
												return "自提";
											} else if (val == 1) {
												return "送货";
											}
										}
									},
									
								{
										field : 'pay_type',
										title : '付款方式',
										width : 80,
										align : 'center',
										formatter : function(val, row, index) {
											if (val == 0) {
												return "回付";
											} else if (val == 1) {
												return "提付";
											} else if (val == 2) {
												return "现付";
											} else if (val == 3) {
												return "货到前付";
											}
										}
									}, {
										field : 'paid',
										title : '应收',
										width : 80,
										align : 'center'
									},{
										field : 'paid_chayi',
										title : '实收',
										width : 80,
										align : 'center',
										editor : {
											type : 'numberbox',
											options : {
												precision : 2,
												validType : 'paid_chayi'
											}
										},
										formatter : function(val, row, index) {

											if (val == null || val == "") {
												return row.paid;
											} else {
												return row.paid_chayi;
											}
										}
									},
									{
										field : 'tifu_chayi',
										title : '差异',
										width : 80,
										align : 'center',
										formatter : function(val, row, index) {

											if (row.paid_chayi == null || val == "") {
												 return Number(Number(row.paid)
														- Number(row.paid));
											} else {
												return Number(Number(row.paid_chayi)
														- Number(row.paid));
											}
										}
										},
							{field : 'delivery_fee',title : '应付接货费',width : 80,align:'center'},
  				{field : 'delivery_fee1',title : '实付接货费',width : 80,align:'center',editor:{
	                	type:'numberbox',
	                	options:{
	                		precision:2,
	                    	validType:'delivery_fee1'
	                	}
	           		},formatter:function(val,row,index){
	           		
	           		   if(val==null){
	           		 		return row.delivery_fee;
	           		   }else{
	           		   return row.delivery_fee1;
	           		   }
  					}
  				},
  				{field : 'fee_remarks1',title : '应付接货费核销备注',width : 120,align:'center',editor:{
	                	type:'text',
	                	options:{
	                    	validType:'fee_remarks1'
	                	}
           			}},				
								
								{
										field : 'send_station',
										title : '发站',
										width : 80,
										align : 'center'
									},
									{
										field : 'end_address',
										title : '到达地',
										width : 80,
										align : 'center'
									},
									{
										field : 'receipt',
										title : '收货人',
										width : 80,
										align : 'center'
									},
									{
										field : 'goods_name',
										title : '品名',
										width : 80,
										align : 'center'
									},
									{
										field : 'goods_num',
										title : '件数',
										width : 80,
										align : 'center'
									},
									{
										field : 'goods_weight',
										title : '重量',
										width : 80,
										align : 'center'
									},
									{
										field : 'goods_vol',
										title : '体积',
										width : 80,
										align : 'center'
									},			
										{
										field : 'create_time',
										title : '协议制作日期',
										width : 80,
										align : 'center'
									},	
										{field : 'fee_writeoff',title : '核销方式',width : 80,align:'center',
  					formatter:function(val,row,index){
  						if(val==0 ){
  							return "打卡";
  						}else if(val==1){
  						return "现金";
  						}else if(val==3){
  						return "未核销";
  						}
  					}	 },	
  			
  				
  			]],onBeforeEdit:function(index,row){ //可编辑之前
				editval=index;
		        row.editing = true;
		    },  
		    onAfterEdit:function(index,row){//编辑关闭后
		    
		    	$('#dg').datagrid("endEdit",editval);
					$.ajax({
           			 type: "post",
          				url : 'payablefee.do?method=updateShippingOrdersFee',
           				data :  row
           				
           				,
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
                var data=$('#dg').datagrid('getData');
           			//最后一行取消编辑
	            	if(rowIndex<data.rows.length-1){
	                //双击开启编辑行
	    				if(editval!=rowIndex){
	    					$('#dg').datagrid("endEdit", editval);
	    					$('#dg').datagrid("beginEdit", rowIndex);
		                	editval=rowIndex;
	    				}else{
	    					editval=undefined;
	    					$('#dg').datagrid("endEdit", rowIndex);
	    				}
    				}
                	
            },rowStyler:function(index,row){
            	//合计行颜色
				 if (row.shiping_order_num=='合计'){
					return 'background-color:yellow;font-weight:bold;color:blue';
				}
				if (row.shiping_order_num!='合计'&&row.fee_writeoff !=3) {
					return 'color:blue;';
				}
			},onLoadSuccess:function(data){
				//添加合计行
	            $('#dg').datagrid('appendRow', {
	                shiping_order_num: '合计',
 	                delivery_fee: compute("delivery_fee"),
 	                 trade_agency : compute("trade_agency"),
	                delivery_fee1: compute("delivery_fee1")
 	            });
 	            //合并单元格
            	 var merges2 = [{
                    field:'shiping_order_num',
                    index: data.rows.length-1,
                    colspan:7,
                    rowspan: 1
            },{
					field : 'pay_type',
					index : data.rows.length - 1,
					colspan : 5,
					rowspan : 1
					}]
                for (var i = 0; i < merges2.length; i++)
                        $('#dg').datagrid('mergeCells', {
                            index: merges2[i].index,
                            field: merges2[i].field,
                            colspan: merges2[i].colspan,
                            rowspan: merges2[i].rowspan
                 }); 
            },
  			/*  onLoadSuccess:function(){
  			 $('#dg').datagrid('appendRow', {
                Saler: '<span class="subtotal">合计</span>',
                TotalOrderCount: '<span class="subtotal">' + compute("TotalOrderCount") + '</span>',
                TotalOrderMoney: '<span class="subtotal">' + compute("TotalOrderMoney") + '</span>',
                TotalOrderScore: '<span class="subtotal">' + compute("TotalOrderScore") + '</span>',
                TotalTrailCount: '<span class="subtotal">' + compute("TotalTrailCount") + '</span>',
                Rate: '<span class="subtotal">' + ((compute("TotalOrderScore") / compute("TotalTrailCount")) * 100).toFixed(2) + '</span>'
            });
            	 compute();
            },
  				 */
  			pagination:true,//分页
		    pageSize:10,
		    pageList:[5,10,15,20],
  			toolbar : '#tb'
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
  	
		$("#carid").select2({
		    placeholder: "请输入车牌号",	//默认文本框显示信息
		    minimumInputLength: 1,	//最小输入字符长度
		    allowClear:true,
		    multiple: false,				//设置多项选择，false则只能单选
		    maximumSelectionSize: 5, //最大选择个数
			query: function (query) {
		    	$.ajax({
				   type: "POST",
				   url: "income.do?method=IncemCarid",
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
  		function modify(){
  		
  		var array=$("#dg").datagrid('getSelections');
  		var id = [];
  		var a = false;
		for ( var i = 0; i < array.length; i++) {
			id.push(array[i].shiping_order_id); //注意修改你的id列 
			if (array[i].fee_writeoff == 3) {
				a = true;
			}
		}
  			if (a == true) {
			if (id != "") {
	  			dialog = parent.jy.modalDialog({
				title : '费用核销',
				url : 'payablefee.do?method=getEditCompanyPageFee&pid=' + id,
				width : 580,
				height:	200,
				buttons : [{
					text : '<input type="button" class="btncss" value="核销"/>',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
					}
				}] 
			});
		}else{
  			$.messager.alert("中转费核销","请选择一行信息","info");
  		}
  		}else{
  			$.messager.alert("中转费核销","请选择信息，如果选择，其中有条信息已核销","info");
  		}	
  	}
  function compute(colName) {
            var rows = $('#dg').datagrid('getRows');
            var total = 0;
            for (var i = 0; i < rows.length; i++) {
                total += parseFloat(rows[i][colName]);
            }
            return total;
        }
  	function searchCar_owner() {
		$("#dg").datagrid('load', {
			send_station : $.trim($("#send_station").val()),
			end_address : $.trim($("#end_address").val()),
			send_time : $.trim($("#send_time").val()),
			car_name : $.trim($("#car_name").val()),
			send_date_fee : $.trim($("#send_date").val()),
			create_time : $.trim($("#create_time").val()),
			fee_writeoff : $.trim($("#write_off1").val()),
			receipt : $.trim($("#receipt").val()),
			goods_name : $.trim($("#goods_name").val()),
			goods_num : $.trim($("#goods_num").val()),
			pay_type : $.trim($("#pay_type").val()),
			delivery_fee : $.trim($("#send_fee").val()),
		});


	}
function del() {
		var array = $("#dg").datagrid('getSelections');
			var id = [];
			var a = false;
		for ( var i = 0; i < array.length; i++) {
			id.push(array[i].shiping_order_id); //注意修改你的id列 
			if (array[i].fee_writeoff != 3) {
				a = true;
			}
		}
	
			if (a== true) {
							$.messager.confirm('确认', '您确定要取消核销吗？', function(r) {
					if (r) {
						$.ajax({
							url : 'payablefee.do?method=delfee&pid=' + id,
							type : "POST",
							data : {
								id:id.join(",")
							},
							success : function(data) {
								if (data.flag == false) {
									parent.$.messager.alert("接货费核销", "取消核销成功",
											'info', function(r) {
												$('#dg').datagrid('reload');
											});
								}
							}
						});
					}
				});
			} else {
				$.messager.alert('取消核销', ' 请选择正确的信息', 'info');
			}

		} 
	//重置
	function reset() {
		$("#send_station").val("");
		$("#end_address").val("");
		$("#send_time").val("");
		$("#car_name").val("");
		$("#send_date").val("");
		$("#create_time").val("");
		$("#write_off1").val("");
		$("#receipt").val("");
		$("#goods_name").val("");
		$("#goods_num").val("");
		$("#pay_type").val("");
		$("#send_fee").val("");
	}
  	
 	

  

  </script>
  <body class="easyui-layout">
	<form action="shipOrder.do" id="outputform" method="post">
		<div region="north" title="检索" class="st-north" border="false"
			collapsible="false">
			<lable class="divlabel">发站:</lable>
			<input type="text" class="search-text" id="send_station"
				style="width:100px">
			<lable class="divlabel">到达地:</lable>
			<input type="text" class="search-text" id="end_address"
				style="width:100px">
				<lable class="divlabel">收货人:</lable>
			<input type="text" class="search-text" id="receipt"
				style="width:100px">
				<lable class="divlabel">物品名称:</lable>
			<input type="text" class="search-text" id="goods_name"
				style="width:100px">
			<lable class="divlabel">送货日期:</lable>
			<input id="send_time" class="Wdate" readonly="readonly"
				style="width:100px;height:22px; "
				onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
				
			<a class="easyui-linkbutton" onclick="searchCar_owner()"
				data-options="iconCls:'icon-search'">查询</a> <a id="btnMoreSearch"
				class="btn btn-sm btn-link" type="button" style="margin-top:16px;"
				href="javascript:void(0)" state="close">更多条件</a>
			<div id="searchInfoId" style="display: none">
				<lable>送货司机:</lable>
				<input type="text" class="search-text" id="car_name" style="width:100px;height:22px; ">
				<lable class="divlabel">核销日期:</lable>
				<input id="send_date" class="Wdate" readonly="readonly"
					style="width:50px;height:22px; "
					onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
				<lable class="divlabel">协议制作日期:</lable>
				<input id="create_time" class="Wdate" readonly="readonly"
					style="width:50px;height:22px; "
					onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
				<td>核销:</td>
				<td><select id='write_off1' name="write_off1"
					style="width:50px;height:22px">
						<option></option>
						<option value="0">打卡</option>
						<option value="1">现金</option>
						<option value="3">未核销</option>
				</select></td>
				
				
				<lable class="divlabel">件数:</lable>
			<input type="text" class="search-text" id="goods_num"
				style="width:100px">
				<lable class="divlabel">付费方式:</lable>
				<td><select id='pay_type' name="pay_type"
					style="width:100px;height:22px">
						<option></option>
						<option value="0">回付</option>
						<option value="1">现付</option>
						<option value="2">提付</option>
						<option value="3">货到前付</option>
				</select></td>
				<lable class="divlabel">金额:</lable>
			<input type="text" class="search-text" id="send_fee"
				style="width:100px">
			</div>
		</div>
		<div region="center">
			<table id="dg" title="汇总信息"></table>
		</div>
		<div id="tb">
			<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-edit',plain:true" onclick="modify()">核销</a>
				<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-edit',plain:true" onclick="del()">取消核销</a>
		</div>
	</form>
</body>
</html>