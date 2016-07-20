<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String v=(String)request.getAttribute("sp");
%>
<%@ page import="com.jy.model.ShippingManual"%>
<%@ taglib prefix="sp" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html> 
 <head>
    <%-- <base href="<%=basePath%>"> --%>
    
    <title>易路通物流有限公司货物运单打印</title>
    <link href="./images/print.ico" type=image/x-icon rel="shortcut icon"/>
 	<script src="./js/CreateControl.js" type="text/javascript"></script>
 
 <script type="text/javascript" src="./js/GRInstall.js"></script>
 <script type="text/javascript" src="./js/GRUtility.js"></script>
   <script type="text/javascript">
    var c='<%=v%>';
    
    alert(c);
        Install_InsertReport();
function window_onload(){
    ReportViewer.Start();
}
function OnBatchFetchRecord(){
    //在 GRDisplayViewer 的 BatchFetchRecord 事件上向服务器请求每一批次的数据
    
    //找出已取数据最后一条记录的关键字段值，作为下一批取数的筛选条件
    var OrderID = 0;
    if ( !ReportViewer.Report.DetailGrid.Recordset.Eof()){
        ReportViewer.Report.DetailGrid.Recordset.Last();
        OrderID = ReportViewer.Report.FieldByName("OrderID").AsInteger;
    }
    
    //BatchStartRecNo指定本批次数据的起始记录号
    //BatchWantRecords指定一个批次希望获取的记录数
    //用 Ajax 载入分批载入报表数据必须用 HTTP 同步数据请求
	//ReportViewer.Report.LoadDataFromURL("../../11.BatchData/SQL_BatchDataXml.jsp?StartNo=" + ReportViewer.BatchStartRecNo + "&WantRecords=" + ReportViewer.BatchWantRecords + "&OrderID=" + OrderID);
   var c='<%=v%>';
   
    AjaxSyncLoadReportData(ReportViewer.Report, "shipManual.do.do?method=getShipYwm&order_num="+c);
}
    </script>
 </head>


</head>

<body style="margin:0" onload="return window_onload()">
<script type="text/javascript"> 
    //用查询显示控件展现报表，从URL“../grf/1a.grf”获取报表膜板定义，从URL“../data/xmlCustomer.jsp”获取XML形式的报表数据，
	//CreateDisplayViewerEx("100%", "100%", "./grf/Picture.grf", "../data/xmlCustomer.jsp", true, "");
	//CreateDisplayViewerEx("100%", "100%", "../grf/1a.grf", "", true, "");
		    var Installed = Install_Detect();
   
	<%-- var c='<%=v%>';
	Report.LoadFromURL("grf/w.grf");
	Report.LoadDataFromURL("shipOrder.do?method=getShipYwm&order_num="+c); --%>
  	//Report.PrintPreview(true);
	
	    CreateDisplayViewerEx("100%", "100%", "grf/123.grf","", false,
          "<param name=RowsPerPage value=0>" +
          "<param name=BatchGetRecord value=true>" +
          "<param name=BatchWantRecords value=60>" +
          "<param name=OnBatchFetchRecord value='OnBatchFetchRecord'>");

</script>

</body>
</html>
  
