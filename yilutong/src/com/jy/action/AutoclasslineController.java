package com.jy.action;

import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.jy.common.ExportUtils;
import com.jy.common.SessionInfo;
import com.jy.common.UUIDUtils;
import com.jy.dao.Json;

import com.jy.model.Agreement;
import com.jy.model.City_info;
import com.jy.model.Taskonlineimport;
import com.jy.service.AutoclasslineService;
import com.jy.service.CityService;
import com.jy.service.UserInfoService;

/*
 * 自动生成计划管理
 * */
@Controller
@RequestMapping(value="/autoclassline.do")
public class AutoclasslineController {
	@Resource
	private AutoclasslineService as;
	@Resource
	private UserInfoService uis;
	@RequestMapping(params="method=Autoclassline")
	public String AutoclasslineInfo(String menu_id,HttpSession session){
		Integer[] rid =(Integer[])session.getAttribute(SessionInfo.SessionRote);
		Integer id = Integer.parseInt(menu_id);
		List<String> list = uis.getFunctions(id,rid);
		if(list.size()>0){
		StringBuffer bf = new StringBuffer();
		for(String ss:list){
			bf.append(ss);
			bf.append(",");
			
		}
		bf.deleteCharAt(bf.length()-1);
		session.setAttribute("function", bf.toString());
		}else{
			session.setAttribute("function", "");
			
		}
		return"autoclassline/autoclasslineInfo";
	}
	//跳转编辑页面并且获取合同的id 返回到页面
		@RequestMapping(params = "method=getEditAutoclasslinePage")
		public String getAutoclasslineEditMan1(String pid, HttpServletRequest request) {
			request.setAttribute("flg", pid);
			return "autoclassline/editAutoclassline";
		}
	// 全部查询分页
	@RequestMapping(params = "method=getAutoclassline")
	public @ResponseBody
	Map getAutoclasslineInfo(String rows, String page, String linname,String lincarno,String start,String end) {
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
	
		List<Taskonlineimport> list = as.getAutoclasslineInfo((page1 - 1) * rows1, rows1, linname, lincarno, start,end);
		int count = as.getAutoclassline(linname, lincarno, start,end);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
		}
	/*
	 * 批量删除
	 */
	@RequestMapping(params = "method=deleteAutoclassline")
	public @ResponseBody
	Json delAutoclassline(String[] del) {
		Json json = new Json();
		int truck = as.deleteAutoclassline(del);
		if (truck > 0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}
	// 跳转到添加页面
		@RequestMapping(params = "method=addAutoclassline")
		public String addCity() {
			return "autoclassline/addAutoclassline";
		}
		// 保存
		@RequestMapping(params = "method=saveAutoclassline")
		public @ResponseBody Json saveAutoclassline(Taskonlineimport d) {
			Json json = new Json();
			d.setLinnumber(UUIDUtils.getUUID());
			int truck = as.saveAutoclassline(d);
			if (truck > 0) {
				json.setFlag(true);
				return json;
			}
			json.setFlag(false);
			return json;
		}
		// 修改查询
		@RequestMapping(params = "method=getUpdateAutoclassline")
		public @ResponseBody
		Taskonlineimport getUpdateAutoclassline(String  linnumber) {
			Taskonlineimport city = as.getUpdateAutoclassline(linnumber);
			if(city!=null){
				return city;
			}else{
				city=as.getUpdateAutoclasslineNo(linnumber);
				return city;
			}
		}

		// 修改
		@RequestMapping(params = "method=updateAutoclassline")
		public @ResponseBody Json  updateAutoclassline(Taskonlineimport d) {
			Json json = new Json();
			int i =as.updateAutoclassline(d);
			if (i > 0) {
				json.setFlag(true);
				return json;
			}
			json.setFlag(false);
			return json;
		}
		//班线检索
		@RequestMapping(params = "method=searchgetClassLineLength")
		public @ResponseBody
		String getClassLineLength(String name) {
			List<Taskonlineimport> list = as.getClassLineLength(name);
			JSONObject jb = null;
			JSONArray jsons = new JSONArray();
			for (Taskonlineimport d : list) {
				jb = new JSONObject();
				jb.put("id", d.getClassline_id());
				jb.put("name", d.getClassline_name());
				jsons.add(jb);
			}
			return jsons.toString();
		}
	
		//车牌检索
		@RequestMapping(params = "method=searchAutoclasslineNumber")
		public @ResponseBody
		String getCar_idLength(String name) {
			List<Taskonlineimport> list = as.getCar_idLength(name);
			JSONObject jb = null;
			JSONArray jsons = new JSONArray();
			for (Taskonlineimport d : list) {
				jb = new JSONObject();
				jb.put("id", d.getTravel_card_id());
				jb.put("name", d.getPlate_number());
				jsons.add(jb);
			}
			return jsons.toString();
		}
		
		// 导出信息
		@RequestMapping(params = "method=autoclasslineExcel")
		public @ResponseBody
		String autoclasslineExcel(String datas, String[] headtitle,String[] fieldName,
				HttpServletResponse response,String linname,String lincarno,String start,String end) {
			String filename = "发车日历导出";
			List<Taskonlineimport> list=as.getAutoclasslineAll(linname, lincarno, start,end);
			//ExportExcel<Agreement> esx= new ExportExcel<Agreement>();
			try {
				// 声明一个工作薄
				HSSFWorkbook workbook = new HSSFWorkbook();
				// 生成一个表格
				response.setContentType("application/vnd.ms-excel;");
				response.setHeader("Content-Disposition", "attachment;filename=\""
						+ new String(filename.getBytes("gbk"), "iso-8859-1")
						+ ".xls\"");
				OutputStream ouputStream = response.getOutputStream();
			//调用工具类创建表头
				ExportUtils.outputHeaders(headtitle,workbook,"发车日历");
			//调用工具类生成内容
				ExportUtils.outputColums(fieldName, list,workbook,1,"发车日历");
				workbook.write(ouputStream);
				ouputStream.flush();
				ouputStream.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}
}
