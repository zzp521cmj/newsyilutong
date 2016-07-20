package com.jy.action;

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

import com.jy.common.ExportExcel;
import com.jy.common.ExportUtils;
import com.jy.model.Car_bid_record;
import com.jy.model.Car_bid_recordforoutput;
import com.jy.model.TemporaryCar;
import com.jy.service.Car_bid_recordInfoService;

/*
 * 历史竞价记录
 * */
@Controller
@RequestMapping(value = "car_b_rec.do")
public class Car_bid_recordInfoController {
	
	@Resource
	private Car_bid_recordInfoService bid_recordInfoService;
	
	@RequestMapping(params="method=Car_bid_InfoPage")
	public String getCar_bid_recordInfoPage(String plate_number,HttpServletRequest request){
		if(plate_number!=null){
			request.setAttribute("number", plate_number);
		}
		return "car_bid_record/Car_bid_recordInfo";
	}
	
	@RequestMapping(params = "method=getCar_b_record")
	public @ResponseBody
	Map<String,Object> getAgreementInfo(String rows, String page,String publisher,String contactInformation,String plate_number) {
		//当前第几页
				Integer page1 = 1;
				//当前页一共几条
				Integer rows1 = 0;
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		List<Car_bid_record> list = bid_recordInfoService.getCar_bid_recordInfo((page1 - 1) * rows1, rows1, publisher,contactInformation,plate_number);
		int count = bid_recordInfoService.getCar_bid_record(publisher,contactInformation,plate_number);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
//		JSONObject json=new JSONObject();
//		json.put("rows", list);
//		System.out.println(json.toString());
		return map;
	}
//车牌检索
	@RequestMapping(params = "method=getCar_idLength")
	public @ResponseBody
	String getCar_idLength(String plate_number) {
		List<Car_bid_record> list = bid_recordInfoService.getCar_idLength(plate_number);
		JSONObject jb = null;
		JSONArray jsons = new JSONArray();
		for (Car_bid_record d : list) {
			jb = new JSONObject();
			jb.put("id", d.getTemporary_car_id());
			jb.put("name", d.getPlate_number());
			jsons.add(jb);
		}
		return jsons.toString();
	}
	//导出
	@RequestMapping(params = "method=outputCar")
	public @ResponseBody String  outputCar(String datas, String[] headtitle,String[] fieldName,
			HttpServletResponse response,String username,String plateNumber,String tel) {
		String filename = "竞价历史记录导出";
		System.out.println("username"+username);
		System.out.println("plateNumber"+plateNumber);
		System.out.println("tel"+tel);
		List<Car_bid_record> list = bid_recordInfoService.getAllCar(username,plateNumber,tel);
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
			ExportUtils.outputHeaders(headtitle,workbook,"竞价历史记录列表");
		//调用工具类生成内容
			ExportUtils.outputColums(fieldName, list,workbook,1,"竞价历史记录列表");
			workbook.write(ouputStream);
			ouputStream.flush();
			ouputStream.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
