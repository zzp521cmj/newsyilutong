package com.jy.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.dao.Json;
import com.jy.model.ShippingOrder;
import com.jy.service.KickbackService;
import com.jy.service.OrderInfoService;
import com.jy.service.UserInfoService;

/*
 * 回扣
 * 
 * */
@Controller
@RequestMapping(value = "/kickback.do")
public class KickbackController {
	@Resource
	private KickbackService ks;
	@Resource
	private UserInfoService uis;

	@RequestMapping(params = "method=tokickbackorder")
	public String tokickbackorder() {
		return "payable/KickbackInfo";
	}

	// 全部查询
	@RequestMapping(params = "method=getallkickbackorder")
	public @ResponseBody
	Map getallkickbackorder(String rows, String page, String shiping_order_num,
			String receipt, String startDate, String endDate, String kickback,
			String custom_name, String goods_name, String goods_num,
			String pay_type, String back_fee) {
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页

		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		List<ShippingOrder> list = ks
				.getKickbackInfo((page1 - 1) * rows1, rows1, shiping_order_num,
						receipt, startDate, endDate, kickback, custom_name, goods_name, goods_num, pay_type, back_fee);
		int count = ks.getKickback(shiping_order_num, receipt, startDate,
				endDate, kickback, custom_name, goods_name, goods_num, pay_type, back_fee);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}

	@RequestMapping(params = "method=updatekickbacks")
	public String updatekickbacks(String id, HttpServletRequest request) {
		request.setAttribute("id", id);
		return "payable/UpdateKickBack";
	}

	@RequestMapping(params = "method=updates")
	public @ResponseBody
	Json update(String zid, String type, String bz, String username) {
		int size = 0;
		if (zid.indexOf(",") == -1) {
			size = 1;
		} else {
			size = zid.indexOf(",") + 1;
		}
		String[] yid = new String[size];
		if (zid.indexOf(",") > 0) {
			yid = zid.split(",");
		} else {
			yid[0] = zid;
		}
		int i;
		for (i = 0; i < yid.length; i++) {
			ks.update(yid[i], type, bz, username);
		}
		Json json = new Json();
		if (i > 0) {
			json.setFlag(true);
		} else {
			json.setFlag(false);
		}
		return json;
	}

	@RequestMapping(params = "method=combacks")
	public @ResponseBody
	Json combacks(String sid) {
		int size = 0;
		if (sid.indexOf(",") == -1) {
			size = 1;
		} else {
			size = sid.indexOf(",") + 1;
		}
		String[] yid = new String[size];
		if (sid.indexOf(",") > 0) {
			yid = sid.split(",");
		} else {
			yid[0] = sid;
		}
		int i;
		for (i = 0; i < yid.length; i++) {
			ks.comback(yid[i]);
		}
		Json json = new Json();
		if (i > 0) {
			json.setFlag(true);
		} else {
			json.setFlag(false);
		}
		return json;
	}
}
