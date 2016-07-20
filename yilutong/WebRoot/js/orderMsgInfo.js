/**
 * @author zzp
 * 如果jy未定义或者为null时，赋值为{}控对象
 */
var dialog;
function getOrderMsg(pid,costomersid,grid){
dialog = parent.jy.modalDialog({
				title : '运单信息',
				url : 'orderC.do?method=getShipOrderPage&pid=' +pid+'&costomersid='+costomersid,
				width : 1150,
				height:550,
				data : {costomersid:costomersid},
				buttons : [{
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
			}
		}] 
	});
}