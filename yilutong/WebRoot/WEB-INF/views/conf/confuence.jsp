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
<script type="text/javascript"
	src="./js/select2/select2_locale_zh-CN.js"></script>
<style type="text/css">
li {
	float: left;
}
</style>
</head>
<script type="text/javascript">
var grid;
var grid2;
	$(function() {
	
		$("#Regform").validationEngine('attach', {
			promptPosition : 'topRight:-15,0'
		});
		grid = $("#dg").datagrid({
			url : 'conf.do?method=getConfluence',
			border : false,
			fit : false,
			height : 450,
			rownumbers : true,
			singleSelect : true,
			selectOnCheck : true,
			checkOnSelect : true,
			multiSort : true,
			/* onSelect : function(index, data) {
			direction = data.direction,
			
				$("#user").datagrid('load', {
					laiyuan : data.direction,
				
				});

			}, */
			columns : [ [ {
				field : 'ck',
				checkbox : true
			},  
				{
				field : 'moneys1',
				title : '本期发生',
				width : 60,
				align : 'center',
				 
				formatter : function(val, row, index) {
				
				return val +  "<a class='ll_button' onclick='browseRoleAuthority("+'"'+row.direction+'"'+")' href='javascript:void(0);'>浏览</a>";				
				}
			}, {
				field : 'fee_date',
				title : '时间',
				width : 60,
				align : 'center'
			}, {
				field : 'direction',
				title : '方向',
				width : 60,
				align : 'center'
			}, {
				field : 'hexiaomoneys',
				title : '核销产生',
				width : 80,
				align : 'center',
				 
				formatter : function(val, row, index) {
				return  val + "<a class='ll_button' onclick='sourceMPV("+'"'+row.direction+'"'+")' href='javascript:void(0);'>核销</a>";				
				}
			}, 
			
			{
				field : 'shoudongmoneys',
				title : '手动入账',
				width : 60,
				align : 'center',
				 
				formatter : function(val, row, index) {
				return val +  "<a class='ll_button' onclick='shoudong("+'"'+row.direction+'"'+")' href='javascript:void(0);'>手动入账</a>";				
				}
			}, 
			
			
			
			
			
			{
				field : 'xianjin',
				title : '现金',
				width : 60,
				align : 'center',
				 
				formatter : function(val, row, index) {
				return val +  "<a class='ll_button' onclick='moneyxianjin("+'"'+row.direction+'"'+")' href='javascript:void(0);'>浏览</a>";				
				}
			}, 
			{
				field : 'daka',
				title : '打卡',
				width : 60,
				align : 'center',
				 
				formatter : function(val, row, index) {
				return val +  "<a class='ll_button' onclick='moneydaka("+'"'+row.direction+'"'+")' href='javascript:void(0);'>浏览</a>";				
				}
			}, 
			
			] ],
			pagination : true,//分页
			pageSize : 10,
			pageList : [ 5, 10, 15, 20 ],
			toolbar : '#vb'
		});
         
			grid2 = $("#user").datagrid({
			url : 'conf.do?method=getMingxi',
			border : false,
			fit : false,
			height : 500,
			rownumbers : true,
			singleSelect : true,
			selectOnCheck : true,
			checkOnSelect : true,
			multiSort : true,

			columns : [ [ /* {
				field : 'ck',
				checkbox : true
			}, */
			{
				field : 'shiping_order_num',
				title : '运单号(项目)',
				width : 80,
				align : 'center',
				
			},
			{
				field : 'money',
				title : '金额',
				width : 60,
				align : 'center'
			},
			 {
				field : 'subject',
				title : '核销科目',
				width : 80,
				align : 'center'
			},
			{
			    field : 'com_car_name',
			    title : '收款人',
			    width : '80',
			    align : 'center',
				/* formatter : function(val, row, index) {
					if (row.subject =="应付中转费核销") {
						return row.car_name;
					} 
				} */
			},
			{
			    field : 'people_song',
			    title : '核销人',
			    width : '80',
			    align : 'center'
			
			},
	/* 		
			{
				field : 'consignee',
				title : '收货人',
				width : 60,
				align : 'center'
			}, */
			 {
				field : 'remarks',
				title : '核销备注',
				width : 60,
				align : 'center'
			}, 
			 {
				field : 'happen_date',
				title : '核销日期',
				width : 100,
				align : 'center'
			},
			 {
				field : 'subject_three',
				title : '付款方式',
				width : 60,
				align : 'center',
				formatter : function(val, row, index) {
					if (val == 0) {
						return "打卡";
					} else if (val == 1) {
						return "现金";
					} else if (val == 3) {
						return "未核销";
					}
				}
			},
			/* {
				field : 'laiyuan',
				title : '来源',
				width : 60,
				align : 'center'
			}, {
				field : 'subject_two',
				title : '二级科目',
				width : 60,
				align : 'center'
			},  {
				field : 'customer_name',
				title : '客户名',
				width : 60,
				align : 'center'
			},  */
			] ],
			pagination : true,//分页
			pageSize : 10,
			pageList : [ 5, 10, 15, 20 ],
			toolbar : '#tb'
		});
		$("#carid").select2({
			placeholder : "请输入车牌号", //默认文本框显示信息
			minimumInputLength : 1, //最小输入字符长度
			allowClear : true,
			multiple : false, //设置多项选择，false则只能单选
			maximumSelectionSize : 5, //最大选择个数
			query : function(query) {
				$.ajax({
					type : "POST",
					url : "incomedp.do?method=getPlateNumber",
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
		}).on("select2-selecting", function(f) {
			$("#car").val(f.object.id);
			$("#carnum").val(f.object.text);
		});
	});
		function deleteEver(){
  		var checkarray=[];
  		var che=[];
	 	var array = $('#dg').datagrid('getSelections');
  		for(var i=0;i<array.length;i++){
  			checkarray.push(array[i].conf_id);
  			che.push(array[i].conf_id);
  			}
  		if(array != ""){
  			$.messager.confirm('确认','您确定要删除选中的记录吗？',function(r){ 
    			if (r){ 
    				$.ajax({
						url: "conf.do?method=deleteCompany",
						type: "POST",
						data:{	
								del:checkarray.join(","),
								che:che.join(",")
						},
			  				success:function(data){
			  					if (data.flag) {
									parent.$.messager.alert("总汇表删除","总汇表删除成功",'info',
										function(r) {
											$('#dg').datagrid('reload');
 										});
  								} 
  						}
					});
				}  			
  			});
  		}else{
  			$.messager.alert('总汇表信息', '请选择要删除的信息', 'info');
  		}
  	}
	function searchOrder() {
		$("#dg").datagrid('load', {
			direction:$.trim($("#direction").val()),
			fee_date:$.trim($("#fee_date").val()),
			dd:$.trim($("#dd").val()),
		
		});
	}
	
	
		function browseRoleAuthority(direction) {
		
		/* var array = $("#dg").datagrid('getSelections');
		var id = [];
		if(array.length==1){
		for ( var i = 0; i < array.length; i++) { //注意修改你的id列 
				direction = array[i].direction;
				} */
				if(direction == "支出"){
				direction = "1";
				}else if (direction == "收入"){
				direction="2";
				}
				
			$("#user").datagrid({
			url : 'conf.do?method=selectConf&direction='+direction});	
			}
		

	function sourceMPV(source) {
		
			if(source == "支出"){
				source = "1";
				}else if (source == "收入"){
				source="2";
				}
			$("#user").datagrid({
			url : 'conf.do?method=selectSour&source='+source});	
			}
		
	function moneyxianjin(subject_three) {
		
				if(subject_three == "支出"){
				subject_three = "1";
				}else if (subject_three == "收入"){
				subject_three="2";
				}
			$("#user").datagrid({
			url : 'conf.do?method=moneyxianjin&subject_three='+subject_three});	
			}
		
		
		
		function moneydaka(subject_three) {
				if(subject_three == "支出"){
				subject_three = "1";
				}else if (subject_three == "收入"){
				subject_three="2";
				}
			$("#user").datagrid({
			url : 'conf.do?method=moneydaka&subject_three='+subject_three});	
			}
		
		
		
		
		function shoudong(subject_three) {
	
				if(subject_three == "支出"){
				subject_three = "1";
				}else if (subject_three == "收入"){
				subject_three="2";
				}
			$("#user").datagrid({
			url : 'conf.do?method=shoudong&subject_three='+subject_three});	
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
	<div region="west" border="true" split="true" width="500px">
		<div style="padding:10px;">
			<input type="hidden" name="mingxi_id"> 
			<input type="hidden"name="id"> 
	<label>方向：</label>
	<input class="search-text" id="direction" style="width:100px"/>
	 <lable>发车日期:</lable>
			<input  id="fee_date"  class="Wdate"  readonly="readonly" style="width:50px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd '})" />
			-
			<input id="dd"  class="Wdate"  readonly="readonly" style="width:50px;height:22px;" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd '})" />
			<a class="easyui-linkbutton" onclick="searchOrder()" data-options="iconCls:'icon-search'">查询</a>
		</div>

		<table id="dg" height="340px" title="单票信息">
		</table>
		<div id="vb">
		     <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true"onclick="deleteEver()">删除</a>
		</div>	
    		
	</div>
	<div region="center">
		<table id="user">
		</table>


	</div>


</body>
</html>
