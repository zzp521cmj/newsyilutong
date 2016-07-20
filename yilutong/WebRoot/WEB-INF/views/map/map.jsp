<!-- 
 文件名:map.jsp
创建人:黄清华
类型:jsp
创建日期:
最新修改日期:
 -->
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

<title></title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="css/style3.css" /> 
<jsp:include page="allMap.jsp"></jsp:include>

<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>

<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
<script type="text/javascript" src="./js/select2/select2.js"></script>
<script type="text/javascript"	src="./js/select2/select2_locale_zh-CN.js"></script>
<script type="text/javascript" src="./js/select2/select2_expand.js"></script>
<style type="text/css">
</style>

<style type="text/css">
   .datagrid-row {
        height: 40px;
    } 
</style>

<script type="text/javascript">
var dialog;
var grid;
$(function() {
	grid = $("#dg").datagrid({
		url : 'map.do?method=loadallcarinfo',
		border : false,
		rownumbers : true,
		fit : false,
		singleSelect : true,
		selectOnCheck : true,
		checkOnSelect : true,
		rowStyler: function(index,row){
			return 'background-color:#F8F8F8;color:black;';
		},
		columns : [ [ {
			field : 'state',
			title : '状态',
			width : 35,
			align : 'center',
			formatter : function(val, row, index) {
				if (val == "3"||val=="") {
					return "<div title='离线' style='width: 16px;height: 16px;background:#cccccc; -moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;' ></div>";
				}else{
					return "<div title='在线' style='width: 16px;height: 16px;background:#3E903E; -moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;' ></div>";
				}
			}
		}, {
			field : 'carno',
			title : '车牌号',
			width : 70,
			align : 'center',
			formatter : function(val, row, index) {
				if(row.carid==""||row.carid==null){
					return "<a href='javascript:void(0)' style='color:red' title='本地无此车辆，请注意维护' onclick='showcarofpoint(this,\""+row.carid+"\")'>"+val+"</a>";
				}else{
					return "<a href='javascript:void(0)' onclick='showcarofpoint(this,\""+row.carid+"\")'>"+val+"</a>";
				}
			}
		}, {
			field : 'deptname',
			title : '机构',
			width : 100,
			align : 'center',
			formatter : function(val, row, index) {
					return "易路通配送";
			}
		}, {
			field : 'drivename',
			title : '司机姓名',
			width : 90,
			align : 'center'
		}, {
			field : 'drivenumber',
			title : '司机电话',
			width : 166,
			align : 'center'
		} ] ],
		pagination : true,//分页
		pageSize : 10,
		pageList : [ 5, 10, 15, 20 ],
		toolbar : '#tb'
	});
	
	
	
	$("#ccs").combotree({    
		url: "depn.do?method=getTree&&id=",    
		width: 175,
		onBeforeLoad: function(node, param) {
	        if (node == null) {
	            $('#ccs').combotree('tree').tree('options').url = "depn.do?method=getTree&&id=";//加载顶层节点
	        } else {
	        
	            $('#ccs').combotree('tree').tree('options').url = "depn.do?method=getTree&&id=" + node.id;//加载下层节点
	        }
	      
	       }     
		}); 
	
	$("#number_search").select2({
		placeholder : "请选择车辆",
		minimumInputLength : 1,
		multiple : false,
		allowClear : true,
		query : function(query) {
			$.ajax({
				type : "POST",
				url : "automaticPlan.do?method=getCarInfo",
				data : {
					name : query.term
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
					});
					query.callback(data);
				}
			});
		},
	});
});
	//查询
	function searchcarno() {
		var carno="";
		var dept="";
 		if(null!=$("#number_search").select2("data")){
			carno=$.trim($("#number_search").select2("data").text);
		}
		if(null!=$("#ccs").combotree("getText")){
			dept=$("#ccs").combotree("getText");
		}
 	 $("#dg").datagrid('load',{
			carno:carno,
			dept:dept,
			ydh:$("#ydh").val()
 		});	 
	}
	
	function cleanall(){
		$("#number_search").select2("val","");
		$('#ccs').combotree("clear");
	}
	function showcarofpoints(e,carid){
		alert(carid);
	}
</script>

<style type="text/css">
input[type=checkbox], input[type=radio]{
vertical-align: text-bottom;
appearance: none;
    width: 16px;
    height: 16px;
    margin: 0;
    cursor: pointer;
    background: #fff;
    border: 1px solid #dcdcdc;
    -webkit-border-radius: 1px;
    -moz-border-radius: 1px;
    border-radius: 1px;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    position: relative;
}

</style>
</head>

<body>
	<div class="easyui-layout" data-options="fit: true">
		<div region="west" border="false" split="false" title="检索信息"
			class="cs-west" style="width:300px;overflow: hidden;" id="westId">
			<!-- <a href="javascript:void(0) " onclick="showcarofpoint(this)">鲁Ae3245</a> -->
			<div id="cks"></div>
			<div id="alls">
				<table id="mytables">
					<tr>
						<td>车牌号：</td>
						<td><input type="hidden" id="number_search"
							style="width: 175px;height: 25px;" /></td>
					</tr>
					<tr>
						<td>
						所属机构:
						</td>
						<td><input id="ccs" style="width: 175px"></td>
					</tr>
					<tr>
						<td>
						运单号:
						</td>
						<td><input id="ydh" style="width: 175px"></td>
					</tr>
					<tr>
						<td></td>
						<td><button class="bts" onclick="searchcarno()">搜索</button>
							<button class="bts" onclick="cleanall()">重置</button>
						</td>
					</tr>
				</table>
			</div>
			<div id="ck"></div>
			<div id="dgs">
					<table style="width: 100%;height: 100%" id="dg" title="车辆信息"  data-options=" loadMsg:'拼命加载中,请稍后……'"></table>
			</div>
		</div>
		<div data-options="region: 'center', border: false">
			<div class="easyui-layout" data-options="fit:true">
				<div data-options="region:'north',border:false"
					style="height:28px;background-color: #FAFAFA;border-bottom: 2px solid #ccc;">
					<div class="easyui-toolbar dialog-toolbar toolbar toolbar-f"
						style="width: auto; height: auto;border: 0px"></div>
					<div class="optionpanel" style="margin-top: 3;">
						<label style="margin-left: 79%;">地图主题：</label> <select style="border: 1px solid #ccc;  margin-top: -2px;" id="stylelist"
							onchange="changeMapStyle(this.value)"></select>
					</div>
				</div>
				<div id="ct" data-options="region:'center',border:false">
					<div id="sele">
						<input style="width: 100px;" type="text" id="cxtj" /><input class="button"
							type="button" id="qdcx" value="查询" />
					</div>
					<div id="menushow" align="left"><div id="gnf">功能</div><div id="sfdt" class="menusclick"
							style="border: 1px solid #c7c7c7;">
							<img class="menuimg" title="缩放地图或清空查询信息" alt="缩放地图" src="images/all.png"
								height="20px" width="20px">
						</div>
						<div class="menusclick" onclick="myDis.open()">
							<img class="menuimg" title="地图测距" alt="地图测距" src="images/cj.png"
								height="20px" width="20px">
						</div>
						<div id="hkqc" class="menusclick">
							<img class="menuimg" title="画框取车" alt="画框取车"
								src="images/cpqc.png" height="20px" width="20px">
						</div>
						<div id="tz" class="menusclick">
							<img class="menuimg" title="拖动地图" alt="拖动地图"
								src="images/td.png" height="20px" width="20px">
						</div>
						<div id="lkqh" align="center" class="menusclick2">路况</div>
						</div>
					
					<div id="wxdtdiv">
						<input type="hidden" id="pdwd" value="卫星">
					</div>

					<!--百度地图容器-->
					<div id="dituContent"></div>
					<!-- 					主页选项卡div -->
					<div id="max">
						<div id="bigndiv">
							<span id="bigmapleave"></span> <img id="sm" alt="关闭"
								src="images/close.png" width="10px" height="10px">
						</div>
						<!-- .slideThree -->
						<div id="one">
							<span style="display: none;">是否以聚合方式显示:</span>
							<div class="jh" style="display: none;">
								<div class="slideThree">
									<input type="checkbox" value="None" id="slideThree"
										name="check" checked /> <label for="slideThree"></label>
								</div>
							</div>
							<!-- end .slideThree -->
						</div>
						<div id="two">
							显示车牌<span
								style="font-size: 12px;font-family: '微软雅黑';font-weight: bolder;">(地图级别大于11)</span>：&nbsp;
							<div class="jh2" style="    margin-top: -24;">
								<div class="slideThree2">
									<input type="checkbox" value="None" id="slideThree2"
										name="check" /> <label for="slideThree2"></label>
								</div>
							</div>
						</div>
						<div
							style="margin: 10px 0 0 10px;font-family: '微软雅黑';font-weight: 400px;font-size: 13px;display: none">
							<span class="cart"><input id="xs" type="checkbox"
								checked="checked">行驶<span class="carcolor" title="地图中绿色箭头即为行驶" style="background-color: #05FD0A"></span>(<span id="xssl">0</span>)</span> <span class="cart">
								<input id="jz" type="checkbox" checked="checked">静止<span class="carcolor"  title="地图中橙色箭头即为静止"  style="background-color: #F9E442"></span>(<span id="jzsl">0</span>)
							</span> <span class="cart"><input id="lx" type="checkbox"
								checked="checked">离线<span class="carcolor"  title="地图中白色箭头即为离线"    style="background-color: #D0E2D2"></span>(<span id="lxsl">0</span>)</span>
						</div>
						<div id="thr">
							<input type="checkbox" id="fzsta" style="display: none" disabled="disabled">车数显示<br />
							<div id="qzd">
								<span class="cartype"><input  id="zc"  type="checkbox" checked="checked" readonly="readonly" disabled="disabled">车辆总数(<span id="zcsl">0</span>)</span>
								<span class="cartype"><input  id="qc"  type="checkbox">图载车辆(<span id="qcsl">0</span>)</span>
							</div>
						</div>
						<span style="margin-left: 13px;">标注点显示(地图级别大于10)：</span>
						<div id="four">
							<input style="margin-left: 10px;margin-right: 8px;display: none;" id="loadzd" type="checkbox" onclick="updateloadtype()" checked="checked"><input style="margin-left: 80px;margin-right: 8px;display: none;" id="loadzdname" type="checkbox">
							<input style="margin-left: 10px;margin-right: 8px;" id="loadsfz" type="checkbox" checked="checked">显示<span id="thisname">收费站</span><input type="button" class="gbxs" id="gbxs" value="修改" style="  margin-left: -57;"><br> 
							<!-- <input style="margin-left: 10px;margin-right: 8px;" type="checkbox">XXXXX<br>
							<input style="margin-left: 10px;margin-right: 8px;" type="checkbox">XXXX<br>
							<input type="text" id="hidecarno"> -->
						</div>
						<input style="margin-left: 10px;" type="checkbox" id="onlyzd">仅显示站点
					</div>

					<!-- 					div地图级别显示 -->
					<div align="center" id="min"></div>
					<!-- 修改查询信息的div -->
					<div id="cxxx">
						<div id="cxxxhd">修改查询信息<span id="closexg" style="  margin-left: 90px;cursor: pointer;">×</span></div>
						<div id="connet">
							<input type="text" id="tname">
							<input type="button"  class="gbxs"  id="tjname" value="提交" style="  height: 29px;    top: 8;  margin-right: -20;">
						</div>
					</div>
					<div id="resultall">
						<div id="resulthead">
							&nbsp;车辆信息 
							<input id="outstart" style="margin-left:79%;border: 1px solid white;  background-color: white;  cursor: pointer;" type="button" value="导出" /> 
								<img id="resimg" alt="关闭" src="images/close.png"width="10px" height="10px">
							<div id="result">
								<table id="restable">
									<tr style="background-color: white;">
										<td>车号</td>
										<td>设备号</td>
										<td>状态</td>
										<td>机构</td>
										<td>位置</td>
										<td>定位时间</td>
										<td>司机姓名</td>
										<td>司机电话</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<form action="map.do?method=outjsontoexcel" method="post" id="outjsonfrom">
	<input id="outjson" name="outjson" value=""/>
	</form>
<!--  form表达隐藏域 
<form name="cargzform" id="cargzform" method="post" action="">
	<input type="hidden" id="gzhidvalue" name="gzhidvalue" value=""/> 
</form>
<form name="carhfform" id="carhfform" action="">
	<input type="text" id="gfhidvalue" name="gfhidvalue" value="">
</form> -->
</body>
<script type="text/javascript" src="mapjs/S-all-jg-mappub.js"></script>
<script type="text/javascript" src="mapjs/mapjsforflash.js"></script>
<script type="text/javascript" src="mapjs/S-all-addpy.js"></script>
</html>
