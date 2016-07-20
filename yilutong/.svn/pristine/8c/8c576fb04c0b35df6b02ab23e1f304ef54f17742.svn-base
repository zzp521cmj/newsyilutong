package com.jy.action;

import java.io.OutputStream;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.common.ExportExcel;
import com.jy.common.UUIDUtils;
import com.jy.dao.Json;
import com.jy.excel.bean.DriverExcel;

import com.jy.model.Car_owner;
import com.jy.service.Car_ownerInfoService;

/*
 * 车主管理
 * */
@Controller
@RequestMapping(value = "/car_owner.do")
public class Car_ownerInfoController{
	@Resource
	private Car_ownerInfoService csi;

	@RequestMapping(params = "method=getCar_ownerInfo")
	public String getCar_ownerMan() {
		return "car_owner/Car_ownerInfo";
	}
	//跳转编辑页面并且获取合同的id 返回到页面
	@RequestMapping(params = "method=getEditCar_ownerPage")
	public String getEditCar_ownerPage(String pid, HttpServletRequest request) {
		request.setAttribute("flg", pid);
		return "car_owner/EditCar_owner";
	}

	// 全部查询
	@RequestMapping(params = "method=getCar_owner")
	public @ResponseBody
	Map getCar_ownerInfo(String rows, String page, String car_owner_name,
			String phone_number, String driving_type) {
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		List<Car_owner> list = csi.getCar_ownerInfo((page1 - 1) * rows1, rows1,
				car_owner_name, phone_number, driving_type);
		int count = csi.getCar_owner(car_owner_name, phone_number, driving_type);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}

	/*
	 * 批量删除
	 */
	@RequestMapping(params = "method=deleteCar_owner")
	public @ResponseBody
	Json delTruck(String[] del) {
		Json json = new Json();
		int truck = csi.deleteCar_owner(del);
		if (truck > 0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}

	// 跳转到添加页面
	@RequestMapping(params = "method=addCar_owner")
	public String addCar_owner() {
		return "car_owner/AddCar_owner";
	}
	// 保存
	@RequestMapping(params = "method=saveCar_owner")
	public @ResponseBody Json saveCar_owner(Car_owner d) {
		Json json = new Json();
		d.setCarOwnerId(UUIDUtils.getUUID());
		d.setUpdateDate(DateFormat.getDateTimeInstance().format(new Date()));
		int truck = csi.saveCar_owner(d);
		if (truck > 0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}
	// 修改查询
	@RequestMapping(params = "method=getUpdateCar_owner")
	public @ResponseBody
	Car_owner getUpdateCar_owner(String car_owner_id) {
		Car_owner der = csi.getUpdateCar_owner(car_owner_id);
		return der;
	}

	// 导入页面
	@RequestMapping(params = "method=inputCar_owner")
	public String inputCar_owner() {
		return "driver/InputDriver";
	}

	// 用户修改
	@RequestMapping(params = "method=updateCar_owner")
	public @ResponseBody Json  updateCar_owner(Car_owner d) {
			d.setUpdateDate(DateFormat.getDateTimeInstance().format(new Date()));
			Json json = new Json();
			int i = csi.updateCar_owner(d);
			if (i > 0) {
				json.setFlag(true);
				return json;
			}
			json.setFlag(false);
			return json;
	}

	/*
	 * select姓名 查询
	 */
	@RequestMapping(params = "method=getCar_ownerLength")
	public @ResponseBody
	String getCar_ownerLength(String search) {
		List<Car_owner> list = csi.getCar_ownerLength(search);
		JSONObject jb = null;
		JSONArray jsons = new JSONArray();
		for (Car_owner d : list) {
			jb = new JSONObject();
			jb.put("id", d.getCarOwnerId());
			jb.put("name", d.getCarOwnerName());
			jsons.add(jb);
		}
		return jsons.toString();
	}

	/*
	 * 电话检索
	 */
	@RequestMapping(params = "method=getPhoneLength")
	public @ResponseBody
	String getPhoneLength(String phones) {
		List<Car_owner> list = csi.getPhoneLength(phones);
		for (Car_owner driver : list) {
			System.out.println(driver.getCarOwnerId());
		}

		JSONObject jb = null;
		JSONArray jsons = new JSONArray();
		for (Car_owner d : list) {
			jb = new JSONObject();
			jb.put("id", d.getCarOwnerId());
			jb.put("name", d.getPhoneNumber());
			jsons.add(jb);
		}
		return jsons.toString();
	}
	@RequestMapping(params = "method=getPlateNumberLength")
	public @ResponseBody
	String getPlateNumberLength(String number) {
		List<Car_owner> list = csi.getPlateNumberLength(number);
		JSONObject jb = null;
		JSONArray jsons = new JSONArray();
		for (Car_owner d : list) {
			jb = new JSONObject();
			jb.put("id", d.getTravel_card_id());
			jb.put("name", d.getPlate_number());
			jsons.add(jb);
		}
		return jsons.toString();
	}

	// 导出信息
	@RequestMapping(params = "method=outDriverExcel")
	public @ResponseBody
	String outputbug(String datas, String[] headtitle,
			HttpServletResponse response) {
		String filename = "DriverExcel";
		ExportExcel<DriverExcel> ex = new ExportExcel<DriverExcel>();
		try {
			JSONArray jsonarray = JSONArray.fromObject(datas);
			List<DriverExcel> lists = (List) JSONArray.toCollection(jsonarray,
					DriverExcel.class);

			response.setContentType("application/vnd.ms-excel;");
			response.setHeader("Content-Disposition", "attachment;filename=\""
					+ new String(filename.getBytes("gbk"), "iso-8859-1")
					+ ".xls\"");
			OutputStream ouputStream = response.getOutputStream();
			ex.exportExcel(headtitle, lists, ouputStream);
			ouputStream.flush();
			ouputStream.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
