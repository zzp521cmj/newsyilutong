package com.jy.action;

import java.io.OutputStream;
import java.text.DateFormat;
import java.util.ArrayList;
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
import com.jy.common.SessionInfo;
import com.jy.common.UUIDUtils;
import com.jy.dao.Json;
import com.jy.excel.bean.DriverExcel;
import com.jy.model.Car_length;
import com.jy.model.CreateAgreement;
import com.jy.model.Driver;
import com.jy.model.DriverRegister;
import com.jy.model.User;
import com.jy.service.DriverInfoService;

/*
 * 司机管理
 * */
@Controller
@RequestMapping(value = "/driver.do")
public class DriverInfoController {
	@Resource
	private DriverInfoService dsi;

	// 主页面
	@RequestMapping(params = "method=getDriverInfo")
	public String getDriverMan() {
		return "driver/DriverInfo";
	}

	@RequestMapping(params = "method=getDriver")
	// 所有人员的查询
	public @ResponseBody
	Map getDriverInfo(String rows, String page, String driver_name,
			String phone_number, String driving_type,String drivers_type,String driverid,HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute(
				SessionInfo.SessionName);
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		//客户
		if(user.getDriver_name()!=null&&!user.getDriver_name().equals("")){
					driver_name=user.getDriver_name();
				}else
		if(user.getDriver_id()!=null&&!user.getDriver_id().equals("")){
			driverid=user.getDriver_id();
				}
		List<Driver> list = dsi.getDriverInfo((page1 - 1) * rows1, rows1,
				driver_name, phone_number, driving_type,drivers_type,driverid);
		int count = dsi.getDriver(driver_name, phone_number, driving_type,drivers_type,driverid);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}

	/*
	 * 批量删除
	 */
	@RequestMapping(params = "method=deleteDriver")
	public @ResponseBody
	Json delTruck(String[] del) {
		Json json = new Json();
		int truck = dsi.deleteDriver(del);
		if (truck > 0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}

	// 跳转到添加页面
	@RequestMapping(params = "method=addDriver")
	public String addDriver() {
		return "driver/AddDriver";
	}

	// 跳转编辑页面并且获取合同的id 返回到页面
	@RequestMapping(params = "method=EditDriverPage")
	public String EditDriver(String pid, HttpServletRequest request) {
		request.setAttribute("flg", pid);
		return "driver/EditDriver";
	}

	// 添加保存司机
	@RequestMapping(params = "method=saveDriver")
	public @ResponseBody
	Json saveDriver(Driver d) {
		Json json = new Json();
		int i = dsi.searchDriver(d.getDriverName(), d.getCarId());
		if (i > 0) {
			json.setFlag(false);
			return json;
		} else {
			d.setDriverId(UUIDUtils.getUUID());
			d.setUpdateDate(DateFormat.getDateTimeInstance().format(new Date()));
			int truck = dsi.saveDriver(d);
			if (truck > 0) {
				json.setFlag(true);
				return json;
			}
			json.setFlag(false);
			return json;
		}
	}

	// 修改查询
	@RequestMapping(params = "method=getUpdateDriver")
	public @ResponseBody
	Driver getUpdateDriver(String driver_id) {
		Driver der = dsi.getUpdateDriver(driver_id);
		return der;
	}

	// 用户修改
	@RequestMapping(params = "method=updateDriver")
	public @ResponseBody
	Json updateDriver(Driver d) {
		Json json = new Json();
		int i = dsi.searchDriver(d.getDriverName(), d.getCarId());// 去除重复
		if (i > 1) {
			json.setFlag(false);
			return json;
		} else {
			d.setUpdateDate(DateFormat.getDateTimeInstance().format(new Date()));
			dsi.updateDriver(d);

			int truck = dsi.updateDriver(d);
			if (truck > 0) {
				json.setFlag(true);
				return json;
			}
			json.setFlag(false);
			return json;
		}
	}

	/*
	 * select姓名 查询
	 */
	@RequestMapping(params = "method=getDriverLength")
	public @ResponseBody
	String getDriver_length(String search) {
		List<Driver> list = dsi.getDriver_length(search);
		JSONObject jb = null;
		JSONArray jsons = new JSONArray();
		for (Driver d : list) {
			jb = new JSONObject();
			jb.put("id", d.getDriverId());
			jb.put("text", d.getDriverName());
			jsons.add(jb);
		}
		return jsons.toString();
	}

	/**
	 * 电话查询
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(params = "method=getPhone")
	public @ResponseBody
	Driver getPhone(String id) {
		System.out.println(id);
		Driver der = dsi.getPhone(id);
		System.out.println(der.getPhoneNumber());
		return der;
	}

	/*
	 * 车牌号检索
	 */
	@RequestMapping(params = "method=getCarIdLength")
	public @ResponseBody
	String getPhone_length(String phones) {
		List<Driver> list = dsi.getPhone_length(phones);
		// for(Driver driver : list){
		// System.out.println("driverId:"+driver.getDriverId());
		// }

		JSONObject jb = null;
		JSONArray jsons = new JSONArray();
		for (Driver d : list) {
			jb = new JSONObject();
			jb.put("id", d.getTravel_card_id());
			jb.put("name", d.getPlate_number());
			jsons.add(jb);
		}
		return jsons.toString();
	}

	// 司机车牌检索
	@RequestMapping(params = "method=getCar_idLength")
	public @ResponseBody
	String getnumberlength(String num) {
		List<Driver> list = dsi.getnumberlength(num);
		JSONObject jb = null;
		JSONArray jsons = new JSONArray();
		for (Driver d : list) {
			jb = new JSONObject();
			jb.put("id", d.getTravel_card_id());
			jb.put("name", d.getPlate_number());
			jsons.add(jb);
		}
		return jsons.toString();

	}

	@RequestMapping(params = "method=getDateLength")
	public @ResponseBody
	String getDateLength(String date) {
		List<Driver> list = dsi.getPhone_length(date);
		JSONObject jb = null;
		JSONArray jsons = new JSONArray();
		for (Driver d : list) {
			jb = new JSONObject();
			jb.put("id", d.getDriverId());
			jb.put("name", d.getUpdateDate());
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

	// 查询司机的车牌
	@RequestMapping(params = "method=driver")
	public @ResponseBody
	String driver(String num) {
		List<Driver> list = dsi.driver(num);
		// for(Driver driver : list){
		// System.out.println("driverId:"+driver.getDriverId());
		// }

		JSONObject jb = null;
		JSONArray jsons = new JSONArray();
		for (Driver d : list) {
			jb = new JSONObject();
			jb.put("id", d.getTravel_card_id());
			jb.put("name", d.getPlate_number());
			jsons.add(jb);
		}
		return jsons.toString();
	}

	// 车辆信息检测
	@RequestMapping(params = "method=ptype")
	public @ResponseBody
	Driver ptype(String car) {
		System.out.println("检查车牌号");
		System.out.println(car);
		Driver der = dsi.ptype(car);
		return der;
	}

	// 检测是否已做协议
	@RequestMapping(params = "method=getselectagreement")
	public @ResponseBody
	Json getselectagreement(String[] id) {
		System.out.println("检查是否已做协议  id===" + id.length);

		Json json = new Json();
		List<CreateAgreement> der = dsi.getselectagreement(id);
		int ss = der.size();
		System.out.println("是否有协议" + ss);
		if (ss > 0) {
			json.setFlag(false);
			return json;
		}
		json.setFlag(true);
		return json;

	}

	// 审核司机注册
	@RequestMapping(params = "method=shenHeDriverRegister")
	public String shenHeDriverRegister(String pid, HttpServletRequest request) {
		DriverRegister der = dsi.getShenHeDriverInfo(pid);
		request.setAttribute("driverRegister", der);
		return "driver/ShenHeDriver";
	}

	// 审核通过
	@RequestMapping(params = "method=driverRegisterThrough")
	public @ResponseBody
	boolean driverRegisterThrough(String userId,String driverId) {
		boolean b = false;
        int i = dsi.driverRegisterThrough(driverId);//更新司机表里状态
        if(i>0){
        	int ii=dsi.updateRegisterState(userId);//更新用户表里状态
        	if(ii>0){
        		b=true;
        	}
        }
		return b;
	}

	// 审核不通过
	@RequestMapping(params = "method=driverRegisterNotThrough")
	public @ResponseBody
	boolean driverRegisterNotThrough(String userId, String driverId
			) {
		boolean b = false;
        int i = dsi.deleteRegisterDriverMessage(driverId);
        if(i>0){
        	/*int ii = dsi.driverRegisterNotThrough(userId);
        	if(ii>0){
        		
        	}*/
        	b=true;
        }
		return b;
	}

}
