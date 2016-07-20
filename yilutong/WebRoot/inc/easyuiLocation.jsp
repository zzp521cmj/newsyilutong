<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>

<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	if($.cookie("easyuiTheme")!=null){
		document.write("<link rel='stylesheet' type='text/css' href='"+$.cookie("easyuiTheme")+"' id='easyuiTheme'>");
	}else{
		document.write("<link rel='stylesheet' type='text/css' href='easyui/themes/metro-blue/easyui.css' id='easyuiTheme'>");
	}
</script>
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<script type="text/javascript" src="js/jyExtEasyui.js"></script>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>