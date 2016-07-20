/**
 * @author zzp 如果jy未定义或者为null时，赋值为{}控对象
 */
var jy = jy || {};
/**
 * panel关闭时回收内存，主要用于layout使用iframe嵌入网页时的内存泄漏问题
 * 
 * @author zzp
 * 
 * @requires jQuery,EasyUI
 * 
 */

/**
 * 3 Jquery easyui datagrid js导出excel 4 修改自extgrid导出excel 5 * allows for
 * downloading of grid data (store) directly into excel 6 * Method: extracts
 * data of gridPanel store, uses columnModel to construct XML excel document, 7 *
 * converts to Base64, then loads everything into a data URL link. 8 * 9 *
 * 
 * @author Animal <extjs support team> 10 * 11 $.extend($.fn.datagrid.methods, {
 *         getExcelXml: function (jq, param) { var worksheet =
 *         this.createWorksheet(jq, param);
 *         //alert($(jq).datagrid('getColumnFields')); var totalWidth = 0; var
 *         cfs = $(jq).datagrid('getColumnFields'); for (var i = 1; i <
 *         cfs.length; i++) { totalWidth += $(jq).datagrid('getColumnOption',
 *         cfs[i]).width; } //var totalWidth =
 *         this.getColumnModel().getTotalWidth(includeHidden); return '<?xml
 *         version="1.0" encoding="utf-8"?>'
 *         +//xml申明有问题，以修正，注意是utf-8编码，如果是gb2312，需要修改动态页文件的写入编码 '<ss:Workbook
 *         xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
 *         xmlns:x="urn:schemas-microsoft-com:office:excel"
 *         xmlns:o="urn:schemas-microsoft-com:office:office">' + '<o:DocumentProperties><o:Title>' +
 *         param.title + '</o:Title></o:DocumentProperties>' + '<ss:ExcelWorkbook>' + '<ss:WindowHeight>' +
 *         worksheet.height + '</ss:WindowHeight>' + '<ss:WindowWidth>' +
 *         worksheet.width + '</ss:WindowWidth>' + '<ss:ProtectStructure>False</ss:ProtectStructure>' + '<ss:ProtectWindows>False</ss:ProtectWindows>' + '</ss:ExcelWorkbook>' + '<ss:Styles>' + '<ss:Style
 *         ss:ID="Default">' + '<ss:Alignment ss:Vertical="Top" />' + '<ss:Font
 *         ss:FontName="arial" ss:Size="10" />' + '<ss:Borders>' + '<ss:Border
 *         ss:Weight="1" ss:LineStyle="Continuous" ss:Position="Top" />' + '<ss:Border
 *         ss:Weight="1" ss:LineStyle="Continuous" ss:Position="Bottom" />' + '<ss:Border
 *         ss:Weight="1" ss:LineStyle="Continuous" ss:Position="Left" />' + '<ss:Border
 *         ss:Weight="1" ss:LineStyle="Continuous" ss:Position="Right" />' + '</ss:Borders>' + '<ss:Interior
 *         />' + '<ss:NumberFormat />' + '<ss:Protection />' + '</ss:Style>' + '<ss:Style
 *         ss:ID="title">' + '<ss:Borders />' + '<ss:Font />' + '<ss:Alignment
 *         ss:Vertical="Center" ss:Horizontal="Center" />' + '<ss:NumberFormat
 *         ss:Format="@" />' + '</ss:Style>' + '<ss:Style ss:ID="headercell">' + '<ss:Font
 *         ss:Bold="1" ss:Size="10" />' + '<ss:Alignment ss:Horizontal="Center"
 *         />' + '<ss:Interior ss:Pattern="Solid" />' + '</ss:Style>' + '<ss:Style
 *         ss:ID="even">' + '<ss:Interior ss:Pattern="Solid" />' + '</ss:Style>' + '<ss:Style
 *         ss:Parent="even" ss:ID="evendate">' + '<ss:NumberFormat
 *         ss:Format="yyyy-mm-dd" />' + '</ss:Style>' + '<ss:Style
 *         ss:Parent="even" ss:ID="evenint">' + '<ss:NumberFormat ss:Format="0"
 *         />' + '</ss:Style>' + '<ss:Style ss:Parent="even"
 *         ss:ID="evenfloat">' + '<ss:NumberFormat ss:Format="0.00" />' + '</ss:Style>' + '<ss:Style
 *         ss:ID="odd">' + '<ss:Interior ss:Pattern="Solid" />' + '</ss:Style>' + '<ss:Style
 *         ss:Parent="odd" ss:ID="odddate">' + '<ss:NumberFormat
 *         ss:Format="yyyy-mm-dd" />' + '</ss:Style>' + '<ss:Style
 *         ss:Parent="odd" ss:ID="oddint">' + '<ss:NumberFormat ss:Format="0"
 *         />' + '</ss:Style>' + '<ss:Style ss:Parent="odd" ss:ID="oddfloat">' + '<ss:NumberFormat
 *         ss:Format="0.00" />' + '</ss:Style>' + '</ss:Styles>' +
 *         worksheet.xml + '</ss:Workbook>'; }, createWorksheet: function (jq,
 *         param) { // Calculate cell data types and extra class names which
 *         affect formatting var cellType = []; var cellTypeClass = []; //var cm =
 *         this.getColumnModel(); var totalWidthInPixels = 0; var colXml = '';
 *         var headerXml = ''; var visibleColumnCountReduction = 0; var cfs =
 *         $(jq).datagrid('getColumnFields'); var colCount = cfs.length; for
 *         (var i = 1; i < colCount; i++) { if (cfs[i] != '') { var w =
 *         $(jq).datagrid('getColumnOption', cfs[i]).width; totalWidthInPixels +=
 *         w; if (cfs[i] === "") { cellType.push("None");
 *         cellTypeClass.push(""); ++visibleColumnCountReduction; } else {
 *         headerXml += '<ss:Cell ss:StyleID="headercell">' + '<ss:Data
 *         ss:Type="String">' + $(jq).datagrid('getColumnOption', cfs[i]).title + '</ss:Data>' + '<ss:NamedCell
 *         ss:Name="Print_Titles" /></ss:Cell>'; cellType.push("String");
 *         cellTypeClass.push(""); } } } var visibleColumnCount =
 *         cellType.length - visibleColumnCountReduction; var result = { height:
 *         9000, width: Math.floor(totalWidthInPixels * 30) + 50 }; var rows =
 *         $(jq).datagrid('getRows'); // Generate worksheet header details. var
 *         t = '<ss:Worksheet ss:Name="' + param.title + '">' + '<ss:Names>' + '<ss:NamedRange
 *         ss:Name="Print_Titles" ss:RefersTo="=\'' + param.title + '\'!R1:R2"
 *         />' + '</ss:Names>' + '<ss:Table x:FullRows="1" x:FullColumns="1"' + '
 *         ss:ExpandedColumnCount="' + (visibleColumnCount + 2) + '"
 *         ss:ExpandedRowCount="' + (rows.length + 2) + '">' + colXml + '<ss:Row
 *         ss:AutoFitHeight="1">' + headerXml + '</ss:Row>'; // Generate the
 *         data rows from the data in the Store //for (var i = 0, it =
 *         this.store.data.items, l = it.length; i < l; i++) { for (var i = 0,
 *         it = rows, l = it.length; i < l; i++) { t += '<ss:Row>'; var
 *         cellClass = (i & 1) ? 'odd' : 'even'; r = it[i]; var k = 0; for (var
 *         j = 1; j < colCount; j++) { //if ((cm.getDataIndex(j) != '') if
 *         (cfs[j] != '') { //var v = r[cm.getDataIndex(j)]; var v = r[cfs[j]];
 *         if (cellType[k] !== "None") { t += '<ss:Cell ss:StyleID="' +
 *         cellClass + cellTypeClass[k] + '"><ss:Data ss:Type="' + cellType[k] +
 *         '">'; if (cellType[k] == 'DateTime') { t += v.format('Y-m-d'); } else {
 *         t += v; } t += '</ss:Data></ss:Cell>'; } k++; } } t += '</ss:Row>'; }
 *         result.xml = t + '</ss:Table>' + '<x:WorksheetOptions>' + '<x:PageSetup>' + '<x:Layout
 *         x:CenterHorizontal="1" x:Orientation="Landscape" />' + '<x:Footer
 *         x:Data="Page &P of &N" x:Margin="0.5" />' + '<x:PageMargins
 *         x:Top="0.5" x:Right="0.5" x:Left="0.5" x:Bottom="0.8" />' + '</x:PageSetup>' + '<x:FitToPage
 *         />' + '<x:Print>' + '<x:PrintErrors>Blank</x:PrintErrors>' + '<x:FitWidth>1</x:FitWidth>' + '<x:FitHeight>32767</x:FitHeight>' + '<x:ValidPrinterInfo
 *         />' + '<x:VerticalResolution>600</x:VerticalResolution>' + '</x:Print>' + '<x:Selected
 *         />' + '<x:DoNotDisplayGridlines />' + '<x:ProtectObjects>False</x:ProtectObjects>' + '<x:ProtectScenarios>False</x:ProtectScenarios>' + '</x:WorksheetOptions>' + '</ss:Worksheet>';
 *         return result; } });
 */

$.extend($.fn.panel.defaults, {
	onBeforeDestroy : function() {
		var frame = $('iframe', this);
		try {
			if (frame.length > 0) {
				for ( var i = 0; i < frame.length; i++) {
					frame[i].src = '';
					frame[i].contentWindow.document.write('');
					frame[i].contentWindow.close();
				}
				frame.remove();
				if (navigator.userAgent.indexOf("MSIE") > 0) {// IE特有回收内存方法
					try {
						CollectGarbage();
					} catch (e) {
					}
				}
			}
		} catch (e) {
		}
	}
});

/**
 * 防止panel/window/dialog组件超出浏览器边界
 * 
 * @author zzp
 * 
 * @requires jQuery,EasyUI
 */
jy.onMove = {
	onMove : function(left, top) {
		var l = left;
		var t = top;
		if (l < 1) {
			l = 1;
		}
		if (t < 1) {
			t = 1;
		}
		var width = parseInt($(this).parent().css('width')) + 14;
		var height = parseInt($(this).parent().css('height')) + 14;
		var right = l + width;
		var buttom = t + height;
		var browserWidth = $(window).width();
		var browserHeight = $(window).height();
		if (right > browserWidth) {
			l = browserWidth - width;
		}
		if (buttom > browserHeight) {
			t = browserHeight - height;
		}
		$(this).parent().css({/* 修正面板位置 */
			left : l,
			top : t
		});
	}
};
$.extend($.fn.dialog.defaults, jy.onMove);
$.extend($.fn.window.defaults, jy.onMove);
$.extend($.fn.panel.defaults, jy.onMove);
/**
 * 
 * 通用错误提示
 * 
 * 用于datagrid/treegrid/tree/combogrid/combobox/form加载数据出错时的操作
 * 
 * @author zzp
 * 
 * @requires jQuery,EasyUI
 */
/*
 * jy.onLoadError = { onLoadError : function(XMLHttpRequest) { if (parent.$ &&
 * parent.$.messager) { parent.$.messager.progress('close');
 * parent.$.messager.alert('错误', XMLHttpRequest.responseText); } else {
 * $.messager.progress('close'); $.messager.alert('错误',
 * XMLHttpRequest.responseText); } } }; $.extend($.fn.datagrid.defaults,
 * jy.onLoadError); $.extend($.fn.treegrid.defaults, jy.onLoadError);
 * $.extend($.fn.tree.defaults, jy.onLoadError);
 * $.extend($.fn.combogrid.defaults, jy.onLoadError);
 * $.extend($.fn.combobox.defaults, jy.onLoadError);
 * $.extend($.fn.form.defaults, jy.onLoadError);
 */

/**
 * 扩展combobox在自动补全模式时，检查用户输入的字符是否存在于下拉框中，如果不存在则清空用户输入
 * 
 * @author zzp
 * 
 * 注意！！！这个地方根据需求来，如果不需要可以去掉
 * @requires jQuery,EasyUI
 */
$.extend($.fn.combobox.defaults, {
	onShowPanel : function() {
		var _options = $(this).combobox('options');
		if (_options.mode == 'remote') {/* 如果是自动补全模式 */
			var _value = $(this).combobox('textbox').val();
			var _combobox = $(this);
			if (_value.length > 0) {
				$.post(_options.url, {
					q : _value
				}, function(result) {
					if (result && result.length > 0) {
						_combobox.combobox('loadData', result);
					}
				}, 'json');
			}
		}
	},
	onHidePanel : function() {
		var _options = $(this).combobox('options');
		if (_options.mode == 'remote') {/* 如果是自动补全模式 */
			var _data = $(this).combobox('getData');/* 下拉框所有选项 */
			var _value = $(this).combobox('getValue');/* 用户输入的值 */
			var _b = false;/* 标识是否在下拉列表中找到了用户输入的字符 */
			for ( var i = 0; i < _data.length; i++) {
				if (_data[i][_options.valueField] == _value) {
					_b = true;
				}
			}
			if (!_b) {/* 如果在下拉列表中没找到用户输入的字符 */
				$(this).combobox('setValue', '');
			}
		}
	}
});
/**
 * 
 * 扩展 自定义弹出Dialog
 * 
 * @author zzp
 * @param options
 * @returns
 */
jy.modalDialog = function(options) {
	var optid = "";
	if (typeof (options.id) == "undefined") {
		options.id = "";
	} else {
		optid = options.id;
		options.id = "";
	}

	// 初始化dialog
	var opts = $.extend({
		title : '&nbsp;',
		width : 640,
		height : 480,
		modal : true,
		onClose : function() {
			$(this).dialog('destroy');
		}
	}, options);
	opts.modal = true;// 模块化
	if (options.url) {
		var optwidth = opts.width - 10;
		var optheight = opts.height - 30;

		opts.content = '<iframe id="'
				+ optid
				+ '" src="'
				+ options.url
				+ '" allowTransparency="true" scrolling="auto" width="100%" height="98%" frameBorder="0" name=""></iframe>';
	}
	return $('<div>').dialog(opts);
};

/**
 *修改easyui删除行bug
 *
 */
$.extend($.fn.datagrid.methods, {
	deleteRow : function(_6c1, index) {
		_6c1.each(function() {
			_6c0(this, index);
		});
		function _6c0(target, index) {
			var opts = $.data(target, "datagrid").options;
			var data = $.data(target, "datagrid").data;
			opts.finder.getTr(target, index).remove();
			var gd = $.data(target, "datagrid");
			for ( var i = index + 1; i < data.rows.length; i++) {
				opts.finder.getTr(target, i, "body", 2).attr(
						"datagrid-row-index", i - 1).attr("id",
						gd.rowIdPrefix + "-2-" + (i - 1));
				var tr1 = opts.finder.getTr(target, i, "body", 1).attr(
						"datagrid-row-index", i - 1).attr("id",
						gd.rowIdPrefix + "-1-" + (i - 1));
				if (opts.rownumbers) {
					tr1.find("div.datagrid-cell-rownumber").html(i);
				}
			}
			data.total -= 1;
			data.rows.splice(index, 1);
		}
	}
});
