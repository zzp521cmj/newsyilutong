/**
 * Select2 Chinese translation
 */
(function ($) {
    "use strict";
    $.fn.select2.locales['zh-CN'] = {
        formatNoMatches: function () { return "<span class='glyphicon glyphicon-info-sign'></span>&nbsp;没有找到相关的匹配"; },
        formatInputTooShort: function (input, min) { var n = min - input.length; return "<span class='glyphicon glyphicon-pencil'></span>&nbsp;请输入至少" + n + "个字符";},
        formatInputTooLong: function (input, max) { var n = input.length - max; return "请删掉" + n + "个字符";},
        formatSelectionTooBig: function (limit) { return "<span class='glyphicon glyphicon-pencil'></span>&nbsp;你只能选择最多" + limit + "项"; },
        formatLoadMore: function (pageNumber) { return "加载结果中…"; },
        formatSearching: function () { return "<span class='glyphicon glyphicon-search'></span>&nbsp;搜索中…"; }
    };

    $.extend($.fn.select2.defaults, $.fn.select2.locales['zh-CN']);
})(jQuery);
