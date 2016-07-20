<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="com.jy.common.SessionInfo" %>
<%@ page import="com.jy.model.User" %>

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
<script type="text/javascript"
	src="./js/select2/select2_locale_zh-CN.js"></script>
<script type="text/javascript" src="./js/function.js"></script>
  	<%
	String realPath1 = "http://" + request.getServerName() + ":" + request.getServerPort() +"/truck_cloud/"; 
	User user=(User)request.getSession().getAttribute(SessionInfo.SessionName);
	
 	%>
  </head>
  <script type="text/javascript">
  	 var username='<%=user.getUsername()%>';
	  	var dialog;
 		var grid;
  		$(function(){
  			grid=$("#dg").datagrid({
  			url : 'shipOrder.do?method=getSignShipOrder',
  			border : false,
  			rownumbers : true,
  			fit : true,
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			rowStyler:function(index,row){
					if (row.shipping_order_state !=4){
								return 'color:black';
						}else  if(row.shipping_order_state==4){
						  return 'color: blue';
						}
					},
  			columns : [[
  			
  				{field : 'ck',checkbox : true}, 				
  				{field : 'shiping_order_num',title : '运单号',width : 70,align:'center'},
  				{field : 'shipping_order_state',title : '运单状态',width : 70,align:'center',
  	  				formatter:function(val,row,index){
  	  						if(val==0){
  	  							return "未出库";
  	  						}else if(val==1){
  	  							return "配送中";
  	  						}else if(val==2){
  	  							return "转运中";
  	  						}else if(val==3){
  	  							return "已到达";
  	  						}else if(val==4){
  	  							return "签收";
  	  						}
  	  				}
  	  			},
  				{field : 'send_station',title : '起运地',width : 70,align:'center'},
  				{field : 'end_address',title : '到达地',width : 70,align:'center'},
  				{field : 'custom_name',title : '发货方',width : 70,align:'center'},
  				{field : 'weituo_time',title : '委托时间',width : 125,align:'center',
  					formatter: function(value,row,index){
  				if(value!=undefined){
  				value=value.substr(0,19);
  				}
  					return value;
  				}
  				},
  				{field : 'receipt',title : '收货方',width : 70,align:'center'},
  				{field : 'receipt_address',title : '收货地址',width : 70,align:'center'},
  				{field : 'goods_name',title : '货物',width : 70,align:'center'},
  				{field : 'transport_pay',title : '运费总额',width : 70,align:'center'},
  				{field : 'company_id',title : '中转公司',width : 70,align:'center',
  					formatter:function(val,row,index){
  						var de='';
	  						$.ajax({
					  			type: "POST",
					  			async : false,
					  			url:'company.do?method=getUpdateCompany',
					  			data:{id : val},
					  			success:function(data){
					  			de=data.company_name;
					  			//$("#ndpid").val(data.department_id);
					  			//$("#departments").append("<li>"+data+"</li>");
					  			}
					  		});
					  	return de;	 	
  					}
  				},	{field : 'imageUrl',title : '签收图片',width : 120,align:'center',
  	  				formatter:function(val,row,index){
	  	  					if(val==null){
								return "运单未签收或无图片";
							}else{
								return "<a href='javascript:void(0)' style='color:red' title='点击查看签收图片' onclick=\"showimg('"+row.shiping_order_id+"')\">点击查看</a>";
							}
  	  					}
  	  				},
  				{field : 'sign_user',title : '提货人',width : 70,align:'center'},
  				{field : 'sign_usernumber',title : '提货人证件',width : 70,align:'center'},
  				{field : 'sign_name',title : '提货代理人',width : 70,align:'center'},
  				{field : 'sign_number',title : '提货代理人证件',width : 70,align:'center'},
  				{field : 'sign_time',title : '提货日期',width : 70,align:'center'},
  				{field : 'sign_remarks',title : '提货备注',width : 70,align:'center'},
  				/* {field : 'sign_username',title : '提货经办',width : 70,align:'center',
  				formatter:function(val,row,index){
  						if(val==null){
  							return username;
  						}
  					}	
  				}, 			 */	
  				{field : 'send_type',title : '送货方式',width : 70,align:'center',
  				formatter:function(val,row,index){
  						if(val==0){
  							return "自提";
  						}else if(val==1){
  							return "送货";
  						}
  					}
  				},
  				{field : 'agreement_type',title : '协议类型',width : 70,align:'center',
  					formatter:function(val,row,index){
  						if(val==0){
  							return "班线";
  						}else if(val==1){
  						return "配送";
  						}else if(val==2){
  						return "转运";
  						}
  					}	
  				
  				},
  				{field : 'ndp_id',title : '托运机构',width :70,align:'center',
  				formatter:function(val,row,index){
  						var de='';
	  						$.ajax({
					  			type: "POST",
					  			async : false,
					  			url:'depn.do?method=getDepn',
					  			data:{department_id:val},
					  			success:function(data){
					  			de=data.department_name;
					  			//$("#ndpid").val(data.department_id);
					  			//$("#departments").append("<li>"+data+"</li>");
					  			}
					  		});
					  	return de;	 	
  					}	
  				},				
  				
  			
  			]],
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
		$.trim($("#shipping_order_state").combobox("setText","全部")); 	 
		$.trim($("#shipping_order_state").combobox("setValue","")); 	 
  	});
  	//删除
  	function deleteEver(){
  		var checkarray=[];
	 	var array = $('#dg').datagrid('getSelections');
  		for(var i=0;i<array.length;i++){
  			checkarray.push(array[i].shiping_order_id);
  		}
  		if(array != ""){
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
  		}else{
  			$.messager.alert("运单签收","请选择一行信息","info");	
  		}
  	}
  	
  	
  	function showimg(obj){
  		dialog = parent.jy.modalDialog({
			title : '签收图片详情',
			url : 'shipOrder.do?method=getimgurl&iurl=' + obj,
			width : 680,
			buttons : [{
				text : '',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.qs(dialog, grid, parent.$);
				}
			}] 
		});
  	}
  	/*
  	修改查询 
  	*/
  	function modify(){
  		var row=$("#dg").datagrid('getSelections');
  			if(row.length==1){
	  			for(var i=0;i<row.length;i++){
		  			var id=row[i].shiping_order_id;
		  		}		
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
  			$.messager.alert("运单签收","请选择一行信息","info");	
  		}	
  	}
  	//详情查询
  	function searchMsgQs(){
  		var row=$("#dg").datagrid('getSelections');
  		var isok=0;
  		var id=0;
		for(var i=0;i<row.length;i++){
			id=row[i].shiping_order_id;
			isok=row[i].shipping_order_state;
		}
  		if(row.length==1){
	  		if(isok==4){
		  		dialog = parent.jy.modalDialog({
					title : '运单详情',
					url : 'shipOrder.do?method=getEditSignShipOrderPage&pid=' + id+'&isok=4',
					width : 680,
					buttons : [{
						text : '',
						handler : function() {
							dialog.find('iframe').get(0).contentWindow.qs(dialog, grid, parent.$);
						}
					}] 
				});
	  		}else{
			  	dialog = parent.jy.modalDialog({
					title : '运单详情',
					url : 'shipOrder.do?method=getEditSignShipOrderPage&pid=' + id+'&isok=0',
					width : 680,
					buttons : [{
						text : '<input type="button" id="btncss"  class="btncss" value="签收"/>',
						handler : function() {
							dialog.find('iframe').get(0).contentWindow.qs(dialog, grid, parent.$);
						}
					}]
					  ,onClose:function(){
		              	$.ajax({
									type : "POST",
									url : 'ChangeO.do?method=shhavepit',})
						   dialog.dialog("destroy");
                } 
				});
	  		}
  		}else{
	  		$.messager.alert("运单签收", '请选择一行信息', 'info');
	  	}
  	}
  	//修改
  	function updateUser(){
	 var myform=document.forms[1];
  	 myform.action="car_owner.do?method=updateCar_owner";
  	 myform.submit();
	
	}

 	function addShipOrder() {
		 /* alert(document.getElementById("addbuttons"));
		 alert(document.getElementById("upbuttons")); */
		dialog = parent.jy.modalDialog({
			title : '运单新增',
			url : 'shipOrder.do?method=addShipOrder',
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
	
  	//查询
  	function searchCar_owner(){
  		var startDate=document.getElementById("startDate").value;
  		var endDate=document.getElementById("endDate").value;
  		$("#dg").datagrid('load',{
  				start_date :startDate,
	 	 		end_date :endDate,
	 	 		name:$.trim($("#ddId").val()),
  				shipping_order_state:$.trim($("#shipping_order_state").combobox("getValue")),
  				custom_name:$.trim($("#custom_name").val()),
  				receipt:$.trim($("#receipt").val()),
  				address:$.trim($("#address").val()),
	 	});	  
  	}
	//重置
	function reset(){
		$("#startDate").val("");
		$("#endDate").val("");
		$("#ddId").val("");
		$("#custom_name").val("");
			$.trim($("#shipping_order_state").combobox("setText","全部")); 	 
		$.trim($("#shipping_order_state").combobox("setValue","")); 	 
		/* $("#shipping_order_state option:second").prop("selected", 'selected'); */
		$("#receipt").val("");
		$("#address").val("");
	}
	//导出
	 function putoutfile(){
		var allRows2 = $("#dg").datagrid("getColumnFields");
		var colName=[];
		var fieldName=[];
		var fieleid = [];
		var aa ;
		var rows = $('#dg').datagrid('getSelections');
		for(var i=0; i<rows.length; i++){
	         fieleid.push(rows[i].shiping_order_id);
	      //   alert(rows[i].ndp_id);
        }
       // alert(rows);
		for(i=1;i<allRows2.length;i++)
		{
			var col = $('#dg').datagrid( "getColumnOption" , allRows2[i] );
			if(col.field!="imageUrl"){
				colName.push(col.title);//把title列名到数组里去 
				fieldName.push(col.field); //把field列属性名到数组里去			
			}			
		}
		var row=$("#dg").datagrid('getSelections');
		
		$("#fieldName").val(fieldName.join(","));
  		 $("#headtitle").val(colName.join(","));
  		 $("#fieleid").val(fieleid.join(","));
  		var outputform=$("#outputform");
  		outputform.submit(); 
  	}
  </script>
  <body class="easyui-layout">
  	<form action="shipOrder.do" id="outputform" method="post">
    	<div region="north" title="检索" class="st-north" border="false" collapsible="false"  >
	    	<lable>委托时间:</lable>
			<input  id="startDate"  class="Wdate"  readonly="readonly" style="width:150px;height:22px; " onfocus="WdatePicker({skin:'twoer'})" />
			-
			<input id="endDate"  class="Wdate"  readonly="readonly" style="width:150px;height:22px;" onfocus="WdatePicker({skin:'twoer'})" />
	    	<lable class="divlabel">运单编号:</lable>
	    	 <input type="text" class="search-text" id="ddId"  style="width:150px"  >
			<lable class="divlabel">是否签收:</lable>
				<select  id="shipping_order_state"class="easyui-combobox" name="shipping_order_state" style="width:150px;height:22px"
						 data-options="panelHeight : 'auto',editable:false">
					<option value="" >全部</option>
					<option value="0" >未签收</option><!--  selected="selected"-->
					<option value="4">已签收</option>
				</select>
	    	 <a class="easyui-linkbutton" onclick="searchCar_owner()" data-options="iconCls:'icon-search'" >查询</a>	
	    	 <a id="btnMoreSearch" class="btn btn-sm btn-link" type="button" style="margin-top:16px;" href="javascript:void(0)" state="close">更多条件</a>
	    	 <div id="searchInfoId" style="display: none">
	    	 <lable >发货方:</lable>
	    	<input type="text"  class="search-text" style="width:150px"  id="custom_name"  name="custom_name"/>
	    	<lable >收货方:</lable>
	    	<input type="text"  class="search-text" style="width:150px"  id="receipt"  name="receipt">
			<lable class="divlabel">到达地:</lable>
			<input type="text" class="search-text" id="address"  name="address">
	    	<!-- <lable >发货人手机:</lable>
	    	<input type="text"  class="search-text"style="width:150px"   id="phone" > -->
			<!--<lable>所属机构:</lable>
			<input id="cc3" name="did">-->
			</div>
    	</div>
    	<div region="center" >
    		<table id="dg" title="运单信息" ></table>
    	</div>
    	<div id="tb">
    	<div title='已签收' style='height: 16px;background:blue;-moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;    float: right;
		    	margin: 5 1%;color: white;
		    padding-left: 10px;
		    padding-right: 10px; '><span>已签收</span></div>
		   
		  <div title='未签收' style='height: 16px;background:black;-moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;    float: right;
		    	margin: 5 1%;color: white;
		    padding-left: 10px;
		    padding-right: 10px; '><span>未签收</span></div>
		
		</div>	
		<input type="hidden" name="method" value="OutGetSignShipOrder">
		<input type="hidden" id="fieldName" name="fieldName">
		<input type="hidden" id="headtitle" name="headtitle">
		<input type = "hidden" id = "fieleid" name = "fieleid">
		</form>
  </body>
</html>