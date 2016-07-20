document.write("<script src='js/jquery.tabs.extend.js' type='text/javascript'></script>");	
$(function(){
		tabCloseEven();
		$('#tabs').tabs({
			onSelect:function(title){
				var p = $(this).tabs('getTab', title); 
				$("#urlId").val(p.find('iframe').attr("src"));
			} 
		});
		$.ajax({
			   type: "POST",
			   url: "menu.do?method=getmenu",
			   success: function(msg){
				   
				  // var ms=$.parseJSON(msg);
				 
				   $.each(msg, function(i, n) {//$.each 循环
						var menulist ='';
						
						menulist +='<ul>';
				        $.each(n.children, function(j, o) {
				        	if(o.children!=""){
							menulist += '<li><div><a a="1" ref="'+o.id+'" rel="'+o.pageurl+'" href="javascript:void(0);"><span class="icon '+o.iconCls+'" >&nbsp;</span><span class="nav" style=" display: -moz-inline-box;display: inline-block;width: 80px;">' + o.text + '</span><img src="images/004a_41.png" style="padding-left:15px"></a>'
							+'</div></li> ';
				        	}else{
				        	menulist += '<li><div><a ref="'+o.id+'" rel="'+o.pageurl+'" href="javascript:void(0);" ><span class="icon '+o.iconCls+'" >&nbsp;</span><span class="nav">' + o.text + '</span></a></div></li> ';	
				        		
				        	}
							menulist +='<ul name="'+o.id+'"style="display:none">';
							$.each(o.children,function(t,p){
							menulist += '<li style="padding-left:10px"><div><a ref="'+p.id+'" rel="'+p.pageurl+'" href="javascript:void(0);" ><span class="icon '+p.iconCls+'" >&nbsp;</span><span class="nav">' + p.text + '</span></a></div></li> ';
								
							});
							menulist += '</ul>';
				        });
						menulist += '</ul>';
						
						$('#nav').accordion('add', {
				            title: n.text,
				            content: menulist,
				            iconCls: 'icon ' + n.iconCls
				        });
					
				    });
				   
					$('.easyui-accordion ul li a').click(function(){//对左侧菜单添加click时间
						
						var tabTitle = $.trim($(this).text());
						var url = $(this).attr("rel");
						var menu_id = $(this).attr("ref");
						if(url!=""){
						addTab(tabTitle,url+"&menu_id="+menu_id);
						}
						$('.easyui-accordion ul li div').removeClass("selected");
						$(this).parent().addClass("selected");
						var a = $(this).attr("a");
						if(a=="1"){
						$("[name='"+menu_id+"']").removeAttr("style");
						$(this).attr("a","2");
						}else if(a=="2"){
							$(this).attr("a","1");
							$("[name='"+menu_id+"']").attr("style","display:none");	
							
						}
						}).hover(
						function(){
							$(this).parent().addClass("hover");
						},function(){
							$(this).parent().removeClass("hover");
						}
					);
				   $('#nav').accordion('select', 0);
			   }
		});
	   
	   
	});
	
	
function addTab(title, url){
	if ($('#tabs').tabs('exists', title)){
		$('#tabs').tabs('select', title);
		var currTab = $('#tabs').tabs('getSelected');
			$('#tabs').tabs('updateIframeTab',{
				which:title,
				iframe:{src:url}
			});
			//存放url
			$("#urlId").val(url);
	} else {
		var content = createFrame(url);
		$('#tabs').tabs('addIframeTab',{
			tab:{title:title,closable:true}, 
			iframe:{src:url}
		});
		$("#urlId").val(url);
	}
	tabClose();
}

function createFrame(url)
{
	var s = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
	return s;
}
function tabClose() {
	$(".tabs-inner").dblclick(function(){
		var subtitle = $(this).children(".tabs-closable").text();
		$('#tabs').tabs('close',subtitle);
	});
	$(".tabs-inner").bind('contextmenu',function(e){
		$('#mm').menu('show', {
			left: e.pageX,
			top: e.pageY
		});

		var subtitle =$(this).children(".tabs-closable").text();

		$('#mm').data("currtab",subtitle);
		$('#tabs').tabs('select',subtitle);
		return false;
	});
}
//右键关闭事件
function tabCloseEven() {
	$('#mm-tabupdate').click(function(){
		var currTab = $('#tabs').tabs('getSelected');
		var url = $(currTab.panel('options').content).attr('src');
		if(url != undefined && currTab.panel('options').title != '欢迎使用') {
			$('#tabs').tabs('update',{
				tab:currTab,
				options:{
					content:createFrame(url)
				}
			});
		}
	});
	$('#mm-tabclose').click(function(){
		var currtab_title = $('#mm').data("currtab");
		$('#tabs').tabs('close',currtab_title);
	});
	$('#mm-tabcloseall').click(function(){
		$('.tabs-inner span').each(function(i,n){
			var t = $(n).text();
			if(t != '欢迎使用') {
				$('#tabs').tabs('close',t);
			}
		});
	});
	$('#mm-tabcloseother').click(function(){
		var prevall = $('.tabs-selected').prevAll();
		var nextall = $('.tabs-selected').nextAll();		
		if(prevall.length>0){
			prevall.each(function(i,n){
				var t=$('a:eq(0) span',$(n)).text();
				if(t != '欢迎使用') {
					$('#tabs').tabs('close',t);
				}
			});
		}
		if(nextall.length>0) {
			nextall.each(function(i,n){
				var t=$('a:eq(0) span',$(n)).text();
				if(t != '欢迎使用') {
					$('#tabs').tabs('close',t);
				}
			});
		}
		return false;
	});
	$('#mm-tabcloseright').click(function(){
		var nextall = $('.tabs-selected').nextAll();
		if(nextall.length==0){
			return false;
		}
		nextall.each(function(i,n){
			var t=$('a:eq(0) span',$(n)).text();
			$('#tabs').tabs('close',t);
		});
		return false;
	});

	$('#mm-tabcloseleft').click(function(){
		var prevall = $('.tabs-selected').prevAll();
		if(prevall.length==0){
			return false;
		}
		prevall.each(function(i,n){
			var t=$('a:eq(0) span',$(n)).text();
			$('#tabs').tabs('close',t);
		});
		return false;
	});

	//退出
	$("#mm-exit").click(function(){
		$('#mm').menu('hide');
	})
}