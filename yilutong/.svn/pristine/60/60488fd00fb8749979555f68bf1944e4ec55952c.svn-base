<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>班线添加页面</title>

    <jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
    <jsp:include page="/inc/incbootstrap.jsp"></jsp:include>
   	<jsp:include page="/inc/incselect2.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="./css/main.css">
	<script type="text/javascript" src="js/json2.js"></script>
	<link rel="stylesheet" href="./js/icheck/skins/flat/blue.css" type="text/css"></link>
	<jsp:include page="../map/key.jsp"></jsp:include>
	<link rel="stylesheet" href="./css/smart.css" type="text/css"></link></head>
	
	<script type="text/javascript" src="./js/icheck/icheck.js"></script>
    <jsp:include page="../../../ValidationEngine/Validation.jsp"></jsp:include>
	<style type="text/css">
		.table-bordered{
/* 			border: 1px solid blue;
 */			width: 100%;
		}
		.table-bordered thead tr th{
			border: 1px solid blue;
			
		}
		
		.repetitionClass{
			display: none;
			margin-top: 5px;
		}
		.tableclass .td2{
			padding:8px 0px 8px 10px;
		}
	</style>
<script type="text/javascript">
var Startsite={};//首点
var Endsite={};//终点
var Passsite={};//途经点
var Lines={};//线路
var Line_default = 1;//行驶线路默认
var change_time = 0;
var Order = 0;//途经点个数
var postline_time = 0;//总耗时
var change_time = 0;//更改的时间
var hour_time = null;
var minute_time = null;
var linenum=0;//线路个数
  
$(function(){
$("#frmInfo,#form_F,#form_E,#form_P").validationEngine('attach', {
	promptPosition:'topRight:-15,0'
});
$("#truck_id").select2({  //自动完成
		placeholder: "请选择车辆",
		minimumInputLength: 1,  
	    multiple:true,
	    allowClear : true,
		query: function(query) {
		 $.ajax({
				   type: "POST",
				   url: "automaticPlan.do?method=getCarInfo",
				   data: {name:query.term},   //传递你输入框中的值
				   success: function(msg){
		 		   	var msg=$.parseJSON(msg);	
		 			var data = {results: []};		
					$.each(msg,function(x,y){
						data.results.push({id: y.id, text: y.name});
					});
			        query.callback(data);
				   }
			});     
	    },
	}).on("select2-selecting", function(f) {
/* 			$("#truckid").val(f.object.id);
			$("#carnum").val(f.object.text);
 *//* 			$("#truckpk").val(f.object.truckpk);
 */	});
$('#input-1,#input-2,#input-3,#datetype_1,#datetype_2,#endtype_1,#endtype_2,#endtype_3').iCheck({
	checkboxClass: 'icheckbox_flat-blue',
	radioClass:'iradio_flat-blue',
	increaseArea:'20%'
});
	$('#endtype_2').on('ifChecked', function(event){
			$("#end_numId").show();
	});
	$('#endtype_2').on('ifUnchecked', function(event){
			$("#end_numId").hide();
	});
	
	$('#endtype_3').on('ifChecked', function(event){
			$("#end_dateId").show();
	});
	$('#endtype_3').on('ifUnchecked', function(event){
			$("#end_dateId").hide();
	});
	
	$('#datetype_2').on('ifChecked', function(event){
			$('#classweek_1,#classweek_2,#classweek_3,#classweek_4,#classweek_5,#classweek_6,#classweek_7').iCheck({
				checkboxClass: 'icheckbox_flat-blue',
				radioClass:'iradio_flat-blue',
				increaseArea:'20%'
			});
			$("#daysId").hide(); 
			$("#selectId").hide();
			$("#weeklable").show();
			$(".repetitionClass").show();
	});
	$('#datetype_2').on('ifUnchecked', function(event){
			$("#weeklable").hide();
			$(".repetitionClass").hide();
			$("#selectId").show();
			$("#daysId").show();
	});
$('#cc').combotree({    
    		url: "depn.do?method=getTree&&id=",    
    		width: 158,
    		onBeforeLoad: function(node, param) {
                if (node == null) {
                    $('#cc').combotree('tree').tree('options').url = "depn.do?method=getTree&&id=";//加载顶层节点
                } else {
                
                    $('#cc').combotree('tree').tree('options').url = "depn.do?method=getTree&&id=" + node.id;//加载下层节点
                }
              
               }     
			});
	//设置首站点
	$("#but_fist").click(function(){
		//判断是否已经设置首站点
		if(Startsite.site_id){
			return modalMarker('F',true);
		}else{
			return modalMarker('F',false);
		}		
	});
	// 设置途经点
	$("#but_pass").click(function(){
		if(!Startsite.site_id){
			$.messager.alert('错误','请先添加首站点','error');
			return ;
		}
		return modalMarker('P',false,-1);
	});
	// 设置终点
	$("#but_end").click(function(){
		//clickcancel('E');
		if(!Startsite.site_id){
			$.messager.alert('错误','请先设置终点','error');
			return ;
		}
		if(Endsite.site_id){
			return modalMarker('E',true);
		}else{
			return modalMarker('E',false);
		}		
	});
	// 设置行驶线路
	$("#but_Line").click(function(){
		return modal_Line(false,0);	
	});
		$('#Dialog_F').dialog({
	    title: '添加首站点',
	    width: 400,
	    height: 170,
	    closed: true,
	    cache: false,
	    modal: true,
	    buttons:[{
	    	text : '<input type="button" value="保存" class="btncss">',
	    	handler : function() {
	    		var type='F';
	    		var siteid = $("#Markerid_"+type).val();	    		
				if(Passsite[0]){
					 if(Passsite[0].site_id==siteid){
						 $.messager.alert('错误','起点不能与第一个途经点相同');
						 return;
					 }
				 }
	    		addMarker('F');
			}
	    }]
	 });
	 $('#Dialog_P').dialog({
	    title: '添加途径点',
	    width: 450,
	    height: 370,
	    closed: true,
	    cache: false,
	    modal: true,
	    buttons:[{
	    	text : '<input type="button" value="保存" class="btncss">',
	    	handler : function() {
	    		var type='P';
				var sitename = $("#Markername_"+type).val();
				var siteid = $("#Markerid_"+type).val();
				var order = parseInt($("#order_"+type).val());
				
				if(order==0){
					if(Startsite.site_id==siteid){
						  	$.messager.alert('错误',"第一个途经点不能与起点相同");
							return ;
					 }
				}
				 if(Endsite.site_id==siteid){
					 $.messager.alert('错误',"途经点不能与终点相同");
						return ;
				 }
				 if(Passsite[order-1]){
					 if(Passsite[order-1].site_id==siteid){
						$.messager.alert('错误',"途经点不能与前一个途经点相同");
						 return ;
					 }
				 }
				 for(var i in Passsite){
					 if(i==order)continue;
					 if(Passsite[i].site_id==siteid){
						 //$.messager.alert('错误',"途经点不能重复");
						//	return ;
					 }
					 
				 }
	    		addMarker('P');
			}
	    }]
	 });
	 $('#Dialog_E').dialog({
	    title: '添加终点',
	    width: 450,
	    height: 370,
	    closed: true,
	    cache: false,
	    modal: true,
	    buttons:[{
	    	text : '<input type="button" value="保存" class="btncss">',
	    	handler : function() {
	    	var type='E';
			var sitename = $("#Markername_"+type).val();
			var siteid = $("#Markerid_"+type).val();
	    	for(var i in Passsite){
				 if(Passsite[i].site_id==siteid){
							$.messager.alert('错误',"途经点不能与终点相同");
						 return ;
					 }
				 }
	    		addMarker('E');
			}
	    }]
	 });
	 //绑定线路
	 $('#myLine').dialog({
	    title: '添加终点',
	    width: 450,
	    height: 170,
	    closed: true,
	    cache: false,
	    modal: true,
	    buttons:[{
	    	text : '<input type="button" value="保存" class="btncss">',
	    	handler : function() {
	    		addLine();
			}
	    }]
	 });
	});

	
	function modalMarker(type,edit,orders){
		$('#myMarker_'+type).modal();
		$("#Marker_"+type).val('');
		//$("#Markerid_"+type).val('');
		$("#Mileage_"+type).val('');
		//$("#Runtime_"+type).val('');
		$("#Runtime_"+type+'_T').val('0');
		$("#Runtime_"+type+'_M').val('0');
		$("#Stoptime_"+type+'_T').val('0');
		$("#Stoptime_"+type+'_M').val('0');
		$("#order_"+type).val('');
		$("#lnglat_"+type).val('');
		postline_time = 0;
		//获取站点
	    $("#select_"+type).select2({
		    placeholder: "选择站点",	//默认文本框显示信息
		    minimumInputLength: 1,	//最小输入字符长度
		    allowClear:true,
		    multiple: false,		//设置多项选择，false则只能单选
		    maximumSelectionSize: 1, //最大选择个数
		    query: function (query) {
		    	$.ajax({
				   type: "POST",
				   url: "postline.do?method=getRemark",
				   data: {remarkName:query.term},   //传递你输入框中的值
				   success: function(msg){
		 		   	var msg=$.parseJSON(msg);		
		 			var data = {results: []};		
					$.each(msg,function(x,y){
						data.results.push({id: y.id, text: y.name,code:y.code,lnglat:y.lnglat});
					});
			        query.callback(data);
				   }
				});
		    }
		}).on("select2-selecting", function(f) {
			$("#Markername_"+type).val(f.object.text);
			$("#Markercode_"+type).val(f.object.code);
			$("#Markerid_"+type).val(f.object.id);
			$("#lnglat_"+type).val(f.object.lnglat);
		});
		//排序-1且类行为途经点
		if(orders == -1 && type == 'P'){
			$('#order_P').val(Order);
			Order = parseInt(Order)+1;
		}
		//途经点修改
		else if(edit && type == 'P'){
		$("#select_"+type).select2('data',{
			id:Passsite[orders].site_id,
			text:Passsite[orders].site_name,
			code:Passsite[orders].site_code,
		});
		$("#Marker_"+type).attr('data-placeholder',Passsite[orders].site_name);
		$("#Marker_"+type).val(Passsite[orders].site_name);
		$("#Markername_"+type).val(Passsite[orders].site_name);
		$("#Markerid_"+type).val(Passsite[orders].site_id);
		$("#Mileage_"+type).val(Passsite[orders].site_mlg);
		//$("#Runtime_"+type).val(Passsite[orders].site_run);
		if(Passsite[orders].site_run >= 60){	
			$("#Runtime_"+type+'_T').val(parseInt(Passsite[orders].site_run/60));
			$("#Runtime_"+type+'_M').val(Passsite[orders].site_run%60);
		}else{
			$("#Runtime_"+type+'_T').val('0');
			$("#Runtime_"+type+'_M').val(Passsite[orders].site_run);
		}
		if(Passsite[orders].site_stop >= 60){	
			$("#Stoptime_"+type+'_T').val(parseInt(Passsite[orders].site_stop/60));
			$("#Stoptime_"+type+'_M').val(Passsite[orders].site_stop%60);
		}else{
			$("#Stoptime_"+type+'_T').val('0');
			$("#Stoptime_"+type+'_M').val(Passsite[orders].site_stop);
		}
		//$("#Stoptime_"+type).val(Passsite[orders].site_stop);
		$("#Markercode_"+type).val(Passsite[orders].site_code);
		$("#order_"+type).val(orders);
		$("#lnglat_"+type).val(Passsite[orders].lnglat);
	}
		//如果点击首站点修改按钮
	else if(edit && type == 'F'){
			$("#select_"+type).select2('data',
				{id:Startsite.site_id,text:Startsite.site_name,code:Startsite.site_code,lnglat:Startsite.lnglat}
			);
			$("#Marker_"+type).val(Startsite.site_name);
			$("#Markername_"+type).val(Startsite.site_name);
			$("#Markerid_"+type).val(Startsite.site_id);
			$("#Markercode_"+type).val(Startsite.site_code);
			$("#lnglat_"+type).val(Startsite.lnglat);
		//select2txt = Startsite.site_name;
	}else if(edit && type == 'E'){
		$("#select_"+type).select2('data',
			{id:Endsite.site_id,text:Endsite.site_name,code:Endsite.site_code}
		);
		$("#Marker_"+type).attr('data-placeholder',Endsite.site_name);
		$("#Marker_"+type).val(Endsite.site_name);
		$("#Markername_"+type).val(Endsite.site_name);
		$("#Markerid_"+type).val(Endsite.site_id);
		$("#Mileage_"+type).val(Endsite.site_mlg);
		//$("#Runtime_"+type).val(Endsite.site_run);
		if(Endsite.site_run >= 60){	
			$("#Runtime_"+type+'_T').val(parseInt(Endsite.site_run/60));
			$("#Runtime_"+type+'_M').val(Endsite.site_run%60);
		}else{
			$("#Runtime_"+type+'_T').val('0');
			$("#Runtime_"+type+'_M').val(Endsite.site_run);
		}
		$("#Markercode_"+type).val(Endsite.site_code);
		$("#lnglat_"+type).val(Endsite.lnglat);
	}
		$("#Dialog_"+type).dialog('open');
		
 	}
 	
 	//绑定行驶线路
 	function modal_Line(edit,id) {
 		$("#Line").val('');
		$("#Linemlg").val('');
		if(edit){
			var line = Lines[id];
			$("#Line").val(line.line_name);
			$("#Linename").val(line.line_name);
			$("#Lineid").val(line.line_id);
			 var line_mlg = line.line_mlg && line.line_mlg > 0 ? line.line_mlg : 0 ;
/* 			line_mlg = Number(line_mlg / 1000).toFixed(2); 
 */			$("#Linemlg").val(line_mlg);
		}

		$("#Line").select2({
		    placeholder: '请选择行驶线路',  
		    minimumInputLength: 1,	//最小输入字符长度
		    allowClear:true,
		    multiple: false,		//设置多项选择，false则只能单选
		    maximumSelectionSize: 1, //最大选择个数
		    //数据加载
		    query: function (query){
		        $.ajax({
				   type: "POST",
				   url: "postline.do?method=getlinInfo",
				   data: {linName:query.term},   //传递你输入框中的值
				   success: function(msg){
			 		   	var msg=$.parseJSON(msg);
			 		   	var data = {results: []};		
						$.each(msg,function(x,y){
							data.results.push({id:y.id,text:y.name,pathmlg:y.lincd});
						});
				        query.callback(data);
		            }
		        });         
		    }
		}).on("select2-selecting", function(f) {
				$("#Linename").val(f.object.text);
				$("#Lineid").val(f.object.id);
				//var line_mlg = f.object.pathmlg && f.object.pathmlg > 0 ? f.object.pathmlg : 0 ;
				//line_mlg = Number(line_mlg / 1000).toFixed(2);
				$("#Linemlg").val(f.object.pathmlg);
		});
		$("#myLine").dialog('open');
 	}
 	//添加线路
 	function addLine(){
/* 	var linename = $("#Line").val();
 */	var linename = $("#Linename").val();
	var lineid = $("#Lineid").val();
	var linemlg = $("#Linemlg").val();
	var Pass = {};
	Pass.line_name = linename;
	Pass.line_id = lineid;
	Pass.line_mlg = linemlg;
	var line_one = Lines[linenum];
	
	if(line_one && line_one.line_default == 1){
		Line_default = 1;
	}
	Pass.line_default = Line_default;
	for(var i=0;i<linenum;i++){
		if(Lines[i].line_name==linename&&Lines[i].line_id==lineid&&Lines[i].line_mlg==linemlg){
			$("#myLine").dialog('close');
			$.messager.alert('绑定线路','绑定的线路已存在，不可重复绑定','info');
			return;
		}
	}
	Pass.linenum=linenum;
	Lines[linenum] = Pass;
	if(Line_default == 1){
		Line_default = 0;
	}
	linenum++;
	show_line();
	$("#myLine").dialog('close');
/* 	$.messager.alert('绑定线路','绑定线路成功','info');
 */}
 	//添加站点的存储
	function addMarker(type){
		var sitename = $("#Markername_"+type).val();//站点名称
		var siteid = $("#Markerid_"+type).val();//站点id
		var sitecode = $("#Markercode_"+type).val();//站点编码
		var lnglat = $("#lnglat_"+type).val();//站点坐标
		//顺序
		var order = $("#order_"+type).val();
		//行驶里程
		var mileage = $("#Mileage_"+type).val();
		//停留时间
		var stoptime = Number($("#Stoptime_"+type+"_T").val() * 60) + Number($("#Stoptime_"+type+"_M").val());
		//行驶时间
		var runtime = Number($("#Runtime_"+type+"_T").val() * 60) + Number($("#Runtime_"+type+"_M").val());
		//首站点赋值
		if(type == 'F'){
			Startsite.site_name = sitename;
			Startsite.site_id = siteid;
			Startsite.site_code = sitecode;
			Startsite.lnglat = lnglat;
		}
		//途经点赋值，其中途经点是以数组形式存储
		if(type == 'P'){
			var Pass = {};
			Pass.site_name = sitename;
			Pass.site_id = siteid;
			Pass.site_run = runtime;
			Pass.site_mlg = mileage;
			Pass.site_stop = stoptime;
			Pass.site_order = order;
			Pass.site_code = sitecode;
			Pass.lnglat = lnglat;
			Passsite[order] = Pass;
		}
		//保存途经点赋值
		if(type == 'E'){
			Endsite.site_name = sitename;
			Endsite.site_id = siteid;
			Endsite.site_run = runtime;
			Endsite.site_mlg = mileage;
			Endsite.site_code = sitecode;
			Endsite.lnglat = lnglat;
		}
	
		//恢复右边显示的详细信息选择时间
		hour_time = null;
		minute_time = null;
		addHtmlMarker();
		$("#hour option[value=\"0\"]").attr("selected", "selected");
		$("#hour option[value=\"00\"]").attr("selected", "selected");
		if(type == 'F'){
			$('#Dialog_F').dialog('close');
/* 			$.messager.alert('添加首站点','添加首站点成功','info');
 */		}
		if(type == 'P'){
			$('#Dialog_P').dialog('close');
/* 			$.messager.alert('添加途径点','添加途径点成功','info');
 */		}
		if(type == 'E'){
			$('#Dialog_E').dialog('close');
/* 			$.messager.alert('添加终点','添加终点成功','info');
 */		}
	}
	
//添加班线
 function addHtmlMarker(){
	$('#markers tbody tr').remove();
	var postline_show = '';
	var postline_mlg = 0;//总里程
	var passnum = 0;//途径站
	var stopnum = 0;
	if(Startsite.site_id){
 		var html = "<tr>"
		+"<th site_name='"+Startsite.site_name+"' site_lnglat='"+Startsite.lnglat+"' type='F'>"+Startsite.site_name+"</th>"
		+"<th>--</th>"
		+"<th>--</th>"
		+"<th>--</th>"
		+"<th><a class='btn btn-default btn-xs' onclick="+"modalMarker('F',true,1)"+">修改</a></th>"
		+"</tr>";
		$('#markers tbody').append(html);
		var time = change_time == 0 ? '0:00' : change_time;
		postline_show += '<li class="special">  <div class="smart-timeline-icon">  </div> <div class="smart-timeline-arrow"></div> <div class="smart-timeline-time banxian_city padding-5"> '+Startsite.site_name+'  </div> <div class="smart-timeline-content clearfix"> <div class="col-xs-12 padding-5 bg-color-white"><select id="hour"><select>&nbsp;&nbsp;时<select id="minute"></select>&nbsp;&nbsp;分</div> </div> </li>';
 		var passnum = 0;
		var stopnum = 0;
 		$.each(Passsite, function(i, item) {
		if(item.site_id){
			//判断第几个途经点
			passnum ++;
			//初始第一个途经点
			if(item.site_order == 0 && Order == (Number(item.site_order)+1)){
				var html = "<tr>"
				+"<th site_name='"+item.site_name+"' site_lnglat='"+item.lnglat+"' type='P'>"+item.site_name+"</th>"
				+"<th>"+item.site_mlg+"</th>"
				+"<th>"+item.site_run+"</th>"
				+"<th>"+item.site_stop+"</th>"
				+"<th><a class='btn btn-default btn-xs' onclick="+"modalMarker('P',true,"+item.site_order+")"+">修改</a><a class='btn btn-default btn-xs' onclick="+"Marker_Del("+item.site_order+")"+">删除</a></th>"
				+"</tr>";
				$('#markers tbody').append(html);
			//后面有，途径第一个点
			}else if(item.site_order == 0 && Order != (Number(item.site_order)+1)){
				var html = "<tr>"
				+"<th site_name='"+item.site_name+"' site_lnglat='"+item.lnglat+"' type='P'>"+item.site_name+"</th>"
				+"<th>"+item.site_mlg+"</th>"
				+"<th>"+item.site_run+"</th>"
				+"<th>"+item.site_stop+"</th>"
				+"<th><a class='btn btn-default btn-xs' onclick="+"Marker_Down('P',true,"+item.site_order+")"+">下移</a><a class='btn btn-default btn-xs' onclick="+"modalMarker('P',true,"+item.site_order+")"+">修改</a><a class='btn btn-default btn-xs' onclick="+"Marker_Del("+item.site_order+")"+">删除</a></th>"
				+"</tr>";
				$('#markers tbody').append(html);
			//最后一个途经点
			}else if(Order == (Number(item.site_order)+1)){
				var html = "<tr>"
				+"<th site_name='"+item.site_name+"' site_lnglat='"+item.lnglat+"' type='P'>"+item.site_name+"</th>"
				+"<th>"+item.site_mlg+"</th>"
				+"<th>"+item.site_run+"</th>"
				+"<th>"+item.site_stop+"</th>"
				+"<th><a class='btn btn-default btn-xs' onclick="+"Marker_Up('P',true,"+item.site_order+")"+">上移</a><a class='btn btn-default btn-xs' onclick="+"modalMarker('P',true,"+item.site_order+")"+">修改</a><a class='btn btn-default btn-xs' onclick="+"Marker_Del("+item.site_order+")"+">删除</a></th>"
				+"</tr>";
				$('#markers tbody').append(html);
			//中间的途经点
			}else{
				var html = "<tr>"
				+"<th site_name='"+item.site_name+"' site_lnglat='"+item.lnglat+"' type='P'>"+item.site_name+"</th>"
				+"<th>"+item.site_mlg+"</th>"
				+"<th>"+item.site_run+"</th>"
				+"<th>"+item.site_stop+"</th>"
				+"<th><a class='btn btn-default btn-xs' onclick="+"Marker_Up('P',true,"+item.site_order+")"+">上移</a><a class='btn btn-default btn-xs' onclick="+"Marker_Down('P',true,"+item.site_order+")"+">下移</a><a class='btn btn-default btn-xs' onclick="+"modalMarker('P',true,"+item.site_order+")"+">修改</a><a class='btn btn-default btn-xs' onclick="+"Marker_Del("+item.site_order+")"+">删除</a></th>"
				+"</tr>";
				$('#markers tbody').append(html);
			}
			postline_mlg += Number(item.site_mlg);
			postline_time += Number(item.site_run);
			var pintime =  timetoday(postline_time);
			postline_time += Number(item.site_stop);
			var pouttime =  timetoday(postline_time);
			stopnum += Number(item.site_stop);
			//postline_show +='<li><div class="smart-timeline-content no-border row"><div class="col-xs-12 padding-5"><i class="fa fa-clock-o"></i> '+item.site_run+'分钟 </div></div><div class="smart-timeline-list-green" style="height:40%"></div><div class="smart-timeline-icon"><div class="timeline-icon-green"></div></div><div class="smart-timeline-arrow"></div><div class="smart-timeline-time banxian_city padding-5"> '+item.site_name+' </div><div class="smart-timeline-content clearfix"><div class="col-xs-12 no-padding"><div class="padding-5"><p><i class="fa fa-angle-double-down"></i> '+pintime+' </p><p><i class="fa fa-dot-circle-o"></i> '+item.site_stop+'分钟 </p><i class="fa fa-angle-double-down"></i> '+pouttime+' </div></div></div></li>';
			postline_show += '<li> <div class="smart-timeline-content no-border row"> 	<div class="col-xs-12 padding-5"> <i class="fa fa-clock-o"></i> '+item.site_run+'分钟 	</div> </div> <div class="smart-timeline-icon"> 	 </div> <div class="smart-timeline-arrow"></div> <div class="smart-timeline-time banxian_city padding-5"> '+item.site_name+'  </div> <div class="smart-timeline-content clearfix"> 	<div class="col-xs-12 padding-5 bg-color-white"> <p><i class="fa fa-angle-double-down"></i>'+pintime+' </p> <p><i class="fa fa-dot-circle-o"></i> '+item.site_stop+'分钟 </p> <i class="fa fa-angle-double-down"></i> '+pouttime+' 	</div> </div> </li>';
		}else{
			postline_mlg += Number(item.site_mlg);
			postline_time += Number(item.site_run);
			var pintime =  timetoday(postline_time);
			postline_time += Number(item.site_stop);
			var pouttime =  timetoday(postline_time);
			stopnum += Number(item.site_stop);
		}
	});
	if(Endsite.site_id){
		var html = "<tr>"
		+"<th site_name='"+Endsite.site_name+"' site_lnglat='"+Endsite.lnglat+"' type='E'>"+Endsite.site_name+"</th>"
		+"<th>"+Endsite.site_mlg+"</th>"
		+"<th>"+Endsite.site_run+"</th>"
		+"<th>--</th>"
		+"<th><a class='btn btn-default btn-xs' onclick="+"modalMarker('E',true,2)"+">修改</a></th>"
		+"</tr>";
		$('#markers tbody').append(html);
		postline_mlg += Number(Endsite.site_mlg);
		postline_time += Number(Endsite.site_run);
		var pintime = timetoday(postline_time);
		//postline_show += '<li><div class="smart-timeline-content no-border row">	<div class="col-xs-12 padding-5"><i class="fa fa-clock-o"></i> '+Endsite.site_run+'分钟 </div></div><div class="smart-timeline-icon"></div><div class="smart-timeline-arrow"></div><div class="smart-timeline-time banxian_city padding-5"> '+Endsite.site_name+' </div><div class="smart-timeline-content padding-5"><i class="fa fa-arrow-circle-o-down"></i> '+pintime+' </div></li>';
		postline_show += '<li class="special s2"> <div class="smart-timeline-content no-border row"> <div class="col-xs-12 padding-5"> <i class="fa fa-clock-o"></i> '+Endsite.site_run+'分钟 </div> </div> <div class="smart-timeline-icon"></div> <div class="smart-timeline-arrow"></div> <div class="smart-timeline-time banxian_city padding-5">'+Endsite.site_name+'</div> <div class="smart-timeline-content padding-5 bg-color-white"> 	<i class="fa fa-arrow-circle-o-down"></i> '+pintime+' </div> </li>';
	}
 		
 		//最后
 		var postline_count = "<h6>途经站："+passnum+"站</h6><h6>总里程："+postline_mlg+"公里</h6><h6>总耗时："+parseInt((postline_time-change_time)/60)+"小时"+((postline_time-change_time)%60)+"分</h6><h6>停留总耗时："+parseInt(stopnum/60)+"小时"+(stopnum%60)+"分</h6>";
		$('#postlineshow').html(postline_show);
		$('#postline_count').html(postline_count);
		var hour = '';
		for(var i=0;i<24;i++){
			hour += '<option value="'+i+'">'+i+'</option>';
		}
		$('#hour').html(hour);
		var minute = '';
		for(var i=0;i<60;i++){
			var j = i<10 ? '0'+i : i;
			minute += '<option value="'+j+'">'+j+'</option>';
		}
		$('#minute').html(minute);
		if(hour_time != null){
			$("#hour option[value=\""+hour_time+"\"]").attr("selected", "selected");
		}
		if(minute_time != null){
			$("#minute option[value=\""+minute_time+"\"]").attr("selected", "selected");
		}
		$('#hour').change(function(){
			hour_time = $('#hour').val();
			postline_time = Number(hour_time*60) + Number($('#minute').val());
			change_time = postline_time;
			addHtmlMarker();
		});
		$('#minute').change(function(){
			minute_time = $('#minute').val();
			postline_time = Number(hour_time*60) + Number($('#minute').val());
			change_time = postline_time;
			addHtmlMarker();
		});
	 	}
 }
 //绑定线路
 function show_line(){
	$('#lines tbody tr').remove();
	$.each(Lines, function(i, item) {
		if(item.line_id){
			if(item.line_default == 1){
				var def_html = "<a class='btn btn-default btn-xs'>默认</a>";
			}else{
				var def_html = "<a class='btn btn-default btn-xs' onclick="+"Line_def('"+item.line_id+"')"+">设置默认</a>";
			}
			var line_mlg = item.line_mlg && item.line_mlg > 0 ? item.line_mlg : 0 ;
/* 			line_mlg = Number(line_mlg / 1000).toFixed(2);
 */			var html = "<tr>"
			+"<th>"+item.line_name+"</th>"
			+"<th>"+line_mlg+"</th>"
			//<a class='btn btn-default btn-xs' onclick="+"modal_Line(true,'"+item.line_id+"')"+">修改</a>
			+"<th>"+def_html+"<a class='btn btn-default btn-xs' onclick="+"Line_del('"+item.linenum+"')"+">删除</a></th>"
			+"</tr>";
			$('#lines tbody').append(html);
		}
	});
}
function Line_def(lineid){
	
	var line = Lines[lineid];
	$.each(Lines, function(i, item) {
		if(item.line_id == lineid){
			item.line_default = 1;
			Lines[i] = item;
		}else{
			item.line_default = 0;
			Lines[i] = item;
		}
	});
	show_line();
}
function Line_del(lineid){
	var line = Lines[lineid];
	if(line.line_default == 1){
		var confirm = "您确定要删除默认行驶线路吗?";
	}else{
		var confirm = "您确定要删除行驶线路吗?";
	}
	$.messager.confirm('修改班线',confirm,function(r){   
        if (r) {
        	Lines[lineid] = '';
        	linenum--;
        	show_line();
		}
    });
}
 //上移途经点
 //把当前这个和上一个的内容进行替换
 function Marker_Up(type,edit,orders){
	if(orders >=1 && type == 'P'){
		var passdown = Passsite[orders];
		var orderup = orders-1;
		var passup = Passsite[orderup];
		passup.site_order = orders;
		passdown.site_order = orderup;
		Passsite[orders] = passup;
		Passsite[orderup] = passdown;
/* 		$.messager.alert('上移操作','上移成功','info');
 */		addHtmlMarker();
	}else{
/* 		$.messager.alert('上移操作','上移错误','error');
 */	}
}
//下移途经点
 //把当前这个和下一个的内容进行替换
 function Marker_Down(type,edit,orders){
	if(orders >=0 && type == 'P'){
		var passdown = Passsite[orders];
		var orderup = orders+1;
		var passup = Passsite[orderup];
	 	passup.site_order = orders;
		passdown.site_order = orderup; 
		Passsite[orders] = passup;
		Passsite[orderup] = passdown;
/* 		$.messager.alert('下移操作','下移成功','info');
 */		addHtmlMarker();
	}else{
/* 		$.messager.alert('下移操作','下移错误','error');
 */	}
}
//删除途经点
function Marker_Del(orders){
$.messager.confirm('Confirm','您确定要删除这个途经点吗?',function(r){
        if (r) {
        	var num = 0;
	    	$.each(Passsite, function(i, item) {
	    		if(item.site_id && item.site_order == orders){
	    			var Pass = {};
					Pass.site_name = '';
					Pass.site_id = '';
					Pass.site_run = '';
					Pass.site_mlg = '';
					Pass.site_stop = '';
					Pass.site_order = '';
					Pass.site_code = '';
		        	Passsite[orders] = Pass;
	    		}else if(item.site_id && item.site_order > orders){
					var ordern = parseInt(orders) + parseInt(num);
					console.log(ordern);
					var Pass = {};
					Pass.site_name = '';
					Pass.site_id = '';
					Pass.site_run = '';
					Pass.site_mlg = '';
					Pass.site_stop = '';
					Pass.site_order = '';
					Pass.site_code = '';
					Passsite[item.site_order] = Pass;	
					item.site_order = ordern;	
					Passsite[ordern] = item;
					num++;
				}
			});
        	Order = Order-1;
        	postline_time=0;
        	addHtmlMarker();
		}
    });
}
function Line_def(lineid){
	
	var line = Lines[lineid];
	$.each(Lines, function(i, item) {
		if(item.line_id == lineid){
			item.line_default = 1;
			Lines[i] = item;
		}else{
			item.line_default = 0;
			Lines[i] = item;
		}
	});
	show_line();
}
function Line_del(lineid){
	var line = Lines[lineid];
	if(line.line_default == 1){
		var confirm = "您确定要删除默认行驶线路吗?";
	}else{
		var confirm = "您确定要删除行驶线路吗?";
	}
	$.messager.confirm('修改班线',confirm,function(r){
        if (r) {
        	Lines[lineid] = '';
        	show_line();
		}
    });
}
 //计算天数
 function timetoday(time){
	var rtime = '';
	var tcount = parseInt(time/1440)+1;//1440分钟也就是24小时
	var mu = time%1440;
	if(tcount > 1 ){
		var day = "第"+tcount+"天";
		var tim = mintohours(mu);
	}else{
		 var day = "第1天";
		 var tim = mintohours(mu);
	}
	var daytime = tim + ' '+ day;
	return daytime;
}
//根据行驶时间算出行驶时间后的时间
function mintohours(min){
	var min = Number(min);
	var hours = "00";
	var min_r = min%60;
	var minute = min_r;
	if(min >= 60){
		var hours = parseInt(min/60);
		if(hours <10){
			hours = '0'+hours;
		}
	}
	if(min_r < 10){
		minute = '0'+min_r;
	}
	var times = hours+':'+minute;
	return times;
}
/**
 * 自动计算里程
 */
 function autoCountMileage(type) {
	var startLnglat = '',
		endLnglat = '',
		startpoint = '',
		endpoint = '',
		markername = '',
		distance = 0;
	var markerArr = [],
		lnglatArr = [],
		typeArr = [];
	var startname = $("#Markername_F").val();
	var nowname = $("#Markername_"+type).val();
	var startLnglat = $("#lnglat_F").val();
	var endLnglat = $("#lnglat_"+type).val();
	if(!nowname){
		$.messager.alert('错误','请先选择站点','error');
		return false; 
	}
	$("#markers tbody tr").each(function(k){
		var linehtml = $(this).html();
		var linepreg = /\<th site_name\=\"(.*)\"\ site_lnglat\=\"(.*)\" type=\"([F,P,E])\"\>/;
		var data = linehtml.match(linepreg);
		if(data){
			markerArr.push(data[1]);
			lnglatArr.push(data[2]);
			typeArr.push(data[3]);
		}
	});
	for (var i = 0; i< markerArr.length; i++)
	{	
		var key = $.inArray(nowname, markerArr);
		if( key > -1 && type == 'P'){
			console.log(key);
			markername = key > 0 ? markerArr[key-1] :  markerArr[0];
			startpoint = key > 0 ? lnglatArr[key-1] :  lnglatArr[0];
			endpoint =  key > 0 ? lnglatArr[key] : endLnglat;
			break;
		}else 
		if( type == 'P'){
			var len = 0;
			for (var j=0; j < typeArr.length; j++)
			{
				if(typeArr[j] == 'P'){
					len++;
				}
			}
			markername = len > 0 ? markerArr[len] :  startname;
			startpoint = len > 0 ? lnglatArr[len] :  startLnglat;
			endpoint = endLnglat;
			break;
		} else if (type == 'E'){	
			var len = markerArr.length;
			if(markerArr[len-1] == nowname){
				markername = len > 0 ? markerArr[len-2] :  startname;
				startpoint = len > 0 ? lnglatArr[len-2] :  startLnglat;
			}else{
				markername = len > 0 ? markerArr[len-1] :  startname;
				startpoint = len > 0 ? lnglatArr[len-1] :  startLnglat;
			}
			endpoint = endLnglat;
			break;
		}
	}
	console.log(markerArr);
	console.log(lnglatArr);
	if(!markername && !startpoint && !endpoint){
		markername = startname;
		startpoint = startLnglat;
		endpoint = endLnglat;
	}
	
	console.log('当前站点：' +nowname+ ' -- ' + splitstr(endpoint) +'   上一站点： '+ markername + ' -- ' + splitstr(startpoint));
	
	if(startpoint){
		sumdistance(splitstr(startpoint),splitstr(endpoint),type);
	}else{
		
	}
}
var submitForm = function($dialog, $grid, $pjq, $mainMenu) {
		//获取select2选择的车辆
		var data=$("#truck_id").select2('data');
		var datastring = "";
	    $.each(data, function (key, val) {
	        datastring = datastring + val.text + ",";
	    });
	    datastring=datastring.substring(0,datastring.length-1);
	   	$("#truckid").val($('#truck_id').val());
		$("#carnum").val(datastring);
		
		if(!Startsite.site_id){
			$.messager.alert('错误','请先设置首点','error');
			return ;
		}else if(!Endsite.site_id){
			$.messager.alert('错误','请先设置终点','error');
			return ;
		}else if($('#cc').combotree('getValue')==null||$('#cc').combotree('getValue')==''){
			$.messager.alert('错误','请选择部门','error');
			return ;
		}
		if($("#frmInfo").validationEngine('validate')){
			$pjq.messager.confirm('新增班线','确定要新增班线吗?',function(r){   
		    	if (r){
			    	var pararm = $("#frmInfo").serializeArray();
			    	var stsite = JSON.stringify(Startsite);
			    	pararm.push({'name':'startsite','value':stsite});
					var edsite = JSON.stringify(Endsite);
					pararm.push({'name':'endsite','value':edsite});
					var pssite = JSON.stringify(Passsite);
					pararm.push({'name':'passsite','value':pssite});
					var lin = JSON.stringify(Lines);
					pararm.push({'name':'lines','value':lin});
					  	 $.ajax({
							type: "POST",
				  			url:'postline.do?method=addPostLineInfo',
				  			data:pararm,
				  			success:function(msg){
				  				 if(msg.flag){
					  					$pjq.messager.alert('新增班线','新增班线成功','info');
									   	$grid.datagrid('reload');
									   	$dialog.dialog('close');
				  					}; 
				  				}
							}); 
						}
					});
				}
		};
	//截取坐标点
	function splitstr(onept){
		var one;
		if (onept.indexOf("|") > 0) {
			one=onept.split("|")[0];
		}
		else{
			one=onept;
		}
		return one;
	}
	//根据地图计算公里数

var map = new BMap.Map("allmap");
  function sumdistance(start,end,type){
	var options = {
	onSearchComplete : function(results) {
		if (driving.getStatus() == BMAP_STATUS_SUCCESS) {
			// 获取第一条方案
			var plan = results.getPlan(0);
			lc=plan.getDistance(false);
			sum(lc,type);

		}
	}
};
var driving = new BMap.DrivingRoute(map, options);
    slng = start.split(",")[0];// 分割
	slat = start.split(",")[1];
	elng = end.split(",")[0];
	elat = end.split(",")[1];// end
driving.search(new BMap.Point(slng, slat), new BMap.Point(elng, elat));
  }

function sum(lc,type){
 if(lc >= 0){
      lc = (lc / 1000).toFixed(1);//公里 = 米 / 1000
      $("#Mileage_"+type).val(lc);
 }
}
</script>
<body class="easyui-layout">
	<div id="mainPanle" region="center" style="background: #fff;">
	<form id="frmInfo">
	<table  class="tableclass">
	<tr>
		<th colspan="6">基本信息</th>
	</tr>
	<tr>
		<td>
		  	<label><font color="red">*&nbsp;</font>班线名称</label>
		</td>
		<td class="td2">
		  	<input type="text" id="classlineName" name="classlineName" placeholder="" datatype="n6-16"  class="inputxt validate[required]"/>
		</td>
		<td>
			<label><font color="red">*&nbsp;</font>班线编码</label>
		</td>
		<td class="td2">
			<input type="text" id="classlineCode" name="classlineCode" placeholder="可输入自定义班线编码" class="validate[required]"/>
		</td>
		<td>
			<label><font color="red">*&nbsp;</font>所属机构</label>
		</td>
		<td class="td2">
			<input id="cc" name="organizationId" style="width: 158px;" class="validate[required]">
		</td>
	</tr>
	<tr>
		<td><label><font color="red">*&nbsp;</font>发车时间</label></td>
		<td class="td2">
			<input id="departure_timeId" type="text" name="departure_time" class="Wdate validate[required]" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',skin:'twoer',minDate:'%y-%M-01',maxDate:'%y-%M-{%d+7}'})"  style="width: 158px;"/>
		</td>
		<td><label>绑定车辆</label></td>
		<td class="td2" colspan="3">
			<input type="hidden" id="truck_id" style="width: 500px;"/>
			<input type="hidden" id="truckid" name="car_id">
			<input type="hidden" id="carnum" name="plate_number">
		</td>
		
	</tr>
	<tr>
		<td><label><font color="red">*&nbsp;</font>总运费</label></td>
		<td class="td2"><input type="text" name="all_money" id="all_money" style="text-align: right;" class="validate[required,custom[number],min[1],max[99999999]]"/></td>
		<td colspan="4"><font color="red">注意：</font>当车辆被删除或解绑时，班次不再生成未来发车计划。</td>
	</tr>
	
	</table>
	<hr style="margin-top: 10px;margin-bottom: 10px;width: 98%"/>
	<table id="markers" class="tableclass" cellspacing="0" cellpadding="0">
		<thead>
		<tr>
			<td align="left" colspan="5">
			<label style="font-size: 12px;font-weight: bold;">操作：</label>
				<a id="but_fist" class="btn btn-default btn-sm">
					<i class="glyphicon glyphicon-plus"></i> 设置首点
				</a> 
				<a id="but_pass" class="btn btn-default btn-sm">
					<i class="glyphicon glyphicon-plus"></i> 添加途经站
				</a>
				<a id="but_end" class="btn btn-default btn-sm">
					<i	class="glyphicon glyphicon-plus"></i> 设置终点
				</a>
			</td>
		</tr>
			<tr>
				<th class="th2">站点名称</th>
				<th class="th2">驶到里程</th>
				<th class="th2">驶到用时（分）</th>
				<th class="th2">停留时间（分）</th>
				<th class="th2">操作</th>
			</tr>
		</thead>
		<tbody>

		</tbody>
	</table>
	<hr style="margin-top: 10px;margin-bottom: 10px;width: 98%"/>
	<table id="lines" class="tableclass" cellspacing="0" cellpadding="0">
		<thead>
			<tr>
				<td colspan="3" align="left">
					<label style="font-size: 12px;font-weight: bold;">操作：</label>
					<a id="but_Line" class="btn btn-default btn-sm">
					<i class="glyphicon glyphicon-plus"></i> 绑定行驶线路</a>
				</td>
			</tr>
			<tr>
				<th>行驶线路名称</th>
				<th>线路里程（Km）</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
	<hr style="margin-top: 10px;margin-bottom: 10px;width: 98%"/>
	<table class="tableclass" style="margin-top: 10px;">
			<tr align="center" valign="middle">
				<th align="center" valign="middle" style="height: 30px;" colspan="4">定期信息</th>
			</tr>
			<tr>
				<td><label>定期类型</label></td>
				<td class="td2">
					<input type="radio" id="datetype_1" value="1" checked="checked" name="regular_type">
					<label for="datetype_1" style="margin-right: 10px">按天</label>
					<input  type="radio" id="datetype_2" value="0" name="regular_type">
					<label for="datetype_2">按周</label>
				</td>
				<td><label id="daysId">间隔天数</label><label id="weeklable" style="display: none;">重复周期</label></td>
				<td class="td2">
					<select style="width: 80%" id="selectId" name="days">
						<option value="0" selected="selected">天天发车</option>
						<option value="1">每隔1天发车</option>
						<option value="2">每隔2天发车</option>
						<option value="3">每隔3天发车</option>
						<option value="4">每隔4天发车</option>
						<option value="5">每隔5天发车</option>
						<option value="6">每隔6天发车</option>
					</select>
					
					<label class="repetitionClass">
						<input type="checkbox" id="classweek_1" name="repetition_periods" checked="checked" value="1">
						每逢 周一 发车
					</label>
					<label  class="repetitionClass">
						<input type="checkbox" id="classweek_2" name="repetition_periods" checked="checked" value="2">
						每逢 周二 发车
					</label>
					<label  class="repetitionClass">
						<input type="checkbox" id="classweek_3" name="repetition_periods" checked="checked" value="3">
						每逢 周三 发车
					</label>
					<label  class="repetitionClass">
						<input type="checkbox" id="classweek_4" name="repetition_periods" checked="checked" value="4">
						每逢 周四 发车
					</label>
					<label  class="repetitionClass">
						<input type="checkbox" id="classweek_5" name="repetition_periods" checked="checked" value="5">
						每逢 周五 发车
					</label>
					<label  class="repetitionClass">
						<input type="checkbox" id="classweek_6" name="repetition_periods" checked="checked" value="6">
						每逢 周六 发车
					</label>
					<label  class="repetitionClass">
						<input type="checkbox" id="classweek_7" name="repetition_periods" checked="checked" value="0">
						每逢 周日 发车
					</label>
				</td>
			</tr>
			<tr>
				<td><label>结束类型</label></td>
				<td class="td2" colspan="3">
					<input type="radio" id="endtype_1" checked="checked" value="1" name="end_type" >
					<label for="endtype_1" style="margin-right: 10px;">永不结束</label>
					<input type="radio" id="endtype_2" value="2" name="end_type" >
					<label for="endtype_2" style="margin-right:10px;">发生次数</label>
					<input type="radio" id="endtype_3" value="3" name="end_type" >
					<label for="endtype_3" style="margin-right: 10px;">到达某天</label>
					<label id="end_numId" style="display: none">
					计划发生次数:
					<input type="text"  name="end_num"  placeholder="365" value="365">
					</label>
					<label id="end_dateId" style="display: none">
					结束日期:
					<input type="text"  name="end_date" class="Wdate validate[required]" onfocus="WdatePicker({skin:'twoer'})">
					</label>
				</td>
			</tr>
			<tr>
				<td><label><font color="red">*&nbsp;</font>生效日期</label></td>
				<td class="td2" colspan="3">
					<input id="effective_dateId" type="text" name="effective_date" class="Wdate validate[required]" onfocus="WdatePicker({skin:'twoer',minDate:'%y-%M-01',maxDate:'%y-%M-{%d+30}'})" style="width: 158px;"/>
				</td>
			</tr>
		</table>
	</form>
	</div>
	<div region="east" border="false"  title="显示"  style="width:320px;" id="eastId" data-options="collapsed:false">
	<div class="inbox-preview" id="yulanbox">
				<!-- 开始班线 -->

				<div class="well well-sm">
					<!-- Timeline Content -->
					<div class="classLine smart-timeline">
						<!--<div class="smart-timeline-content no-border padding-5 clearfix">
							<div class="col-xs-6 no-padding">
								计划
							</div>
						</div>-->
						<ul class="smart-timeline-list" id="postlineshow">

						</ul>
					</div>
					<div class="well well-sm no-border no-margin" id="postline_count">
						
					</div>
					<!-- END Timeline Content -->

				</div>
			  	<!-- 结束班线 -->
			</div>
		
	</div>
	<div id="Dialog_F">
		<form id="form_F">
		<table class="tableclass">
			<tr>
				<td>
					<label style="font-size: 13px;vertical-align: middle;" >首站点：</label>
				</td>
				<td class="td2">
					<input type="hidden" id="select_F" name="cityOfLoadingId" style="width: 230px;"/>
					<input type="hidden" id="Markername_F" name="Markername_F"/>
					<input type="hidden" id="Markercode_F" name="Markercode_F"/>
					<input type="hidden" id="Markerid_F" name="Markerid_F"/>
					<input type="hidden" id="lnglat_F" name="lnglat_F"/>
				</td>
			</tr>
		</table>
		</form>
	</div>
	<div id="Dialog_P">
		<form id="form_P">
		<table class="tableclass">
			<tr>
				<td>
					<label style="font-size: 13px;vertical-align: middle;" >途经点：</label>
				</td>
				<td class="td2">
					<input type="hidden" id="select_P" name="cityOfLoadingId" style="width: 230px;"/>
					<input type="hidden" value="" id="Markername_P" name="Markername_P">
					<input type="hidden" value="" id="Markerid_P" name="Markerid_P">
					<input type="hidden" id="order_P" name="order_P">	
					<input type="hidden"  id="Markercode_P" name="Markercode_P">
					<input type="hidden" id="lnglat_P" name="lnglat_P">	

				</td>
			</tr>
			<tr>
				<td><label style="font-size: 13px;vertical-align: middle;" >行驶里程(公里):</label></td>
				<td class="td2"><input type="text" placeholder="行驶里程(公里)" id="Mileage_P" name="Mileage_P" class="validate[required,custom[number],min[1],max[99999999]]">
				<button type="button"  onclick="autoCountMileage('P')">自动计算</button>
				</td>
				
			</tr>
			<tr>
				<td><label style="font-size: 13px;vertical-align: middle;" >行驶时间:</label></td>
				<td class="td2">
					<input type="text" class="validate[required,custom[number],min[0],max[999]]" style="width: 88px;"  value="0" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" onchange="this.value = this.value=='' ? 0: this.value" id="Runtime_P_T" name="Runtime_P_T">
					<label>时</label>
					<input type="text" class="validate[required,custom[number],min[0],max[999]]" style="width: 58px;" value="0" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" onchange="this.value = this.value=='' ? 0: this.value" id="Runtime_P_M" name="Runtime_P_M">
					<label>分</label>
				</td>
			</tr>
			<tr>
				<td><label style="font-size: 13px;vertical-align: middle;" >停留时间:</label></td>
				<td class="td2">
					<input type="text" style="width: 88px;" class="validate[required,custom[number],min[0],max[999]]" value="0" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" onchange="this.value = this.value=='' ? 0: this.value" id="Stoptime_P_T" name="Stoptime_P_T">
					<label>时</label>
					<input type="text" style="width: 58px;" class="validate[required,custom[number],min[0],max[999]]" value="0" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" onchange="this.value = this.value=='' ? 0: this.value" id="Stoptime_P_M" name="Stoptime_P_M">
					<label>分</label>
				</td>
			</tr>
		</table>
		</form>
	</div>
	<div id="Dialog_E">
		<form id="form_E">
		<table class="tableclass">
			<tr>
				<td>
					<label style="font-size: 13px;vertical-align: middle;" >途经点：</label>
				</td>
				<td class="td2">
					<input type="hidden" id="select_E" name="cityOfLoadingId" style="width: 230px;"/>
					<input type="hidden" value="" id="Markername_E" name="Markername_E">
					<input type="hidden" value="" id="Markerid_E" name="Markerid_E">
					<input type="hidden" id="order_E" name="order_P">	
					<input type="hidden"  id="Markercode_E" name="Markercode_E">
					<input type="hidden" id="lnglat_E" name="lnglat_E">	

				</td>
			</tr>
			<tr>
				<td><label style="font-size: 13px;vertical-align: middle;" >行驶里程(公里):</label></td>
				<td class="td2"><input type="text" placeholder="行驶里程(公里)" id="Mileage_E" name="Mileage_E" class="validate[required,custom[number],min[1],max[99999999]]">
				<button type="button"  onclick="autoCountMileage('E')">自动计算</button>
				</td>
			</tr>
			<tr>
				<td><label style="font-size: 13px;vertical-align: middle;" >行驶时间:</label></td>
				<td class="td2">
					<input type="text" style="width: 88px;" class="validate[required,custom[number],min[0],max[999]]"  value="0" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" onchange="this.value = this.value=='' ? 0: this.value" id="Runtime_E_T" name="Runtime_E_T">
					<label>时</label>
					<input type="text" style="width: 58px;" class="validate[required,custom[number],min[0],max[999]]" value="0" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" onchange="this.value = this.value=='' ? 0: this.value" id="Runtime_E_M" name="Runtime_E_M">
					<label>分</label>
				</td>
			</tr>
		</table>
		</form>
	</div>
	<div id="myLine">
		<table class="tableclass">
			<tr>
				<td>
					<label style="font-size: 13px;vertical-align: middle;" >行驶线路：</label>
				</td>
				<td class="td2">
					<input type="hidden" id="Line" name="" style="width: 230px;"/>
					<input type="hidden" id="Linename" name="Linename"/>
					<input type="hidden" id="Lineid" name="Lineid"/>
					<input type="hidden" id="Linemlg" name="Linemlg"/>
				</td>
			</tr>
		</table>
	</div>
<div id="allmap"></div>
</body>
</html>
