<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>循环滚动代码--整理hqh</title>
<!-- Bootstrap core CSS -->
<!-- <link href="assets/css/bootstrap.css" rel="stylesheet">
Custom styles for this template
<link href="assets/css/main.css" rel="stylesheet">
<link href="assets/css/font-awesome.min.css" rel="stylesheet">
<link href="assets/css/prism.css" rel="stylesheet" />
<link href="assets/css/jquery.mCustomScrollbar.css" rel="stylesheet"
	type="text/css" /> -->
	
<link href="./forindex/assets/css/main.css" rel="stylesheet">
<link href="./forindex/assets/css/font-awesome.min.css" rel="stylesheet">
<link href="./forindex/assets/css/prism.css" rel="stylesheet" />
<link href="./forindex/assets/css/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css" />
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
    label {
  vertical-align: initial;
}

    #test2 li {
	color: #4e4e4e;
	background: #F2F2F2;
	overflow:auto;
	height: 110px;
	padding: 5px;
	line-height: 30px;
	list-style: none;
	font-size: 16px;
	text-align: left;
	border-bottom: 1px dotted #2c8162;
} 
    *:before, *:after {
  COLOR: rgb(250, 250, 236);
  }
    
    </style>
</head>
<body>
	<div class="col-md-7 centered"
		style='background-color: #71CBAD;width: 340px; '>
		<div id="test2-container" style="height: 310px;">
			<ul id="test2"  style="margin-top: 10px;">
			
			</ul>
			<i class="fa fa-arrow-down" id="test2-next" style='margin-top: 20;MARGIN-RIGHT: 55PX;'></i>
			<i class="fa fa-arrow-up" id="test2-prev" style='margin-top: 20;'></i>
		</div>
	</div>



	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	
	<!-- <script src="./forindex/assets/js/jquery-1.10.2.js"></script> -->
<script src="./forindex/assets/js/chart.js"></script>
<!-- <script src="./forindex/assets/js/bootstrap.js"></script> -->
<script src="./forindex/assets/js/prism.js"></script>
<script src="./forindex/assets/js/jquery.mCustomScrollbar.min.js"></script> 
<script src="./forindex/assets/js/jquery.newsTicker.js"></script> 

<!-- 	<script src="assets/js/jquery-1.10.2.js"></script>
	<script src="assets/js/chart.js"></script>
	<script src="assets/js/bootstrap.js"></script>
	<script src="assets/js/prism.js"></script>
	<script src="assets/js/jquery.mCustomScrollbar.min.js"></script>
	<script src="assets/js/jquery.newsTicker.js"></script> -->
	<script>
		/* $('a[href*=#]').click(function(e) {
			var href = $.attr(this, 'href');
			if (href != "#") {
				$('html, body').animate({
					scrollTop : $(href).offset().top - 81
				}, 500);
			} else {
				$('html, body').animate({
					scrollTop : 0
				}, 500);
			}
			return false;
		}); */

		$(window).load(function() {
			$('code.language-javascript').mCustomScrollbar();
		});
		var nt_title = $('#nt-title').newsTicker({
			row_height : 40,
			max_rows : 1,
			duration : 3000,
			pauseOnHover : 0
		});
		var nt_example1 = $('#test2').newsTicker({
			row_height : 80,
			max_rows : 3,
			duration : 4000,
			prevButton : $('#test2-prev'),
			nextButton : $('#test2-next')
		});
		var nt_example2 = $('#nt-example2').newsTicker(
				{
					row_height : 60,
					max_rows : 1,
					speed : 300,
					duration : 6000,
					prevButton : $('#nt-example2-prev'),
					nextButton : $('#nt-example2-next'),
					hasMoved : function() {
						$('#nt-example2-infos-container').fadeOut(
								200,
								function() {
									$('#nt-example2-infos .infos-hour').text(
											$('#nt-example2 li:first span')
													.text());
									$('#nt-example2-infos .infos-text').text(
											$('#nt-example2 li:first').data(
													'infos'));
									$(this).fadeIn(400);
								});
					},
					pause : function() {
						$('#nt-example2 li i').removeClass('fa-play').addClass(
								'fa-pause');
					},
					unpause : function() {
						$('#nt-example2 li i').removeClass('fa-pause')
								.addClass('fa-play');
					}
				});
		$('#nt-example2-infos').hover(function() {
			nt_example2.newsTicker('pause');
		}, function() {
			nt_example2.newsTicker('unpause');
		});
		var state = 'stopped';
		var speed;
		var add;
		var nt_example3 = $('#nt-example3').newsTicker(
				{
					row_height : 80,
					max_rows : 1,
					duration : 0,
					speed : 10,
					autostart : 0,
					pauseOnHover : 0,
					hasMoved : function() {
						if (speed > 700) {
							$('#nt-example3').newsTicker("stop");
							console.log('stop')
							$('#nt-example3-button').text(
									"RESULT: "
											+ $('#nt-example3 li:first').text()
													.toUpperCase());
							setTimeout(function() {
								$('#nt-example3-button').text("START");
								state = 'stopped';
							}, 2500);

						} else if (state == 'stopping') {
							add = add * 1.4;
							speed = speed + add;
							console.log(speed)
							$('#nt-example3').newsTicker('updateOption',
									"duration", speed + 25);
							$('#nt-example3').newsTicker('updateOption',
									"speed", speed);
						}
					}
				});

		$('#nt-example3-button').click(function() {
			if (state == 'stopped') {
				state = 'turning';
				speed = 1;
				add = 1;
				$('#nt-example3').newsTicker('updateOption', "duration", 0);
				$('#nt-example3').newsTicker('updateOption', "speed", speed);
				nt_example3.newsTicker('start');
				$(this).text("STOP");
			} else if (state == 'turning') {
				state = 'stopping';
				$(this).text("WAITING...");
			}
		});
	</script>
	<script type="text/javascript">
		//  alert($(document.body).height());
	</script>

</body>
</html>