<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<title>添加订单信息</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
<jsp:include page="../../../ValidationEngine/Validation.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="./css/main.css">
	<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
	<script type="text/javascript" src="./js/select2/select2.js"></script>
	<script type="text/javascript" src="./js/select2/select2_locale_zh-CN.js"></script>
	
</head>
<script type="text/javascript">
	$(function(){
		 $("#Regform").validationEngine('attach', { 
				 promptPosition:'topRight:-15,0'
				 });
				 	grid=$("#dg").datagrid({
  			url : 'incomedp.do?method=getIncomeMake',
  			border : false,
  			rownumbers : true,
  			//fit : true,
  			/* sortName:'transport_pay,check_time,shipping_order',
  			sortOrder:'desc', */
  			//height:200,
  			singleSelect : true,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			multiSort:true,
  		/* 	remoteSort:true, */
  			onSelect:function(index,data){
				pid=data.shiping_order_id;
			 $.ajax({
			url : 'incomedp.do?method=getUpdateShipOrder',
			data : {
				id : pid
				},
			success : function(data) {
			 if(data.plate_number==null){
				data.plate_number='';
				}	
				//$("#sect").select2('data',{id:data.travel_card_id,text:data.plate_number});
				//$("#sect").prev("div").find("span.textbox combo").text(data.gender);
				$("#carid").prev("div").find("span.select2-chosen").text(data.plate_number); 
				$('#Regform').form('load', data);
			}
		});
	},
  			columns : [[
  				{field : 'ck',checkbox : true},
  				{field : 'shiping_order_num',title : '订单号',width : 80,align:'center'},
  			 	{field : 'start_address',title : '起运地',width : 60,align:'center'},
  				{field : 'end_address',title : '到达地',width : 60,align:'center'},
  				{field : 'checkp',title : '托运方',width : 60,align:'center'},
  				{field : 'receipt',title : '收货方',width : 60,align:'center'},
  				{field : 'receipt_tel',title : '收货方电话',width : 80,align:'center'},
  				/*  {field : 'receipt_address',title : '收货地址',width : 140,align:'center'}, */ 
  				{field : 'goods_name',title : '货物',width : 60,align:'center'},
  				{field : 'transport_pay',title : '运费总额',width : 60,align:'center'},
  				/*{field : 'check_type',title : '发货方式',width : 90,align:'center',
  				formatter:function(val,row,index){
  						if(val==0){
  							return "发货人门点";
  						}else if(val==1){
  						return "起运货运站";
  						}
  					}	
  				},
  				 {field : 'send_type',title : '送货方式',width : 60,align:'center',
  				formatter:function(val,row,index){
  						if(val==0){
  							return "自提";
  						}else if(val==1){
  						return "送货";
  						}
  					}
  				}, */
  			/* 	{field : 'shipping_order_state',title : '状态',width : 50,align:'center',
  					formatter:function(val,row,index){
  						if(val==0){
  							return "受理";
  						}else if(val==1){
  							return "在途";
  						}else if(val==2){
  						return "到达";
  						}else if(val==3){
  						return "配送";
  						}else if(val==4){
  						return "签收";
  						}
  					}	
  				}, */
  				/* {field : 'order_state',title : '订单状态',width : 90,align:'center',hidden:'true'}, 
  				{field : 'checktype',title : '发货方式',width : 90,align:'center',hidden:'true'},
  				{field : 'sendtype',title : '提货方式',width : 90,align:'center',hidden:'true'},
  				{field : 'shipping_order',title : '制单人',width : 90,align:'center',sortable:'true'},
  				{field : 'check_time',title : '创建时间',width : 100,align:'center',sortable:'true'},
  				{field : 'updateDate',title : '更新日期',width : 80,align:'center'}, */
  			]],
  			pagination:true,//分页
		    pageSize:10,
		    pageList:[5,10,15,20],
  			toolbar : '#tb'
  		}); 
	$("#carid").select2({
		    placeholder: "请输入车牌号",	//默认文本框显示信息
		    minimumInputLength: 1,	//最小输入字符长度
		    allowClear:true,
		    multiple: false,				//设置多项选择，false则只能单选
		    maximumSelectionSize: 5, //最大选择个数
			query: function (query) {
		    	$.ajax({
				   type: "POST",
				   url: "incomedp.do?method=getPlateNumber",
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
		}).on("select2-selecting", function(f) {
			$("#car").val(f.object.id);
			$("#carnum").val(f.object.text);				
		});	 		  	
  	}); 			
  	function searchOrder(){
  			$("#dg").datagrid('load',{
  				id:$.trim($("#num").val()),
  				
	 	 		/* end_date :endDate,
	 	 		name:$.trim($("#ddId").val()),//订单编号
	 	 		phone_number:$.trim($("#phone").val()),//收货人
  				institution:$.trim($("#cc3").combotree("getValue")),
  				type:$.trim($("#address").val()), */
	 	});	  	
  	}
  	var pid='';
  	function xiangxiseach(){
  		var row=$("#dg").datagrid('getSelections');
  			if(row.length==1){
	  			for(var i=0;i<row.length;i++){
		  			var id=row[i].shiping_order_id;
		  			pid=id;
		  			}
		  $.ajax({
			url : 'incomedp.do?method=getUpdateShipOrder',
			data : {
				id : id  
			},
			success : function(data) {
			 if(data.plate_number==null){
				data.plate_number='';
				}	
				//$("#sect").select2('data',{id:data.travel_card_id,text:data.plate_number});
				//$("#sect").prev("div").find("span.textbox combo").text(data.gender);
				$("#carid").prev("div").find("span.select2-chosen").text(data.plate_number); 
				$('#Regform').form('load', data);
			}
		});
  		}else{
  			alert("请选择一行信息");
  		}	
  	}
	  	var submitForm = function($dialog, $grid, $pjq, $mainMenu) {	
 		
		if($("#Regform").validationEngine('validate')){		
	  			//可提交
				$pjq.messager.confirm('新增单票','确定要新增吗?',function(r){   
	    		if (r){    
					$.ajax({
					type: "POST",
		  			url:'incomedp.do?method=saveIncome&id='+pid,
		  			data:$('#Regform').serialize(),
		  			
		  			success:function(msg){
		  				if(msg.flag){
		  					$pjq.messager.alert('新增单票','单票添加成功','info'); 
		  						$("#dg").datagrid('reload');					
 								$('#Regform').form('reset');
  									$("#carid").select2("val",'');
		  						
									   $grid.datagrid('reload');
		  				};
		  			}
				});
			}
		});
		 }else{
			    $pjq.messager.alert('新增单票', '必填信息不可为空', 'info');
			  }
				
		
	};
	var pid='';
  	function xiangxiseach(){
  		var row=$("#dg").datagrid('getSelections');
  			if(row.length==1){
	  			for(var i=0;i<row.length;i++){
		  			var id=row[i].shiping_order_id;
		  			pid=id;
		  			}
		  $.ajax({
			url : 'incomedp.do?method=getUpdateShipOrder',
			data : {
				id : id
			},
			success : function(data) {
			 if(data.plate_number==null){
				data.plate_number='';
				}	
				//$("#sect").select2('data',{id:data.travel_card_id,text:data.plate_number});
				//$("#sect").prev("div").find("span.textbox combo").text(data.gender);
				$("#carid").prev("div").find("span.select2-chosen").text(data.plate_number); 
				$('#Regform').form('load', data);
			}
		});
  		}else{
  			alert("请选择一行信息");
  		}	
  	}
	
	
	
</script>
<body class="easyui-layout">
	<div region="west" border="true" split="true" width="400px">
    		<div style="padding:10px;">
    		<input type="hidden" name="tatal_id">
			<input type="hidden" name="shiping_order_id">
    		<label>订单号：</label><input class="search-text" id="num" />
    		 <a class="easyui-linkbutton" onclick="searchOrder()" data-options="iconCls:'icon-search'" >查询</a>	
    		</div>
    		
    		<table id="dg" height="340px"title="单票信息"></table>
    	<!-- 	<div id="tb">
    		<input type="hidden" name="tatal_id">
			<input type="hidden" name="shiping_order_id">
    		 <a class="easyui-linkbutton" onclick="xiangxiseach()" data-options="iconCls:'icon-search'" >详细查询</a>	
    		</div>	 -->
		</div>
    <div region="center" >
			<form action="" method="post" id="Regform">
			<input type="hidden" name="tatal_id">
			<input type="hidden" name="shiping_order_id">
				<fieldset>
					<table class="tableclass">
						
						<tr>
							<th colspan="4">基本信息</th>
						</tr>
						<tr>
							<td><font color="red" style="margin-right:10px">*</font>订单号:</td>
							<td class="td2"><input type="text" readonly="true"
								class="validate[required]" id="num" name="shiping_order_num" >
							</td>
							<td><font color="red" style="margin-right:10px">*</font>到站:</td>
							<td class="td2"><input type="text"
								class="validate[required]" id="" name="end_address">
							</td>
						</tr>
						<tr>
							<td><font color="red" style="margin-right:10px">*</font>收货人:</td>
							<td class="td2"><input type="text"
								class="validate[required]" id="" name="receipt">
							</td>

							<td><font color="red" style="margin-right:10px">*</font>品名:</td>
							<td class="td2"><input type="text"
								class="validate[required]" id="" name="goods_name">
							</td>
							</td>
						</tr>
						<tr>
							<td><font color="red" style="margin-right:10px">*</font>发货地址/单位：</td>
							<td colspan="3" class="td2"><textarea cols="45" rows="2"
									class="validate[required]" name="start_address"></textarea></td>
						</tr>
						<tr>
						</tr>

						<tr>
							<td><font color="red" style="margin-right:10px">*</font>总件数：</td>
							<td class="td2"><input type="text"
								class="validate[custom[integer],required,min[0],max[99999]]"
								placeholder="0" value="0" name="goods_num" />
							</td>
							<td><font color="red" style="margin-right:10px">*</font>总重量(千克)：</td>
							<td class="td2"><input type="text"
								class="validate[required,custom[number],min[0],max[99999]]"
								placeholder="0.0000" value="0.0000" name="goods_weight" />
							</td>
				
					</td>
						</tr>

						<tr>
							<td><font color="red" style="margin-right:10px">*</font>总体积(立方米)：</td>
							<td colspan="3" class="td2"><input type="text"
								class="validate[required,custom[number],min[0],max[99999]]" value="0.0000"
								placeholder="0.0000" name="goods_vol" />
							</td>
		
					</td>
						</tr>
						<tr>
					<td >车牌号:</td>
					<td   class="td2"><input class="search-text"  id="carid" type="hidden" >
					<input class="search-text" type="hidden" id="car"  name="car_id" >
					<input type="hidden" class="validate[required] search-text" id="carnum"
						name="car_number" style="width:150px"></td>
							</td>
							<td>交接方式：</td>
							<td class="td2"><select id='send' class="combobox"
								name="send_type" style="width:150px;height:22px"
								data-options="panelHeight : 'auto',editable:false">
									<option id="" value="0">自提</option>
									<option id="" value="1">送货</option>
							</select></td>
							
						</tr>
						<tr>
							<td ><font color="red" style="margin-right:10px">*</font>收款日期:</td>
					<td  class="td2"><input  class="Wdate validate[required]" onfocus="WdatePicker({isShowWeek:true})" id=""
						name="income_time" />
						</tr>
					</td>
						<tr>
							<th colspan="4">计费标准</th>
						</tr>
						<tr>
			
							<td>代收运费：</td>
							<td class="td2"><input id="trade_total" type="text"
								class="validate[custom[number],min[0],max[99999],custom[dd]]"placeholder="0.00"
								value="0.00" name="trade_total" />
							</td>
						
							<td ><font color="red" style="margin-right:10px">*</font>落地费：</td>
					<td  class="td2"><input type="text"  class="validate[required,custom[number],max[99999.99],min[0.00],custom[dd]] search-text" placeholder="0.00"  value="0.00" id=""
						name="land_total"></td>
						</tr>
						<tr>
							<td>实收运费：</td>
							<td class="td2"><input id="trade_real" type="text"
								class="validate[custom[number],min[0]max[99999],custom[dd]]" placeholder="0.00"
								value="0.00" name="trade_real" />
							</td>
							<td>中转费：</td>
							<td class="td2"><input id="send_pay" type="text"
								class="validate[custom[number],min[0]max[99999],custom[dd]]" placeholder="0.00"
								value="0.00" name="change_total" />
							</td>
						</tr>
						<tr>
						<td ><font color="red" style="margin-right:10px">*</font>送货费：</td>
					<td  class="td2"><input type="text"  class="validate[required,custom[number],max[99999.99],min[0.00],custom[dd]] search-text" placeholder="0.00"  value="0.00" id=""
						name="sends_fee"></td>
							<td><font color="red" style="margin-right:10px">*</font>付费方式：</td>
							<td class="td2"><select id='type' class="combobox"
								name="pay_type" style="width:150px;height:22px"
								data-options="panelHeight : 'auto',editable:false">
								
							<option id="" value="1">回付</option>
							<option id="" value="2">月结</option>
							<option id="" value="3">等通知</option>
							<option id="" value="4">打卡</option>
									
							</select>
							</td>
						</tr>
						<tr>
							<td>送货费小车：</td>
							<td class="td2"><input id="send_car" type="text"
								class="validate[custom[number],min[0],max[99999],custom[dd]]" placeholder="0.00"
								value="0.00" name="send_car" />
							</td>
							<td>中转单位：</td>
							<td class="td2"><input type="text" editable=""
								name="change_address" /></td>
						</tr>
						<td>中转费(公司)：</td>
							<td class="td2"><input id="send_pay" type="text"
								class="validate[custom[number],min[0],max[99999],custom[dd]]" placeholder="0.00"
								value="0.00" name="changes_pay" />
							</td>
							<td>装卸费：</td>
							<td class="td2"><input id="adorns_fee" type="text"
								class="validate[custom[number],min[0],max[99999],custom[dd]]" placeholder="0.00"
								value="0.00" name="adorns_fee" />
							</td>
						<tr>
							
						</tr>
						<tr>
							<td>备注:</td>
							<td colspan="3" class="td2"><textarea
									class="easyui-textarea" cols="45" rows="2" name="remarkes"></textarea>
							</td>
						</tr>
					</table>
				</fieldset>
				<input type="hidden" name="isincome" value="0" style="width:150px">
			</form>
	</div>
	
	
</body>
</html>
