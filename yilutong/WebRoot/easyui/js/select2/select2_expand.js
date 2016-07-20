/**
 * select2自定义插件
 * @author zzp
 */
;(function($){
	$.fn.select2_expend=function(options){
		var defaults={
			color:'green',
			url:'',
			filedname:''
		}
		var options=$.extend(defaults,options);
		this.each(function(){
			var _this=$(this);
			$.ajax({
				   type: "POST",
				   url: options.url,
/*				   data: {search:query.term},
*/				   success: function(msg){
		 		   	var msg=$.parseJSON(msg);
		 		   	createoption(msg,options.filedname,_this.attr("id"));
				   }
			});
		});
		return this;
	}
	//创建option
	function createoption(value,filedname,ids){
		if (value == undefined || filedname == undefined) {
            return false;
        }
		var _options = '<option value="">-无-</option>';
		switch (filedname) {
			case 'car_length':
				 _options = '<option value="">车长</option>';
				break;
			case 'car_type':
				_options = '<option value="">选择车型</option>';
				break;
			default:
                _options = '<option value="">-无-</option>';
		}
		$.each(value, function(k, v) {
            _options += '<option value="' + v.id + '">' + v.name + '</option>';
        });
		$("#" + ids).html(_options);
	}
})(jQuery);  