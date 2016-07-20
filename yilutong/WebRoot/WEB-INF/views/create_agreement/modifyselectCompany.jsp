<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>中专公司选择</title>

    <jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="./css/main.css">
    <link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
    <script type="text/javascript" src="./js/select2/select2.js"></script>
    <script type="text/javascript" src="./js/select2/select2_locale_zh-CN.js"></script>

    <script type="text/javascript">
        var dialog;
        var grid;
        $(function(){
            grid=$("#dg").datagrid({
                url : 'company.do?method=getCompany',
                border : false,
                rownumbers : true,
                fit : true,
                idField:'company_id',
                singleSelect : true,
                selectOnCheck : true,
                checkOnSelect :true,
                multiSort:true,
                columns : [[
                    {field : 'ck',checkbox : true},
                    {field : 'company_name',title : '承运单位',width : 100,align:'center'},
                    {field : 'company_area',title : '承运地区',width : 100,align:'center'},
                    {field : 'company_time',title : '创建时间',width : 100,align:'center'},
                    {field : 'phone',title : '联系电话',width : 100,align:'center'},
                    {field : 'start_people',title : '起始站联系人',width : 100,align:'center'},
                    {field : 'start_phone',title : '起始站联系电话',width : 100,align:'center'},
                    {field : 'start_area',title : '起始站地址',width : 100,align:'center'},
                    {field : 'end_people',title : '到达站联系人',width : 100,align:'center'},
                    {field : 'end_phone',title : '到达站联系电话',width : 100,align:'center'},
                    {field : 'end_area',title : '到货点地址',width : 140,align:'center'},
                ]],
                onSelect:function(index,data){
                    $("#company_id").val(data.company_id);
                    $("#company_name").val(data.company_name);
                    $("#comp_phone").val(data.start_phone);
                    $("#comp_ren").val(data.end_people);
                },
                onLoadSuccess:function(){
                    var id = $(window.parent.document).find('#modifyId').get(0).contentWindow.document.getElementById('compid');
                    if(id.value!=''&&id.value!=null){
                        $('#dg').datagrid('selectRecord',id.value);
                    }

                },
                pagination:true,//分页
                pageSize:10,
                pageList:[5,10,15,20],
                toolbar : '#tb'
            });

            document.onkeydown = function(event) {
                e = event ? event : (window.event ? window.event : null);
                if (e.keyCode == 13) {
                    //执行的方法
                    searchCar_owner();
                }
            };

        });
        $('#cc3').combotree({
            url: "depn.do?method=getTree&&id=",
            width: 150,
            onBeforeLoad: function(node, param) {

                if (node == null) {
                    $('#cc3').combotree('tree').tree('options').url = "depn.do?method=getTree&&id=";//加载顶层节点
                } else {

                    $('#cc3').combotree('tree').tree('options').url = "depn.do?method=getTree&&id=" + node.id;//加载下层节点
                }

            }
        });
        /*
         select框
         */

        $("#carid").select2({
            placeholder: "请输入车牌号",	//默认文本框显示信息
            minimumInputLength: 1,	//最小输入字符长度
            allowClear:true,
            multiple: false,				//设置多项选择，false则只能单选
            maximumSelectionSize: 5, //最大选择个数
            query: function (query) {
                $.ajax({
                    type: "POST",
                    url: "income.do?method=IncemCarid",
                    data: {phones:query.term},   //传递你输入框中的值
                    success: function(msg){
                        var msg=$.parseJSON(msg);
                        var data = {results: []};
                        $.each(msg,function(x,y){
                            data.results.push({id: y.id, text: y.name});;
                        });
                        query.callback(data);
                    }
                });
            }
        });
        //查询
        function searchCar_owner() {
            $("#dg").datagrid('load', {
                company_name : $.trim($("#company_name1").val()),
                start_people : $.trim($("#start_people").val()),
                end_phone:$.trim($("#end_phone").val()),
                //phone:$.trim($("#phone").val()),
            });
        }
        var submitForm = function($dialog, $grid, $pjq, $mainMenu) {
            var company=$(window.parent.document).find('#modifyId').get(0).contentWindow;
            company.document.getElementById('compid').value=$("#company_id").val();
            company.document.getElementById('compName').value=$("#company_name").val();
            company.document.getElementById('comp_phone').value=$("#comp_phone").val();
            company.document.getElementById('comp_ren').value=$("#comp_ren").val();
           

            $dialog.dialog('close');
            $grid.datagrid('reload');
        };

        //删除
        function deleteMessage(){
            var checkarray=[];
            var array = $('#dg').datagrid('getSelections');
            for(var i=0;i<array.length;i++){
                checkarray.push(array[i].id);
            }
            if(array != ""){
                $.messager.confirm('确认','您确定要删除选中的消息吗？',function(r){
                    if (r){
                        $.ajax({
                            url: "pushMessage.do?method=deleteMessage",
                            type: "POST",
                            data:{del:checkarray.join(",")},
                            success:function(data){
                                if (data.flag) {
                                    parent.$.messager.alert("删除消息","删除消息成功",'info',
                                            function(r) {
                                                $('#dg').datagrid('reload');
                                            });
                                }
                            }
                        });
                    }
                });
            }else{
                $.messager.alert("消息","请选择要删除的信息","info");
            }
        }
        //重置
        function reset(){
            $("#company_name1").val("");
            $("#start_people").val("");
            $("#end_phone").val("");
           // $("#phone").val();
        }
        
    </script>
</head>

<body class="easyui-layout">
<form action="company.do" id="outputform" method="post">

    <div region="north" title="检索" class="st-north" border="false" collapsible="false"  >
        <lable >承运公司:</lable>
        <input type="text"  class="search-text"style="width:150px"   id="company_name1" >
        <lable >起始地联系人:</lable>
        <input type="text"  class="search-text"style="width:150px"   id="start_people" >

        <lable >到达站联系电话:</lable>
        <input type="text" class="search-text" id="end_phone"  style="width:150px"  >
        <a class="easyui-linkbutton" onclick="searchCar_owner()" data-options="iconCls:'icon-search'" >查询</a>
    </div>
    <div region="center" >
        <table id="dg" title="汇总信息" ></table>
    </div>
    <!-- <div id="tb">
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true"onclick="add()">新增</a>
       <a href="javascript:void(0)" class="easyui-linkbutton"  data-options="iconCls:'icon-edit',plain:true"onclick="modify()">修改</a>
       <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true"   onclick="deleteEver()">删除</a>
    </div>	 -->
    <input type="hidden" id="company_name" name="company_name"/>
    <input type="hidden" id="company_id" name="company_id"/>
    <input type="hidden" id="comp_phone" name="comp_phone"/>
    <input type="hidden" id="comp_ren" name="comp_ren"/>
</form>
</body>
</html>
