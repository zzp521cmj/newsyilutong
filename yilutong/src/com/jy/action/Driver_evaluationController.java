package com.jy.action;
/*
 * 司机评价
 */
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.common.ExportUtils;
import com.jy.common.UUIDUtils;
import com.jy.dao.Json;
import com.jy.model.Claim_settlement;
import com.jy.model.CreateAgreement;
import com.jy.model.Customer;
import com.jy.model.Driver;
import com.jy.model.Evaluate;
import com.jy.model.ShippingOrder;
import com.jy.model.Unqualified;
import com.jy.service.Driver_evaluationService;

@Controller
@RequestMapping(value = "/Driver.do")
public class Driver_evaluationController {
	@Resource
	private Driver_evaluationService de;
	
	/*
	 * 跳转到主页面
	 */
	@RequestMapping(params="method=gdriver")
	public String gdriver(){
		return "Star_evaluation/engine_driver";	
	}
	/*	
	 *  查询司机
	 */
	@RequestMapping(params="method=listdriver")
	public @ResponseBody
	Map<String, Object> listdriver(String rows,String pages,String driverName,String ptype,String bouns,String bouns_time) {
		Integer rows1 = 0; // 当前的行数
		Integer page1 = 1; // 当前的页数
		if (rows != null && !rows.equals("")) {
			rows1 = Integer.valueOf(rows);
		}
		if (pages != null && !pages.equals("")) {
			page1 = Integer.valueOf(pages);
		}
		List<Driver> list = de.listdriver((page1 - 1) * rows1, rows1, driverName, ptype, bouns, bouns_time);
		int count = de.drivercount(driverName, ptype,bouns,bouns_time);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;

	}
	
	
	/*
	 * 跳转到订单页面
	 */
	@RequestMapping(params="method=gettiao")
	public String gettiao(String driverId,HttpServletRequest request){
		request.setAttribute("flg", driverId);
		return "Star_evaluation/driver_evaluation";	
	}
	
/*	
	 * 
	 *  查询订单
	 */
	@RequestMapping(params="method=inquire")
	public @ResponseBody
	Map<String, Object> inquire(String rows, String page,
			String shiping_order_num, String goods_name,String grade, String bouns,String driverId) {
		Integer rows1 = 0; // 当前的行数
		Integer page1 = 1; // 当前的页数
		if (rows != null && !rows.equals("")) {
			rows1 = Integer.valueOf(rows);
		}
		if (page != null && !page.equals("")) {
			page1 = Integer.valueOf(page);
		}
		List<CreateAgreement> list = de.inquire((page1 - 1) * rows1, rows1, shiping_order_num, goods_name, grade, bouns, driverId);
		System.out.println(driverId);
		int count = de.count(shiping_order_num, goods_name, grade, bouns, driverId);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;

	}
	
	
	/*
	 * 
	 * 跳转到评价页面
	*/ 
	@RequestMapping(params="method=getclaims")
	public String getclaims(String agreement_id, HttpServletRequest request){
		request.setAttribute("flg", agreement_id);
		return "Star_evaluation/Star";
	}
	
	/*
	 * 查询车牌号的方法
	 */
	
	@RequestMapping(params = "method=carp")
	public @ResponseBody
	String carp(String car_number1) {
		List<CreateAgreement> flist = de.carp(car_number1);
		JSONObject jb = null;
		JSONArray jsons = new JSONArray();
		for (CreateAgreement f : flist) {
			jb = new JSONObject();
			jb.put("id", f.getCar_number1());
			jb.put("name", f.getCar_number1());
			jsons.add(jb);
		}
		return jsons.toString();
	}
	
	 /*
	  * 添加的方法
	  */
	@RequestMapping(params="method=insertinfo")
	public @ResponseBody Json insertinfo(Evaluate evaluate,String id){
		ShippingOrder ul = de.getjUnqualified(id);
		evaluate.setShiping_order_id(ul.getShiping_order_id());
		evaluate.setRatingid(UUIDUtils.getUUID());
		int a=de.insertinfo(evaluate);
		Json json=new Json();
		if(a>0){
			json.setFlag(true);
		}
		return json;	
	}
	
	/*
	 * 删除的方法
	 */
	@RequestMapping(params ="method=deleteTravel")
	public @ResponseBody
	Json deleteTravel(String[] del) {
		Json json = new Json();
		int list=de.deleteTravel(del);
		if (list > 0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}
			
			/*
			 * 导出
			 */
/*	@RequestMapping(params = "method=outShi")
    public @ResponseBody
   List<Driver> outShi(HttpServletResponse response,String[] headtitle,
		   String[] fieldName,String[] checkarray){
		String filename = "司机评价结算信息导出";	
		
		
		List<Driver> list = de.outShi(checkarray);
		try {			
			// 声明一个工作薄
			HSSFWorkbook workbook = new HSSFWorkbook();
			// 生成一个表格
			response.setContentType("application/vnd.ms-excel;");
			response.setHeader("Content-Disposition", "attachment;filename=\""
					+ new String(filename.getBytes("gbk"), "iso-8859-1")
					+ ".xls\"");
			OutputStream ouputStream = response.getOutputStream();
			// 调用工具类创建表头
			ExportUtils.outputHeaders(headtitle, workbook, "司机评价信息导出");
			// 调用工具类生成内容
			ExportUtils.outputColums(fieldName, list, workbook, 1, "司机评价信息导出");
			workbook.write(ouputStream);
			ouputStream.flush();
			ouputStream.close();
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;	
	}*/
	//导出
	@RequestMapping(params = "method=exportunqualified2")
	public @ResponseBody
	String exportunqualified(String datas, String[] headtitle, String[] fieldName,
			HttpServletResponse response,String[] checkarray) {
		String filename = "司机评价导出";
		List<Driver> list;
		if(checkarray!=null&&checkarray.length>0){
			list = de.exportunqualified(checkarray);
		}else{
			list = de.exportunqualified(null);			
		}
		try {
			// 声明一个工作薄
			HSSFWorkbook workbook = new HSSFWorkbook();
			// 生成一个表格
			response.setContentType("application/vnd.ms-excel;");
			response.setHeader("Content-Disposition", "attachment;filename=\""
					+ new String(filename.getBytes("gbk"), "iso-8859-1")
					+ ".xls\"");
			OutputStream ouputStream = response.getOutputStream();
			// 调用工具类创建表头
			ExportUtils.outputHeaders(headtitle, workbook, "司机评价导出");
			// 调用工具类生成内容
			ExportUtils.outputColums(fieldName, list, workbook, 1, "司机评价导出");
			workbook.write(ouputStream);
			ouputStream.flush();
			ouputStream.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
