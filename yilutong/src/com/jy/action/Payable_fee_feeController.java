package com.jy.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.common.SessionInfo;
import com.jy.common.UUIDUtils;
import com.jy.dao.Json;
import com.jy.model.Confluence;
import com.jy.model.Mingxi;
import com.jy.model.Settlement;
import com.jy.model.ShippingOrder;
import com.jy.model.User;
import com.jy.service.Payable_feeService;
import com.jy.service.Payable_fee_feeService;

@Controller
@RequestMapping(value = "/payablefee.do")
public class Payable_fee_feeController {
	@Resource
	private Payable_fee_feeService pay;
	@Resource
	private Payable_feeService pay2;
	
	@RequestMapping(params = "method=getDeliveryfee")
	public String getDeliveryfee() {
	return "payable/Deliveryfee";
	}
	@RequestMapping(params = "method=getEditCompanyPageFee")
	public String getEditCompanyPageFee(String pid, HttpServletRequest request) 

{
		request.setAttribute("flg", pid);
		return "payable/EditpayableFee";
	}
	// 应付中转费 取消核销

		@RequestMapping(params = "method=delfee")
		public @ResponseBody
		Json delfee(ShippingOrder d, String pid[]) {
			Json json = new Json();
			boolean flag = false;
			json.setFlag(flag);
			List<ShippingOrder> list10 = pay2.selectinfo(pid);
			for (ShippingOrder op : list10) {
				d.setFee_writeoff("3");
				ShippingOrder sp = new ShippingOrder();
				d.setSend_date(sp.getSend_date());
				d.setPeople_song(null);
				int truk = pay.delfee(op.getShiping_order_id(),
						d.getFee_writeoff(), d.getSend_date(),d.getPeople_song());
				System.out.println("truk2"+truk);
				int i = pay2.delConf(pid);
				int v = pay2.delMingxi(pid);
			}
			return json;
		}

	@RequestMapping(params = "method=updateShippingOrdersFee")
	public @ResponseBody
	Json updateShippingOrdersFee(ShippingOrder d) {
	// 修改
	Json json = new Json();
	String xx = d.getFee_remarks1();
	try {
		if(xx!=null){
			xx=new String(xx.getBytes("ISO-8859-1"),"utf-8");
		}
	
	} catch (Exception e) {
		e.printStackTrace();
	}
	d.setFee_remarks1(xx);
	int i = pay.updateShippingOrdersFee(d);
	if (i > 0) {
		json.setFlag(true);	
		return json;
	}
	json.setFlag(false);
	return json;
	}

	// 修改查询
		@RequestMapping(params = "method=getUpdate")
		public @ResponseBody
		ShippingOrder getUpdate(String id) {
			ShippingOrder der = pay2.getUpdate(id);
			return der;
		}

	//全部查询
	@RequestMapping(params = "method=getDeliveryfeeList")
	public @ResponseBody
	Map getDeliveryfeeList(String rows, String page, String send_station,
			String end_address, String send_time, String car_name,
			String send_date_fee, String create_time,String fee_writeoff,String receipt,String goods_name,String goods_num,String pay_type,String delivery_fee) {
	Integer rows1 = 0;// 当前有几行
	Integer page1 = 1;// 当前有几页
	if (rows != null && !"".equals(rows)) {
		rows1 = Integer.parseInt(rows);
	}
	if (page != null && !"".equals(page)) {
		page1 = Integer.parseInt(page);
	}
	
	List<ShippingOrder> list = pay.getDeliveryfeeList((page1 - 1) * rows1, rows1,
			send_station, end_address, send_time, car_name, send_date_fee,
			create_time, fee_writeoff, receipt, goods_name, goods_num, pay_type, delivery_fee);
	
	int count = pay.getDeliveryfeeCount(send_station, end_address, send_time,
			car_name, send_date_fee, create_time, fee_writeoff, receipt, goods_name, goods_num, pay_type, delivery_fee);
	Map<String, Object> map = new HashMap<String, Object>();
	map.put("total", count);
	map.put("rows", list);
	return map;
	}
//修改
	@RequestMapping(params = "method=update")
	public @ResponseBody
	Json update(ShippingOrder d,HttpServletRequest request) {
		Json json = new Json();
		boolean flag = false;
		json.setFlag(flag);
	try{
			String[] s = d.getShiping_order_id().split(",");
			List<ShippingOrder> list10=pay2.selectinfo(s);
			for (ShippingOrder op : list10) {
				if ("3".equals(op.getFee_writeoff())) {
					for (int i = 0; i < list10.size(); i++) {
						SimpleDateFormat df = new SimpleDateFormat(
								"yyyy-MM-dd HH:mm:ss");// 设置日期格式
						User user=(User)request.getSession().getAttribute(SessionInfo.SessionName);
						d.setPeople_jie(user.getUsername());
						d.setSend_date_fee(df.format(new Date()));
						int truk = pay.update(op.getShiping_order_id(),
								d.getFee_writeoff(),d.getFee_remarks1(),
								d.getSend_date_fee(),d.getPeople_jie());
					}
					List<Confluence> list1 = new ArrayList<Confluence>();
					Confluence co = new Confluence();
					co.setFee_date(d.getSend_date_fee());
					co.setDirection("支出");
					co.setSource("1");
					co.setHappen(op.getDelivery_fee1() );
					co.setId(op.getShiping_order_id());
					co.setProject("应付接货费核销");
					co.setShiping_order_num(op.getShiping_order_num());
					co.setHandle("实付接货费");
					co.setConf_id(UUIDUtils.getUUID());
					list1.add(co);
					int flat=pay2.insertinfo(list1);
					List<Mingxi> ls = new ArrayList<Mingxi>();
					Mingxi mx = new Mingxi();
					SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
					mx.setHappen_date(df.format( new Date()));
					mx.setSubject("应付接货费核销");
					mx.setSubject_two("接货费");
					mx.setMingxi_id(op.getShiping_order_id());
					mx.setSubject_three(d.getFee_writeoff());
					mx.setMoney(op.getDelivery_fee1());
					mx.setRemarks(op.getFee_remarks1());
					mx.setShiping_order_num(op.getShiping_order_num());
					mx.setCustomer_name(op.getCustom_name());//客户接货人
					mx.setConsignee(op.getReceipt());
					mx.setId(UUIDUtils.getUUID());
					mx.setLaiyuan("支出");
					ls.add(mx);
					int  add = pay2.add(ls);
					
					List<Settlement> list = new ArrayList<Settlement>();
						Settlement st = new Settlement();
						st.setWrite_id(UUIDUtils.getUUID());
						st.setShiping_order_num(op.getShiping_order_num());
						st.setWrite_fangshi(d.getFee_writeoff());
						st.setWrite_people(d.getPeople_jie());
						st.setWrite_data(d.getSend_date_fee());
						st.setWrite_money(op.getDelivery_fee1());
						st.setWrite_project("应付接货费");
						list.add(st);
						int d1 = pay2.addSettlement(list);
						
					
				} else {
				}
			}
			return json;
		} catch (Exception e) {
			return json;
		}
	}


}
