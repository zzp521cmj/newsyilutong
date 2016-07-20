package com.jy.action;

import java.text.DateFormat;
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
import com.jy.common.UUIDUtils;
import com.jy.dao.Json;
import com.jy.model.Company;
import com.jy.model.Confluence;
import com.jy.model.Detaileds;
import com.jy.model.Income;
import com.jy.model.Jy_mingxi;
import com.jy.model.Mingxi;
import com.jy.model.ShippingOrder;
import com.jy.service.CompanyInfoService;
import com.jy.service.ConfluenceService;
import com.jy.service.Jy_mingxiService;

@Controller
@RequestMapping(value = "/jy.do")
public class Jy_mingxiController {
	@Resource
	private  Jy_mingxiService jy; 

	@RequestMapping(params = "method=get")
	public String getCompanyQuery() {
		return "jy/mingxi";
	}
	// 全部查询
		@RequestMapping(params = "method=getMingxi")
		public @ResponseBody
		Map getCompany(String rows, String page, 
				String jy_direction, String jy_source, String jy_project
				
				) {
			Integer rows1 = 0;// 当前有几行
			Integer page1 = 1;// 当前有几页
			if (rows != null && !"".equals(rows)) {
				rows1 = Integer.parseInt(rows);
			}
			if (page != null && !"".equals(page)) {
				page1 = Integer.parseInt(page);
			}

			List<Jy_mingxi> list = jy.getMingxi((page1 - 1) * rows1, rows1,
					jy_direction, jy_source,jy_project);
			
			int count = jy.getMingxiInfo(jy_direction, jy_source, jy_project);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("total", count);
			map.put("rows", list);
			return map;
		}
		@RequestMapping(params = "method=save")
		public String addCompany(){
			return"jy/addJymingxi";
		}
		// 添加
		@RequestMapping(params = "method=add")
		public @ResponseBody
		Json addCompany(Jy_mingxi d) {
			Json json = new Json();
			d.setJy_id(UUIDUtils.getUUID());
			d.setJy_source("0");
			SimpleDateFormat dfv = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
			d.setTimes(dfv.format( new Date()));
			int truck = jy.sava(d);
			List<Confluence> list = new ArrayList<Confluence>();
			Confluence co = new Confluence();
			co.setConf_id(UUIDUtils.getUUID());
			co.setId(d.getJy_id());
			co.setDirection(d.getJy_direction());
			co.setSource(d.getJy_source());
			co.setProject(d.getJy_project());
			co.setHappen(d.getJy_money());
			co.setHandle(d.getJy_project());
			co.setFee_date(d.getTimes());
			list.add(co);
			int  s = jy.add(co);
			List<Mingxi> list1 = new ArrayList<Mingxi>();
			Mingxi mx = new Mingxi();
			mx.setId(UUIDUtils.getUUID());
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
			mx.setHappen_date(df.format( new Date()));
			mx.setMingxi_id(d.getJy_id());
			mx.setSubject(d.getJy_project());
			mx.setSubject_two(d.getJy_subject_two());
			mx.setSubject_three(d.getJy_jiaojie());
			mx.setMoney(d.getJy_money());
			mx.setRemarks(d.getJy_remarks());
			mx.setLaiyuan(d.getJy_direction());
			list1.add(mx);
			int  a = jy.addMingxi(mx);
			boolean flag;
			if(truck>0&a>0&s>0){
				flag = false;
				json.setFlag(flag);
			}
			json.setFlag(false);
				return json;
			
		}
		@RequestMapping(params = "method=deleteCompany")
		public @ResponseBody
		Json deleteCompany(String[] del )  {
			Json json = new Json();
			int truck = jy.deleteMingxi(del);
			if (truck > 0 ) {
				json.setFlag(true);
				return json;
			}
			json.setFlag(false);
			return json;
		}
}