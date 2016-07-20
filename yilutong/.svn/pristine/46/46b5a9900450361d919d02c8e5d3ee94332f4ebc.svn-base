<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" href="./ValidationEngine/css/validationEngine.jquery.css">
<script src="./ValidationEngine/js/jquery.validationEngine-zh_CN.js"></script>
<script src="./ValidationEngine/js/jquery.validationEngine.js"></script>
<!-- jquery.validationEngine-zh_CN.js 为配置文件，可根据需求自行调整或增加，也可以更换为其他语言配置文件 -->
</head>

</html>


<%-- 
调用说明：
a.<jsp:include page="../../../ValidationEngine/Validation.jsp"></jsp:include> 引入页面
b.声明全局变量
  $("填写你的form的ID").validationEngine('attach', { 
			 promptPosition:'topRight:-15,0',
			 scroll:false,//不滚动
			 autoHidePrompt:true,//	是否自动隐藏提示信息
		 	 autoHideDelay:2000 //两秒
			 }); 开启方法

Form表单填写方法
1.Form表单中的标签[input,select]等------<input type="text" class="validate[required]">/填写Class[required]为必填
      其他验证请下拉详细验证解释说明，多个验证的写法-----validate[required,minSize[6],custom[onlyLetterNumber]]
       验证规则均写在 validate[] 中，如有多条规则，用英文逗号(,)分割。
2.提交ajax时,在提交前判断
  if($("填写你的form的ID").validationEngine('validate')){
  	//可提交
  }else{
    $pjq.messager.alert('XXXX', '必填信息不可为空', 'info');
  }
  
详细验证解释：
validate[minSize[6]]     		  最少输入字符数  
validate[maxSize[20]]			  最多输入字符数
validate[min[1]]         		  最小值（该项为数字的最小值，注意与 minSize 的区分）
validate[max[9999]]       		  最大值（该项为数字的最大值，注意与 maxSize 的区分）
validate[minCheckbox[2]]  		  最少选取的项目数（用于 Checkbox）
validate[maxCheckbox[2]]  		  最多选取的项目数（用于 Checkbox）
validate[custom[dateFormat]] 	   验证日期格式，格式为 YYYY/MM/DD、YYYY/M/D、YYYY-MM-DD、YYYY-M-D
validate[custom[dateTimeFormat]] 验证日期及时间格式，格式为：YYYY/MM/DD hh:mm:ss AM|PM
validate[custom[number]]		  验证数字
validate[custom[integer]]		  验证整数
validate[custom[phone]]		  	  验证电话号码
validate[custom[email]]			  验证 E-mail 地址
validate[custom[onlyNumberSp]]	  只接受填数字和空格
validate[custom[onlyLetterSp]]	  只接受填英文字母、单引号（'）和空格
validate[custom[onlyLetterNumber]] 只接受数字和英文字母


validate[custom[chinaId]]		验证身份证号码（仅支持 18 位的身份证号码）
validate[custom[chinaIdLoose]]  验证身份证号码（支持 15 及 18 位的身份证号码）


validate[custom[ruleName]] 		  自定义规则验证
								 JavaScript Code'ruleName': { 
								   'regex': RegExp, /* 正则表达式，如果正则能匹配内容表示通过 */ 
								   'alertText': '验证不通过时的提示信息' 
								 } 
  --%>
  
  
  
 <%--  
  validationEventTrigger	'blur'	触发验证的事件，支持事件可参考 jQuery 的事件说明。
PS：如果希望只在表单提交时验证，可以设置为空。或者设置参数 binded:false
binded	true	是否绑定即时验证
scroll	true	屏幕自动滚动到第一个验证不通过的位置。
focusFirstField	true	验证未通过时，是否给第一个不通过的控件获取焦点。
validateNonVisibleFields	false	是否验证不可见的元素（如 type="hidden" 的输入框，或多个输入控件在选项卡切换中）
showPrompts	true	是否显示提示信息
showArrow	true	是否显示提示信息的箭头
promptPosition	'topRight'	
提示信息的位置，可设置为：'topRight', 'topLeft', 'bottomRight', 'bottomLeft', 'centerRight', 'centerLeft', 'inline'
可设置更具体的位置，格式为："方向: X偏移值, Y偏移值"。如：bottomLeft: -20, 5
autoPositionUpdate	false	是否自动调整提示层的位置
autoHidePrompt	false	是否自动隐藏提示信息
autoHideDelay	100000	自动隐藏提示信息的延迟时间 (ms)
fadeDuration	0.3	隐藏提示信息淡出的时间
addPromptClass	''	给提示信息增加 class
Ciaoca 增强版中，增加样式如下：
'formError-noArrow' -- 无箭头样式
'formError-text' -- 纯文字样式
'formError-small' -- 精简版样式
'formError-white' -- 白色版样式
可以叠加使用，如：addPromptClass: 'formError-noArrow formError-small'
custom_error_messages	{}	自定义错误信息内容 [Demo]
maxErrorsPerField	false	单个元素显示错误提示的最大数量，值设为数值。默认 false 表示不限制。
showOneMessage	false	是否只显示一个提示信息
doNotShowAllErrosOnSubmit	false	在提交表单时不显示所有的错误信息（建议使用参数 showOneMessage 替代）
addSuccessCssClassToField	''	验证通过时，给控件增加 class，当再次验证失败时，会去除。
addFailureCssClassToField	''	验证失败时，给控件增加 class，当再次验证通过时，会去除。
prettySelect	false	是否使用了美化过的 select 选择控件 [Demo]
onFieldSuccess	false	控件验证通过时的回调函数
function(field){}
onFieldFailure	false	控件验证失败时的回调函数
function(field){}
onSuccess	false	在表单验证结果为通过时的回调函数
onFailure	false	在表单验证结果为失败时的回调函数
PS：onSuccess 和 onFailure 请参考 [Demo]
onValidationComplete	false	表单提交验证完成时的回调函数 [Demo]
function(form, valid){}，参数：
form：表单元素
valid：验证结果（ture or false）
PS：使用此方法后，表单即使验证通过也不会进行提交，交给定义的回调函数进行操作。
ajaxFormValidation	false	是否使用 Ajax 提交表单（默认使用 GET 方式发送数据）
ajaxFormValidationURL	false	设置 Ajax 提交的 URL，默认使用 form 的 action 属性
ajaxFormValidationMethod	'get'	设置 Ajax 提交时，发送数据的方式
onAjaxFormComplete	$.noop	表单提交，Ajax 验证完成后的行为（Function）[Demo]
function(status, form, json, options){}
onBeforeAjaxFormValidation	$.noop	表单提交验证通过后，Ajax 提交之前的回调函数 [Demo]
function(form, options){}
ajaxValidCache	{}	
isError	false	
InvalidFields	[]	
isOverflown	false	表单是否在溢出滚动的元素内（即外部元素设置了 overflow:scroll）
PS：设置为 ture 后，提示内容的插入位置将更改为在验证的控件之前插入；
　　此时需要在控件外层再套一个元素，并设置 class="inputContainer"
overflownDIV	''	设置了溢出滚动的元素，格式为 jQuery 的选择器。
usePrefix	''	使用 ID 前缀
useSuffix	''	使用 ID 后缀 --%>