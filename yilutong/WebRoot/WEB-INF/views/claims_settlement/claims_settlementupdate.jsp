<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ page import="com.jy.common.SessionInfo"%>
<%@ page import="com.jy.model.User"%>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<title>理赔修改</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">


<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
<jsp:include page="../../../ValidationEngine/Validation.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<link rel="stylesheet" href="./js/select2/select2.css" type="text/css">
<script type="text/javascript" src="./js/select2/select2.js"></script>
<script type="text/javascript"
	src="./js/select2/select2_locale_zh-CN.js"></script>
<style type="text/css">
fieldset {
	border: 1px dotted #D1D7DC;
	/* margin: 10px; */
	padding: 8px;
	width: 720px;
}

.st-north {
	
}

.iner {
	margin-top: 10px;
}

.testStyle {
	vertical-align: middle;
	width: 150px;
	height: 22px
}
</style>

</head>
<%
	User user = (User) request.getSession().getAttribute(
			SessionInfo.SessionName);
	String costomers = (String) request.getAttribute("costomers");
	String flg = (String) request.getAttribute("flg");
	String flg2 = (String) request.getAttribute("flg2");
%>
<script type="text/javascript">
	  	var dialog;
 		var grid;
 			var pid=[];
 			var pdid=[];
 		<%-- <%for (int i = 0; i < did.length; i++) {%>
 			pid.push('<%=did[i]%>');
 		<%}
 		%> --%>  

  		$(function(){
  		var claimsid='<%=flg2%>';
  			$.ajax({
			url : 'claims_settlement.do?method=updateId',
			data : {
				id : claimsid
			},
			
  			
			success : function(data) {
				//根据form表单获取所以值
				//$('#shiping_order_num').val(data.shiping_order_num);
				//给select2  赋值name	
				$("#custom_name").val(data.custom_name);
			   $("#custom_id").select2('data',{id:data.custom_id,text:data.custom_name});	
			   
			   if(data.type==2){
			   document.getElementById("yhkh").style.display="";	
				document.getElementById("khh").style.display="";
				document.getElementById("zpbh1").style.display="none";	
				document.getElementById('khbank').setAttribute("class", "validate[required]");
				document.getElementById('usernames').setAttribute("class", "validate[required]");
				document.getElementById('kahao').setAttribute("class", "validate[required,custom[number]]");
				  document.getElementById('zpbh').setAttribute("class", "");	   
			   }else if(data.type==3){
			    document.getElementById("zpbh1").style.display="";	
			    document.getElementById("yhkh").style.display="none";	
				document.getElementById("khh").style.display="none";	
				document.getElementById('khbank').setAttribute("class", "");
				document.getElementById('usernames').setAttribute("class", "");
				document.getElementById('kahao').setAttribute("class", "");
			    document.getElementById('zpbh').setAttribute("class", "validate[required]");
			   }
			   
			   $('#editTravel').form('load', data);	 
			   $("#dg").datagrid({url : 'claims_settlement.do?method=abnormal&custom_name='+data.custom_id});		
				}
		});  			
		var abnormalid='<%=flg%>';
		 $.ajax({
				url : 'claims_settlement.do?method=updateId',//查询理赔表
				data : {
					id : abnormalid	
				},
			}); 
		var $target = $('input,textarea,select');
		 $target.bind('keydown', function (e) {
            var key = e.which;
            if (key == 13) {
                e.preventDefault();
                var nxtIdx = $target.index(this) + 1;
                    $target.eq(nxtIdx).focus();
            };
        });
  		 
				 
		 $("#editTravel").validationEngine('attach', {
			promptPosition : 'topRight:-15,0',
			maxErrorsPerField:1,
			autoHidePrompt:true,//	是否自动隐藏提示信息
		 	autoHideDelay:2000 //两秒
		});
  			grid=$("#dg").datagrid({
  			url : 'claims_settlement.do?method=abnormal',//查询所有要理赔的以及修改的这条数据关联的派单 							
  			idField:'abnormalid',//复选框对应的id签收表中派单id
  			border : false,
  			rownumbers : true,
  						
  			/* fit : true, */
  			singleSelect : true,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			multiSort:true,	
  			columns : [ [
									{field : 'abnormalids',checkbox : true},//派单id 对应数据id Javabeen中已经实例化
									{field : 'shiping_order_num',title : '运单号',width : 90,align:'center',},	
									{field : 'custom_name',title : '发货客户',width : 90,align:'center',},	
									{field : 'goods_name',title : '货品名称',width : 90,align:'center',},		
									{field : 'types_id',title : '异常类型',width : 80,align:'center',},									
							  		{field : 'responsible_people',title : '负责人',width : 80,align:'center'},							  						  		
							  		{field : 'send_time',title : '发货时间',width : 100,align:'center',
							  		formatter : function(val, row, index) {
											if (val != null) {
												return val.substring(0, 19);
											}
										}
										},									
							  		{field : 'abnormal_situation',title : '异常情况',width : 80,align:'center'},
							  		{field : 'unqualified_number',title : '异常数量',width : 80,align:'center'},
							  		
							] ],
							//进入修改页面 自动勾选
						onLoadSuccess:function(){
						$.ajax({
							type: "POST",
							async : false,
				  				url : 'claims_settlement.do?method=updateween',
				  			data : {
				  				id : claimsid
							},
							success : function(data) {
								$(data).each(function(i) {
									pdid.push(data[i].abnormalid);
									var abnormalid=data[i].abnormalid;
									$('#dg').datagrid('selectRecord', abnormalid);
								});
							}
					  	});	
					},
  			pagination:true,//分页
		    pageSize:10,
		    pageList:[5,10,15,20],	
		    toolbar : '#tb'	,
  	
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
		
		/*部门查询  */
		depart='<%=user.getDid()%>';
		$("#ndpid").val(depart);
		$.ajax({
  			type: "POST",
  			async : false,
  			url:'depn.do?method=getDepn',
  			data:{department_id:depart},
  			success:function(data){
  			$("#ndp").val(data.department_name);
  			//$("#ndpid").val(data.department_id);
  			//$("#departments").append("<li>"+data+"</li>");
  			}
  		});
		
		$('#driver2').combobox({
			url: '',
			valueField: 'id',
			textField: 'text',
			editable: false,
			onSelect: function (rec) {
				$("#name").val(rec.text);
					$.ajax({
						url: "driver.do?method=getPhone",
						type: "POST",
						data:{id:rec.id},
			  			success:function(data){
			  				$("#phones").val(data.phoneNumber)
			  				}
			  			});
					},
					onLoadSuccess: function (rec) {
					}
			});
		/*
  		select框
  	*/ 	
  	 $("#creat").val('<%=user.getUsername()%>');
  	  $("#did").val('<%=user.getDid()%>');
		
		//回车查询
  		document.onkeydown = function(event) {
			e = event ? event : (window.event ? window.event : null);
			if (e.keyCode == 13) {
				//执行的方法 
				searchOder();
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
   //异常类型
	$("#types_id").select2({
		    placeholder: "请输入异常类型",	//默认文本框显示信息
		    minimumInputLength: 1,	//最小输入字符长度
		    allowClear:true,
		    multiple: false,				//设置多项选择，false则只能单选
		    maximumSelectionSize: 5, //最大选择个数
			query: function (query) {
		    	$.ajax({
				   type: "POST",
				   url: "claims_settlement.do?method=nquiryDisplay",
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
		});		
			
	  //发货客户	
		 $("#custom_id").select2({
			placeholder : "请输入发货客户名称", //默认文本框显示信息
			minimumInputLength : 1, //最小输入字符长度
			allowClear : true,
			multiple : false, //设置多项选择，false则只能单选
			maximumSelectionSize : 5, //最大选择个数 
			query : function(query) {
				$.ajax({
					type : "POST",
					url : "claims_settlement.do?method=inquireName",
					data : {
						custom_name : query.term
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
		      	$("#custom_name").val(f.object.text);			
				$("#dg").datagrid({url : 'claims_settlement.do?method=abnormal&custom_name='+f.object.id});	
		}).on("select2-removed", function(e) {		
			$("#dg").datagrid({url : 'claims_settlement.do?method=abnormal'});				
		}); 
	}); 
	//查询
  function searchPay() {
			$("#dg").datagrid('load',{
			send_time : $.trim($("#send_time").val()),
			custom_name : $.trim($("#custom_name").val()),
			shiping_order_num : $.trim($("#shiping_order_num").val()),
			//send_time : endDate,
			responsible_people : $.trim($("#responsible_people").val()),
			types_id : $.trim($("#types_id").val())
		});
	}
	function compute() {
		var rows = $("#dg").datagrid('getRows');//获取当前的数据行
		var total = 0;
		for (var i = 0; i < rows.length; i++) {
			total = parseInt(rows[i]['transport_pay']) + total;
		}
		$("#alls").val(total + ".00");
	}
	//修改
	var submitForm = function($dialog, $grid, $pjq, $mainMenu) {	
		var rows = $("#dg").datagrid('getSelections');
		var checkarray=[];
		var claimsid1='<%=flg2%>';
		if(rows!=""){
			for (var i = 0; i < rows.length; i++) {
				checkarray.push(rows[i].abnormalid);	
				};	
			}
			/* if($("#custom_name").val()==null||$("#custom_name").val()==""){
	  				$pjq.messager.alert('修改理赔单', '请选择发货客户', 'info');	
	  			}else */
		if($("#editTravel").validationEngine('validate')&&checkarray.length>0){
	  			//可提交	
			$pjq.messager.confirm('修改信息','确定要修改吗?',function(r){   
						    	if (r){   										
									$.ajax({
												type: "POST",
									  			url:'claims_settlement.do?method=getupdate&id='+checkarray.join(","),
									  			data:$('#editTravel').serialize(),		  		
									  			success:function(msg){
									  				if(msg.flag){
									  				//window.parent.layer.close(index); 
									  					$pjq.messager.alert('修改信息', '修改成功', 'info');
														$dialog.dialog('close');
														$grid.datagrid('reload');
									  				}else{
									  				$pjq.messager.alert('修改信息', '修改失败', 'info');
														$dialog.dialog('close');
														$grid.datagrid('reload');
									  		}
									 	}
							});
						};
					});		
			};			
	};
		function reset(){	
		$("#thesign").val("");
		$("#starttime:starttime").val("");
		$("#endtime:endtime").val("");		
		$("#ddid").val("");
		$("#trytype").select2("val",'');
		$("#suname").select2("val",'');
		
		}
		
		function xj(obj){
		if(obj.checked){
		$("#khbank").val("");
		$("#kahao").val("");
		$("#usernames").val("");		
		document.getElementById("yhkh").style.display="none";	
		document.getElementById("khh").style.display="none";
		document.getElementById("zpbh1").style.display="none";
		document.getElementById('khbank').setAttribute("class", "");
		document.getElementById('kahao').setAttribute("class", "");
		document.getElementById('usernames').setAttribute("class", "");
		}
		}
		function sk(obj){
		if(obj.checked){
		document.getElementById("yhkh").style.display="";	
		document.getElementById("khh").style.display="";
		document.getElementById("zpbh1").style.display="none";	
		document.getElementById('khbank').setAttribute("class", "validate[required]");
		document.getElementById('usernames').setAttribute("class", "validate[required]");
		document.getElementById('kahao').setAttribute("class", "validate[required,custom[number]]");
		document.getElementById('zpbh').setAttribute("class", "");
		}
		}
			
	   function openZp(obj){
	 	if(obj != null){
	    $("#khbank").val("");
		$("#kahao").val("");
		$("#usernames").val("");	
		document.getElementById("yhkh").style.display="none";	
		document.getElementById("khh").style.display="none";
		document.getElementById("zpbh1").style.display="";
		document.getElementById('zpbh').setAttribute("class", "validate[required]");
		document.getElementById('khbank').setAttribute("class", "");
		document.getElementById('kahao').setAttribute("class", "");
		document.getElementById('usernames').setAttribute("class", ""); 
		}
		}
	   function qt(obj){
		if(obj.checked){
		$("#khbank").val("");
		$("#kahao").val("");
		$("#usernames").val("");
		$("#zpbh").val("");	
		document.getElementById("yhkh").style.display="none";	
		document.getElementById("khh").style.display="none";
		document.getElementById("zpbh1").style.display="none";
		document.getElementById('zpbh').setAttribute("class", "");
		document.getElementById('khbank').setAttribute("class", "");
		document.getElementById('kahao').setAttribute("class", "");
		document.getElementById('usernames').setAttribute("class", "");
		}
		}
</script>
<body class="easyui-layout">
	<form action="payfq.do" id="editTravel" method="post">
		<input type="hidden" id="claimsid" name="claimsid">
		<div region="west" class="wt-north" style="width: 560px"
			border="false" collapsible="false">
			<fieldset
				style=" margin-top: 0px ;width: 530px;margin-left: 0px;margin-bottom: 0px;margin-right: 0px;";>
				<table class="tableclass" style="width:530px">
					<tr>
						<th colspan="4">基本信息</th>
					</tr>
					<tr>
						<td>理赔单号：</td>
						<td colspan="3" class="td2"><input type="text" id="numbersid"
							name="numbersid" readonly="readonly" style="width: 240px;">
						</td>
					</tr>
					<tr>
						
						<td><font color="red" style="margin-right:10px">*</font>赔偿金额：</td>
						<td class="td2"><input type="text" id="compensation_payments"
							class="validate[custom[number],[required]]]"
							name="compensation_payments" style="width: 120px;"
							placeholder="0.00"></td>
							<td>			
					<font color="red" style="margin-right:10px">*</font>付款方式：</td>
					<td class="td2" colspan="3">	
						<input type="radio" name="type" value="1"  style="width:14px" onclick="xj(this)" checked/><label style="margin-left: 10px">现金</label>
					<input type="radio"  name="type" value="2"  style="width:14px" onclick="sk(this)"/><label  style="margin-left: 10px">转账</label><br>	
					<input type="radio" name="type" value="3"  style="width:14px" onclick="openZp(this)"/><label style="margin-left: 10px">支票</label>
					<input type="radio"  name="type" value="4"  style="width:14px" onclick="qt(this)"/><label  style="margin-left: 10px">其他</label>				
					</td> 
					</tr>
				
				<tr id="khh"  style="display: none;">
				<td ><font color="red" style="margin-right:10px">*</font>开户行:</td><!--  style="color: blue;"-->
				<td colspan="1" class="td2"><input  id="khbank"	style="width:120px;" 	name="khbank"></td>	
				<td><font color="red" style="margin-right:10px">*</font>开户名:</td><!--  style="color: blue;"-->
				<td colspan="1" class="td2"><input  id="usernames"		style="width:120px;" name="usernames"></td>			
			</tr>						
			<tr id="yhkh"  style="display: none;">
				<td ><font color="red" style="margin-right:10px">*</font>银行卡号:</td><!--  style="color: blue;"-->
				<td colspan="3" class="td2"><input  id="kahao"	style="width:200px; height:24px" 	name="kahao"></td>				
				</tr>
			<tr id="zpbh1"  style="display: none;">
				<td ><font color="red" style="margin-right:10px">*</font>支票编号:</td><!--  style="color: blue;"-->
				<td colspan="3" class="td2"><input  id="zpbh"	style="width:200px; height:24px" name="zpbh"></td>				
				</tr>
					<tr>
					<td>事故分析及处理结果：</td>
					<td colspan="5" class="td2"><textarea
							class="easyui-textarea validate[maxSize[256],custom[checkerr],custom[checkkeyerr]]"
							cols="45" rows="4" name="damage_intensity"></textarea></td>
					</tr>
					<tr>
						<td>审核意见：</td>
						<td colspan="5" class="td2"><textarea
								class="easyui-textarea validate[maxSize[256],custom[checkerr],custom[checkkeyerr]]"
								cols="45" rows="4" name="audit_opinion"></textarea>
						</td>
					</tr>

				</table>
			</fieldset>

		</div>

		<div region="center">
			<lable>发货时间：</lable>
			<input id="send_time" class="Wdate" readonly="readonly"
				style="width:90px;height:22px; margin-right: 0px;"
				onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd '})" /> - <input
				id="send_time" class="Wdate" readonly="readonly"
				style="width:90px;height:22px;margin-right: 0px;"
				onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd '})" />
				
				<!-- <td>发货客户：</td>
						<td class="td2"><input  type="text" class=" search-text" id="custom_id" name="custom_id"style="width: 120px;">
					<input  type="hidden" class=" search-text" id="custom_name" name="custom_name"style="width: 120px;">
						</td> -->
			<a
				class="easyui-linkbutton" onclick="searchPay()"
				data-options="iconCls:'icon-search'">查询</a> <a id="btnMoreSearch"
				class="btn btn-sm btn-link" type="button" style="margin-top:16px;"
				href="javascript:void(0)" state="close">更多条件</a>
			<div id="searchInfoId" style="display: none">
				<lable>异常类型：</lable>
			<input type="text" class="search-text" id="types_id"
				style="width:90px;margin-right: 0px;"> 
				<lable>派单号：</lable>
				<input type="text" class="search-text" id="shiping_order_num"
					style="width:90px;margin-right: 0px;">
				<lable>负责人：</lable>
				<input type="text" class="search-text" id="responsible_people"
					style="width:90px;margin-right: 0px;"> <a
					href="javascript:void(0)" class="easyui-linkbutton"
					data-options="iconCls:'icon-reset',plain:true"
					onclick="onLoadSuccess()"></a>
			</div>
			<table id="dg" style="height: 93%" title="异常签收信息"></table>
<!-- 
			<div id="tb"> -->

			<!-- 	<!--   <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true"onclick="deletefrom()">移除订单</a> -->
			</div> -->
		</div>
		<input type="hidden" id="ddids" name="ddids"> <input
			type="hidden" id="dialog2" /> <input id="creat" class="search-text"
			type="hidden" name="creater" /> <input id="did" class="search-text"
			type="hidden" name="creatdid" />
	</form>



</body>
</html>