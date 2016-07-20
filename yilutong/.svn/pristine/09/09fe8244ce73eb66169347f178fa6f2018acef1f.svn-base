package com.jy.action;

import java.text.DateFormat;
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
import com.jy.common.UUIDUtils;
import com.jy.dao.Json;
import com.jy.model.City_info;
import com.jy.model.Company;
import com.jy.model.Income;
import com.jy.service.CompanyInfoService;

@Controller
@RequestMapping(value = "/company.do")
public class CompanyController {
	@Resource
	private CompanyInfoService cif; 

	@RequestMapping(params = "method=get")
	public String getCompanyQuery() {
		return "company/company";
	}
	/**
	 * 转跳添加页面
	 * @return
	 */
	@RequestMapping(params = "method=saveCompany")
	public String addCompany(){
		return"company/addCompany";
	}
	// 跳转编辑页面并且获取合同的id 返回到页面
		@RequestMapping(params = "method=getEditCompanyPage")
		public String getEdittCompanyPage(String pid, HttpServletRequest request) {
			request.setAttribute("flg", pid);
			return "company/EditCompany";
		}
	

	// 全部查询
	@RequestMapping(params = "method=getCompany")
	public @ResponseBody
	Map getCompany(String rows, String page, 
			String company_name, String start_people, String end_phone,
			String phone,String end_people) {
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}

		List<Company> list = cif.getCompany((page1 - 1) * rows1, rows1,
				company_name, start_people, end_phone, phone,end_people);

		int count = cif.getCompanyInfo(company_name, start_people, end_phone, phone,end_people);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}
	/**
	 * 改终到位置省
	 * @param oneid
	 * @return
	 */
	@RequestMapping(params = "method=getNewFinalPositionCounty")
	public @ResponseBody
	List<Map<String, Object>> getNewFinalPositionCounty() {
		List<City_info> list = cif.getNewFinalPositionCounty();
		List<Map<String, Object>> lists = new ArrayList<Map<String, Object>>();
		Map<String, Object> map = null;
		for (City_info tc : list) {
			map = new HashMap<String, Object>();
			map.put("id",tc.getCitycode());
			map.put("text", tc.getCityname());
			map.put("citye_parent_id", tc.getCitycode());
			map.put("city_type", tc.getCity_type());		
			lists.add(map);
		}
		System.out.println("position:"+list.size());
		return lists;
	}
	/**
	 * 改终到位置市
	 */
	@RequestMapping(params = "method=getNewFinalpositionCity")
	public @ResponseBody
	List<Map<String, Object>> getNewFinalpositionCity(Integer citye_parent_id) {
		List<City_info> list = cif.getNewFinalpositionCity(citye_parent_id);
		List<Map<String, Object>> lists = new ArrayList<Map<String, Object>>();
		Map<String, Object> map = null;
		for (City_info tc : list) {
			map = new HashMap<String, Object>();
			map.put("id",tc.getCitycode());
			map.put("text", tc.getCityname());
			map.put("citye_parent_id", tc.getCitycode());
			map.put("city_type", tc.getCity_type());		
			lists.add(map);
		}
		return lists;
	}
	/**
	 * 改终到位置区
	 */
	@RequestMapping(params = "method=getNewFinalpositioncounty")
	public @ResponseBody
	List<Map<String, Object>> getNewFinalpositioncounty(Integer citye_parent_id) {
		List<City_info> list = cif.getNewFinalpositioncounty(citye_parent_id);
		List<Map<String, Object>> lists = new ArrayList<Map<String, Object>>();
		Map<String, Object> map = null;
		for (City_info tc : list) {
			map = new HashMap<String, Object>();
			map.put("id",tc.getCitycode());
			map.put("text", tc.getCityname());
			map.put("citye_parent_id", tc.getCitycode());
			map.put("city_type", tc.getCity_type());		
			lists.add(map);
		}
		return lists;
	}
				// 添加
		@RequestMapping(params = "method=addCompany")
		public @ResponseBody
		Json addCompany(Company d) {
			Json json = new Json();
			d.setCompany_id(UUIDUtils.getUUID());
			System.out.println("=========================================================="+d.getStart_province());
			int truck = cif.addCompany(d);
			
			System.out.println(truck+ "---------------------------------------");
			if (truck >0) {
				json.setFlag(true);
				return json;
			} else {
				json.setFlag(false);
				return json;
			}
		}
		// 修改查询
		@RequestMapping(params = "method=getUpdateCompany")
		public @ResponseBody
		Company getUpdateCompany(String id) {
			Company der = cif.getUpdateCompany(id);
			return der;
		}
		/**
		 * 批量删除
		 * @param del
		 * @param deletn
		 * @return
		 */
		@RequestMapping(params = "method=deleteCompany")
		public @ResponseBody
		Json deleteCompany(String[] del )  {
			Json json = new Json();
			int truck = cif.deleteCompany(del);
			if (truck > 0 ) {
				json.setFlag(true);
				return json;
			}
			json.setFlag(false);
			return json;
		}
		// 修改
		@RequestMapping(params = "method=updateCompany")
		public @ResponseBody
		Json updateCompany(Company d) {
			// 修改
			Json json = new Json();
			System.out.println(d.getCompany_id() + "--------------------------");
			int i = cif.updateCompany(d);
			if (i > 0) {
				json.setFlag(true);
				return json;
			}
			json.setFlag(false);
			return json;
		}
}