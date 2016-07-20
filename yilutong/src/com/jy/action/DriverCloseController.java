package com.jy.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.common.SessionInfo;
import com.jy.common.UUIDUtils;
import com.jy.dao.Json;
import com.jy.model.ShippingOrder;
import com.jy.model.User;
import com.jy.service.DriverCloseService;

@Controller
@RequestMapping(value = "/DriverClose.do")
public class DriverCloseController {
	@Resource DriverCloseService dcs;
	/**
     * 跳转司机结算界面
     * */
	@RequestMapping(params = "method=getDriverClose")
	public String getDriverClose(){
		return "DriverClose/DriverCloseJsp";
    }
	@RequestMapping(params = "method=getDriverCloseRejectInfo")
	public@ResponseBody Map getDriverCloseRejectInfo(String rows, String page,String shiping_order_num,String receipt,String fee_date,String fee_datetime , String create_time,String create_date,String write_off,String send_station ,String goods_name,String goods_num,String pay_type,String driver_name){		
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		List<ShippingOrder> list = dcs.getDriverCloseRejectInfo(rows1,(page1 - 1) * rows1, shiping_order_num, receipt, fee_date, fee_datetime, create_time, create_date, write_off, send_station, goods_name, goods_num, pay_type, driver_name);
		int count = dcs.getDriverCloseRejectCoun(shiping_order_num, receipt, fee_date, fee_datetime, create_time, create_date, write_off, send_station, goods_name, goods_num, pay_type, driver_name);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}
	/**
	 * 修改费用
	 * */
	@RequestMapping(params = "method=UpdeteClose")
	public Json UpdeteClose(ShippingOrder sd){
	   int i = dcs.UpdeteClose(sd);
	   if (i>0) {
	   }
		return null;
	}
	/**
	 * 结算跳转
	 * */
	@RequestMapping(params = "method=getCloseRedirect")
	public String getCloseRedirect(String[] pid,HttpServletRequest request){
		request.setAttribute("flg", pid);
		return "DriverClose/EreCloseDriver";	
	}
	/**
	 * 结算提交
	 * */
	@RequestMapping(params = "method=UpdateCloseDriver")
	public@ResponseBody Json UpdateCloseDriver(ShippingOrder sd,String[] pid,HttpServletRequest request){
		User user = (User) request.getSession().getAttribute(SessionInfo.SessionName);
		Json josn = new Json();   
        sd.setDriver_close_naem( user.getUsername());     
        int i = dcs.UdateDriverClose(sd.getSettlement_modes(), sd.getFee_remarks(), sd.getDriver_close_naem(), sd.getDriv_sige_name(), sd.getDriv_card(), sd.getDriv_bank(), sd.getOil_card(), sd.getOil_card_name(), pid);
        
        if (i>0) {
        	josn.setFlag(true);	
        }
		return josn;
	}
	/**
	 * 提审跳转界面
	 * */
	@RequestMapping(params = "method=getArraignedClose")
    public String getArraignedClose(String[] pid,HttpServletRequest request){
		System.out.println(pid.length);
		request.setAttribute("pid", pid);
    	return "DriverClose/EreArraignedClose";
    }
	/**
	 * 提审提交
	 * */
	@RequestMapping(params = "method=getArraignedDriverClose")
	public@ResponseBody Json getArraignedDriverClose(String[] pid,String trial_remarks,String did,String trial_name,HttpServletRequest request){
		User user = (User) request.getSession().getAttribute(SessionInfo.SessionName);       
		Json json = new Json();
		int i = dcs.getArraignedDriverClose(pid, trial_remarks, did, user.getUsername());
		if (i>0) {
			json.setFlag(true);
			System.out.println("成功！");
		}		
		return json;
	}
	/**
	 * 跳转审核界面
	 * */
	@RequestMapping(params = "method=getDriverChecked")
	public String getDriverChecked(){
		return "DriverClose/DriverCheckedInfo";
		
	}
	
	/**
	 * 司机审核查询
	 * */
	@RequestMapping(params = "method=getDriverCheckedSelect")
    public@ResponseBody Map getDriverCheckedSelect( String page,String rows,String driver_name,String car_number,String kuhu_date,String kuhu_dates,String create_time,String create_date){
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		List<ShippingOrder> list = dcs.getDriverChecked((page1 - 1) * rows1, rows1,driver_name, car_number, kuhu_date, kuhu_dates, create_time, create_date);
		int count = dcs.getDriverCheckedCount(driver_name, car_number, kuhu_date, kuhu_dates, create_time, create_date);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
    }
	/**
	 * 详细信息
	 * */
	@RequestMapping(params = "method=getDriverShip")
	public String getDriverShip(String did,HttpServletRequest request){
		request.setAttribute("did",did);
		return "DriverClose/EreDriverShipping";
	}
	/**
	 * 详细信息查询
	 * */
	@RequestMapping(params = "method=getDriverShipping")
	public@ResponseBody Map<String, Object> getDriverShipping(String page,String rows,String did){		
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		List<ShippingOrder> list = dcs.getDriverShipping((page1 - 1) * rows1, rows1,did);
		int count = dcs.getDriverShippingCount(did);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
		
	}
	/**
	 * 审核跳转
	 * */
	@RequestMapping(params = "method=getDriverCh")
	public String getDriverCh(String id,HttpServletRequest request){
		request.setAttribute("id",id);
		return "DriverClose/EreCheckedRejct";
		
	}
	/**
	 * 查选
	 * */
	@RequestMapping(params = "method=getShippingDriver")
	 public@ResponseBody ShippingOrder getShippingDriver(String id){
		ShippingOrder so = dcs.getShippingDriver(id);
		return so;		 
	 }
	/**
	 * 审核
	 * */
	@RequestMapping(params = "method=getDriverCheckedClose")
    public@ResponseBody Json getDriverCheckedClose(String id,ShippingOrder sd){
		Json json = new Json();
		List<ShippingOrder> list = dcs.getDriverCheckedShipp(sd.getDriver_id());
		List<ShippingOrder> ls = new ArrayList<ShippingOrder>();
		System.out.println(list.size()+"凸^-^凸");
		int j;
		ShippingOrder spo = null;
		for (ShippingOrder so : list) {
			spo = new ShippingOrder();
			spo.setCost_summary_id(UUIDUtils.getUUID());
			spo.setCustom_id(so.getCustom_id());
			spo.setCustomer_id(so.getCustomer_id());
			spo.setShiping_order_id(so.getShiping_order_id());
			spo.setShiping_order_num(so.getShiping_order_num());
			spo.setPaid_upstairs_fee(so.getPaid_upstairs_fee());
			spo.setPaid_deliver_fee(so.getPaid_deliver_fee());
			spo.setPaid_ground_fee(so.getPaid_ground_fee());
			spo.setPaid_adorn_fee(so.getPaid_adorn_fee());
			spo.setSend_fee(so.getSend_fee());
			spo.setPay_upstairs_fee(so.getPay_upstairs_fee());			
			spo.setPayble_other(so.getPayble_other());
			spo.setPayble_coolie(so.getPayble_coolie());
			
			j = dcs.UpdateCheckedShipp(sd.getUsername(), so.getShiping_order_id(),sd.getClose_recheck_remarks());
			if (j>0) {
				json.setFlag(true);
			}
		}
			
		
		//int l = dcs.insertDriverClose(ls);
		     	     
	    
	     
    	return json;
    }
	/**
	 * 驳回
	 * */
	@RequestMapping(params = "method=getDriverCheckedReject")
    public@ResponseBody Json getDriverCheckedReject(ShippingOrder sd){
		Json json = new Json();
		List<ShippingOrder> list = dcs.getDriverCheckedShipp(sd.getDriver_id());
		int j;
		for (ShippingOrder so : list) {
			j = dcs.UpdateCheckedReject(sd.getUsername(), so.getShiping_order_id(),sd.getClose_recheck_remarks());
			if (j>0) {
				json.setFlag(true);
			}
		}
	     
    	return json;
    }
}
