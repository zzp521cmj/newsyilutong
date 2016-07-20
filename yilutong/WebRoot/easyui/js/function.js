$(function(){
	var fs;
	//var ff = $(window.parent.document).find("iframes");
	var ff = window.parent.document.getElementById("urlId").value;
	
	//var ss = $(window.parent.document).find("iframe").attr("src");
	$.ajax({
		type : "POST",
		async : false,
		url : 'user.do?method=getFunctions',
		data : {
			url : ff
		},
		success : function(data2) {
			
			fs=data2.split(",");
		}
	});
	for ( var i = 0; i < fs.length; i++) {
		if (fs[i] == "添加") {
			
			$("#tb").append("<a href='javascript:void(0)' class='easyui-linkbutton' id='tbadd' onclick='add()' data-options=\"iconCls:\'icon-add\',plain:true\">添加</a>");
		} else if (fs[i] == "修改") {
			$("#tb").append("<a href='javascript:void(0)' class='easyui-linkbutton' id='tbmodify' onclick='modify()' data-options=\"iconCls:\'icon-edit\',plain:true\">修改</a>");
		} else if (fs[i] == "删除") {
			$("#tb").append("<a href='javascript:void(0)' class='easyui-linkbutton' id='tbdel' onclick='deleteEver()' data-options=\"iconCls:\'icon-remove\',plain:true\">删除</a>");
		}else if (fs[i] == "详细信息") {
			$("#tb").append("<a href='javascript:void(0)' class='easyui-linkbutton' id='tbxinxi' onclick='xiangxixinxi()' data-options=\"iconCls:\'icon-edit\',plain:true\" >详细信息</a>");
		}else if (fs[i] == "导出") {
			$("#tb").append("<a href='javascript:void(0)'class='easyui-linkbutton' id='tbput' onclick='putoutfile()' data-options=\"iconCls:\'icon-output\',plain:true\">导出</a>");
		} else if (fs[i] == "重置密码") {
			$("#tb").append("<a href='javascript:void(0)' class='easyui-linkbutton' id='tbresetpassword' onclick='resetpassword()' data-options=\"iconCls:\'icon-reset\',plain:true\" >重置密码</a>");
		} else if (fs[i] == "导入") {
			$("#tb").append("<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='putoutfile()' data-options=\"iconCls:\'icon-output\',plain:true\">导入</a>");
		}
	}
	$("#tb").append("<a href='#' class='easyui-linkbutton' id='tbreset' onclick='reset()' data-options=\"iconCls:\'icon-reset\',plain:true\">重置</a>");
	$.parser.parse();
})

