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

<title>自动计划管理添加页面</title>

    <jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
    <jsp:include page="/inc/incbootstrap.jsp"></jsp:include>
   	<jsp:include page="/inc/incselect2.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="./css/main.css">
      <script type="text/javascript" src="./js/Validform/Validform_v5.3.2_min.js"></script>
    
     <script type="text/javascript" src="js/json2.js"></script>
	<style type="text/css">
		.table-bordered{
/* 			border: 1px solid blue;
 */			width: 100%;
		}
		.table-bordered thead tr th{
			border: 1px solid blue;
			
		}
		.well-sm{
			padding:1px;
		}
		.repetitionClass{
			display: none;
			margin-top: 5px;
		}
		.tableclass .td2{
			padding:8px 0px 8px 10px;
		}
	</style>
<link rel="stylesheet" href="./js/icheck/skins/flat/blue.css" type="text/css"></link>
<script type="text/javascript" src="./js/icheck/icheck.js"></script>

</head>

<script type="text/javascript">
var isupdate = updateid = 0;
var Startsite={};//首点
var Endsite={};//终点
var Passsite={};//途经点
var Lines={};//线路
var Line_default = 1;//行驶线路默认
var Order = 0;//途经点个数
/* var parms = $ips.getUrlParams();
 */var chooseId = null;
var selectids = '';
var submitForm = function($dialog, $grid, $pjq) {
		$pjq.messager.confirm('新增发车计划表','确定要新增发车计划表吗?',function(r){   
	    	if (r){
				$.ajax({
					type: "POST",
		  			url:'automaticPlan.do?method=addclassplan',
		  			data:$('#frmInfo').serialize(),
		  			success:function(msg){
		  				if(msg.flag){
		  					$pjq.messager.alert('新增发车计划表','新增发车计划表成功','info');
						   	$grid.datagrid('reload');
						   	$dialog.dialog('close');
		  				};
		  			}
				});
			}
		});
	};
$(function(){
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
$("#planname_s").select2({
	    placeholder: '请选择班线',  
	    minimumInputLength: 2,  
	    multiple:false,  
	    allowClear : true,
	    //数据加载
	    query: function (query){
	      $.ajax({
				   type: "POST",
				   url: "automaticPlan.do?method=getclassline",
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
			$("#planname").val(f.object.text);		
			$("#postlineid").val(f.object.id);
			showpostline(f.object.id);
	}); 
$("#truck_id").select2({  //自动完成
		placeholder: "请选择车辆",
		minimumInputLength: 1,  
	    multiple:false,  
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
			$("#truckid").val(f.object.id);
			$("#carnum").val(f.object.text);
/* 			$("#truckpk").val(f.object.truckpk);
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
});

function showpostline(lineid){
	if(lineid){
	$.ajax({
  		  	url: 'postline.do?method=getSelectPostLine',
  		  	data:{pid:lineid},
  		  	success:function(data){
  		  		var data=$.parseJSON(data);
  		  		$.each(data.postClassLineInfo,function(i,item){
  		  			if(item.siteflag == 1){
						Startsite.site_name = item.site_name;
						Startsite.site_id = item.remarkId;
						Startsite.site_code = item.site_code;
						Startsite.lnglat = item.lnglat;
					}else if(item.siteflag == 0){
						Endsite.site_name = item.site_name;
						Endsite.site_id = item.remarkId;
						Endsite.site_run = item.site_run;
						Endsite.site_mlg = item.site_mlg;
						Endsite.site_code = item.site_code;
						Endsite.lnglat = item.lnglat;
					}else{
						var Pass = {};
						Pass.site_name = item.site_name;
						Pass.site_id = item.remarkId;
						Pass.site_run = item.site_run;
						Pass.site_mlg = item.site_mlg;
						Pass.site_stop = item.site_stop;
						Pass.site_order = item.site_order;
						Pass.site_code = item.site_code;
						Pass.lnglat = item.lnglat;
						Order = item.site_order;
						Order = parseInt(Order)+1;
						Passsite[Pass.site_order] = Pass;
					}
  		  		});
  		  		addHtmlMarker();
  		  	}
  		});
  	}
}
function addHtmlMarker(){
	$('#markers tbody tr').remove();
	var postline_show = '';
	var postline_mlg = 0;
	var postline_time = 0;
	if(Startsite.site_id){
		postline_show += '<li class="special">  <div class="smart-timeline-icon">  </div>'
					   +' <div class="smart-timeline-arrow"></div> <div class="smart-timeline-time '
					   +'banxian_city padding-5"> '+Startsite.site_name+'  </div> <div '
					   +'class="smart-timeline-content clearfix"> <div class="col-xs-12 padding-5 bg-color-white">'
					   +'<i class="fa fa-arrow-circle-o-down"></i> 00:00 	</div> </div> </li>';
	}
	var passnum = 0;
	var stopnum = 0;
	$.each(Passsite, function(i, item) {
		if(item.site_id){
			passnum ++;
			postline_mlg += Number(item.site_mlg);
			postline_time += Number(item.site_run);
			var pintime =  timetoday(postline_time);
			postline_time += Number(item.site_stop);
			var pouttime =  timetoday(postline_time);
			stopnum += Number(item.site_stop);
			postline_show += '<li> <div class="smart-timeline-content no-border row"> 	<div class="col-xs-12 padding-5"> <i class="fa fa-clock-o"></i> '+item.site_run+'分钟 	</div> </div> <div class="smart-timeline-icon"> 	 </div> <div class="smart-timeline-arrow"></div> <div class="smart-timeline-time banxian_city padding-5"> '+item.site_name+'  </div> <div class="smart-timeline-content clearfix"> 	<div class="col-xs-12 padding-5 bg-color-white"> <p><i class="fa fa-angle-double-down"></i>'+pintime+' </p> <p><i class="fa fa-dot-circle-o"></i> '+item.site_stop+'分钟 </p> <i class="fa fa-angle-double-down"></i> '+pouttime+' 	</div> </div> </li>';
		}
	});
	if(Endsite.site_id){
		postline_mlg += Number(Endsite.site_mlg);
		postline_time += Number(Endsite.site_run);
		var pintime = timetoday(postline_time);
		postline_show += '<li class="special s2"> <div class="smart-timeline-content no-border row"> <div class="col-xs-12 padding-5"> <i class="fa fa-clock-o"></i> '+Endsite.site_run+'分钟 </div> </div> <div class="smart-timeline-icon"></div> <div class="smart-timeline-arrow"></div> <div class="smart-timeline-time banxian_city padding-5">'+Endsite.site_name+'</div> <div class="smart-timeline-content padding-5 bg-color-white"> 	<i class="fa fa-arrow-circle-o-down"></i> '+pintime+' </div> </li>';
	}
	var postline_count = "<h6>途经站："+passnum+"站</h6><h6>总里程："+postline_mlg+"公里</h6><h6>总耗时："+parseInt(postline_time/60)+"小时"+(postline_time%60)+"分</h6><h6>停留总耗时："+parseInt(stopnum/60)+"小时"+(stopnum%60)+"分</h6>";

	$('#postlineshow').html(postline_show);
	$('#postline_count').html(postline_count);
}
function timetoday(time){
	var rtime = '';
	var tcount = parseInt(time/1440)+1;
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
function mintohours(min){
	var min = Number(min);
	var min_r = min%60;
	var hours = "00";
	var minute = min_r;
	if(min > 60){
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

</script>
<body class="easyui-layout">
	<div id="mainPanle" region="center" style="background: #fff;">
	<form id="frmInfo">
		<table class="tableclass">
			<tr align="center" valign="middle">
				<th align="center" valign="middle" style="height: 30px;" colspan="4">基本信息</th>
			</tr>
			<tr>
				<td><label>班线名称</label></td>
				<td class="td2">
					<input type="hidden" id="planname_s" style="width: 158px;"/>
					<input type="hidden" id="planname" name="classline_name">
					<input type="hidden" id="postlineid" name="classline_id">
				</td>
				<td><label>绑定车辆</label></td>
				<td class="td2">
					<input type="hidden" id="truck_id" style="width: 158px;"/>
					<input type="hidden" id="truckid" name="car_id">
					<input type="hidden" id="carnum" name="plate_number">
				</td>
			</tr>
			<tr>
				<td><label>所属机构</label></td>
				<td class="td2">
					<input id="cc" name="organization_id" style="width: 158px;">
				</td>
				<td><label>班次编码</label></td>
				<td class="td2">
					<input type="text" style="width: 158px;"/>
				</td>
			</tr>
			<tr>
				<td><label>发车时间</label></td>
				<td class="td2">
					<input id="departure_timeId" type="text" name="departure_time" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',skin:'twoer',minDate:'%y-%M-01',maxDate:'%y-%M-{%d+7}'})"  style="width: 158px;"/>
				</td>
				<td class="td2" colspan="2">
				<input  type="checkbox" id="input-1">
              	<label for="input-1" style="margin-right: 5px;">暂不指定车辆</label><br/><br/>
              	<input  type="radio" checked="checked" id="input-2" name="demo-radio">
	            <label for="input-2" style="margin-right: 5px;" >不删除已生成未来发车计划</label>
              	<input  type="radio" id="input-3" name="demo-radio" >
	            <label for="input-3">删除已生成未来发车计划</label>
              	</td>
			</tr>
			<tr>
				<td colspan="4"><font color="red">注意：</font>当车辆被删除或解绑时，班次不再生成未来发车计划。</td>
			</tr>
		</table>
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
					<select style="width: 80%" id="selectId">
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
						<input type="checkbox" id="classweek_7" name="repetition_periods" checked="checked" value="7">
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
					<input type="text"  name="end_date" class="Wdate" onfocus="WdatePicker({skin:'twoer'})">
					</label>
				</td>
			</tr>
			<tr>
				<td><label>生效日期</label></td>
				<td class="td2" colspan="3">
					<input id="effective_dateId" type="text" name="effective_date" class="Wdate" onfocus="WdatePicker({skin:'twoer',minDate:'%y-%M-01',maxDate:'%y-%M-{%d+30}'})" style="width: 158px;"/>
				</td>
			</tr>
		</table>
	</form>
	</div>
	<div region="east" border="false"  title="显示"  style="width:300px;" id="eastId" data-options="collapsed:false">
	<div class="inbox-preview" id="yulanbox">
				<!-- 开始班线 -->

				<div class="well well-sm">
					<!-- Timeline Content -->
					<div class="classLine smart-timeline">
						<div class="smart-timeline-content no-border padding-5 clearfix" >
							<div class="">
								计划
								
							</div>
						</div>
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
	
</body>
</html>
