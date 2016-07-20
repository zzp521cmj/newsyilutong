package com.tag;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.jy.common.SessionInfo;
import com.jy.service.UserInfoService;

public class ButtonTag extends TagSupport{
	
	private UserInfoService uis;
	private static ApplicationContext ac=new ClassPathXmlApplicationContext(new String[] {"classpath:mybatis-config.xml","classpath:spring.xml"});
	
	
	@Override
	public int doStartTag() throws JspException {
		
		uis = (UserInfoService) ac.getBean(UserInfoService.class);
		// TODO Auto-generated method stub 
		 JspWriter out = this.pageContext.getOut();
		 HttpSession session=this.pageContext.getSession();
			Integer[] roles=(Integer[]) session.getAttribute(SessionInfo.SessionRote);
			List<String> list = uis.getFunctions(Integer.parseInt(menu_id),roles);
		 try {
			 for (int i = 0; i < list.size();i++) {
				 if (list.get(i).equals("添加")) {
						out.println("<a href='javascript:void(0)' class='easyui-linkbutton' id='tbadd' onclick='"+addBtnClick+"' data-options=\"iconCls:\'icon-add\',plain:true\">添加</a>");
					} else if (list.get(i).equals("修改")) {
						out.println("<a href='javascript:void(0)' class='easyui-linkbutton' id='tbmodify' onclick='"+editBtnClick+"' data-options=\"iconCls:\'icon-edit\',plain:true\">修改</a>");
					} else if (list.get(i).equals("删除")) {
						out.println("<a href='javascript:void(0)' class='easyui-linkbutton' id='tbdel' onclick='"+delBtnClick+"' data-options=\"iconCls:\'icon-remove\',plain:true\">删除</a>");
					}else if (list.get(i).equals("详细信息")) {
						out.println("<a href='javascript:void(0)' class='easyui-linkbutton' id='tbxinxi' onclick='"+InfoBtnClick+"' data-options=\"iconCls:\'icon-edit\',plain:true\" >详细信息</a>");
					}else if (list.get(i).equals("导出")) {
						out.println("<a href='javascript:void(0)'class='easyui-linkbutton' id='tbput' onclick='"+importBtnClick+"' data-options=\"iconCls:\'icon-output\',plain:true\">导出</a>");
					} else if (list.get(i).equals("重置密码")) {
						out.println("<a href='javascript:void(0)' class='easyui-linkbutton' id='tbresetpassword' onclick='"+resetPswBtnClick+"' data-options=\"iconCls:\'icon-reset\',plain:true\" >重置密码</a>");
					} else if (list.get(i).equals("导入")) {
						out.println("<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='"+exportBtnClick+"' data-options=\"iconCls:\'icon-input\',plain:true\">导入</a>");
					} else if (list.get(i).equals("绑定车辆")) {
						out.println("<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='"+BDCarClick+"' data-options=\"iconCls:\'icon-lock\',plain:true\">绑定车辆</a>");
					} else if (list.get(i).equals("打印")) {
						out.println("<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='"+QRCodeBtnClick+"' data-options=\"iconCls:\'icon-print\',plain:true\">打印</a>");
					}else if (list.get(i).equals("一维打印")) {
						out.println("<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='"+printYWMClick+"' data-options=\"iconCls:\'icon-print\',plain:true\">一维打印</a>");
					}else if (list.get(i).equals("编辑")) {
						out.println("<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='"+eidtChangeClick+"' data-options=\"iconCls:\'icon-edit\',plain:true\">编辑</a>");
					}else if (list.get(i).equals("接收")) {
						out.println("<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='"+dealBackClick+"' data-options=\"iconCls:\'icon-edit\',plain:true\">接收</a>");
					}else if (list.get(i).equals("寄出")) {
					out.println("<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='"+dealNotBackClick+"' data-options=\"iconCls:\'icon-edit\',plain:true\">寄出</a>");
					}else if (list.get(i).equals("取消接收")) {
					out.println("<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='"+notdealBackClick+"' data-options=\"iconCls:\'icon-remove\',plain:true\">取消接收</a>");
					}else if (list.get(i).equals("取消寄出")) {
					out.println("<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='"+notdealNotBackClick+"' data-options=\"iconCls:\'icon-remove\',plain:true\">取消寄出</a>");
					}else if (list.get(i).equals("查看订单")) {
					out.println("<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='"+searchMsgClick+"' data-options=\"iconCls:\'icon-edit\',plain:true\">查看订单</a>");
					}else if (list.get(i).equals("签收")) {
						out.println("<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='"+searchMsgQs+"' data-options=\"iconCls:\'icon-edit\',plain:true\">签收</a>");
					}else if (list.get(i).equals("核对")) {
						out.println("<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='"+checkClick+"' data-options=\"iconCls:\'icon-edit\',plain:true\">核对</a>");
					}else if (list.get(i).equals("一键审核")) {
						out.println("<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='"+YJshenheClick+"' data-options=\"iconCls:\'icon-edit\',plain:true\">一键审核</a>");
					}else if (list.get(i).equals("提货确认")) {
						out.println("<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='"+affirmClick+"' data-options=\"iconCls:\'icon-edit\',plain:true\">提货确认</a>");
					}else if (list.get(i).equals("日图")) {
						out.println("<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='"+dayClick+"' data-options=\"iconCls:\'icon-edit\',plain:true\">日图</a>");
					}else if (list.get(i).equals("周图")) {
						out.println("<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='"+zhouClick+"' data-options=\"iconCls:\'icon-edit\',plain:true\">周图</a>");
					}else if (list.get(i).equals("月图")) {
						out.println("<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='"+yueClick+"' data-options=\"iconCls:\'icon-edit\',plain:true\">月图</a>");
					}else if (list.get(i).equals("年图")) {
						out.println("<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='"+nianClick+"' data-options=\"iconCls:\'icon-edit\',plain:true\">年图</a>");
					}else if (list.get(i).equals("提货")) {
						out.println("<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='"+dealDeliveryClick+"' data-options=\"iconCls:\'icon-edit\',plain:true\">提货</a>");
					}else if (list.get(i).equals("提审")) {
						out.println("<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='"+dealtishenClick+"' data-options=\"iconCls:\'icon-edit\',plain:true\">提审</a>");
				
					}else if (list.get(i).equals("调整")) {
						out.println("<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='"+TzeidtChangeClick+"' data-options=\"iconCls:\'icon-add\',plain:true\">调整</a>");
					}else if (list.get(i).equals("审核")) {
						out.println("<a href='javascript:void(0)' class='easyui-linkbutton' id='tbinput' onclick='"+shenheClick+"' data-options=\"iconCls:\'icon-edit\',plain:true\">审核</a>");
					}
					
				}
/*			out.println("<a href='#' onclick='addUser()' class='btn btn-primary'><i class='fa fa-plus'></i>&nbsp;&nbsp;创建</a>");
			out.println("<a href='#' class='btn btn-primary id='email_delete' name='email_delete'><i class='fa fa-pencil'></i>&nbsp;&nbsp; 修改</a>");
			out.println("<a href='#' class='btn btn-danger' id='email_delete' name='email_delete'><i class='fa fa-minus'></i>&nbsp;&nbsp; 删除</a>");
*/
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return EVAL_PAGE;
	}
	@Override
	public int doEndTag() throws JspException {
		// TODO Auto-generated method stub
		 return EVAL_PAGE;
	}
	@Override
	public void release() {
		// TODO Auto-generated method stub
		super.release();
		menu_id=null;
	}
	private String menu_id;
	private String addBtnClick="add()";//添加
	private String editBtnClick="modify()";//修改
	private String quanBtnClick="QuanBtn()";//授权
	private String delBtnClick="deleteEver()";//删除
	private String InfoBtnClick="xiangxixinxi()";//详细信息
	private String exportBtnClick="putintfile()";//导入
	private String importBtnClick="putoutfile()";//导出
	private String resetPswBtnClick="resetpassword()";//密码重置
	private String biddingBtnClick="biddingBtn()";//竞价
	private String monitorBtnClick="monitorBtn()";//全图监控
	private String QRCodeBtnClick="dy()";//打印
	private String printYWMClick="printYWM()";//一维码打印
	private String playbackBtnClick="playbackCodeBtn()";//回放
	private String BDCarClick="bdcar()";//绑定车辆
	private String eidtChangeClick="eidtChange()";//编辑
	private String dealBackClick="dealBack()";//接受
	private String dealNotBackClick="dealNotBack()";//寄出
	private String notdealBackClick="notdealBack()";//取消接收
	private String notdealNotBackClick="notdealNotBack()";//取消寄出
	private String searchMsgClick="searchMsg()";//查看订单
	private String searchMsgQs="searchMsgQs()";//签收
	private String checkClick="check()";//核对
	private String YJshenheClick="shenhe()";//一建审核
	private String affirmClick="affirm()";//提货确认
	private String dayClick="day()";//日图
	private String zhouClick="zhou()";//周图
	private String yueClick="yue()";//月图
	private String nianClick="nian()";//年图
	private String dealDeliveryClick="dealDelivery()";//提货
	private String dealtishenClick="dealtishen()";//提审
	private String TzeidtChangeClick="eidtChange()";//调整
	private String shenheClick="shenhe()";//审核
	
	
	
	public String getYueClick() {
		return yueClick;
	}
	public void setYueClick(String yueClick) {
		this.yueClick = yueClick;
	}
	public UserInfoService getUis() {
		return uis;
	}
	public void setUis(UserInfoService uis) {
		this.uis = uis;
	}
	public static ApplicationContext getAc() {
		return ac;
	}
	public static void setAc(ApplicationContext ac) {
		ButtonTag.ac = ac;
	}
	public String getPrintYWMClick() {
		return printYWMClick;
	}
	public void setPrintYWMClick(String printYWMClick) {
		this.printYWMClick = printYWMClick;
	}
	public String getBDCarClick() {
		return BDCarClick;
	}
	public void setBDCarClick(String bDCarClick) {
		BDCarClick = bDCarClick;
	}
	public String getEidtChangeClick() {
		return eidtChangeClick;
	}
	public void setEidtChangeClick(String eidtChangeClick) {
		this.eidtChangeClick = eidtChangeClick;
	}
	public String getDealBackClick() {
		return dealBackClick;
	}
	public void setDealBackClick(String dealBackClick) {
		this.dealBackClick = dealBackClick;
	}
	public String getDealNotBackClick() {
		return dealNotBackClick;
	}
	public void setDealNotBackClick(String dealNotBackClick) {
		this.dealNotBackClick = dealNotBackClick;
	}
	public String getNotdealBackClick() {
		return notdealBackClick;
	}
	public void setNotdealBackClick(String notdealBackClick) {
		this.notdealBackClick = notdealBackClick;
	}
	public String getNotdealNotBackClick() {
		return notdealNotBackClick;
	}
	public void setNotdealNotBackClick(String notdealNotBackClick) {
		this.notdealNotBackClick = notdealNotBackClick;
	}
	public String getSearchMsgClick() {
		return searchMsgClick;
	}
	public void setSearchMsgClick(String searchMsgClick) {
		this.searchMsgClick = searchMsgClick;
	}
	public String getSearchMsgQs() {
		return searchMsgQs;
	}
	public void setSearchMsgQs(String searchMsgQs) {
		this.searchMsgQs = searchMsgQs;
	}
	public String getCheckClick() {
		return checkClick;
	}
	public void setCheckClick(String checkClick) {
		this.checkClick = checkClick;
	}
	public String getYJshenheClick() {
		return YJshenheClick;
	}
	public void setYJshenheClick(String yJshenheClick) {
		YJshenheClick = yJshenheClick;
	}
	public String getAffirmClick() {
		return affirmClick;
	}
	public void setAffirmClick(String affirmClick) {
		this.affirmClick = affirmClick;
	}
	public String getDayClick() {
		return dayClick;
	}
	public void setDayClick(String dayClick) {
		this.dayClick = dayClick;
	}
	public String getZhouClick() {
		return zhouClick;
	}
	public void setZhouClick(String zhouClick) {
		this.zhouClick = zhouClick;
	}
	public String getNianClick() {
		return nianClick;
	}
	public void setNianClick(String nianClick) {
		this.nianClick = nianClick;
	}
	public String getDealDeliveryClick() {
		return dealDeliveryClick;
	}
	public void setDealDeliveryClick(String dealDeliveryClick) {
		this.dealDeliveryClick = dealDeliveryClick;
	}
	public String getDealtishenClick() {
		return dealtishenClick;
	}
	public void setDealtishenClick(String dealtishenClick) {
		this.dealtishenClick = dealtishenClick;
	}
	public String getTzeidtChangeClick() {
		return TzeidtChangeClick;
	}
	public void setTzeidtChangeClick(String tzeidtChangeClick) {
		TzeidtChangeClick = tzeidtChangeClick;
	}
	public String getShenheClick() {
		return shenheClick;
	}
	public void setShenheClick(String shenheClick) {
		this.shenheClick = shenheClick;
	}
	public String getPlaybackBtnClick() {
		return playbackBtnClick;
	}
	public void setPlaybackBtnClick(String playbackBtnClick) {
		this.playbackBtnClick = playbackBtnClick;
	}
	public String getQuanBtnClick() {
		return quanBtnClick;
	}
	public void setQuanBtnClick(String quanBtnClick) {
		this.quanBtnClick = quanBtnClick;
	}
	public String getQRCodeBtnClick() {
		return QRCodeBtnClick;
	}
	public void setQRCodeBtnClick(String qRCodeBtnClick) {
		QRCodeBtnClick = qRCodeBtnClick;
	}
	public String getAddBtnClick() {
		return addBtnClick;
	}
	public void setAddBtnClick(String addBtnClick) {
		this.addBtnClick = addBtnClick;
	}
	public String getEditBtnClick() {
		return editBtnClick;
	}
	public void setEditBtnClick(String editBtnClick) {
		this.editBtnClick = editBtnClick;
	}
	public String getDelBtnClick() {
		return delBtnClick;
	}
	public void setDelBtnClick(String delBtnClick) {
		this.delBtnClick = delBtnClick;
	}
	public String getInfoBtnClick() {
		return InfoBtnClick;
	}
	public void setInfoBtnClick(String infoBtnClick) {
		InfoBtnClick = infoBtnClick;
	}
	public String getExportBtnClick() {
		return exportBtnClick;
	}
	public void setExportBtnClick(String exportBtnClick) {
		this.exportBtnClick = exportBtnClick;
	}
	public String getImportBtnClick() {
		return importBtnClick;
	}
	public void setImportBtnClick(String importBtnClick) {
		this.importBtnClick = importBtnClick;
	}
	
	public String getResetPswBtnClick() {
		return resetPswBtnClick;
	}
	public void setResetPswBtnClick(String resetPswBtnClick) {
		this.resetPswBtnClick = resetPswBtnClick;
	}
	public String getBiddingBtnClick() {
		return biddingBtnClick;
	}
	public void setBiddingBtnClick(String biddingBtnClick) {
		this.biddingBtnClick = biddingBtnClick;
	}
	public String getMonitorBtnClick() {
		return monitorBtnClick;
	}
	public void setMonitorBtnClick(String monitorBtnClick) {
		this.monitorBtnClick = monitorBtnClick;
	}
	public String getMenu_id() {
		return menu_id;
	}
	public void setMenu_id(String menu_id) {
		this.menu_id = menu_id;
	}
}
