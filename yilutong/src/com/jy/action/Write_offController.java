package com.jy.action;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.jy.common.UUIDUtils;
import com.jy.dao.Json;
import com.jy.model.ChangeOrder;
import com.jy.model.Company;
import com.jy.model.Income;
import com.jy.model.ShippingOrder;
import com.jy.service.CompanyInfoService;
import com.jy.service.Write_offService;

@Controller
@RequestMapping(value = "/write_off.do")
public class Write_offController {
	@Resource
	private Write_offService wo; 

	@RequestMapping(params = "method=get")
	public String getCompanyQuery() {
		return "write_off/write_off";
	}
	// 跳转编辑页面并且获取合同的id 返回到页面
			@RequestMapping(params = "method=getEditCompanyPage")
	public String getEdittCompanyPage(String pid, HttpServletRequest request) {
				request.setAttribute("flg", pid);
				return "write_off/EditWrite_off";
			}
	
			// 修改查询
			@RequestMapping(params = "method=getUpdateShippingOrder")
	public @ResponseBody
	ShippingOrder getUpdateCompany(String id) {
				ShippingOrder der = wo.getUpdateShippingOrder(id);
				return der;
			}		
			// 修改
			@RequestMapping(params = "method=updateShippingOrder")
			public @ResponseBody
			Json updateShippingOrder(ShippingOrder d) {
				// 修改
				
		if(d.getWrite_a() == "0" |
			d.getWrite_b() == "0" |
			d.getWrite_c() == "0" |
			d.getWrite_d() == "0" |
			d.getWrite_e() == "0" |
			d.getWrite_f() == "0" |
			d.getWrite_g() == "0" |
			d.getWrite_h() == "0" |
			d.getWrite_a() == null |
			d.getWrite_b() ==null 	|
			d.getWrite_c() == null |
			d.getWrite_d() == null |
			d.getWrite_e() == null |
			d.getWrite_f() == null |
			d.getWrite_h() == null 	){
			d.setWrite_off("1");
		}else {
			d.setWrite_off("0");
		}
				Json json = new Json();	
				int i = wo.updateShippingOrder(d);
				if (i > 0) {
					json.setFlag(true);
					return json;
				}
				json.setFlag(false);
				return json;
			}
			
			
	// 全部查询	
	@RequestMapping(params = "method=getWrite_off")
	public @ResponseBody
	Map getWrite_off(String rows, String page, 
			String shiping_order_num, String updatetime, String check_time
			) {
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}

		List<ShippingOrder> list = wo.getChangeOrderInfo((page1 - 1) * rows1, rows1,
				shiping_order_num, check_time, updatetime);

		int count = wo.getChangeOrder(shiping_order_num, check_time, updatetime);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}
	
}