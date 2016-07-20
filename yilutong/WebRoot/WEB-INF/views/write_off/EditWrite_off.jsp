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
    <title>费用核销</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	
	<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
	<jsp:include page="../../../ValidationEngine/Validation.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="./css/main.css">
	<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
	<script type="text/javascript" src="./js/select2/select2.js"></script>
	<script type="text/javascript" src="./js/select2/select2_locale_zh-CN.js"></script>
	
  
  </head>
  <%String flg = (String) request.getAttribute("flg"); %>
  <script type="text/javascript">
	  	var dialog;
 		var grid;
  		$(function(){
  			$("#Regform").validationEngine('attach', { 
				 promptPosition:'topRight:-15,0'
				 });
		var pid='<%=flg%>';
		$.ajax({
			url : 'write_off.do?method=getUpdateShippingOrder',
			data : {
				id : pid
			},
			success : function(data) {
				$('#Regform').form('load', data);
				
			}
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
  var submitFormEdit = function($dialog, $grid, $pjq, $mainMenu) {
		if($("#Regform").validationEngine('validate')){
	  			//可提交
		$pjq.messager.confirm('费用核销', '确定要核销吗?', function(r) {
			if (r) {
				$.ajax({
					type : "POST",
					url : 'write_off.do?method=updateShippingOrder',
					data : $('#Regform').serialize(),
					success : function(msg) {
					
						if (msg.flag) {
							$pjq.messager.alert('费用核销', '费用核销成功', 'info');
							$dialog.dialog('close');
							$grid.datagrid('reload');
						};
					}
				});   
			} 
		});
		} else{
				
			    $pjq.messager.alert('费用核销', '必填信息不可为空', 'info');
			  }
	};
	function add() {
		alert("ss");
	};
  </script>
  <body class="easyui-layout">
    <form action="" method="post" id="Regform">
     <div region="west" border="true" split="true">
 	<table class="tableclass">
			
						<th colspan="4">费用核销</th>
				</tr>
				<tr>
					<td>应付中转费：</td>
							<td class="td2"><input id="change_pay" type="text"
								class="validate[custom[number],min[0],max[99999],custom[dd]]" placeholder="0.00"
								value="0.00" name="change_pay" />
							</td>
					<td>核销:</td>
					<td class="td2"><select id='sectaa' class="easyui-combobox" name="write_a"  onkeyup="add()" style="width:150px;height:22px"
						 data-options="panelHeight : 'auto',editable:false">
							<option  value="0">未核销</option>
							<option  value="1">已核销</option>
					</select></td> 
					</td>
				</tr>
				<tr>			
							<td>卸车费：</td>
							<td class="td2"><input id="unloading_fee" type="text"
								class="validate[custom[number],min[0],max[99999],custom[dd]]" placeholder="0.00"
								value="0.00" name="unloading_fee" />
							</td>
							<td>核销:</td>
					<td class="td2"><select id='sectaa' class="easyui-combobox" name="write_b" style="width:150px;height:22px"
						 data-options="panelHeight : 'auto',editable:false">
							<option  value="0">未核销</option>
							<option  value="1">已核销</option>
					</select></td> 
					</td>
				</tr>
				<tr>
				
					<td>装车费：</td>
							<td class="td2"><input id="loading_fee" type="text"
								class="validate[custom[number],min[0],max[99999],custom[dd]]" placeholder="0.00"
								value="0.00" name="loading_fee" />
							</td>
							<td>核销:</td>
					<td class="td2"><select id='sectaa' class="easyui-combobox" name="write_c" style="width:150px;height:22px"
						 data-options="panelHeight : 'auto',editable:false">
							<option  value="0">未核销</option>
							<option  value="1">已核销</option>
					</select></td> 
					</td>
					</tr>
					<tr>		
							<td>运费差异：</td>
							<td class="td2"><input id="trans_price" type="text"
								class="validate[custom[number],min[0],max[99999],custom[dd]]" placeholder="0.00"
								value="0.00" name="trans_price" />
							</td>
							<td>核销:</td>
					<td class="td2"><select id='sectaa' class="easyui-combobox" name="write_d" style="width:150px;height:22px"
						 data-options="panelHeight : 'auto',editable:false">
							<option  value="0">未核销</option>
							<option  value="1">已核销</option>
					</select></td> 
					</td>
				</tr>
				<tr>
				<input type="hidden" name="shiping_order_id"  >
				<input type="hidden" name="change_fee_id"  >
					<td>配送费：</td>
							<td class="td2"><input id="sends_fee" type="text"
								class="validate[custom[number],min[0],max[99999],custom[dd]]" placeholder="0.00"
								value="0.00" name="sends_fee" />
							</td>
							<td>核销:</td>
					<td class="td2"><select id='sectaa' class="easyui-combobox" name="write_e"  style="width:150px;height:22px"
						 data-options="panelHeight : 'auto',editable:false">
							<option  value="0">未核销</option>
							<option  value="1">已核销</option>
					</select></td> 
					</td>
							</tr>
					<tr>		
							<td>装车费：</td>
							<td class="td2"><input id="loading_fee" type="text"
								class="validate[custom[number],min[0],max[99999],custom[dd]]" placeholder="0.00"
								value="0.00" name="loading_fee" />
							</td>
							<td>核销:</td>
					<td class="td2"><select id='sectaa' class="easyui-combobox" name="write_f" style="width:150px;height:22px"
						 data-options="panelHeight : 'auto',editable:false">
							<option  value="0">未核销</option>
							<option  value="1">已核销</option>
					</select></td> 
					</td>
				</tr>
				<tr>
				<td>卸车费：</td>
							<td class="td2"><input id="unloading_fee" type="text"
								class="validate[custom[number],min[0],max[99999],custom[dd]]" placeholder="0.00"
								value="0.00" name="unloading_fee" />
							</td>
							<td>核销:</td>
					<td class="td2"><select id='sectaa' class="easyui-combobox" name="write_g" style="width:150px;height:22px"
						 data-options="panelHeight : 'auto',editable:false">
							<option  value="0">未核销</option>
							<option  value="1">已核销</option>
					</select></td> 
					</td>
				</tr>
				<tr>			
					<td>运费差异：</td>
							<td class="td2"><input id="loading_fee" type="text"
								class="validate[custom[number],min[0],max[99999],custom[dd]]" placeholder="0.00"
								value="0.00" name="loading_fee" />
							</td>
							<td>核销:</td>
					<td class="td2"><select id='sectaa' class="easyui-combobox" name="write_h"  style="width:150px;height:22px"
						 data-options="panelHeight : 'auto',editable:false">
							<option  value="0">未核销</option>
							<option  value="1">已核销</option>
					</select></td> 
					</td>
						
				</tr>
			</table>
    	
				
					</div>
		  </form>	
  </body>
</html>