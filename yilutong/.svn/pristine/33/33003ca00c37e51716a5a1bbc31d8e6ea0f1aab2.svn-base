package com.jy.action;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.common.SessionInfo;
import com.jy.common.UUIDUtils;
import com.jy.dao.Json;
import com.jy.model.Claim_settlement;
import com.jy.model.Customer;
import com.jy.model.Overbooking;
import com.jy.model.ShippingOrder;
import com.jy.model.Unqualified;
import com.jy.model.User;
import com.jy.service.DepartmentService;
import com.jy.service.OverbookingService;
import com.jy.service.UserInfoService;

@Controller
@RequestMapping(value = "/overbook.do")
public class OverbookingController {
	@Resource
	private OverbookingService oks;
	@Resource
	private UserInfoService uis;

	// 跳转下单的页面
	@RequestMapping(params = "method=getOverbookingPage")
	public String getOverbookingPage() {

		return "Over_booking/overbooking";
	}

	/*
	 * 查询全部
	 */
	@RequestMapping(params = "method=dueselects")
	public @ResponseBody
	Map<String, Object> dueselects(String rows, String page,
			String shiping_order_num, String shiping_accept_static,
			String custom_name, String receipt, HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute(
				SessionInfo.SessionName);
		Integer rows1 = 0; // 当前的行数
		Integer page1 = 1; // 当前的页数
		if (rows != null && !rows.equals("")) {
			rows1 = Integer.valueOf(rows);
		}
		if (page != null && !page.equals("")) {
			page1 = Integer.valueOf(page);
		}
		System.out.println();
		List<Overbooking> list = oks.getShipCheckInfo((page1 - 1) * rows1,
				rows1, shiping_order_num, shiping_accept_static, custom_name,
				receipt, user);
		
		int count = oks.getShipCheckInfoConun(shiping_order_num,
				shiping_accept_static, custom_name, receipt,user);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}

	/*
	 * 跳转到添加页面
	 */
	@RequestMapping(params = "method=getadd")
	public String getadd(String shiping_orders_id, HttpServletRequest request,
			HttpSession session) {
		User user = (User) session.getAttribute(SessionInfo.SessionName);
		User u = uis.getUser1(user.getId());
		request.setAttribute("costomers", u.getCostomers());
		String df ="XD" +new SimpleDateFormat("yyMMdd").format(new Date());
		String b = oks.xdselect(); // 方法
		int i=0;
		String c="";
		if(b!=null){
			 c= b.substring(b.length() - 6, b.length()); // 截取后6位
			 i = Integer.parseInt(c);// 转为int
			 i=i+1;		
			 if(i<10){
				 c=df+"00000"+i;					
			 }else if(i>=10&&i<100){
				 c=df+"0000"+i;				 
			 }else if(i>=100&&i<1000){
				 c=df+"000"+i;				 
			 }else if(i>=1000&&i<10000){
				 c=df+"00"+i;
				 
			 }else if(i>=10000&&i<100000){
				 c=df+"0"+i;	 
			 }else if(i>=100000&&i<1000000){
				
				 c=df+i;	 
			 }
		}else{
			 c=df+"000001";
		}
		// 在这里写方法吗
		request.setAttribute("flg", shiping_orders_id);
		request.setAttribute("flg2", c);
		return "Over_booking/overbookingadd";
	}

	/*
	 * 添加的方法
	 */
	@RequestMapping(params = "method=insertInfo")
	public @ResponseBody
	Json insertInfo(Overbooking overbooking, HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute(
				SessionInfo.SessionName);
		overbooking.setUser_id(overbooking.getUser_id());
		
		overbooking.setShiping_orders_id(UUIDUtils.getUUID());
		int a = oks.insertInfo(overbooking);
		Json json = new Json();
		if (a > 0) {
			json.setFlag(true);
		}
		return json;
	}

	/*
	 * 查询发货的方法
	 */
	@RequestMapping(params = "method=inquireName")
	public @ResponseBody
	String inquireName(String custom_name) {
		List<Customer> flist = oks.inquireName(custom_name);
		JSONObject jb = null;
		JSONArray jsons = new JSONArray();
		for (Customer f : flist) {
			jb = new JSONObject();
			jb.put("id", f.getCustomer_id());
			jb.put("name", f.getCustomer_name());
			jsons.add(jb);
		}
		return jsons.toString();
	}

	/*
	 * 查询收货的方法
	 */
	@RequestMapping(params = "method=inquireName1")
	public @ResponseBody
	String inquireName1(String receipt) {
		List<Overbooking> flist = oks.inquireName1(receipt);
		JSONObject jb = null;
		JSONArray jsons = new JSONArray();
		for (Overbooking f : flist) {
			jb = new JSONObject();
			jb.put("id", f.getReceipt());
			jb.put("name", f.getReceipt());
			jsons.add(jb);
		}
		return jsons.toString();
	}

	/*
	 * 
	 * 跳转修改页面的方法
	 */
	@RequestMapping(params = "method=gupdate")
	public String gupdate(String shiping_orders_id, HttpServletRequest request) {
		request.setAttribute("flg", shiping_orders_id);
		return "Over_booking/overbookingupdate";
	}

	/*
	 * 查询修改对应的id
	 */
	@RequestMapping(params = "method=updateId")
	public @ResponseBody
	Overbooking updateId(String id) {
		Overbooking ct = oks.updateId(id);
		return ct;
	}

	/*
	 * 修改
	 */
	@RequestMapping(params = "method=getupdate")
	public @ResponseBody
	Json getupdate(Overbooking shiping_orders_id, HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute(
				SessionInfo.SessionName);
		Json json = new Json();
		int i = oks.getupdate(shiping_orders_id);
		if (i > 0) {
			json.setFlag(true);
			return json;
		} else {
			json.setFlag(false);
		}
		return json;
	}

	/*
	 * 删除的方法
	 */
	@RequestMapping(params = "method=deleteTravel")
	public @ResponseBody
	Json deleteTravel(String[] del) {
		Json json = new Json();
		int list = oks.deleteTravel(del);
		if (list > 0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}

	/*
	 * 接收
	 */
	@RequestMapping(params = "method=updateunqualified")
	public @ResponseBody
	Json updateunqualified(@Param("array") String[] shiping_orders_id) {
		int a = oks.updateunqualified(shiping_orders_id);
		Json json = new Json();
		if (a > 0) {
			json.setFlag(true);
		} else {
			json.setFlag(false);
		}
		return json;
	}

	/*
	 * 
	 * 确定
	 */
	@RequestMapping(params = "method=countersign")
	public @ResponseBody
	Json countersign(@Param("array") String[] shiping_orders_id) {
		int a = oks.countersign(shiping_orders_id);
		Json json = new Json();
		if (a > 0) {
			json.setFlag(true);
		} else {
			json.setFlag(false);
		}
		return json;
	}

	/*
	 * 订单重复查询
	 */
	@RequestMapping(params = "method=getNumber")
	public @ResponseBody
	Json getNumber(String number) {
		System.out.println(number);
		int der = oks.getNumber(number);
		Json json = new Json();
		if (der > 0) {
			json.setFlag(true);
		} else {
			json.setFlag(false);
		}
		return json;
	}
}
