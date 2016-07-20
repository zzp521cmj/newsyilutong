/*package com.jy.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.poi.hssf.model.InternalWorkbook;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jy.common.ExcelUtil;
import com.jy.model.Equipment_info;
import com.jy.model.Truck;
import com.jy.service.EquipmentManService;

*//**
 * 2015-5-4 15:35:24
 * 
 * @author zkj
 *//*
@Controller
@RequestMapping(value = "/infoMan.do")
public class infoManController {

	@Resource
	private EquipmentManService equipmentManService;
	

	*//**
	 * 去设备管理页面
	 *//*
	@RequestMapping(params = "method=getequipmentMan")
	public String PersonInfo() {
		return "infoMan/equipmentMan";
	}

	*//**
	 * 分页查询
	 *//*
	@RequestMapping(params = "method=getEquipmentManlist")
	public @ResponseBody
	Map<String, Object> EquipmentManList(String page, String rows,
			String equipment_number,String car_id,String is_binding) {
		// 当前第几页
		Integer page2 = 1;
		// 当前页一共几条
		Integer rows1 = 0;
		if (page != null && !"".equals(page)) {
			page2 = Integer.parseInt(page);
		}
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		List<Equipment_info> list = equipmentManService.getEquipmentManInfo(
				(page2 - 1) * rows1, rows1, equipment_number,car_id,is_binding);
		int total = equipmentManService.getCount(equipment_number,car_id,is_binding);
//		for(Equipment_info lids: list){
//			System.out.println(lids.getDepartment_Name());
//		}
		// json返回串
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", total);
		map.put("rows", list);
		return map;
	}

	// 导出
	@RequestMapping(params = "method=outputInfoMan")
	public @ResponseBody
	String outputInfoMan(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String fileName = "excel文件";
		// 填充数据
		List<Equipment_info> projects = createData();
		List<Map<String, Object>> list = createExcelRecord(projects);
		String columnNames[] = { "设备号", "所属机构", "服务到期时间", "是否绑定", "车牌号", "离线时长","设备附件" };// 列名
		String keys[] = { "equipment_number", "department_Name", "end_date","is_binding", "plate_number","offline_lengthdate","equipment_annex"	};// map中的key
		ByteArrayOutputStream os = new ByteArrayOutputStream();
		try {
			ExcelUtil.createWorkBook(list, keys, columnNames).write(os);
		} catch (IOException e) {
			e.printStackTrace();
		}
		byte[] content = os.toByteArray();
		InputStream is = new ByteArrayInputStream(content);
		// 设置response参数，可以打开下载页面
		response.reset();
		response.setContentType("application/vnd.ms-excel;charset=utf-8");
		response.setHeader("Content-Disposition", "attachment;filename="
				+ new String((fileName + ".xls").getBytes(), "iso-8859-1"));
		ServletOutputStream out = response.getOutputStream();
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		try {
			bis = new BufferedInputStream(is);
			bos = new BufferedOutputStream(out);
			byte[] buff = new byte[2048];
			int bytesRead;
			// Simple read/write loop.
			while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
				bos.write(buff, 0, bytesRead);
			}
		} catch (final IOException e) {
			throw e;
		} finally {
			if (bis != null)
				bis.close();
			if (bos != null)
				bos.close();
		}
		return null;
	}
	//导出Excel查询
	private List<Equipment_info> createData() {
		List<Equipment_info> equipment_infos = equipmentManService.getEquipmentManInfoOne();
		return equipment_infos;
	}

	private List<Map<String, Object>> createExcelRecord(List<Equipment_info> projects) {
		List<Map<String, Object>> listmap = new ArrayList<Map<String, Object>>();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sheetName", "sheet1");
		listmap.add(map);
		Equipment_info equipment_info = null;
		for (int j = 0; j < projects.size(); j++) {
			equipment_info = projects.get(j);
			Map<String, Object> mapValue = new HashMap<String, Object>();
			mapValue.put("equipment_number", equipment_info.getEquipment_number());
			mapValue.put("department_Name", equipment_info.getDepartment_Name());
			mapValue.put("end_date", equipment_info.getEnd_date());
			mapValue.put("plate_number", equipment_info.getPlate_number());
			mapValue.put("offline_startdate", equipment_info.getOffline_startdate());
			mapValue.put("offline_lengthdate", equipment_info.getOffline_startdate());
			mapValue.put("equipment_annex", equipment_info.getOffline_startdate());
			listmap.add(mapValue);
		}
		return listmap;

	}
	
	//导入Excel
	@RequestMapping(params = "method=outInfoMan")
	public @ResponseBody String outputInfoMan1(HttpServletRequest request) throws Exception {
//		POIFSFileSystem fs=new POIFSFileSystem(new FileInputStream(file));
		MultipartHttpServletRequest fs = (MultipartHttpServletRequest) request;
		MultipartFile multipartFile = fs.getFile("file");
//		String file = request.getParameter("file");
//		InputStream is = new FileInputStream(file);
		HSSFWorkbook wb=new HSSFWorkbook();
		HSSFSheet hssfSheet=wb.getSheetAt(0);  // 获取第一个Sheet页
		if(hssfSheet!=null){
			for(int rowNum=1;rowNum<=hssfSheet.getLastRowNum();rowNum++){
				HSSFRow hssfRow=hssfSheet.getRow(rowNum);
				if(hssfRow==null){
					continue;
				}
				Equipment_info equipment_info=new Equipment_info();
				equipment_info.setEquipment_number(ExcelUtil.formatCell(hssfRow.getCell(0)));
				equipment_info.setInstitutions_id(ExcelUtil.formatCell(hssfRow.getCell(1)));
				equipment_info.setEnd_date(ExcelUtil.formatCell(hssfRow.getCell(2)));
				equipment_info.setIs_binding(ExcelUtil.formatCell(hssfRow.getCell(3)));
				equipmentManService.InfoManAdd(equipment_info);
			}
		}
		
		return "infoMan/equipmentMan";
	}
	
	//获取设备号检索列表
	@RequestMapping(params="method=getInfoManlength")
	public @ResponseBody String getCar_length(String search){
		List<Equipment_info> list=equipmentManService.getEquipment_number(search);
		JSONObject jb=null;
		JSONArray jsons=new JSONArray();
		for (Equipment_info t: list) {
			jb=new JSONObject();
			jb.put("id", t.getEquipment_id());
			jb.put("name",t.getEquipment_number());
			jsons.add(jb);
		}
		return jsons.toString();
	}
	
	//获取车牌号
	@RequestMapping(params="method=getCarIdlength")
	public @ResponseBody String getCarid_length(String carid){
		List<Truck> list=equipmentManService.getCar_id(carid);
		JSONObject jb=null;
		JSONArray jsons=new JSONArray();
		for (Truck t: list) {
			jb=new JSONObject();
			jb.put("id", t.getCarId());
			jb.put("name",t.getPlateNumber());
			jsons.add(jb);
		}
		return jsons.toString();
	}
}*/