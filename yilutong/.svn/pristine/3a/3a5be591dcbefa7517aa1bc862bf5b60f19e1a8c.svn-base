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
import com.jy.model.Company;
import com.jy.model.Income;
import com.jy.model.Material;
import com.jy.service.CompanyInfoService;
import com.jy.service.MaterialService;

@Controller
@RequestMapping(value = "/material.do")
public class MaterialController {
	@Resource
	private MaterialService ms; 

	@RequestMapping(params = "method=get")
	public String getCompanyQuery() {
		return "material/material";
	}
	/**
	 * 转跳添加页面
	 * @return
	 */
	@RequestMapping(params = "method=saveMaterial")
	public String addCompany(){
		return"material/addmaterial";
	}
	// 跳转编辑页面并且获取合同的id 返回到页面
		@RequestMapping(params = "method=getEditCompanyPage")
		public String getEdittCompanyPage(String pid, HttpServletRequest request) {
			request.setAttribute("flg", pid);
			return "material/Editmaterial";
		}
	

	// 全部查询
	@RequestMapping(params = "method=getMaterial")
	public @ResponseBody
	Map getMaterial(String rows, String page, 
			String material_id, String material_name, String material_type
			) {
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}

		List<Material> list = ms.getMaterial((page1 - 1) * rows1, rows1,
				material_id, material_name, material_type);

		int count = ms.getMaterialInfo(material_id, material_name, material_type);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}
				// 添加
		@RequestMapping(params = "method=addMaterial")
		public @ResponseBody
		Json addMaterial(Material d) {
			Json json = new Json();
			d.setId(UUIDUtils.getUUID());
			int truck = ms.addMaterial(d);
			if (truck >0) {
				json.setFlag(true);
				return json;
			} else {
				json.setFlag(false);
				return json;
			}
		}
		// 修改查询
		@RequestMapping(params = "method=getUpdateMaterial")
		public @ResponseBody
		Material getUpdateMaterial(String id) {
			Material der = ms.getUpdateMaterial(id);
			return der;
		}
	/**
		 * 批量删除
		 * @param del
		 * @param deletn
		 * @return
		 */
		@RequestMapping(params = "method=deleterMaterial")
		public @ResponseBody
		Json deleteMaterial(String[] del )  {
			Json json = new Json();
			int truck = ms.deleterMaterial(del);
			if (truck > 0 ) {
				json.setFlag(true);
				return json;
			}
			json.setFlag(false);
			return json;
		}
		// 修改
		
		@RequestMapping(params = "method=updateMaterial")
		public @ResponseBody
		Json updateMaterial(Material d) {
			// 修改
			Json json = new Json();
			int i = ms.updateMaterial(d);
			if (i > 0) {
				json.setFlag(true);
				return json;
			}
			json.setFlag(false);
			return json;
		}
}