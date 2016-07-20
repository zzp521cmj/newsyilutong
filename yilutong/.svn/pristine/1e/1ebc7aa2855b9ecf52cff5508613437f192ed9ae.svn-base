package com.jy.action;

import java.io.OutputStream;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
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
import com.jy.dao.Json;
import com.jy.model.MonitorRuning;
import com.jy.service.MonitorRuningService;
import com.jy.service.UserInfoService;
	/*
	 * 监控报警管理
	 * */
@Controller
@RequestMapping(value="/monitor.do")
public class MonitorRuningController {
	@Resource
	private MonitorRuningService msi;
	@Resource
	private UserInfoService uis;
	//线路
	@RequestMapping(params = "method=getMonitorRunXL")
	public String getMonitorRuningXLInfo(String menu_id,HttpSession session) {
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
		return "monitor/monitorRuningXLInfo";
	}
	//距离
	@RequestMapping(params = "method=getMonitorRunJL")
	public String getMonitorRuningJLInfo(String menu_id,HttpSession session) {
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
		return "monitor/monitorRuningJLInfo";
	}
	//停靠点
	@RequestMapping(params = "method=getMonitorRunTKD")
	public String getMonitorRuningTKDInfo(String menu_id,HttpSession session) {
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
		return "monitor/monitorRuningTKDInfo";
	}
	// 全部查询
	@RequestMapping(params = "method=getMonitorRuning")
	public @ResponseBody
	Map getMonitorRuningInfo(String rows, String page, String start_date,String end_date,Integer monitorType,String carId) {
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		List<MonitorRuning> list = msi.getMonitorRuningInfo((page1 - 1) * rows1, rows1,
				start_date,end_date,monitorType, carId);
		int count = msi.getMonitorRuning(start_date, end_date, monitorType, carId);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}
	/*
	 * 车牌号检索
	 */
	@RequestMapping(params = "method=getCar_idLength")
	public @ResponseBody
	String getCar_idLength(String car_id,int type) {
		List<MonitorRuning> list = msi.getCar_idLength(car_id,type);
		JSONObject jb = null;
		JSONArray jsons = new JSONArray();
		for (MonitorRuning d : list) {
			jb = new JSONObject();
			jb.put("id", d.getTravel_card_id());
			jb.put("name", d.getPlate_number());
			jsons.add(jb);
		}
		return jsons.toString();
	}
	//处理
	@RequestMapping(params = "method=dealMonitor")
	public @ResponseBody
	Json dealMonitor(String del) {
		Json json = new Json();
		MonitorRuning m=msi.searchMonitor(del);
		if(m.getMonitor_id()!=""||m.getMonitor_id()!=null){
			m.setAnswer_time(DateFormat.getDateTimeInstance().format(new Date()));
			System.out.println(m.getAnswer_time());
			int truck=msi.dealMonitor(m);
			if (truck > 0) {
				json.setFlag(true);
				return json;
			}
			json.setFlag(false);
			return json;
		}else{
			json.setFlag(false);
			return json;
		}
	
	}
	
	// 导出信息
	@RequestMapping(params = "method=outMonitor")
	public @ResponseBody
	String outMonitorRuning(String datas, String[] headtitle,String[] fieldName,
			HttpServletResponse response,String start_date,String end_date,Integer monitorType,String carId) {
		String filename = "线路监控";
		List<MonitorRuning> list=msi.getMonitorRuningAll(start_date, end_date, 1, carId);
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
			ExportUtils.outputHeaders(headtitle,workbook,"线路监控");
		//调用工具类生成内容
			ExportUtils.outputColums(fieldName, list,workbook,1,"线路监控");
			workbook.write(ouputStream);
			ouputStream.flush();
			ouputStream.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	// 导出信息
		@RequestMapping(params = "method=outMonitor1")
		public @ResponseBody
		String outMonitorRuning1(String datas, String[] headtitle,String[] fieldName,
				HttpServletResponse response,String start_date,String end_date,Integer monitorType,String carId) {
			String filename = "节点监控";
			List<MonitorRuning> list=msi.getMonitorRuningAll(start_date, end_date, 3, carId);
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
				ExportUtils.outputHeaders(headtitle,workbook,"节点监控");
			//调用工具类生成内容
				ExportUtils.outputColums(fieldName, list,workbook,1,"节点监控");
				workbook.write(ouputStream);
				ouputStream.flush();
				ouputStream.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}
		// 导出信息
		@RequestMapping(params = "method=outMonitor2")
		public @ResponseBody
		String outMonitorRuning2(String datas, String[] headtitle,String[] fieldName,
				HttpServletResponse response,String start_date,String end_date,Integer monitorType,String carId) {
			String filename = "距离监控";
			List<MonitorRuning> list=msi.getMonitorRuningAll(start_date, end_date, 2, carId);
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
				ExportUtils.outputHeaders(headtitle,workbook,"距离监控");
			//调用工具类生成内容
				ExportUtils.outputColums(fieldName, list,workbook,1,"距离监控");
				workbook.write(ouputStream);
				ouputStream.flush();
				ouputStream.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}
}
