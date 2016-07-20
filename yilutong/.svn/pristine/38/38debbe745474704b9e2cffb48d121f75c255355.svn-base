package com.jy.action;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.http.HttpRequest;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import sun.print.resources.serviceui;

import com.jy.common.SessionInfo;
import com.jy.common.UUIDUtils;
import com.jy.dao.Json;
import com.jy.model.Company;
import com.jy.model.Confluence;
import com.jy.model.Mingxi;
import com.jy.model.OrderCustom;
import com.jy.model.Settlement;
import com.jy.model.ShippingOrder;
import com.jy.model.User;
import com.jy.service.CollectService;

@Controller
@RequestMapping(value = "/collect.do")
public class CollectController {
	private static final Date Date = null;
	/**
	 * 应付客户款项核销（按车核销）
	 */
	
	@Resource
	private CollectService cs;

	@RequestMapping(params = "method=get")
	public String getCompanyQuery() {
		return "collect/collect";
		
	}

	// 全部查询
	@RequestMapping(params = "method=getCollect")
	public @ResponseBody Map getCompany(String rows, String page, String custom_name,String car_time, String kuhu_date,String kuhu_dates,String write_off3,String send_time,String send_times,String receipt_time,String receipt_times,String car_number,String driver_name) {
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		List<ShippingOrder> list = cs.getCollect((page1 - 1) * rows1, rows1,custom_name, car_time, kuhu_date,kuhu_dates,write_off3, send_time,send_times, receipt_time,receipt_times, car_number, driver_name);
		int count = cs.getCollectInfo(custom_name, car_time, kuhu_date,kuhu_dates,write_off3, send_time,send_times, receipt_time, receipt_times,car_number, driver_name);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}
	// 修改
	@RequestMapping(params = "method=updateShippiOrCo")
	public @ResponseBody Json updateShippiOrCo(ShippingOrder d, HttpServletRequest request) {
			Json json = new Json();
			String remarks_fee1 = request.getParameter("remarks_fee1");
			d.setRemarks_fee1(remarks_fee1);
			String paid_fee = request.getParameter("paid_fee");
			String transport_pay = request.getParameter("transport_pay");
			d.setTransport_pay(transport_pay);
			d.setPaid_fee(paid_fee);
			
			System.out.println("应收到付款："+d.getPaid_fee());
			System.out.println("备注："+d.getReceived_remarks());
			System.out.println("应付到付款："+d.getPay_trade_agency());
			System.out.println("daishoukuan ："+d.getPay_destination_fee());
			//int i = cs.updateShippingOrder(d);
			int i = cs.updateShippiOrCo(d);
			if (i > 0) {
				json.setFlag(true);
				return json;
			}
			json.setFlag(false);
			return json;
		}
	// 修改
//	@RequestMapping(params = "method=updateShippingOrder")
//	public @ResponseBody
//	Json updateShippingOrder(OrderCustom d, HttpServletRequest request) {
//		Json json = new Json();
//		String remarks_fee1 = request.getParameter("remarks_fee1");
//		d.setRemarks_fee1(remarks_fee1);
//		String paid_fee = request.getParameter("paid_fee");
//		String transport_pay = request.getParameter("transport_pay");
//		d.setTransport_pay(transport_pay);
//		d.setPaid_fee(paid_fee);
//		int i = cs.updateShippingOrder(d);
//		if (i > 0) {
//			json.setFlag(true);
//			return json;
//		}
//		json.setFlag(false);
//		return json;
//	}

	// 修改
	@RequestMapping(params = "method=otherUpdate")
	public @ResponseBody
	Json otherUpdate(ShippingOrder d, HttpServletRequest request) {
		Json json = new Json();
	
		String paid = request.getParameter("paid");
		d.setPaid(paid);
		String write_remarks = request.getParameter("write_remarks");
		String paid_chayi = request.getParameter("paid_chayi");
		d.setPaid_chayi(paid_chayi);
		String chayi_daifukuan1 = request.getParameter("chayi_daifukuan1");
		d.setChayi_daifukuan1(chayi_daifukuan1);
		d.setWrite_remarks(write_remarks);
		String paid1 = request.getParameter("paid1");
		d.setPaid1(paid1);

		int i = cs.otherUpdate(d);
	
		if (i>0) {
		  return json;
		}
		return json;
		
	}

	// 修改查询
	@RequestMapping(params = "method=getUpdateCompany")
	public @ResponseBody
	OrderCustom getUpdateCompany(String id) {
		OrderCustom der = cs.getUpdateShippingOrder(id);
		return der;
	}

	// 跳转编辑页面并且获取合同的id 返回到页面
	@RequestMapping(params = "method=getEditCompanyPagef")
	public String getEdittCompanyPagef(String[] pid, HttpServletRequest request) {
		System.out.println("id"+pid);
		request.setAttribute("flg", pid);
		return "collect/Editcollect";
	}

	@RequestMapping(params = "method=getUpdate3")
	public @ResponseBody
	OrderCustom getUpdate3(String id) {
		OrderCustom der = cs.getupdate3(id);
		return der;
	}
	/**
	 * 
	 * */
	@RequestMapping(params = "method=getshipinCollect")
	public @ResponseBody ShippingOrder getshipinCollect(String id) {
		ShippingOrder der = cs.getshipinCollect(id);
		return der;
	}
    /**
     * 结算
     * */
	@RequestMapping(params = "method=updateCollect")
	public @ResponseBody
	Json updateCollect(String[] pid,ShippingOrder d,String remarks,String kahao,String names,String bank,String write_of, HttpServletRequest request) {
		Json json = new Json();	
			//List<ShippingOrder> list = cs.select(s);
		
      System.out.println(remarks+kahao+bank+names+write_of+"///////////");
				
						SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
						User user=(User)request.getSession().getAttribute(SessionInfo.SessionName);
						d.setPeople_name(user.getUsername());
						d.setKuhu_date(df.format(new Date()));
					    d.setCustoms_recheck_state("0");
	
						int truk = cs.update3(pid,write_of, remarks,d.getKuhu_date(),d.getPeople_name(),d.getCustoms_recheck_state(),names,kahao,bank);
			if (truk>0) {
			    json.setFlag(false);
			}	
			return json;
      }
	/**
	 * 提审跳转界面
	 * */
	@RequestMapping(params = "method=getArraignedClose")
    public String getArraignedClose(String[] pid,HttpServletRequest request){
		System.out.println(pid.length);
		request.setAttribute("pid", pid);
    	return "collect/EreArraignedCustoms";
    }
	/**
	 * 专线公司结算提审
	 * */
	@RequestMapping(params = "method=getEreArraignedCustoms")
	 public@ResponseBody Json getEreArraignedCustoms(String[] pid,String trial_remarks,String did,String trial_name,HttpServletRequest request){
		User user = (User) request.getSession().getAttribute(SessionInfo.SessionName); 
		Json json = new Json();
		System.out.println(trial_remarks);
		System.out.println(did);
		System.out.println(trial_name);
		System.out.println(pid.length);
		int i = cs.getEreArraignedCustoms(pid, trial_remarks, did, user.getUsername());
		 
		 if (i>0) {
			 System.out.println("成功！！！！！");
			 json.setFlag(true);
		}
		
		 return json;
		 
		 
	 }
	/**
	 * 应收其他费核销
	 */
	@RequestMapping(params = "method=gets")
	public String getCompanyQuerys() {
		return "collect/others";
	}

	// 全部查询
	@RequestMapping(params = "method=getAdorn_fee")
	public @ResponseBody
	Map getAdorn_fee(String rows, String page, String shiping_order_num,
			String send_station, String others_date,String aa,String write_off5,String custom_name,String receipt,String goods_name,String goods_num,String pay_type,String paid) {
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		List<ShippingOrder> list = cs.getAdorn_fee((page1 - 1) * rows1, rows1,
				shiping_order_num, send_station, others_date, aa,write_off5, custom_name, receipt, goods_name, goods_num, pay_type, paid);

		int count = cs.getAdorn_feeInfo(shiping_order_num, send_station,
				others_date,aa,write_off5, custom_name, receipt, goods_name, goods_num, pay_type, paid);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}

	// 跳转编辑页面并且获取合同的id 返回到页面
	@RequestMapping(params = "method=getEditCompanyPages")
	public String getEdittCompanyPages(String pid, HttpServletRequest request) {

		request.setAttribute("flg", pid);
		return "collect/Editothers";
	}

	@RequestMapping(params = "method=getUpdate2")
	public @ResponseBody
	ShippingOrder getUpdate2(String id) {
		ShippingOrder der = cs.getUpdate2(id);
		return der;
	}

	// 修改
	@RequestMapping(params = "method=update9")
	public @ResponseBody
	Json update9(ShippingOrder d,HttpServletRequest request) {
		Json json = new Json();
		boolean flag = false;
		json.setFlag(flag);
		try {
			String[] s = d.getShiping_order_id().split(",");
			
			List<ShippingOrder> list10 = cs.selectinfo(s);
		
			for (ShippingOrder op : list10) {
				if ("3".equals(op.getWrite_off5())) {
					for (int i = 0; i < list10.size(); i++) {
						SimpleDateFormat df = new SimpleDateFormat(
								"yyyy-MM-dd HH:mm:ss");// 设置日期格式
						d.setOthers_date(df.format(new Date()));
					
						d.setShiping_order_num(op.getShiping_order_num());
						User user=(User)request.getSession().getAttribute(SessionInfo.SessionName);
						d.setPeople_others(user.getUsername());
						int truk = cs.update9(op.getShiping_order_id(),
								d.getWrite_off5(),	d.getOthers_date(), 
								d.getPeople_others(),d.getWrite_remarks());
					}
					// List<ShippingOrder> list = cs.selectinfo(s);
					// for (ShippingOrder sy : list) {
					List<Confluence> list1 = new ArrayList<Confluence>();

					Confluence co = new Confluence();
					SimpleDateFormat df2 = new SimpleDateFormat(
							"yyyy-MM-dd HH:mm:ss");// 设置日期格式
					co.setFee_date(	d.getOthers_date());
					co.setDirection("收入");
					co.setSource("1");
					co.setHappen(op.getPaid());
					co.setId(op.getShiping_order_id());
					co.setProject("应付其他费， 运费核销 ");
					co.setConf_id(UUIDUtils.getUUID());
					co.setShiping_order_num(op.getShiping_order_num());
					co.setHandle("应收运费其,其它费");
					list1.add(co);

					int flat = cs.insertinfo(list1);
					// }
					// List<ShippingOrder> lt = cs.selectinfo(s);
					// for (ShippingOrder sq : lt) {
					List<Mingxi> ls = new ArrayList<Mingxi>();
					Mingxi mx = new Mingxi();
					SimpleDateFormat df1 = new SimpleDateFormat(
							"yyyy-MM-dd HH:mm:ss");// 设置日期格式
					mx.setHappen_date(df1.format(new Date()));
					mx.setSubject("应付其他费， 运费核销");
					mx.setSubject_two("其他费，运费");
					mx.setMingxi_id(op.getShiping_order_id());
					mx.setSubject_three(d.getWrite_off5());
					mx.setMoney(op.getPaid());
					mx.setRemarks(op.getWrite_remarks());
					mx.setShiping_order_num(op.getShiping_order_num());
					mx.setCustomer_name(op.getCustom_name());
					mx.setConsignee(op.getReceipt());
					mx.setId(UUIDUtils.getUUID());
					mx.setLaiyuan("收入");
					ls.add(mx);
					int add = cs.add(ls);
					List<Settlement> list9 =  new ArrayList<Settlement>();
					Settlement sl = new Settlement();
					sl.setWrite_id(UUIDUtils.getUUID());
					sl.setShiping_order_num(d.getShiping_order_num());
					sl.setWrite_project("应收其他费，运费");
					sl.setWrite_data(d.getOthers_date());
					sl.setWrite_people(d.getPeople_others());
					sl.setWrite_money(d.getPaid());
					sl.setWrite_fangshi(d.getWrite_off5());
					sl.setRemarks(op.getWrite_remarks());
					list9.add(sl);
					int p = cs.addSettlement(list9);
				} else {

				}

			}

			return json;
		} catch (Exception e) {
			return json;
		}
	}

	// 其他费运费取消核销
	@RequestMapping(params = "method=editOther")
	public @ResponseBody
	Json updateCompany(ShippingOrder d,String pid[],String ids[]
			) {
		Json json = new Json();
		boolean flag = false;
		json.setFlag(flag);
		List<ShippingOrder> list10 = cs.selectinfo(pid);
	
		for(ShippingOrder op : list10 ){
			d.setWrite_off5("3");
	
			ShippingOrder sp = new ShippingOrder();
			d.setOthers_date(sp.getOthers_date());
			d.setPeople_others(null);
			int truk = cs.editOther(op.getShiping_order_id(), d.getWrite_off5(),d.getOthers_date(),d.getPeople_others());
			int i = cs.delConf(pid);
			int v = cs.delMingxi(pid); 
		
			int qq =cs.sp(ids);
		
		}
		return json;
	}
	// 应收客户取消核销
		@RequestMapping(params = "method=editKuhu")
		public @ResponseBody
		Json updatekehu(ShippingOrder d,String pid[]) {
			Json json = new Json();
			boolean flag = false;
			json.setFlag(flag);
			List<ShippingOrder> list = cs.select(pid);
			for(ShippingOrder op : list ){
				System.out.println("idid:"+op.getShiping_order_id());
				d.setWrite_off("3");
				OrderCustom oc = new OrderCustom();
				d.setKuhu_date(oc.getKuhu_date());
				d.setPeople_name(null);
				int truk = cs.editKuhu(op.getShiping_order_id(),d.getWrite_off(),d.getKuhu_date(),d.getPeople_name() );
				//int i = cs.delConf(pid);
				//int v = cs.delMingxi(pid); 
			}
			return json;
		}
		
		// 全部查询
		@RequestMapping(params = "method=selectSettement")
		public @ResponseBody
		Map selectSettement( String shiping_order_num
				) {

			if(shiping_order_num!=null){
				try {
					shiping_order_num=new String(shiping_order_num.getBytes("ISO-8859-1"),"utf-8");
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			List<Settlement> list = cs.selectSettement(shiping_order_num);
			int count = cs.selectSettementInfo(shiping_order_num
					);
			//System.out.println(shiping_order_num+"订单号");
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("total", count);
			map.put("rows", list);
			return map;
		}
		@RequestMapping(params="method=getCheckApplication")
		public String getCheckApplication(){
			
			return "collect/CheckApplication";
		}
		/**
		 * 专线公司结算审核查询
		 * */
		@RequestMapping(params ="method=getCheckCollect")
		public @ResponseBody Map<String, Object> getCheckCollect(String rows, String page, String custom_name,String car_time, String kuhu_date,String kuhu_dates,String write_off3,String send_time,String send_times,String receipt_time,String receipt_times,String car_number,String driver_name){
			Integer rows1 = 0;// 当前有几行
			Integer page1 = 1;// 当前有几页
			if (rows != null && !"".equals(rows)) {
				rows1 = Integer.parseInt(rows);
			}
			if (page != null && !"".equals(page)) {
				page1 = Integer.parseInt(page);
			}
			List<ShippingOrder> list = cs.getCheckCollect((page1 - 1) * rows1, rows1, custom_name, car_time, kuhu_date, kuhu_dates, write_off3, send_time, send_times, receipt_time, receipt_times, car_number, driver_name);
			int count = cs.getCheckCollectCount(custom_name, car_time, kuhu_date, kuhu_dates, write_off3, send_time, send_times, receipt_time, receipt_times, car_number, driver_name);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("total", count);
			map.put("rows", list);
			return map;
		}
		/**
		 * 审核redirect
		 * **/
		@RequestMapping(params ="method=redirectPage")
		public String redirectPage(String id,HttpServletRequest request){
			//System.out.println("id"+id);
			request.setAttribute("id",id);
			return "collect/EditothCheck";
		}
		/**
		 * 审核
		 * **/
		@RequestMapping(params ="method=updateCheckCollect")
		public@ResponseBody Json updateCheckCollect(String [] id,String username,String close_recheck_remarks,String paid_fee,String transport_pay,String trade_agency){
			Json json = new Json();
			List<ShippingOrder> list = cs.getCustomShiping(id);
			
			ShippingOrder or = null;
		    List<ShippingOrder> order =new ArrayList<ShippingOrder>();
		    int s =0;
			for (ShippingOrder oc : list) {
				or = new ShippingOrder();
				or.setCost_summary_id(UUIDUtils.getUUID());
				or.setCustom_id(oc.getCustom_id());
				or.setCustom_name(oc.getCustom_name());
				or.setCustomer_id(oc.getCustomer_id());
				//or.setClose_recheck_time(oc.getClose_recheck_time());
				or.setShiping_order_id(oc.getShiping_order_id());
				or.setShiping_order_num(oc.getShiping_order_num());
				or.setTake_fee(oc.getTake_fee());
				or.setSend_fee(oc.getSend_fee());
				or.setAdorn_fee(oc.getAdorn_fee());
				or.setChange_fee(oc.getChange_fee());
				or.setReceivable_ground_fee(oc.getReceivable_ground_fee());
				or.setUpstairs_fee(oc.getUpstairs_fee());
				or.setDeliver_fee(oc.getDeliver_fee());
				or.setInspect_fee(oc.getInspect_fee());
				or.setSeized_fee(oc.getSeized_fee());
				or.setBack_fee(oc.getBack_fee());
				or.setTransport_pay(oc.getTransport_pay());
				or.setTrade_agency(oc.getTrade_agency());
				s = cs.UpdateShipingorder(oc.getShiping_order_id());
				System.out.println(oc.getShiping_order_id());
				if (s>0) {
					json.setFlag(true);
				}
			}
			System.out.println("审核");
			order.add(or);
			//System.out.println(username+close_recheck_remarks+paid_fee+transport_pay+trade_agency+"？？？？？？？？？？？？？？？？？？");
			//int sh = cs.delectCollShi(or, id);		
			//int j = cs.insertCostShiping(order);
			//int i = cs.updateCheckCollect(id, username, close_recheck_remarks,paid_fee, transport_pay, trade_agency);
			
			
			return json;	
		}
		/**
		 * 客户结算审核select2查询
		 * */
		@RequestMapping(params="method=getUser")
		public @ResponseBody String getUser(String username){
			JSONObject jb = null;
			System.out.println("用户名："+username);
			List<User> list = cs.getuser(username);
			JSONArray jsons = new JSONArray();
			for (User u : list) {
				jb = new JSONObject();
				jb.put("id", u.getId());
				jb.put("name", u.getUsername());
				jsons.add(jb);
			}
			return jsons.toString();

		}
		/**
		 * 跳转详细页面
		 * */
		@RequestMapping(params = "method=getShippingCollect")
		public String getShippingCollect(String pid,HttpServletRequest request) {
			request.setAttribute("flg", pid);
			return "collect/ShippingCollect";
		}
		/**
		 * 详细页面查询
		 * */
		@RequestMapping(params = "method=getShippingCollects")
		public @ResponseBody
		Map getShippingCollects(String rows, String page, String name,
				String phone_number, String type, String start_date, String end_date,String pid,String phone,String order_state,String pay_type,String send_address) {
			Integer rows1 = 0;// 当前有几行
			Integer page1 = 1;// 当前有几页
			if (rows != null && !"".equals(rows)) {
				rows1 = Integer.parseInt(rows);
			}
			if (page != null && !"".equals(page)) {
				page1 = Integer.parseInt(page);
			}
			List<ShippingOrder> list = cs.getShippingCollect((page1 - 1) * rows1,
					rows1, name, phone_number, type, start_date, end_date,pid,phone, order_state, pay_type, send_address);
			for (ShippingOrder sd : list) {
		        if (sd.getStocks_predestination()!=null&&sd.getStocks_predestination()!="") {
					sd.setStocks_predestination("0");
				}
			}
			int count = cs.getShippingCount(name, phone_number, type, start_date,
					end_date,pid, phone, order_state, pay_type, send_address);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("total", count);
			map.put("rows", list);
			return map;
		}
		/**
		 * 驳回
		 * **/
		@RequestMapping(params ="method=rejectCheckCollect")
		public@ResponseBody Json rejectCheckCollect(String [] id,String username,String close_recheck_remarks,String paid_fee,String transport_pay,String trade_agency){
			Json json = new Json();
			//String [] shpid =  new String [20];
			List<ShippingOrder> list = cs.getCustomShiping(id);
			for (ShippingOrder sd : list) {
				System.out.println("ididi"+sd.getShiping_order_id());
				    	 //shpid[i] = String.valueOf(sd.getShiping_order_id());
				    	 int i = cs.rejectShipingorder(sd.getShiping_order_id());
				    	 System.out.println("驳回");
			             //int j = cs.updateCori(sd.getCustom_id(),sd.getWrite_off(), sd.getReceived_remarks(),sd.getKuhu_date(),sd.getPeople_name(),sd.getClose_recheck_state());
			}
			json.setFlag(true);
			return json;	
		}
}
