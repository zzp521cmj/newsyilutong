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
import com.jy.model.Detailed;
import com.jy.model.Income;
import com.jy.model.ShippingOrder;
import com.jy.service.CompanyInfoService;
import com.jy.service.DetailedService;
import com.jy.service.Write_offService;

@Controller
@RequestMapping(value = "/detailed.do")
public class DetailedController {
	@Resource
	private DetailedService ds; 

	@RequestMapping(params = "method=get")
	public String getCompanyQuery() {
		return "detailed/detailed";
	}
	@RequestMapping(params = "method=savedetailed")
	public String addCompany(){
		return"detailed/adddetailed";
	}
	// 跳转编辑页面并且获取合同的id 返回到页面
		@RequestMapping(params = "method=getEditIncomePage")
		public String getEdittIncomePage(String pid, HttpServletRequest request) {
			request.setAttribute("flg", pid);
			return "detailed/updatedetailed";
		}
		// 修改查询
		@RequestMapping(params = "method=getUpdateDetailed")
		public @ResponseBody
		ShippingOrder getUpdateDetailed(String id) {
			ShippingOrder der = ds.getUpdateDetailed(id);
			return der;
		}
		// 修改
		@RequestMapping(params = "method=updateDetailed")
		public @ResponseBody
		Json updateDetailed(Detailed d) {
			// 修改
			Json json = new Json();
			int i = ds.updateDetailed(d);
			if (i > 0) {
				json.setFlag(true);
				return json;
			}
			json.setFlag(false);
			return json;
		}
	// 全部查询	
	@RequestMapping(params = "method=getDetailed")
	public @ResponseBody
	Map getWrite_off(String rows, String page, 
		String	shiping_order_num,String change_fee, String land_total
			) {
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}

		List<Detailed> list = ds.getDetailed((page1 - 1) * rows1, rows1,
				shiping_order_num,	 change_fee, land_total);
		
		int count = ds.getDetailedInfo( shiping_order_num,change_fee, land_total);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}
	/**
	 * 批量删除
	 * @param del
	 * @param deletn
	 * @return
	 */
	@RequestMapping(params = "method=deleteDetailed")
	public @ResponseBody
	Json deleteCompany(String[] del , String[] che)  {
		Json json = new Json();
		int truck = ds.deleteDetailed(del);
		int i = ds.updateStateship(che);
		if (truck > 0&i>0 ) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}
	// 添加
	@RequestMapping(params = "method=addDetailed")
	public @ResponseBody
	Json addDetailed(Detailed d) {
		String ids=d.getShiping_order_id();
		Json json = new Json();
		int i=ds.searchOrder(ids);
		if(i>0){
			int count=ds.updateDetailed(d);
			if (count >0) {
				json.setFlag(true);
				return json;
			} else {
				json.setFlag(false);
				return json;
			}
		}else{
			d.setDetailed_id(UUIDUtils.getUUID());
			int truck = ds.addDetailed(d);
		
			if (truck >0) {
				json.setFlag(true);
				return json;
			} else {
				json.setFlag(false);
				return json;
			}
		}
		
		
	}
	// 全部查询
				@RequestMapping(params = "method=getShippingOrder")
				public @ResponseBody
				Map getShippingOrder(String rows, String page, String shiping_order_num) {
					Integer rows1 = 0;// 当前有几行
					Integer page1 = 1;// 当前有几页
					if (rows != null && !"".equals(rows)) {
						rows1 = Integer.parseInt(rows);
					}
					if (page != null && !"".equals(page)) {
						page1 = Integer.parseInt(page);
					}
					List<ShippingOrder> list = ds.getShippingOrder((page1 - 1) * rows1,
							rows1, shiping_order_num);
					int count = ds.getShippingOrderInfo(shiping_order_num);
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("total", count);
					map.put("rows", list);
					return map;
				}
				/*
				 * 订单信息总汇表制作查询
				 */
				@RequestMapping(params = "method=getUpdateShipOrder")
				public @ResponseBody
				ShippingOrder getUpdateShipOrder(String id) {
					ShippingOrder der = ds.getUpdateShipOrder(id);
					return der;
				}
				
				
	}
	
	
	
