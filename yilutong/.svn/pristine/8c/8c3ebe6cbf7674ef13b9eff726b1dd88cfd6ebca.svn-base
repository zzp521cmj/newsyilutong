<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>车辆历史竞价记录</title>
    <jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="./css/main.css">
	<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
  	<script type="text/javascript" src="./js/select2/select2.js"></script>
	<script type="text/javascript" src="./js/select2/select2_locale_zh-CN.js"></script>
  </head>
  <% String number=(String)request.getAttribute("number");%>
  <script type="text/javascript">
  		$(function(){
		 $("#dg").datagrid({
			url : 'car_b_rec.do?method=getCar_b_record',
  			border : false,
  			rownumbers : true,
  			fit : true,
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			columns : [[
  				{field : 'ck',checkbox : true},
  				
  				{field : 'userName',title : '司机姓名',width : 70,align:'center',
					formatter:function(value,rec,index){ 
						 var userName='';
					if(typeof(rec.d)!="undefined"){
						userName=rec.d.userName;
					}
						return userName;
					}
				},
  				{field : 'plateNumber',title : '车牌号',width : 80,align:'center',
  					formatter:function(value,rec,index){ 
						 var plateNumber='';
					if(typeof(rec.d)!="undefined"){
						plateNumber=rec.d.plateNumber;
					}
						return plateNumber;
					}
  				},
  				/* {field : 'd.carLeng',title : '临时车车长',width : 80,align:'center',
  					formatter:function(value,rec,index){ 
						 var carLength='';
					if(typeof(rec.d)!="undefined"){
						carLength=rec.d.carLength;
					}
						return carLength;
					}
  				},
  				{field : 'd.length_name',title : '临时车箱型',width : 80,align:'center',
  					formatter:function(value,rec,index){ 
						var length_name='';
						if(typeof(rec.d)!="undefined"){
							length_name=rec.d.length_name;
						}
						return length_name;
					}
  				},
  				{field : 'd.volume',title : '临时车体积',width : 80,align:'center',
  					formatter:function(value,rec,index){ 
						 var volume='';
					if(typeof(rec.d)!="undefined"){
						volume=rec.d.volume;
					}
						return volume;
					}
  				},
  				{field : 'd.load_s',title : '临时车载重',width : 80,align:'center',
  					formatter:function(value,rec,index){ 
						 var load_s='';
					if(typeof(rec.d)!="undefined"){
						load_s=rec.d.load_s;
					}
						return load_s;
					}
  				}, */
  				/* {field : 'd.normalRoute',title : '临时车常跑路线',width : 80,align:'center',
  					formatter:function(value,rec,index){ 
						 var normalRoute='';
					if(typeof(rec.d)!="undefined"){
						normalRoute=rec.d.normalRoute;
					}
						return normalRoute;
					}
  				}, */
  				/* {field : 'd.source',title : '临时车来源',width : 80,align:'center',
  					formatter:function(value,rec,index){ 
						 var source='';
					if(typeof(rec.d)!="undefined"){
						source=rec.d.source;
					}
						return source;
					}
  				}, */
  				{field : 'publisher',title : '需求发布人',width : 100,align:'center'},
  				{field : 'contactInformation',title : '联系方式',width : 100,align:'center'},
  				//{field : 'createTime',title : '创建时间',width : 125,align:'center'},
  				{field : 'price',title : '价格',width : 60,align:'center'},
  				{field : 'loadingAddress',title : '装货地址',width : 120,align:'center'},
  				{field : 'unloadingAddress',title : '卸货地址',width : 120,align:'center'},
  				{field : 'ranges',title : '方位（m³）',width : 80,align:'center'},
  				{field : 'weight',title : '重量（T）',width : 80,align:'center'},
  				//{field : 'models',title : '车长（m）',width : 100,align:'center'},
  				//{field : 'truckTypeId',title : '货车类型',width : 100,align:'center'},
  				{field : 'zhuang',title : '装货城市',width : 100,align:'center'},
  				{field : 'xie',title : '卸货城市',width : 100,align:'center'},
  				{field : 'remarks',title : '备注',width : 100,align:'center'},
  				
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
				   url: "car_b_rec.do?method=getCar_idLength",
				   data: {plate_number :query.term},   //传递你输入框中的值
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
		var number='<%= number%>';
			if(number!="null"){
				$("#dg").datagrid('load',{ 	 		
		 	 		plate_number:number	
		 	});	  	
		 	$("#plid").val(number);	 
			}
	 	
  		});
  		
 		//查询
  	function searchCar_bid_record(){
  				$("#dg").datagrid('load',{
  					publisher:$.trim($("#userName").val()),
	 	 			contactInformation: $.trim($("#contactInformation").val())
	 	 			//plate_number:$.trim($("#carid").select2("val"))
			 	});	  
 	 	
	 	
  	}
 	//重置按钮
	function equimentRuset(){
		//$("#carid").select2("val", "");
		document.getElementById("userName").value="";
		document.getElementById("contactInformation").value="";
	}
  //导出
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
  </script>
  <body class="easyui-layout">
   <form action="car_b_rec.do" id="outputform" method="post">
  	<div region="north" title="检索" class="st-north" border="false" collapsible="false"  >
  	<input type="hidden" name="plateNumber" id="plid">
	    	<label>司机姓名：</label>
	    	 <input type="text"  class="search-text" id="userName" name="username"   >
	    	<!--  <label>车牌号：</label>
			<input type="text"  class="search-text"  id="carid" name="plateNumber"> -->
	    	<label class="divlabel" >发布人：</label>
	    	<input type="text"  class="search-text"     id="contactInformation" name="tel">
			
			<a class="easyui-linkbutton" onclick="searchCar_bid_record()" data-options="iconCls:'icon-search'">查询</a>		
    	</div>
    	<div region="center" >
    		<table id="dg" title="车辆历史竞价记录信息"></table>
    	</div>
    	<div id="tb">
    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="equimentRuset()" data-options="iconCls:'icon-reset',plain:true" >重置</a>
		   <a href="javascript:void(0)" class="easyui-linkbutton" id="outputAgreement" data-options="iconCls:'icon-output',plain:true" onclick="putoutfile()">导出</a>
		</div>	
			<input type="hidden" name="method" value="outputCar">
			<input type="hidden" id="fieldName" name="fieldName">
			<input type="hidden" id="headtitle" name="headtitle">
		</form>
	
  </body>
</html>
