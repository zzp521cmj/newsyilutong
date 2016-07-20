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
    <% User user=(User)request.getSession().getAttribute(SessionInfo.SessionName);%>
    <title>My JSP 'monitorSet.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	 <link rel="stylesheet" href="./bootstrap/css/bootstrap.css" type="text/css"></link>
     <link rel="stylesheet" href="./bootstrap/css/bootstrap-switch.css" type="text/css"></link>
     <script type="text/javascript" src="./easyui/jquery.min.js"></script>
      <script type="text/javascript" src="./bootstrap/js/bootstrap.min.js"></script>
	  <script type="text/javascript" src="./bootstrap/switch/bootstrap-switch.js"></script>
	   <script type="text/javascript" src="./bootstrap/js/npm.js"></script>
 	<style type="text/css">
 		.dl-horizontal dt .switch{
		  float: left;
		  width: 80px;
		  overflow: hidden;
		  clear: left;
		  text-align: right;
		  text-overflow: ellipsis;
		  white-space: nowrap;
		  height: 20px;
		}
		.bootstrap-switch .bootstrap-switch-handle-off.bootstrap-switch-primary, .bootstrap-switch .bootstrap-switch-handle-on.bootstrap-switch-primary {
		background-image: -webkit-linear-gradient(top,#ccc,#08c);
		}
		.bootstrap-switch .bootstrap-switch-handle-off.bootstrap-switch-primary, .bootstrap-switch .bootstrap-switch-handle-on.bootstrap-switch-primary{
		}
		.bootstrap-switch .bootstrap-switch-container{
		width: 30px;
		}
		.bootstrap-switch-label{
		width:30px;
		}
		.badge{
		  display: inline-block;
		  min-width: 10px;
		  padding: 3px 7px;
		  font-size: 12px;
		  font-weight: bold;
		  line-height: 1;
		  color: #fff;
		  text-align: center;
		  white-space: nowrap;
		  vertical-align: baseline;
		  border-radius: 10px;
		}
		span.badge.switch{}
		.btn-lg{
		padding: 5px;
		}
 	</style>
 </head>
  <script type="text/javascript">
  	$(function(){
    		
  		 var depart=<%=user.getDid()%>
  		 	$.ajax({
  			type: "POST",
  			async : false,
  			url:'depn.do?method=getDepn',
  			data:{department_id:depart},
  			success:function(data){
  			$("#cc2").val(data.department_name);
  			}
  		});
  		/*  $('#cc2').combotree(
						{
							url : "depn.do?method=getTree&&id=",
							width : 150,
							onBeforeLoad : function(node, param) {

								if (node == null) {
									$('#cc2').combotree('tree').tree('options').url = "depn.do?method=getTree&&id=";//加载顶层节点
								} else {

									$('#cc2').combotree('tree').tree('options').url = "depn.do?method=getTree&&id="
											+ node.id;//加载下层节点
								}

							}
						}); */
  			 $.ajax({
						url: "smonitor.do?method=getMonitorSet",
						type: "POST",
			  				success:function(data){
			  					if(data.smonitor_line==1){
			  					$("#switch-state").attr('checked',true); 
			  					}
			  					if(data.smonitor_distance==1){
			  					$("#switch-state1").attr('checked',true);
			  					}
			  					 if(data.smonitor_point==1){
			  					$("#switch-state2").attr('checked',true);
			  					}
			  					 if(data.smonitor_trantime==1){
			  					$("#switch-state3").attr('checked',true);
			  					}
			  					 if(data.smonitor_cartime==1){
			  					$("#switch-state4").attr('checked',true);
			  					}
			  					 if(data.smonitor_pointtime==1){
			  					$("#switch-state5").attr('checked',true);
			  					}	
  							$("[name='switch']").bootstrapSwitch();
  							
  						}
					}); 
					
/* 	$("#mySwitch").on('switch-change', function (e, data) {
		alert("aaa");
	/*     var $el = $(data.el), 
	    value = data.value;
	    console.log(e, $el, value); 
		}); */	
		 $("[data-switch-get]").on("click", function() {
		    var xl=$("#switch-state").bootstrapSwitch("state");
		    var jl=$("#switch-state1").bootstrapSwitch("state");
		    var	tkd=$("#switch-state2").bootstrapSwitch("state");
		    var fysj=$("#switch-state3").bootstrapSwitch("state");
		    var clyx=$("#switch-state4").bootstrapSwitch("state");
		    var jdzy=$("#switch-state5").bootstrapSwitch("state");
     			 $.ajax({
						url: "smonitor.do?method=dealMonitorSet",
						type: "POST",
						data:{xl:xl,
						jl:jl,
						tkd:tkd,
						fysj:fysj,
						clyx:clyx,
						jdzy:jdzy},
						success:function(data){			
						if (data.flag) {
									parent.$.messager.alert("监控报警设置","监控报警设置成功",'info');
									}	
							}
						});
     });
  
  	});
  	
  	function canel(){
  		var myform=document.forms[0];
  		myform.action="smonitor.do?method=getMonitorSetInfo";
  		myform.submit();
  	}
  </script>
  
  
  <body style="padding: 30px">
  		<div class="panel panel-default">
  		
  		<h3  style="margin-left: 20px;font: 18px/21px 'Microsoft YaHei',微软雅黑,Helvetica,Arial,sans-serif;">监控报警设置</h3>
  		<hr style="margin-bottom: 15px">
  		<div style="margin-bottom: 15px">
  		<label>机构：</label><input id="cc2" >
  		</div>
 		 <div class="panel-heading" style="height:60px">
	  			
		  </div>
  		</div>
    	<form action="smonitor.do" method="post" id="form1">
    	<fieldset>
  		<div class="panel-bodys">
  			<div class="form-horizontal">
			<div class="form-group" style="margin-top: 15px;">
			<div class="col-sm-4" >
			  <ul class="list-group">
				  <li class="list-group-item list-group-item-success">
				 	<input style="margin-right: 15px;"type="checkbox" />
				   			线路监控
				    
			   			<span   class="badge switch" style="height:20px;">
					    	<input name="switch"  id="switch-state"  style="width:28px" type="checkbox"  data-size="mini" />
							</span>
			 	 </li>
				  <li class="list-group-item list-group-item-info">
				  <input style="margin-right: 15px;"type="checkbox" />
				 	距离监控
				 	<span  class="badge switch"  style="height:20px;">
					    	<input id="switch-state1"name="switch"  style="width:28px" type="checkbox" data-size="mini" />
							</span>
				  </li>
				  <li class="list-group-item list-group-item-warning">
				  <input style="margin-right: 15px;"type="checkbox"  />
				 	停靠点监控
				    <span class="badge switch"  style="height:20px;">
					    	<input id="switch-state2"name="switch"  style="width:28px" type="checkbox"  data-size="mini" />
							</span>
				  
				  </li>
				  <li class="list-group-item list-group-item-danger">
				  <input style="margin-right: 15px;"type="checkbox" />
				  	发运时间报警
				   <span  class="badge switch"  style="height:20px;">
					    	<input id="switch-state3" name="switch" style="width:28px" type="checkbox"  data-size="mini" />
							</span>
				  </li>
				  <li class="list-group-item list-group-item-info">
				  <input style="margin-right: 15px;"type="checkbox"  />
				  
				  	车辆运行时间报警
				    <span  class="badge switch"  style="height:20px;">
					    	<input id="switch-state4"name="switch" style="width:28px" type="checkbox"  data-size="mini" />
							</span>
				  </li>
				  <li class="list-group-item list-group-item-success">
				  <input style="margin-right: 15px;" type="checkbox"  />
				  	节点作业时间报警
				   <span  class="badge switch"  style="height:20px;">
					    	<input id="switch-state5" name="switch" style="width:28px" type="checkbox"  data-size="mini" />
					</span>
				  
				  </li>
			  </ul>
			  </div>
			<div class="col-sm-8" ></div>
			</div>
		</div>
 		</div>
		  </fieldset>
		</form>
		  <div class="panel-footer"style="margin-top: 15px;height:60px"> 
		  <hr>
		  	 <div class="col-sm-9 "></div>
	  			<div class="col-sm-1 ">
	  				  <button type="submit" data-switch-get="state" id="buttons3" class="btn btn-primary"   data-toggle="popover" title="Popover title" data-content="">
	  				<span class="glyphicon glyphicon-floppy-disk"  aria-hidden="true"></span>保存</button>
	  				
	  			</div>
	  			<div class="col-sm-2">
	  				<button class="btn btn-default" style="padding: 7px;width: 60px"onclick="canel()"type="submit">
	  				取消</button>
	  			</div>
		  </div>
  </body>
</html>
