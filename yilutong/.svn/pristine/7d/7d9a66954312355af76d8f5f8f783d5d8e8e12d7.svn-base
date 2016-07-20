<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.jy.model.PostClassLineInfo;" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>查看详细班线信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="./css/main.css">
	
<style type="text/css">
	.tableclass tr td{
		height: 28px;
	}
</style>
<script type="text/javascript">
	
</script>
  </head>
<%--   <%List<PostClassLineInfo> postClassLineInfo=request.getAttribute("postClassLineInfo"); %>
 --%>  <body>
  <fieldset>
  	<table class="tableclass">
			<tr>
				<th colspan="2">基本信息</th>
			</tr>
			<tr>
				<td><label>班线名称：</label></td>
				<td class="td2"><label>${postClassline.classlineName}</label></td>
			</tr>
			<tr>
				<td><label>班线编码：</label></td>
				<td  class="td2"><label>${postClassline.classlineCode}</label></td>
			</tr>
			<tr>
				<td><label>所属机构：</label></td>
				<td  class="td2"><label>${postClassline.organizationName}</label></td>
			</tr>
			<tr>
				<td><label>首站点：</label></td>
				<td  class="td2"><label>
				${postClassline.postClassLineInfo.shouzhandian}
				</label></td>
			</tr>
			<tr>
				<td><label>途经点：</label></td>
				<td  class="td2"><label>
				${postClassline.postClassLineInfo.passdian}
				</label></td>
			</tr>
			<tr>
				<td><label>到达站点：</label></td>
				<td  class="td2"><label>
				${postClassline.postClassLineInfo.endzhandian}
				</label></td>
			</tr>
			<tr>
				<td><label>运行时间(分钟)：</label></td>
				<td  class="td2"><label>
				${postClassline.postClassLineInfo.site_run}
				</label></td>
			</tr>
			<tr>
				<td><label>计算总里程(公里)：</label></td>
				<td  class="td2"><label>
				${postClassline.postClassLineInfo.site_mlg}
				</label></td>
			</tr>
			<tr>
				<td><label>绑定线路：</label></td>
				<td  class="td2"><label>
				${postClassline.classLineToLinstandard.linname}</label></td>
			</tr>
			<tr>
				<td><label>发车时间：</label></td>
				<td  class="td2"><label>${fn:substring(postClassline.departure_time, 0, 16)}</label></td>
			</tr>
			<tr>
				<td><label>车牌号：</label></td>
				<td  class="td2"><label>${postClassline.plate_number}</label></td>
			</tr>
			<tr>
				<td><label>生效开始日期：</label></td>
				<td  class="td2"><label>${postClassline.effective_date}</label></td>
			</tr>
			<tr>
				<td><label>生效结束日期：</label></td>
				<td  class="td2"><label>${postClassline.end_date==null||postClassline.end_date==''?'永不结束':postClassline.end_date}</label></td>
			</tr>
			<tr>
				<td><label>最后更新日期：</label></td>
				<td  class="td2"><label>${fn:substring(postClassline.update_datetime, 0, 16)}</label></td>
			</tr>
	</table>
  </fieldset>
  </body>
</html>
