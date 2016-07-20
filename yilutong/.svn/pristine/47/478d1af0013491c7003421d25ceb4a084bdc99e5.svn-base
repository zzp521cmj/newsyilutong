$(function() {
	var fs;
	// var ff = $(window.parent.document).find("iframes");
	var ff = window.parent.document.getElementById("urlId").value;

	// var ss = $(window.parent.document).find("iframe").attr("src");
	$.ajax({
		type : "POST",
		async : false,
		url : 'user.do?method=getFunctions',
		data : {
			url : ff
		},
		success : function(data2) {

			fs = data2.split(",");
		}
	});
	for ( var i = 0; i < fs.length; i++) {
		if (fs[i] == "添加") {
			$("#tb")
					.append(
							"<a href='javascript:void(0)' class='easyui-linkbutton' id='tbadd' onclick='add()' data-options=\"iconCls:\'icon-add\',plain:true\">添加</a>");
		} else if (fs[i] == "修改") {
			$("#tb")
					.append(
							"<a href='javascript:void(0)' class='easyui-linkbutton' id='tbmodify' onclick='modify()' data-options=\"iconCls:\'icon-edit\',plain:true\">修改</a>");
		} else if (fs[i] == "删除") {
			$("#tb")
					.append(
							"<a href='javascript:void(0)' class='easyui-linkbutton' id='tbdel' onclick='deleteEver()' data-options=\"iconCls:\'icon-remove\',plain:true\">删除</a>");
		} else if (fs[i] == "详细信息") {
			$("#tb")
					.append(
							"<a href='javascript:void(0)' class='easyui-linkbutton' id='tbxinxi' onclick='xiangxixinxi()' data-options=\"iconCls:\'icon-edit\',plain:true\" >详细信息</a>");
		} else if (fs[i] == "导出") {
			$("#tb")
					.append(
							"<a href='javascript:void(0)'class='easyui-linkbutton' id='tbput' onclick='putoutfile()' data-options=\"iconCls:\'icon-output\',plain:true\">导出</a>");
		} else if (fs[i] == "重置密码") {
			$("#tb")
					.append(
							"<a href='javascript:void(0)' class='easyui-linkbutton' id='tbresetpassword' onclick='resetpassword()' data-options=\"iconCls:\'icon-reset\',plain:true\" >重置密码</a>");
		} else if (fs[i] == "导入") {
			$("#tb")
					.append(
							"<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='putintfile()' data-options=\"iconCls:\'icon-input\',plain:true\">导入</a>");
		} else if (fs[i] == "绑定车辆") {
			$("#tb")
					.append(
							"<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='bdcar()' data-options=\"iconCls:\'icon-lock\',plain:true\">绑定车辆</a>");
		} else if (fs[i] == "打印") {
			$("#tb")
					.append(
							"<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='dy()' data-options=\"iconCls:\'icon-print\',plain:true\">打印</a>");
		} else if (fs[i] == "一维打印") {
			$("#tb")
					.append(
							"<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='printYWM()' data-options=\"iconCls:\'icon-print\',plain:true\">一维打印</a>");
		} else if (fs[i] == "编辑") {
			$("#tb")
					.append(
							"<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='eidtChange()' data-options=\"iconCls:\'icon-edit\',plain:true\">编辑</a>");
		} else if (fs[i] == "接收") {
			$("#tb")
					.append(
							"<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='dealBack()' data-options=\"iconCls:\'icon-edit\',plain:true\">接收</a>");
		} else if (fs[i] == "寄出") {
			$("#tb")
					.append(
							"<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='dealNotBack()' data-options=\"iconCls:\'icon-edit\',plain:true\">寄出</a>");
		} else if (fs[i] == "取消接收") {
			$("#tb")
					.append(
							"<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='notdealBack()' data-options=\"iconCls:\'icon-remove\',plain:true\">取消接收</a>");
		} else if (fs[i] == "取消寄出") {
			$("#tb")
					.append(
							"<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='notdealNotBack()' data-options=\"iconCls:\'icon-remove\',plain:true\">取消寄出</a>");

		} else if (fs[i] == "查看订单") {
			$("#tb")
					.append(
							"<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='searchMsg()' data-options=\"iconCls:\'icon-edit\',plain:true\">查看订单</a>");
		} else if (fs[i] == "签收") {
			$("#tb")
					.append(
							"<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='searchMsgQs()' data-options=\"iconCls:\'icon-edit\',plain:true\">签收</a>");

		} else if (fs[i] == "核对") {
			$("#tb")
					.append(
							"<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='check()' data-options=\"iconCls:\'icon-edit\',plain:true\">核对</a>");

		} else if (fs[i] == "一键审核") {
			$("#tb")
					.append(
							"<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='shenhe()' data-options=\"iconCls:\'icon-edit\',plain:true\">一键审核</a>");
		} else if (fs[i] == "提货确认") {
			$("#tb")
					.append(
							"<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='affirm()' data-options=\"iconCls:\'icon-edit\',plain:true\">提货确认</a>");
		} else if (fs[i] == "日图") {
			$("#tb")
					.append(
							"<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='day()' data-options=\"iconCls:\'icon-edit\',plain:true\">日图</a>");
		} else if (fs[i] == "周图") {
			$("#tb")
					.append(
							"<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='zhou()' data-options=\"iconCls:\'icon-edit\',plain:true\">周图</a>");
		} else if (fs[i] == "月图") {
			$("#tb")
					.append(
							"<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='yue()' data-options=\"iconCls:\'icon-edit\',plain:true\">月图</a>");
		} else if (fs[i] == "年图") {
			$("#tb")
					.append(
							"<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='nian()' data-options=\"iconCls:\'icon-edit\',plain:true\">年图</a>");
		} else if (fs[i] == "提货") {
			$("#tb")
					.append(
							"<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='dealDelivery()' data-options=\"iconCls:\'icon-edit\',plain:true\">提货</a>");
		} else if (fs[i] == "提审") {
			$("#tb")
					.append(
							"<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='dealtishen()' data-options=\"iconCls:\'icon-edit\',plain:true\">提审</a>");

		} else if (fs[i] == "调整") {
			$("#tb")
					.append(
							"<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='eidtChange()' data-options=\"iconCls:\'icon-add\',plain:true\">调整</a>");

		} else if (fs[i] == "审核") {
			$("#tb")
					.append(
							"<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='shenhe()' data-options=\"iconCls:\'icon-edit\',plain:true\">审核</a>");

		} else if (fs[i] == "制作承运协议") {
			$("#tb")
					.append(
							"<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='createAgreement()' data-options=\"iconCls:\'icon-add\',plain:true\">制作协议</a>");

		} else if (fs[i] == "作废") {
			$("#tb")
					.append(
							"<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='deleteAgreement()' data-options=\"iconCls:\'icon-remove\',plain:true\">作废</a>");

		} else if (fs[i] == "推送协议") {
			$("#tb")
					.append(
							"<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='pushCAMessage()' data-options=\"iconCls:\'icon-ok\',plain:true\">推送协议</a>");

		} else if (fs[i] == "确定车辆") {
			$("#tb")
					.append(
							"<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='quedingcheliang()' data-options=\"iconCls:\'icon-add\',plain:true\">确定车辆</a>");

		} else if (fs[i] == "查看记录") {
			$("#tb")
					.append(
							"<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='chakan()' data-options=\"iconCls:\'icon-edit\',plain:true\">查看记录</a>");

		}else if (fs[i] =="结算") {
			$("#tb").append("<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='settlementYfs()' data-options=\"iconCls:\'icon-edit\',plain:true\">结算</a>");
	
		}else if (fs[i] =="添加理赔单") {
			$("#tb").append("<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='addlp()' data-options=\"iconCls:\'icon-edit\',plain:true\">添加理赔单</a>");
	
		}else if (fs[i] =="提交") {
			$("#tb").append("<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='tijiao()' data-options=\"iconCls:\'icon-edit\',plain:true\">提交</a>");
	
		}

	}
	$("#tb")
			.append(
					"<a href='javascript:void(0)' class='easyui-linkbutton' id='tbreset' onclick='reset()' data-options=\"iconCls:\'icon-reset\',plain:true\">清空查询条件</a>");
	$.parser.parse();
})
