<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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

    <title>车辆选择</title>

    <jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="./css/main.css">
    <link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
    <script type="text/javascript" src="./js/select2/select2.js"></script>
    <script type="text/javascript"
            src="./js/select2/select2_locale_zh-CN.js"></script>

    <script type="text/javascript">
        var grid;
        var dialog;
        $(function() {
            $('#cc2')
                    .combotree(
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
                            });
            /* 根据车牌号查询 */
            $("#number_search").select2({
                placeholder : "请选择车辆", //默认文本框显示信息
                minimumInputLength : 1, //最小输入字符长度
                multiple : false, //设置多项选择，false则只能单选
                allowClear : true,
                maximumSelectionSize : 5,
                query : function(query) {
                    $.ajax({
                        type : "POST",
                        url : "travel.do?method=getCarNum",
                        data : {
                            search : query.term
                        }, //传递输入框中的值
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
                }
            });

            /* 初始化页面 */
            grid = $("#dg").datagrid(
                    {
                        url : 'createA.do?method=getTravel',
                        border : false,
                        rownumbers : true,
                        idField : 'driver_id',
                        fit : true,
                        singleSelect : true,
                        selectOnCheck : true,
                        checkOnSelect : true,
                        columns : [ [ {
                            field : 'ck',
                            checkbox : true
                        }, {
                            field : 'plateNumber',
                            title : '车牌号码',
                            width : 80
                        }, {
                            field : 'carOwner',
                            title : '所有人',
                            width : 80
                        }, {
                            field : 'driverName',
                            title : '司机姓名',
                            width : 120,
                            formatter : function(val, row, index) {
                                if (val == null) {
                                    return "没有绑定司机";
                                }else{
                                    return val;
                                }
                            }
                        }, {
                            field : 'user_idcard',
                            title : '身份证',
                            width : 120
                        },

                            {field : 'departmentId',title : '所属部门',width : 140,

                                formatter:function(val,row,index){
                                    $.ajax({
                                        type: "POST",
                                        async : false,
                                        url:'user.do?method=getDepartment',
                                        data:{did:val},
                                        success:function(data){
                                            da=data;
                                        }
                                    });
                                    val = da;
                                    return val;
                                } },
                            {
                                field : 'phoneNumber',
                                title : '司机手机号',
                                width : 120
                            }, {
                                field : 'address',
                                title : '地址',
                                width : 160
                            }, {
                                field : 'carLength',
                                title : '车长',
                                width : 80,
                            }, {
                                field : 'length_name',
                                title : '厢型',
                                width : 80
                            }, {
                                field : 'tonnage',
                                title : '吨位',
                                width : 80,
                            }, {
                                field : 'carType',
                                title : '车辆类型',
                                width : 80,
                                formatter : function(val, row, index) {
                                    if (val == "A") {
                                        return "市内车";
                                    } else if (val == "B") {
                                        return "班线车";
                                    }
                                }
                            }

                        ] ],
                        onSelect : function(index, data) {
                            $("#driver_id").val(data.travelCardId);
                            $("#plateNumber").val(data.plateNumber);
                            $("#carOwner").val(data.driverName);
                            $("#tels").val(data.phoneNumber);
                            $("#driverid").val(data.driverId);

                        },
                        onLoadSuccess : function() {
                            var carId = $(window.parent.document).find('#company')
                                    .get(0).contentWindow.document
                                    .getElementById('canum');
                            if (carId.value != '' && carId.value != null) {
                                $('#dg').datagrid('selectRecord', carId.value);
                            }
                        },
                        pagination : true,
                        pageSize : 10,
                        pageList : [ 5, 10, 15, 20 ],
                        toolbar : '#tb'
                    });

            document.onkeydown = function(event) {
                e = event ? event : (window.event ? window.event : null);
                if (e.keyCode == 13) {
                    //执行的方法 
                    searchTruck();
                }
            };
        });
        var submitForm = function($dialog, $grid, $pjq, $mainMenu) {
            var company = $(window.parent.document).find('#company').get(0).contentWindow;
            company.document.getElementById('canum').value = $("#driver_id").val();
            company.document.getElementById('car').value = $("#plateNumber").val();
            company.document.getElementById('driver').value = $("#carOwner").val();
            company.document.getElementById('phones').value = $("#tels").val();
            company.document.getElementById('driverid').value = $("#driverid").val();
            $dialog.dialog('close');
            $grid.datagrid('reload');
        };
        /* 查询 */
        function searchTruck() {
            $('#dg').datagrid('load', {
                plateNumber : $.trim($("#number_search").select2("val")),
                did : $.trim($("#cc2").combotree("getValue")),
                carLength:$.trim($("#carLength").val()),
                length_name:$.trim($("#length_name").combobox("getText")),
            });
        }
       //重置
        function reset(){
        $("#number_search").select2("val", "");
        $("#cc2").combotree('setValue', "");
        $("#carLength").val("");
        $("#length_name").combobox('setValue', "");
        }
    </script>
</head>
<body class="easyui-layout">
<form action="shipOrder.do" id="outputform" method="post">
    <div region="north" title="车辆基础信息管理" class="st-north" border="false"
         data-options="collapsible:false">
        <div>
            <lable>车牌号码：</lable>
            <input type="hidden" id="number_search" name="plateNumber"
                   style="width: 140px" />
            <lable class="divlabel">所属机构：</lable>
            <input id="cc2" name="did" style="width: 130px"> 
            <lable>车长:</lable><input type="text" id="carLength" name="carLength">
            <lable>箱型:</lable><input type="text" id="length_name" name="length_name"  class="easyui-combobox">&nbsp;
            
            <a
                class="easyui-linkbutton" onclick="searchTruck()"
                data-options="iconCls:'icon-search'">查询</a>
        </div>
        <!-- <div id="cc">
            <lable>载货状态:</lable><input type="text" id="" placeholder="请选择载货状态">
            <lable>GPS状态:</lable><input type="text" id="" placeholder="全部">
        </div> -->
    </div>

    <div region="center" title="车辆信息列表" region="center"
         style="background:#eee;overflow-y:hidden">
        <table id="dg"></table>
    </div>
    <div id="tb">
        <!--   <a class="easyui-linkbutton" id="tbput" onclick="" data-options="iconCls:'icon-input',plain:true"style="display: none">导入</a> -->
        <!--  <a class="easyui-linkbutton" id="tbhuifang" onclick="" data-options="plain:true"style="display: none">回放</a>
      <a class="easyui-linkbutton" id="tbgenzong" onclick="" data-options="plain:true"style="display: none">跟踪</a>-->
        <!--  <a class="easyui-linkbutton" onclick="tbgongxiang" data-options="plain:true"style="display: none">货运人共享</a> -->
        <a class="easyui-linkbutton" id="tbreset" onclick="reset()"
           data-options="iconCls:'icon-reset',plain:true">重置</a>
    </div>
    <input type="hidden" name="method" value="outShipOrder"> <input
        type="hidden" id="fieldName" name="fieldName"> <input
        type="hidden" id="headtitle" name="headtitle"> <input
        type="hidden" id="driver_id" name="driver_id" /> <input
        type="hidden" id="plateNumber" name="plateNumber" /> <input
        type="hidden" id="carOwner" name="carOwner" /> <input type="hidden"
                                                              id="tels" name="tels" />
    <input type="hidden"
           id="driverid" name="driverid" />
</form>
<input id="functionname" type="hidden" value=${function}>
</body>
</html>
