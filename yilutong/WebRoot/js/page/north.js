$(function(){
/*	$('li.dropdown').mouseover(function() {   
    	$(this).addClass('open');    
    }); 
*/
});  
	//缩放左边tree
	var westflag=0;
	function toggleAllOpen(){
		if(westflag==0){
			openwest();
			westflag=1;
		}else{
			closewest();
			westflag=0;
		}
		
	}
	function openwest(){
		$("#lyouts").layout("collapse", "west");
	}
	function closewest(){
		$("#lyouts").layout("expand", "west");
	}
	//添加tab
	function headinfo(title,url){
		addTab(title,url);
	}
	
	var fullflag=0;
  function fullscrenall(){
 
  	if(fullflag==0){
  		fullscren();
  		fullflag=1;
  	}else{
  		exitfullscren();
  		fullflag=0;
  	}
  }
  //全屏
  function fullscren(){
  	var elem=document.documentElement;
    if(elem.webkitRequestFullScreen){
        elem.webkitRequestFullScreen();     
    }else if(elem.mozRequestFullScreen){
        elem.mozRequestFullScreen();  
    }else if(elem.requestFullScreen){  
        elem.requestFullscreen();  
    }else{
        //浏览器不支持全屏API或已被禁用  
    } 
  }
  //退出全屏
  function exitfullscren(){
  	 var elem=document;  
    if(elem.webkitCancelFullScreen){  
        elem.webkitCancelFullScreen();      
    }else if(elem.mozCancelFullScreen){  
        elem.mozCancelFullScreen();  
    }else if(elem.cancelFullScreen){  
        elem.cancelFullScreen();  
    }else if(elem.exitFullscreen){
        elem.exitFullscreen();  
    }else{  
        //浏览器不支持全屏API或已被禁用  
    }  
  }
//伸缩左部、上部、右部
	var centerfull=0;
	function fullAllOpen(){
		if(centerfull==0){
			fullall();
			centerfull=1;
			$("#fullBtn").removeClass("glyphicon-resize-full");
			$("#fullBtn").addClass("glyphicon-resize-small");
		}else{
			closefullall();
			centerfull=0;
			$("#fullBtn").addClass("glyphicon-resize-full");
			$("#fullBtn").removeClass("glyphicon-resize-small");
		}
		
	}
	
	function fullall(){
		$("#lyouts").layout("collapse", "north");
 		$("#lyouts").layout("collapse", "west");
/* 		$("#lyouts").layout("collapse", "east");
*/ 		
	}
	function closefullall(){
		$("#lyouts").layout("expand", "north");
 		$("#lyouts").layout("expand", "west");
	}