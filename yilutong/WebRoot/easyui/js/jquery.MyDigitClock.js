/**
 *
 * Version 0.5
 *
 */
(function($) {

    var _options = {};
	var _container = {};

	jQuery.fn.MyDigitClock = function(options) {
		var id = $(this).get(0).id;
		_options[id] = $.extend({}, $.fn.MyDigitClock.defaults, options);

		return this.each(function()
		{
			_container[id] = $(this);
			showClock(id);
		});
		
		function showClock(id)
		{
			var d = new Date;
			var h = d.getHours();
			var m = d.getMinutes();
			var s = d.getSeconds();
			var ampm = "";
			if (_options[id].bAmPm)
			{
				if (h>12)
				{
					h = h-12;
					ampm = " PM";
				}
				else
				{
					ampm = " AM";
				}
			}
			
			var templateStr = _options[id].timeFormat + ampm;
			templateStr = templateStr.replace("{HH}", getDD(h));
			templateStr = templateStr.replace("{MM}", getDD(m));
			templateStr = templateStr.replace("{SS}", getDD(s));
		
			var obj = $("#"+id);
			obj.css("fontSize", _options[id].fontSize);
			obj.css("fontFamily", _options[id].fontFamily);
			obj.css("color", _options[id].fontColor);
			obj.css("background", _options[id].background);
			obj.css("fontWeight", _options[id].fontWeight);
		
			//change reading
			obj.html(templateStr)
			
			//toggle hands
			if (_options[id].bShowHeartBeat)
			{
				obj.find("#ch1").fadeTo(800, 1000);
				obj.find("#ch2").fadeTo(800, 1000);
			}
			setTimeout(function(){showClock(id)}, 1000);
		}
		
		function getDD(num)
		{
			return (num>=10)?num:"0"+num;
		}
		
		function refreshClock()
		{
			setupClock();
		}
	}
	
	//default values
	jQuery.fn.MyDigitClock.defaults = {
		fontSize: '50px',
		fontFamily: 'Microsoft JhengHei, Century gothic, Arial',
		fontColor: '#777777',
		fontWeight: 'bold',
		timeFormat: '{HH}<span id="ch1" style="height:40px;display:inline-block;margin-left: 5px;margin-right: 5px;margin-top: -5px;font-size: 21px;">:</span>{MM}<span id="ch2" style="height:40px;display:inline-block;margin-left: 5px;margin-right: 5px;margin-top: -5px;font-size: 21px;">:</span>{SS}',
		bShowHeartBeat: false,
		bAmPm:false
	};

})(jQuery);
