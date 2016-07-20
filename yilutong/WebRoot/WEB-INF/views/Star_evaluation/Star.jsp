<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Star.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<!-- 	<meta http-equiv="content-Type" content="Star.jsp" charset="utf-8"> -->
	<link rel="stylesheet" type="text/css" href="./sk/css/lrtk.css">
	<script type="text/javascript" src="./sk/js/jquery.js"></script>
	<!-- <script type="text/javascript" src="./sk/js/lrtk.js"></script> -->
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <%
  String flg = (String) request.getAttribute("flg");
   %>
   <script type="text/javascript"> 
    var shiping_order_id='<%=flg%>';
  $(document).ready(function(){
   
    var stepW = 24;
    var description = new Array("非常差，回去再练练   1分","真的是差，都不忍心说你了 2分","一般，还过得去吧  3分","很好   4分 ","非常好   5分!");
    var stars = $("#star > li");
    var descriptionTemp;
    $("#showb").css("width",0);
    stars.each(function(i){
        $(stars[i]).click(function(e){
            var n = i+1;
            $("#showb").css({"width":stepW*n});
            descriptionTemp = description[i];
            $("#grade").val(n);
            $(this).find('a').blur();
            return stopDefault(e);
            return descriptionTemp;
        });
    });
    stars.each(function(i){
        $(stars[i]).hover(
            function(){
                $(".description").text(description[i]);
            },
            function(){
                if(descriptionTemp != null)
                    $(".description").text("当前您的评价为:"+descriptionTemp);
                else 
                    $(".description").text(" ");
            }
        );
    });
});
function stopDefault(e){
    if(e && e.preventDefault)
           e.preventDefault();
    else
           window.event.returnValue = false;
    return false;
}; 
  	
  		//添加

	var submitForm = function($dialog, $grid, $pjq, $mainMenu) {
	if($("#grade").val()!=null&&$("#grade").val()!=""){		
				$pjq.messager.confirm('司机评价','确定要评价吗?',function(r){   
						    	if (r){   										
									$.ajax({
										type: "POST",
							  			url:'Driver.do?method=insertinfo&id='+shiping_order_id,
							  			data:$('#Regform').serialize(),		  		
							  			success:function(msg){
							  				if(msg.flag==true){
							  			/* 	window.parent.layer.close(index);  */
							  					$pjq.messager.alert('司机评价', '评价成功', 'info');
												$dialog.dialog('close');
												$grid.datagrid('reload');
							  				}
							  			}
									});
								}
			});
			
			  }else if($("#grade").val()==null||$("#grade").val()==""){
			$pjq.messager.alert("司机评价", "评价不能为空", "info");	
			}
	};
  	
  </script>
  <body>
  <form action="" method="post" id="Regform">
  <div id="xzw_starSys">
	<div id="xzw_starBox">
		<ul class="star" id="star">
			<li><a href="javascript:void(0)" title="1" class="one-star">1</a></li>
			<li><a href="javascript:void(0)" title="2" class="two-stars">2</a></li>
			<li><a href="javascript:void(0)" title="3" class="three-stars">3</a></li>
			<li><a href="javascript:void(0)" title="4" class="four-stars">4</a></li>
			<li><a href="javascript:void(0)" title="5" class="five-stars">5</a></li>
		</ul>
		<div class="current-rating" id="showb"></div>
		<br/>
		<td >评价内容：</td>
				
				<textarea class="easyui-textarea validate[maxSize[256],custom[checkerr],custom[checkkeyerr]]" cols="45" rows="4" name="content"></textarea>
	</div>
		<div class="description" id="ss"></div>
</div>
     <input type="hidden" id="grade" name="grade"/>
     
     </form>
  </body>
</html>
