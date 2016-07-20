<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String change_fee1 = request.getParameter("change_fee1");
%>
<%
	String realPath1 = "http://" + request.getServerName() + ":"
			+ request.getServerPort() + "/surmax/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>司机结算</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">


<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
<script type="text/javascript" src="./js/select2/select2.js"></script>
<script type="text/javascript"
	src="./js/select2/select2_locale_zh-CN.js"></script>
<script type="text/javascript" src="./js/function.js"></script>
<!--命名按钮方法  -->
<style type="text/css">
.subtotal {
	font-weight: bold;
} /*合计单元格样式*/
</style>

</head>
<script type="text/javascript">
	var dialog;
	var grid;
	var editval;
	$(function() {
		grid = $("#dg").datagrid({
		    url : 'DriverClose.do?method=getDriverCloseRejectInfo',
			border : false,
			rownumbers : true,
			fit : true,
			singleSelect : false,
			selectOnCheck : true,
			checkOnSelect : true,
			multiSort : true,
			striped : true,
			rownumbers : true,
			rowStyler: function(index,row){
			    if (row.settlement_modes==2&&row.driver_close_stata==0){
				    return 'color:blue;';
				} else if (row.settlement_modes!=2&&row.driver_close_stata==0){
					return 'color:rgb(221, 14, 211);';
				}else if(row.driver_close_stata==3){
					return 'color:red;';
				}
			},
			columns : [ [
			    {field : 'ck',checkbox : true},
			    {field : 'driver_name', title : '司机姓名',	width : 80,align : 'center'},
				{field : 'shiping_order_num', title : '运单编号',	width : 80,align : 'center'},
				{field : 'send_type',	title : '交接方式',width : 80,align : 'center',
					formatter : function(val, row, index) {
						if (val == 0) {
							return "自提";
						} else if (val == 1) {
							return "送货";
						}
						}
					},
									
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
					}
				}, 
		/* 		{field : 'chayi_zhongzhuanfei',title : '付差异',width : 80,align : 'center',			
					formatter : function(val, row, index) {
						if (row.change_fee1 == null) {
							 return val;
						} else {
							 return parseFloat(parseFloat(row.change_fee1*1)-parseFloat(row.change_pay*1));
						}
					 }
				}, */
				
					  
			    {field : 'send_fee',title : '应付直送费', width : 80,align :'center',sortable:'true'},	//送货费
			    {field : 'payble_coolie', title : '应付装卸费', width : 80,align :'center',sortable:'true'},		
			    {field : 'pay_upstairs_fee',title : '应付上楼费', width : 80,align :'center',sortable:'true'},
			    {field : 'payble_other',title : '应付其他费',width : 80,	align : 'center', sortable:'true'},		
			    {field : 'pay_total_fee',title : '应付总和',width : 80,	align : 'center',sortable:'true'},	
			    {field : 'paid_deliver_fee',title : '实付直送费', width : 80,align :'center',sortable:'true',
			    editor : {
				    type : 'numberbox',
					options : {
						precision : 2,
						validType : 'paid_deliver_fee'
					}
				},
				},	
			    {field : 'paid_ground_fee',title : '实付装卸费', width : 80,align :'center',sortable:'true',
			    editor : {
				    type : 'numberbox',
					options : {
						precision : 2,
						validType : 'paid_ground_fee'
					}
				},
			    },	
			    {field : 'paid_upstairs_fee',title : '实付上楼费', width : 80,align :'center',sortable:'true',
			    editor : {
				    type : 'numberbox',
					options : {
						precision : 2,
						validType : 'paid_upstairs_fee'
					}
				},
			    },
			    {field : 'paid_adorn_fee',title : '实付其他费', width : 80,align :'center',sortable:'true',
			    editor : {
				    type : 'numberbox',
					options : {
						precision : 2,
						validType : 'paid_adorn_fee'
					}
				},
			    },		
			    {field : 'paid_total_fee',title : '实付总和', width : 80,align :'center',sortable:'true',
				    formatter : function(val, row, index) {
					return Number(Number(row.paid_adorn_fee)+Number(row.paid_deliver_fee)+Number(row.paid_ground_fee)+Number(row.paid_upstairs_fee)) ;
					}   
			    },
		
			    
			  	
			    
			    
			    
				{field : 'send_station',title : '发站',width : 80,align : 'center'},
				{field : 'end_address',title : '到达地',width : 80,align : 'center'},
				{field : 'receipt',title : '收货人',width : 80,align : 'center'},
				{field : 'goods_name',title : '品名',width : 80,align : 'center'},
				{field : 'goods_num',title : '件数',width : 80,align : 'center'},	
				{field : 'goods_weight',title : '重量',width : 80,align : 'center'},
	            {field : 'goods_vol',title : '体积',width : 80,align : 'center'},
				{field : 'create_time',title : '协议制作日期',width : 80,align : 'center'},
				{field : 'driver_close_stata',title : '结算状态',width : 80,align : 'center',
					formatter : function(val, row, index) {
						if (val == 0) {
							return "未审核";
						} else if (val == 1) {
							return "审核中";
						} else if (val == 2) {
							return "审核通过";
						} else if (val == 3) {
							return "审核未通过";
						}
					}
				}, 
			    {field : 'settlement_modes',title : '结算方式',width : 80,align : 'center',
					formatter : function(val, row, index) {
						if (val == 0) {
							return "现金";
						} else if (val == 1) {
							return "油卡";
						} else if (val == 3) {
							return "转账";
						} else if (val == 2) {
							return "未结算";
						} 
					}
				}, 
				{field : 'driv_sige_name',title : '开户名称',width : 80,align : 'center'},
				{field : 'driv_card',title : '银行卡号',width: 80,align : 'center'},
				{field : 'driv_bank',title : '开户行',width : 80,align : 'center'},
				{field : 'oil_card',title : '油卡号',width : 80,align : 'center'},				
				{field : 'oil_card_name',title : '姓名',width : 80,align : 'center'},
				//{field : 'driver_close_naem',title : '结算人',width : 80,align : 'center'},				
			    {field : 'driver_close_remarks',title : '结算备注', width : 80,align :'center',sortable:'true'},	
				
				
				{field : 'driver_close_time',title : '结算日期',width : 80,align : 'center'},
				{field : 'driver_close_naem',title : '结算人',width : 80,align : 'center'},
			] ],
			onBeforeEdit : function(index, row) { //可编辑之前
				editval = index;
				row.editing = true;
			},
			onAfterEdit : function(index, row) {//编辑关闭后
				$('#dg').datagrid("endEdit", editval);
				$.ajax({
					type : "post",
					url : 'DriverClose.do?method=UpdeteClose',
					data : row,
					success : function(data) {
													// Play with returned data in JSON format
					},
					error : function(msg) {
	
					}
				});
									/* $('#dg').datagrid("updateRow", {index:index,row:{gain_total:price}}); */
					row.editing = false;
			},
							//双击事件
			onDblClickRow : function(rowIndex, rowData) {
				var data = $('#dg').datagrid('getData');
								//双击开启编辑行
				if (rowIndex < data.rows.length - 1) {
					if (editval != rowIndex) {
						$('#dg').datagrid("endEdit", editval);
						$('#dg').datagrid("beginEdit", rowIndex);
						editval = rowIndex;
					} else {
						editval = undefined;
						$('#dg').datagrid("endEdit", rowIndex);
					}
				}
			},
			/* rowStyler : function(index, row) {
								//合计行颜色
				if (row.shiping_order_num == '合计') {
					return 'background-color:yellow;font-weight:bold;color:blue';
				} */
			/* 	if (row.shiping_order_num != '合计'&& row.write_off != 3) {
					return 'color:blue;';
				} 
			},*/
			/* onLoadSuccess : function(data) {
				//添加合计行
				$('#dg').datagrid('appendRow', {
					shiping_order_num : '合计',
					change_fee1 : compute("change_fee1"),
					paid_chayi : compute("paid_chayi"),
					change_other : compute("change_other"),
					change_fee : compute("change_fee"),
					change_pay : compute("change_pay"),
					chayi_zhongzhuanfei : compute("chayi_zhongzhuanfei"),
					tifu_chayi : compute("tifu_chayi")
				});
								//合并单元格
				var merges2 = [ {
					field : 'shiping_order_num',
					index : data.rows.length - 1,
					colspan : 1,
					rowspan : 1
				}, {field : 'change_remarks',index : data.rows.length - 1,colspan : 1,rowspan : 1
				} ];
				for ( var i = 0; i < merges2.length; i++)
					$('#dg').datagrid('mergeCells', {
					    index : merges2[i].index,
						field : merges2[i].field,
						colspan : merges2[i].colspan,
						rowspan : merges2[i].rowspan
					});
				}, */
	    pagination : true,//分页
		pageSize : 10,
		pageList : [ 5, 10, 15, 20 ],
		toolbar : '#tb'
		});
		var btnMoreSearch = $("#btnMoreSearch");
		btnMoreSearch.click(function() {
			if (btnMoreSearch.attr("state") == "close") {
				//主要代码 
				$('.easyui-layout').layout('panel', 'north').panel('resize', {
					height : 92
				});
				$('.easyui-layout').layout('resize');
				btnMoreSearch.text("收起条件");
				btnMoreSearch.attr("state", "open");
				$("#searchInfoId").css("display", "block");
				$("#phone").val("");
				$("#address").val("");
			} else {
				$('.easyui-layout').layout('panel', 'north').panel('resize', {
					height : 60
				});
				$('.easyui-layout').layout('resize');
				btnMoreSearch.text("更多条件");
				btnMoreSearch.attr("state", "close");
				$("#searchInfoId").css("display", "none");
			}
		});
		/*
		select框
		 */

		$("#carid").select2({
			placeholder : "请输入车牌号", //默认文本框显示信息
			minimumInputLength : 1, //最小输入字符长度
			allowClear : true,
			multiple : false, //设置多项选择，false则只能单选
			maximumSelectionSize : 5, //最大选择个数
			query : function(query) {
				$.ajax({
					type : "POST",
					url : "income.do?method=IncemCarid",
					data : {
						phones : query.term
					}, //传递你输入框中的值
					success : function(msg) {
						var msg = $.parseJSON(msg);
						var data = {
							results : []
						};
						$.each(msg, function(x, y) {
							data.results.push({
								id : y.id,
								text : y.name
							});
							;
						});
						query.callback(data);
					}
				});
			}
		});
	});
     //结算
	function modify() {

		var array = $("#dg").datagrid('getSelections');
		var id = [];
		var a = true;
		for ( var i = 0; i < array.length; i++) {
			id.push(array[i].shiping_order_id); //注意修改你的id列 
			if (array[i].settlement_modes == 3) {
				a = true;
			}
		}
		if (a == true) {
			dialog = parent.jy.modalDialog({
				title : '费用结算',
				url : 'DriverClose.do?method=getCloseRedirect&pid=' + id,
				width : 500,
				height : 300,
				buttons : [ {
					text : '<input type="button" class="btncss" value="结算"/>',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow
								.submitFormEdit(dialog, grid, parent.$);
					}
				} ]
			});
		} else {
			$.messager.alert("中转费结算", " 请选择正确的信息", "info");
		}
	}
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
	//查询
	function searchCar_owner() {
		$("#dg").datagrid('load', {

			shiping_order_num : $.trim($("#shiping_order_num").val()),//运单号
			receipt : $.trim($("#receipt").val()),//收货人
			fee_date : $.trim($("#fee_date").val()),//结算日期
			fee_datetime : $.trim($("#fee_datetime").val()),//结算日期
			create_time : $.trim($("#create_time").val()),//协议制作时间
			create_date : $.trim($("#create_date").val()),
			write_off : $.trim($("#settlement_modes").val()),//结算
			send_station : $.trim($("#send_station").val()),//发展
			goods_name : $.trim($("#goods_name").val()),//品名
			goods_num : $.trim($("#goods_num").val()),//件数
			pay_type : $.trim($("#pay_type").val()),//付费方式
			driver_name : $.trim($("#driver_name").val()),//司机姓名
			//company_name : $.trim($("#company_name").val()),
			
		});

	}

	//重置
	function reset() {
		$("#shiping_order_num").val("");
		$("#receipt").val("");
		$("#fee_date").val("");
		$("#dd").val("");
		$("#create_time").val("");
		$("#yy").val("");
		$("#write_off").val("");
		$("#send_station").val("");
		$("#goods_name").val("");
		$("#goods_num").val("");
		$("#pay_type").val("");
		$("#paid").val("");
		$("#company_name").val("");
		
	}
	document.onkeydown = function(event) {
  				e = event ? event : (window.event ? window.event : null);
  				if (e.keyCode == 13) {
  					//执行的方法 
  					searchCar_owner();
  				}
  			};	
	
		function del() {
		var array = $("#dg").datagrid('getSelections');
			var id = [];
			var a = false;
		for ( var i = 0; i < array.length; i++) {
			id.push(array[i].shiping_order_id); //注意修改你的id列 
			if (array[i].write_off != 3) {
				a = true;
			}
		}
	
			if (a== true) {
							$.messager.confirm('确认', '您确定要取消结算吗？', function(r) {
					if (r) {
						$.ajax({
							url : 'payable.do?method=editZhongzhuan&pid=' + id,
							type : "POST",
							data : {
								id:id.join(",")
							},
							success : function(data) {
								if (data.flag == false) {
									parent.$.messager.alert("其他费结算", "取消结算成功",
											'info', function(r) {
												$('#dg').datagrid('reload');
											});
								}
							}
						});
					}
				});
			} else {
				$.messager.alert('取消结算', ' 请选择正确的信息', 'info');
			}

		} 
		function putoutfile(){
		var allRows2 = $("#dg").datagrid("getColumnFields");
		var colName=[];
		var fieldName=[];
		for(i=1;i<allRows2.length;i++)
		{
			var col = $('#dg').datagrid( "getColumnOption" , allRows2[i] );
			
				colName.push(col.title);//把title列名到数组里去 
				fieldName.push(col.field); //把field列属性名到数组里去 
			
		} 
		$("#fieldName").val(fieldName.join(","));
  		 $("#headtitle").val(colName.join(","));
  		var outputform=$("#outputform");
  		outputform.submit(); 
		}
	//勾选导出
  	function putgouxuan(){
  		var checkarray=[];
  		var checkip='';
  		var colName=[];
		var fieldName=[];
  		var i=0;
	 	var array = $('#dg').datagrid("getSelections");
  	
  	    var allRows2 = $("#dg").datagrid("getColumnFields");
		
		for(i=1;i<allRows2.length;i++)
		{
			var col = $('#dg').datagrid( "getColumnOption" , allRows2[i] );
			
				colName.push(col.title);//把title列名到数组里去 
				fieldName.push(col.field); //把field列属性名到数组里去 			
		} 	 
  		if(array != ""){
  		for(var i=0;i<array.length;i++){
  			checkarray.push(array[i].shiping_order_id);
  			
  			}
  		 $("#fieldName1").val(fieldName.join(","));
  		 $("#headtitle1").val(colName.join(","));
  		 $("#checkarray").val(checkarray.join(","));
  		var daochufrom=$("#daochufrom");
  		daochufrom.submit();		
  		}else{
  			$.messager.alert("应付中转费","请选择要导出的信息","info");
  		}
  	}
  	/*
  	结算提审
  	*/
  	function settlementSh(){
  		var ids=[];
  		var row=$("#dg").datagrid('getSelections');
  		var ds = false;
  			if(row.length>0){
	  			for(var i=0;i<row.length;i++){
	  				ids.push(row[i].shiping_order_id);	
	  				if (row[i].driver_close_stata==0) {
					 	ds = true;
					}  	  				  		
		  		} 
		  	}		
		  if(ds == true){
	  			dialog = parent.jy.modalDialog({
				title : '结算提审',
				url : 'DriverClose.do?method=getArraignedClose&pid=' + ids.join(","),
				width :450,
				height:300,
				buttons : [{
					text : '<input type="button" class="btncss" value="确定"/>',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
					}
				}] 
			});
  		}else{
  				$.messager.alert("结算提审","请选则正确信息！","info");
  		}		
  	}
  	
</script>
    <body class="easyui-layout">
	<form action="payable.do" id="outputform" method="post">
		<div region="north" title="检索" class="st-north" border="false" collapsible="false">			
          <lable class="divlabel">运单编号:</lable>
			<input type="text" class="search-text" id="shiping_order_num"
				style="width:70px">
			<lable class="divlabel">收货人:</lable>
			<input type="text" class="search-text" id="receipt"
				style="width:70px">
			<lable class="divlabel">结算日期:</lable>
			<input id="fee_date" class="Wdate" style="width:50px;height:22px; "
				onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd '})" />
				-
			<input id="fee_datetime"  class="Wdate"  readonly="readonly" style="width:50px;height:22px;" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd '})" />
			<lable class="divlabel">协议制作日期:</lable>
				<input id="create_time" class="Wdate"
					style="width:50px;height:22px; "
					onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd '})" />
					-
			<input id="create_date"  class="Wdate"  readonly="readonly" style="width:50px;height:22px;" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd '})" />
				<td>结算:</td>
				<td><select id='settlement_modes' name="settlement_modes"
					style="width:50px;height:22px">
						<option></option>
						<option value="0">现金</option>
						<option value="1">油卡</option>
						<option value="2">转账</option>
				</select></td>
			<a class="easyui-linkbutton" onclick="searchCar_owner()"
				data-options="iconCls:'icon-search'">查询</a> <a id="btnMoreSearch"
				class="btn btn-sm btn-link" type="button" style="margin-top:16px;"
				href="javascript:void(0)" state="close">更多条件</a>
			<div id="searchInfoId" style="display: none">

				
				<lable class="divlabel">发站:</lable>
			<input type="text" class="search-text" id="send_station"
				style="width:90px">
				<lable class="divlabel">物品名称:</lable>
			<input type="text" class="search-text" id="goods_name"
				style="width:90px">
				
				<lable class="divlabel">件数:</lable>
			<input type="text" class="search-text" id="goods_num"
				style="width:90px">
				<td>付费方式:</td>
				<td><select id='pay_type' name="pay_type"
					style="width:50px;height:22px">
						<option></option>
						<option value="0">回付</option>
						<option value="1">提付</option>
						<option value="2">现付</option>
						<option value="3">货到前付</option>
				</select></td>
			<lable class="divlabel">司机姓名:</lable>
			<input type="text" class="search-text" id="driver_name"
				style="width:90px"> 
		<!-- 		<lable class="divlabel">中转公司:</lable>
			<input type="text" class="search-text" id="company_name"
				style="width:90px"> -->
			</div>
		</div>
		<div region="center">
			<table id="dg" title="汇总信息"></table>
		</div>
		<div id="tb">
			<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-edit',plain:true" onclick="modify()">结算</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" id="getUpdateCar_owner" data-options="iconCls:'icon-edit',plain:true"onclick="settlementSh()">提审</a>
			<!-- <a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-edit',plain:true" onclick="del()">取消结算</a> -->
           <!--  <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-output',plain:true" onclick="putoutfile()">导出</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-output',plain:true" onclick="putgouxuan()">勾选导出</a> -->
		<div title='未结算未审核' style='height: 16px;background:blue;-moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;    float: right;
		    	margin: 5 1%;color: white;
		    padding-left: 10px;
		    padding-right: 10px; '><span>未结算未审核</span></div>
		<div title='结算未审核' style='height: 16px;background:rgb(221, 14, 211);-moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;    float: right;
		    	margin: 5 0%;color: white;
		    padding-left: 10px;
		    padding-right: 10px; '><span>结算未审核</span></div>
		    <div title='审核未通过' style='height: 16px;background:red;-moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;    float: right;
		    	margin: 5 0%;color: white;
		    padding-left: 10px;
		    padding-right: 10px; '><span>审核未通过</span></div>
		</div>	
		<input type="hidden" name="method" value="getPayableOutpa">
		<input type="hidden" id="fieldName" name="fieldName">
		<input type="hidden" id="headtitle" name="headtitle">
			</form>
	<form action="payable.do" id="daochufrom" method="post">
		<input type="hidden" name="method" value="daochufrom">
		<input type="hidden" id="fieldName1" name="fieldName">
		<input type="hidden" id="headtitle1" name="headtitle">
		<input type="hidden" id="checkarray" name="checkarray">
</form>
</body>
</html>