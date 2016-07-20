<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>循环滚动代码--整理hqh</title>
<!-- <link href="./forindex/assets/css/bootstrap.css" rel="stylesheet"> -->
<link href="./forindex/assets/css/main.css" rel="stylesheet">
<link href="./forindex/assets/css/font-awesome.min.css" rel="stylesheet">
<link href="./forindex/assets/css/prism.css" rel="stylesheet" />
<link href="./forindex/assets/css/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css" />
<style type="text/css">
label {
  vertical-align: initial;
}
#number{
  margin-left: 20px;
  font-size: 20;
  width: 250px;
  height: 30px;
  cursor: pointer;
  color: white;
}
.hour{
	margin-left: 10px;
}
#nt-example2 li{
    color: #f2f2f2;
    background: #74cfae;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    height: 55px;
    padding: 10px 16px 10px 16px;
    line-height: 40px;
    list-style: none;
    font-size: 24px;
    text-align: left;
}
#nt-example2 {
    max-width: 680px;
    margin: auto;
}
#nt-example2-infos {
    max-width: 590px;
    margin: auto;
    padding: 12px;
    color: #f2f2f2;
    background: #74cfae;
    height: 152;
}
</style>
</head>
<body>
<div style="width: 680px;height: 233px;">
			<div id="nt-example2-container" style="    margin-top: 10px;">
				<ul id="nt-example2">
					
				</ul>
				<div id="nt-example2-infos-container">
					<div id="nt-example2-infos-triangle"></div>
					<div id="nt-example2-infos" class="row">
						<div class="col-xs-4 centered">
							<div class="infos-hour" id="onecarno">
							</div>
							<i class="fa fa-arrow-left" id="nt-example2-prev"></i>
							<i class="fa fa-arrow-right" id="nt-example2-next"></i>
						</div>
						<div class="col-xs-8">
							<div class="infos-text" id="onecarnotext">
							</div>
						</div>
					</div>
				</div>
			</div>
</div>
<!-- <script src="./forindex/assets/js/jquery-1.10.2.js"></script> -->
<script src="./forindex/assets/js/chart.js"></script>
<!-- <script src="./forindex/assets/js/bootstrap.js"></script> -->
<script src="./forindex/assets/js/prism.js"></script>
<script src="./forindex/assets/js/jquery.mCustomScrollbar.min.js"></script> 
<script src="./forindex/assets/js/jquery.newsTicker.js"></script> 
<script type="text/javascript">
	/* $('a[href*=#]').click(function(e) {
		var href = $.attr(this, 'href');
		if (href != "#") {
			$('html, body').animate({
				scrollTop: $(href).offset().top - 81
			}, 500);
		}
		else {
			$('html, body').animate({
				scrollTop: 0
			}, 500);
		}
		return false;
	}); */
	$(window).load(function(){
		$('code.language-javascript').mCustomScrollbar();
	});
	var nt_title = $('#nt-title').newsTicker({
		row_height: 40,
		max_rows: 1,
		duration: 3000,
		pauseOnHover: 0
	});
	var nt_example1 = $('#nt-example1').newsTicker({
		row_height: 80,
		max_rows: 3,
		duration: 4000,
		prevButton: $('#nt-example1-prev'),
		nextButton: $('#nt-example1-next')
	});
	var nt_example2 = $('#nt-example2').newsTicker({
		row_height: 60,
		max_rows: 1,
		speed: 300,
		duration: 6000,
		prevButton: $('#nt-example2-prev'),
		nextButton: $('#nt-example2-next'),
		hasMoved: function() {
			$('#nt-example2-infos-container').fadeOut(200, function(){
				$('#nt-example2-infos .infos-hour').html($('#nt-example2 li:first span').html());
				$('#nt-example2-infos .infos-text').html($('#nt-example2 li:first').data('infos'));
				$(this).fadeIn(400);
			});
		},
		pause: function() {
			$('#nt-example2 li i').removeClass('fa-play').addClass('fa-pause');
		},
		unpause: function() {
			$('#nt-example2 li i').removeClass('fa-pause').addClass('fa-play');
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
	var nt_example3 = $('#nt-example3').newsTicker({
		row_height: 80,
		max_rows: 1,
		duration: 0,
		speed: 10,
		autostart: 0,
		pauseOnHover: 0,
		hasMoved: function() {
			if (speed > 700) {
				$('#nt-example3').newsTicker("stop");
				console.log('stop')
				$('#nt-example3-button').text("RESULT: " + $('#nt-example3 li:first').text().toUpperCase());
				setTimeout(function() {
					$('#nt-example3-button').text("START");
					state = 'stopped';
				},2500);
			}
			else if (state == 'stopping') {
				add = add * 1.4;
				speed = speed + add;
				console.log(speed)
				$('#nt-example3').newsTicker('updateOption', "duration", speed + 25);
				$('#nt-example3').newsTicker('updateOption', "speed", speed);
			}
		}
	});
	$('#nt-example3-button').click(function(){
		if (state == 'stopped') {
			state = 'turning';
			speed = 1;
			add = 1;
			$('#nt-example3').newsTicker('updateOption', "duration", 0);
			$('#nt-example3').newsTicker('updateOption', "speed", speed);
			nt_example3.newsTicker('start');
			$(this).text("STOP");
		}
		else if (state == 'turning') {
			state = 'stopping';
			$(this).text("WAITING...");
		}
	});
</script>
</body>
</html>
