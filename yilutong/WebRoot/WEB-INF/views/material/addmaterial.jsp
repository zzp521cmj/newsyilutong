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

<title>添加信息</title>
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
  			url : 'material.do?method=getIncomeMake',
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
				$pjq.messager.confirm('物料新增','确定要新增吗?',function(r){   
	    		if (r){    
					$.ajax({
					type: "POST",
		  			url:'material.do?method=addMaterial',
		  			data:$('#Regform').serialize(),
		  			success:function(msg){
		  				if(msg.flag){
		  					$pjq.messager.alert('新增物料','物料添加成功','info'); 
									  $grid.datagrid('reload');
									   $dialog.dialog('close');
		  				};
		  			}
				});
			}
		});
		 }else{
			    $pjq.messager.alert('新增物料', '必填信息不可为空', 'info');
			  }
	};
</script>
<body class="easyui-layout">
    		
    		<table id="dg" height="340px"title="中转公司信息"></table>
    <div region="center" >
			<form action="" method="post" id="Regform">
				<fieldset>
					<table class="tableclass">
						<tr>
							<th colspan="4">基本信息</th>
						</tr>
						<tr>
							<input type="hidden" name="id">
							<td><font color="red" style="margin-right:10px">*</font>物料编号:</td>
							<td class="td2"><input type="text" 
								class="validate[required]" id="num" name="material_id" >
							</td>
							<td><font color="red" style="margin-right:10px">*</font>物料名称:</td>
							<td class="td2"><input type="text" 
								class="validate[required]" id="num" name="material_name" >
							</td>
							</tr>
							<tr>
							<td><font color="red" style="margin-right:10px">*</font>规格:</td>
							<td class="td2"><input type="text"
								class="validate[required]" id="" name="material_size">
							</td>
							<td><font color="red" style="margin-right:10px">*</font>类型:</td>
							<td class="td2"><input type="text"
							 name="material_type">
							</td>
						</tr>
						<tr>
							<td><font color="red" style="margin-right:10px">*</font>整箱体积:</td>
							<td class="td2"><input type="text"
							value="0.00"		class="validate[custom[number],min[0]max[99999] id="" name="material_volume">
							</td>
							<td><font color="red" style="margin-right:10px">*</font>整箱重量:</td>
							<td class="td2"><input type="text"
						value="0.00"			class="validate[custom[number],min[0]max[99999] id="" name="material_weight">
							</td>
							</td>
						</tr>
						<tr>
							<td><font color="red" style="margin-right:10px">*</font>散支体积:</td>
							<td class="td2"><input type="text"
						value="0.00"		class="validate[custom[number],min[0]max[99999]
							 name="material_volume1">
							</td>
								<td><font color="red" style="margin-right:10px">*</font>散支重量:</td>
							<td class="td2"><input type="text"
						value="0.00"		class="validate[custom[number],min[0]max[99999]
								 name="material_weight1">
							</td>
						</tr>
						
					</td>
					</table>
				</fieldset>
			</form>
	</div>
	
	
</body>
</html>
