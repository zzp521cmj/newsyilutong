package com.jy.action;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import Decoder.BASE64Decoder;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.jy.common.BaiduWeather;
import com.jy.common.GSONUtils;
import com.jy.common.MD5;
import com.jy.common.UUIDUtils;
import com.jy.dao.Json;
import com.jy.model.AppMessage;
import com.jy.model.AppVersion;
import com.jy.model.Car_length;
import com.jy.model.CityAgreement;
import com.jy.model.City_info;
import com.jy.model.ConfirmMsg;
import com.jy.model.CreateAgreement;
import com.jy.model.Customer;
import com.jy.model.Demand_release;
import com.jy.model.Department;
import com.jy.model.Driver;
import com.jy.model.DriverRegister;
import com.jy.model.Evaluate;
import com.jy.model.JITMonitor;
import com.jy.model.Maps;
import com.jy.model.MonitorRuning;
import com.jy.model.Overbooking;
import com.jy.model.PushMessage;
import com.jy.model.ShippingOrder;
import com.jy.model.Sign_order;
import com.jy.model.TemporaryCar;
import com.jy.model.TransportCard;
import com.jy.model.TravelCard;
import com.jy.model.Unqualified;
import com.jy.model.User;
import com.jy.model.Vehicle_auction;
import com.jy.service.CityAgreementSearchService;
import com.jy.service.CreateAgreementInfoService;
import com.jy.service.Demand_releaseService;
import com.jy.service.DriverInfoService;
import com.jy.service.JITMonitorService;
import com.jy.service.LoginUserService;
import com.jy.service.MapService;
import com.jy.service.MonitorRuningService;
import com.jy.service.OverbookingService;
import com.jy.service.PushMessageService;
import com.jy.service.RemarkMapService;
import com.jy.service.RoleService;
import com.jy.service.ShippingOrderInfoService;
import com.jy.service.TemporaryCarService;
import com.jy.service.TravelCardService;
import com.jy.service.UnqualifiedService;
import com.jy.service.UserInfoService;
import com.jy.service.VehicleAuctionService;
import com.jy.service.VehicleBiddingService;

/**
 * 2015年5月13日 11:30:48 Controller
 * 
 * @author zkj
 */
@Controller
@RequestMapping(value = "/app.do")
public class AppController {

	@Resource
	private MapService mapService;
	@Resource
	private Demand_releaseService demand_releaseService;
	@Resource
	private LoginUserService loginUserService;
	@Resource
	private UserInfoService uis;
	@Resource
	private TemporaryCarService cs;
	@Resource
	private VehicleAuctionService vehicleAuctionService;
	@Resource
	private CityAgreementSearchService bid;
	@Resource
	private RoleService roleService;
	@Resource
	private JITMonitorService msi;
	@Resource
	private MonitorRuningService mrs;
	@Resource
	private TravelCardService tcs;
	@Resource
	private ShippingOrderInfoService csi;
	@Resource
	private PushMessageService pushMessageService;
	@Resource
	private CreateAgreementInfoService cai;
	@Resource
	private OverbookingService os;
	@Resource
	private VehicleBiddingService vbs;
	@Resource
	private UnqualifiedService tc;
	@Resource
	private RemarkMapService rms;
	@Resource
	private DriverInfoService dsi;

	// 竞价修改信息
	@RequestMapping(params = "method=getEditVehicle_auction")
	public @ResponseBody
	String updateDemand_release(String json) {
		Vehicle_auction auction = new Vehicle_auction();
		JSONObject returnjson = new JSONObject();

		/* try{ */
		JSONObject tojson = JSONObject.fromObject(json);
		auction.setDemandReleaseId(tojson.getString("demandReleaseId"));
		auction.setPrice(tojson.getDouble("price"));
		auction.setUserid(tojson.getString("userid"));
		auction.setDetermine(0);
		// Vehicle_auction vehicle_auction,String demandReleaseId,
		// HttpServletRequest request
		TemporaryCar cc = cs.getUserTemCar(tojson.getString("userid"));
		auction.setTemporary_car_id(cc.getTemporaryCarId());
		int i = vehicleAuctionService.updateVehicle_auction(auction,
				tojson.getString("userid"));
		returnjson.put("success", true);
		return returnjson.toString();
		/*
		 * }catch (Exception e) { // TODO: handle exception
		 * returnjson.put("errorMsg", "系统异常"); return returnjson.toString(); }
		 */
	}

	// 获取修改信息
	/*
	 * @RequestMapping(params = "method=getVehicleAuctionRow") public
	 * 
	 * @ResponseBody Vehicle_auction getVehicleAuctionRow(String json) {
	 * JSONObject tojson=JSONObject.fromObject(json);
	 * 
	 * Vehicle_auction vehicle_auction = vehicleAuctionService
	 * .getVehicleAuctionRow(tojson.getString("vehicleAuctionId")); return
	 * vehicle_auction;
	 * 
	 * }
	 */

	// 进行竞价
	@RequestMapping(params = "method=AddVehicleAuction")
	public @ResponseBody
	String AddVehicleAuction(String json) {
		JSONObject returnjson = new JSONObject();

		try {
			JSONObject tojson = JSONObject.fromObject(json);
			Vehicle_auction vehicle_auction = new Vehicle_auction();
			vehicle_auction.setPrice(tojson.getDouble("price"));
			vehicle_auction.setVehicleAuctionId(tojson
					.getString("vehicleAuctionId"));
			int i = vehicleAuctionService
					.updateVehicleAuctionRow(vehicle_auction);
			if (i > 0) {
				returnjson.put("success", true);
				return returnjson.toString();
			}
			returnjson.put("success", true);
			return returnjson.toString();
		} catch (Exception e) {
			// TODO: handle exception
			returnjson.put("errorMsg", "系统异常");
			return returnjson.toString();
		}
	}

	// 用户登录
	// 登录
	@RequestMapping(params = "method=applogin")
	public @ResponseBody
	String userLogin(String json, HttpSession session) {
		JSONObject tojson = JSONObject.fromObject(json);

		JSONObject returnjson = new JSONObject();
		/* try { */
		User user = new User();
		user.setUsername(tojson.getString("userName"));
		user.setPassword(tojson.getString("pwd"));
		boolean flag = loginUserService.appCheckUser(user);
		if (flag == true) {
			User userinfo = loginUserService.appGetUserInfo(user);
			if(userinfo.getReviewed_state()==null&&userinfo.getDriver_id()==null){
				userinfo.setReviewed_state("0");
			}else if(userinfo.getReviewed_state()==null&&userinfo.getDriver_id()!=null){
				userinfo.setReviewed_state("3");	
			}
			
			/*
			 * String device_type =
			 * tojson.getString("device_type");//3：Android，4：IOS // 更新app标识
			 * loginUserService.updatechannelId(tojson.getString("channelId"),
			 * device_type, user.getId());
			 */
			// 是否有固定车辆信息
			/*
			 * String carflag=loginUserService.getCarCount(userinfo.getId());
			 * if(carflag==null){ returnjson.put("errorMsg","请先维护车辆信息，再登陆");
			 * return returnjson.toString(); }else{
			 */
			returnjson.put("successMsg", userinfo);
			// returnjson.put("carid", carflag);
			System.out.println(returnjson.toString());
			return returnjson.toString();
			// }
		}
		returnjson.put("errorMsg", "用户名密码错误");
		return returnjson.toString();
		/* } */
		/*
		 * catch (Exception e) { // TODO: handle exception
		 * returnjson.put("errorMsg","登录异常"); return returnjson.toString();
		 * 
		 * }
		 */

	}

	/**
	 * 添加一个用户
	 */
	@RequestMapping(params = "method=appsaveUser")
	public @ResponseBody
	String saveUser(String json) {
		JSONObject returjson = new JSONObject();
		JSONObject tojson = JSONObject.fromObject(json);
		User user = new User();
		Gson gson = new Gson();
		String flag = tojson.getString("flag");
		user.setUsername(tojson.getString("username"));
		user.setPassword(MD5.toMD5(tojson.getString("password")));
		user.setRealName(tojson.getString("realName"));
		// user.setDid(tojson.getString("did"));
		user.setFlag(flag);
		user.setPhone(tojson.getString("phone"));
		boolean b = uis.checkUser(tojson.getString("username"));
		if (b) {
			returjson.put("errorMsg", "用户已存在");
		} else {
			boolean addflag = false;
			if (flag.equals("1")) {// 司机注册
				user.setId(UUIDUtils.getUUID());
				user.setState("0");
				addflag = uis.appAddUser(user);
			} else if (flag.equals("2")) {// 客户注册
				String cus = tojson.getString("customer");
				Customer customers = gson.fromJson(cus, Customer.class);
				customers.setCustomer_id(UUIDUtils.getUUID());
				customers.setCustomer_type("1");
				int i = uis.appSaveCustomer(customers);
				if (i > 0) {
					user.setId(UUIDUtils.getUUID());
					user.setCostomersid(customers.getCustomer_id());
					user.setState("1");
					addflag = uis.appAddUser(user);
				}
			}
			if (addflag) {
				// User userinfo = loginUserService.getUserInfo(user);
				returjson.put("successMsg", "注册成功");
			} else {
				returjson.put("errorMsg", "注册失败");
			}
		}
		return returjson.toString();
	}

	@RequestMapping(params = "method=appAddDriverMessage")
	public @ResponseBody
	String appAddDriverMessage(String json) {
		JSONObject returjson = new JSONObject();
		JSONObject tojson = JSONObject.fromObject(json);
		String driver_json = tojson.getString("driver");// 司机注册信息
		String user_id = tojson.getString("user_id");// 用户id
		String images = tojson.getString("fileNames");// 文件名称
		Gson gson = new Gson();
		DriverRegister drivermessage = gson.fromJson(driver_json,
				DriverRegister.class);
		int i = tcs.checkTraCarName(drivermessage.getCar_number());
		if (i > 0) {
			returjson.put("errorMsg", "车牌号已存在");
		} else {
			TravelCard tCard = new TravelCard();
			tCard.setTravelCardId(UUIDUtils.getUUID());
			tCard.setPlateNumber(drivermessage.getCar_number());// 车牌号
			tCard.setTels(drivermessage.getPhone());// 电话
			tCard.setAddress(drivermessage.getAdress());// 地址
			tCard.setCarType(drivermessage.getCar_type());// 车型
			tCard.setBoxType(drivermessage.getBox_type());//箱型
			tCard.setCarOwner(drivermessage.getDrive_name());// 所有人
			tCard.setUser_idcard(drivermessage.getIDcardnumber());// 所有人身份证
			tCard.setCars_type("1");//app注册
			tCard.setDepartmentId("0");
			int addTCardBoolean = tcs.appAddTravel(tCard);
			
			if (addTCardBoolean > 0) {
				TransportCard transportCard = new TransportCard();
				if(drivermessage.getCar_long()==null&&drivermessage.getCar_long().equals("")){					
				}
				double carLength = Double.parseDouble(drivermessage.getCar_long());
				transportCard.setCarLength(carLength);
				String tonnage= drivermessage.getCar_weight();
				transportCard.setTonnage(tonnage);
				transportCard.setTravelCardId(tCard.getTravelCardId());
				transportCard.setRoadTransportCardId(UUIDUtils.getUUID());
				int addTranBoolean= tcs.addTran(transportCard);
				//System.out.println("添加车俩长度载重"+addTranBoolean);
				Driver driver = new Driver();
				driver.setDriverId(UUIDUtils.getUUID());
				driver.setAddress(drivermessage.getAdress());// 住址
				driver.setCarId(tCard.getTravelCardId());// 车辆id
				driver.setDriverName(drivermessage.getDrive_name());// 司机姓名
				driver.setPhoneNumber(drivermessage.getPhone());// 手机号
				driver.setCardNumber(drivermessage.getIDcardnumber());// 身份证
				driver.setPlate_number(tCard.getPlateNumber());// 车牌号
				driver.setDrivers_type("1");
				driver.setReviewed_state("1");
				int saveDriverBoolean = dsi.appSaveDriver(driver);
				if (saveDriverBoolean > 0) {
					int userBoolean = uis.updateUserState(user_id,driver.getDriverId());
					if(userBoolean>0){
						dsi.appSaveRregisterImage(UUIDUtils.getUUID(), driver.getDriverId(), images);//保存图片
						returjson.put("successMsg", "提交成功");
					}else{
						returjson.put("errorMsg", "提交失败");
					}
					
				}else{
					returjson.put("errorMsg", "提交司机信息失败");
				}
			} else {
				returjson.put("errorMsg", "提交车俩信息失败");
			}

		}
		return returjson.toString();
	}

	// 获取装货城市下拉框列表
	@RequestMapping(params = "method=getCity_info")
	public @ResponseBody
	String getCity_info(String json) {
		List<City_info> list = demand_releaseService.getCity_info(json);
		JSONObject jb = null;
		JSONArray jsons = new JSONArray();
		for (City_info city_info : list) {
			jb = new JSONObject();
			jb.put("id", city_info.getCitycode());
			jb.put("name", city_info.getCityname());
			jsons.add(jb);
		}
		return jsons.toString();
	}

	/**
	 * 添加临时车辆
	 * 
	 * @param tem
	 * @return
	 */
	@RequestMapping(params = "method=addCar")
	public @ResponseBody
	String addCar(String json, HttpSession session) {
		Gson gson = new Gson();
		JSONObject returnjson = new JSONObject();
		TemporaryCar tc = gson.fromJson(json, TemporaryCar.class);
		Json json1 = new Json();
		int truck = tcs.checkTemCarName(tc.getPlateNumber());
		int truck2 = tcs.checkTraCarName(tc.getPlateNumber());
		if (truck > 0 || truck2 > 0) {
			returnjson.put("errorMsg", "车辆已存在");
			return returnjson.toString();
		}
		int add = cs.addCar(tc);
		// 添加临时车辆权限
		roleService.addUserRole(tc.getCreatingUser(), 2);
		// 添加部门更新！！！！！！！！！！！！！！！！！！！
		int flag = uis.updateDepartment(tc.getCreatingUser(),
				tc.getInstitutionId());
		if (add > 0) {
			returnjson.put("successMsg", true);
			return returnjson.toString();
		}
		returnjson.put("errorMsg", false);
		return returnjson.toString();
	}

	/**
	 * 需求发布页面
	 * 
	 * @param page
	 * @param rows
	 * @param zhuang
	 * @param xie
	 * @param models
	 * @param truckTypeId
	 * @param publisher
	 * @return
	 */
	@RequestMapping(params = "method=getDemand_release")
	public @ResponseBody
	List<Demand_release> getDemand_release(String json) {
		JSONObject gson = JSONObject.fromObject(json);
		String rownum = gson.getString("rownum");
		if (rownum != null && !"".equals(rownum)) {
			if (Integer.parseInt(rownum) > 0) {
				rownum = String.valueOf(Integer.parseInt(rownum) - 1);
			}
		}
		List<Demand_release> list = demand_releaseService
				.getDemand_releaseInfoAll(gson.getString("userid"), rownum,
						gson.getString("rows"));
		JSONArray jsons = JSONArray.fromObject(list);
		System.out.println(jsons.toString());
		return list;
	}

	/**
	 * 查询显示自己的竞价
	 */
	@RequestMapping(params = "method=getVehicleAuction")
	public @ResponseBody
	List<Vehicle_auction> getVehicleAuction(String json) {
		JSONObject gson = JSONObject.fromObject(json);
		String rownum = gson.getString("rownum");
		if (rownum != null && !"".equals(rownum)) {
			if (Integer.parseInt(rownum) > 0) {
				rownum = String.valueOf(Integer.parseInt(rownum) - 1);
			}
		}
		List<Vehicle_auction> list = vehicleAuctionService
				.getVehicle_auctionInfoAll(gson.getString("userid"),
						gson.getString("istrue"), rownum,
						gson.getString("rows"));
		return list;
	}

	// 查询车辆协议
	@RequestMapping(params = "method=getCityAgreement")
	public @ResponseBody
	List<CityAgreement> getAgreementInfo(String json) {
		JSONObject gson = null;
		String isArrive = null;
		String did = null;
		String userid = null;
		if (json != null) {
			gson = JSONObject.fromObject(json);
			isArrive = gson.getString("isArrive");
			userid = gson.getString("userid");
			did = gson.getString("did");
		}

		List<CityAgreement> list = bid.getCityAgreementSearchAll(isArrive, did,
				userid);
		return list;
	}

	// 修改状态idms
	@RequestMapping(params = "method=updateCityAgreement")
	public @ResponseBody
	String updateCityAgreement(String json) {
		JSONObject gson = null;
		String code = null;
		boolean flag = false;
		JSONObject returnjson = new JSONObject();

		try {

			if (json != null) {
				gson = JSONObject.fromObject(json);
				code = gson.getString("code");
				flag = bid.updateCityAgreement(code);
			}

			if (flag)
				returnjson.put("successMsg", "更新成功");
			else
				returnjson.put("errorMsg", "该承运协议不存在，更新失败");
			return returnjson.toString();
		} catch (Exception e) {
			// TODO: handle exception
			returnjson.put("errorMsg", "系统异常");
			return returnjson.toString();
		}
	}

	/**
	 * 厢型信息
	 * 
	 * @return
	 */
	@RequestMapping(params = "method=getLength")
	public @ResponseBody
	String getLength() {
		List<Car_length> state = cs.getLength();
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> map = null;
		for (Car_length st : state) {
			map = new HashMap<String, Object>();
			map.put("id", st.getLength_id());
			map.put("text", st.getLength_name());
			list.add(map);
		}
		JSONObject returnjson = new JSONObject();
		returnjson.put("successMsg", list);
		return returnjson.toString();
	}

	/**
	 * 获取司机临时车辆的信息
	 * 
	 * @return
	 */
	@RequestMapping(params = "method=getUserTemporaryCar")
	public @ResponseBody
	String getUserTemporaryCar(String json) {
		JSONObject gson = JSONObject.fromObject(json);
		TemporaryCar list = null;
		JSONObject returnjson = new JSONObject();
		/* try{ */

		if (gson != null && !"".equals(gson.getString("creatingUser"))) {
			list = cs.getUserTemCar(gson.getString("creatingUser"));
			returnjson.put("successMsg", list);

		} else {
			returnjson.put("errorMsg", "车辆信息不存在");
		}
		return returnjson.toString();
		/*
		 * }catch (Exception e) { // TODO: handle exception
		 * returnjson.put("errorMsg", "系统异常"); return returnjson.toString(); }
		 */
	}

	/**
	 * 修改车辆信息
	 * 
	 * @param tem
	 * @return
	 */
	@RequestMapping(params = "method=updateTem")
	public @ResponseBody
	String editTemCar(String json) {
		JSONObject returnjson = new JSONObject();
		TemporaryCar temp = new TemporaryCar();
		/* try{ */
		TemporaryCar tem = (TemporaryCar) GSONUtils.JsonToObject(json, temp);
		int i = cs.editTemCar(tem);
		int flag = uis.updateDepartment(tem.getCreatingUser(),
				tem.getInstitutionId());
		if (i > 0) {
			returnjson.put("successMsg", "修改成功");
		} else {
			returnjson.put("errorMsg", "修改失败");
		}
		/*
		 * }catch (Exception e) { // TODO: handle exception
		 * returnjson.put("errorMsg", "系统异常"); }
		 */
		return returnjson.toString();

	}

	/**
	 * 获取指定用户
	 */
	@RequestMapping(params = "method=getUser1")
	public @ResponseBody
	String getUser1(String json) {
		JSONObject gson = JSONObject.fromObject(json);
		JSONObject returnjson = new JSONObject();
		/* try{ */
		if (gson != null) {
			User user = uis.getAppUser(gson.getString("id"));
			returnjson.put("successMsg", user);
		} else {
			returnjson.put("errorMsg", "获取信息失败");
		}
		/*
		 * }catch (Exception e) { // TODO: handle exception
		 * returnjson.put("errorMsg", "系统异常"); }
		 */
		return returnjson.toString();
	}

	/**
	 * 修改密码
	 */

	@RequestMapping(params = "method=modifypassword")
	public @ResponseBody
	String modifypassword(String json) {
		JSONObject gson = JSONObject.fromObject(json);
		JSONObject returnjson = new JSONObject();
		try {
			if (gson != null) {
				User u = uis.getUser1(gson.getString("id"));
				boolean pass = u.getPassword().equals(
						MD5.toMD5(gson.getString("password1")));
				if (pass) {
					boolean flag = uis.modifyPassword(gson.getString("id"),
							MD5.toMD5(gson.getString("password2")));
					if (flag) {
						returnjson.put("successMsg", "修改密码成功");
					} else {
						returnjson.put("errorMsg", "修改密码失败");
					}
				} else {
					returnjson.put("errorMsg", "原密码输入错误");
				}
			} else {
				returnjson.put("errorMsg", "数据错误");
			}
			return returnjson.toString();
		} catch (Exception e) {
			// TODO: handle exception
			returnjson.put("errorMsg", "系统异常");
			return returnjson.toString();
		}
	}

	// 设备id更新
	@RequestMapping(params = "method=appUpdateChannelId")
	public @ResponseBody
	String updatechannelId(String json) {
		JSONObject returnjson = new JSONObject();

		try {
			JSONObject tojson = JSONObject.fromObject(json);
			// System.out.println("设备号:"+tojson.getString("channelId"));
			boolean b = loginUserService.updatechannelId(
					tojson.getString("channelId"),
					tojson.getString("device_type"), tojson.getString("id"));
			if (b) {
				returnjson.put("successMsg", "更新设备状态成功");
				return returnjson.toString();
			} else {
				returnjson.put("successMsg", "更新失败，用户信息不存在");
				return returnjson.toString();
			}
		} catch (Exception e) {
			// TODO: handle exception
			returnjson.put("successMsg", "系统异常");
			return returnjson.toString();
		}
	}

	/**
	 * 获取机构信息
	 * 
	 * @return
	 */
	@RequestMapping(params = "method=getDepartment")
	public @ResponseBody
	String getDepartment(String json) {
		JSONObject getjson = JSONObject.fromObject(json);
		JSONObject returnjson = new JSONObject();
		try {
			List<Department> dep = uis.getDepartmentName(getjson
					.getString("department_name"));
			if (dep.size() > 0)
				returnjson.put("successMsg", dep);
			else
				returnjson.put("errorMsg", "机构信息不存在");
			return returnjson.toString();
		} catch (Exception e) {
			// TODO: handle exception
			returnjson.put("errorMsg", "系统异常");
			return returnjson.toString();
		}
	}

	/**
	 * 获取app版本号
	 */
	@RequestMapping(params = "method=getAppVersion")
	public @ResponseBody
	String getAppVersion(String json) {
		JSONObject getjson = JSONObject.fromObject(json);
		JSONObject returnjson = new JSONObject();
		try {
			AppVersion dep = uis.getAppVersion();
			returnjson.put("successMsg", dep);
			return returnjson.toString();
		} catch (Exception e) {
			// TODO: handle exception
			returnjson.put("errorMsg", "系统异常");
			return returnjson.toString();
		}
	}

	/**
	 * 保存意见信息
	 * 
	 * @param tem
	 * @return
	 */
	@RequestMapping(params = "method=saveAppMessage")
	public @ResponseBody
	String saveAppMessage(String json) {
		JSONObject getjson = JSONObject.fromObject(json);
		JSONObject returnjson = new JSONObject();
		AppMessage appmessage = new AppMessage();
		try {
			appmessage.setMessage(getjson.getString("message"));
			appmessage.setUser_id(getjson.getString("user_id"));
			int i = uis.saveAppMessage(appmessage);
			if (i > 0) {
				returnjson.put("successMsg", "添加成功");
			} else {
				returnjson.put("errorMsg", "添加失败");
			}
		} catch (Exception e) {
			// TODO: handle exception
			returnjson.put("errorMsg", "系统异常");
		}
		return returnjson.toString();

	}

	/**
	 * 获取消息
	 */
	@RequestMapping(params = "method=showMsg")
	public @ResponseBody
	String showMsg(String json) {
		JSONObject getjson = JSONObject.fromObject(json);
		/*
		 * //临时车辆 JSONObject objjson =new JSONObject(); //固定车辆 //JIT JSONObject
		 * gdjson=new JSONObject(); //RUN JSONObject runjson=new JSONObject();
		 */

		JSONObject returnobj = new JSONObject();
		TemporaryCar tc = null;
		TravelCard travelCard = null;
		try {
			String flag = getjson.getString("flag");
			String user_id = getjson.getString("id");
			if (flag != null && user_id != null) {
				if ("1".equals(flag)) {
					// 临时车辆
					tc = cs.getUserTemCar(user_id);
					List<ConfirmMsg> list = cs.getConfirmMsg(tc
							.getTemporaryCarId());
					returnobj.accumulate("confirmMsg", list);
					/*
					 * if(list.size()>0){ for(ConfirmMsg confirmMsg:list){
					 * System.out.println(confirmMsg.getMessage());
					 * objjson=objjson.fromObject(confirmMsg);
					 * 
					 * } }
					 */
				} else if ("2".equals(flag)) {
					travelCard = tcs.getUserTravel(user_id);
					// JIT报警
					List<JITMonitor> jitmonitorlist = msi
							.getCarIdJITMonitor(travelCard.getTravelCardId());
					returnobj.accumulate("JITMsg", jitmonitorlist);

					/*
					 * if(jitmonitorlist.size()>0){ for(JITMonitor
					 * jitMonitor:jitmonitorlist){
					 * System.out.println(jitMonitor.getCar_id());
					 * gdjson=gdjson.fromObject(jitMonitor); } }
					 */
					// 运行报警
					List<MonitorRuning> runmonitorlist = mrs
							.getCarIdRunMonitor(travelCard.getTravelCardId());
					returnobj.accumulate("RunMsg", runmonitorlist);

					/*
					 * if(runmonitorlist.size()>0){ for(MonitorRuning
					 * monitorRuning:runmonitorlist){
					 * System.out.println(monitorRuning.getCar_id());
					 * runjson=gdjson.fromObject(monitorRuning); } }
					 */
				}
			}

		} catch (Exception e) {
			// TODO: handle exception
			/*
			 * returnjson.put("errorMsg", "系统异常");
			 */}
		return returnobj.toString();

	}

	/**
	 * 订单查询默认值放入签收字段默认值
	 */
	@RequestMapping(params = "method=getOrderInfo")
	public @ResponseBody
	String getOrderInfo(String json) {
		JSONObject getjson = JSONObject.fromObject(json);
		JSONObject returnjson = new JSONObject();
		/* try{ */
		ShippingOrder der = csi.getAppShipOrder(getjson.getString("orderid"));
		Sign_order so = new Sign_order();
		so.setSign_user(der.getReceipt());
		so.setSign_userphone(der.getReceipt_tel());
		so.setActual_number(Integer.parseInt(der.getGoods_num()));
		so.setDefect_number(0);
		so.setCopies_number(der.getIs_recept());
		so.setOrder_id(der.getShiping_order_id());
		so.setOrder_number(der.getShiping_order_num());
		returnjson.put("successMsg", so);
		System.out.println("签收查询：" + returnjson.toString());
		return returnjson.toString();
		/*
		 * }catch (Exception e) { // TODO: handle exception
		 * returnjson.put("errorMsg", "系统异常"); return returnjson.toString(); }
		 */
	}

	/**
	 * 订单签收
	 */
	@RequestMapping(params = "method=signShipOrder")
	public @ResponseBody
	String signShipOrder(String json, HttpServletRequest request) {
		JSONObject getjson = JSONObject.fromObject(json);
		JSONObject returnjson = new JSONObject();
		/* try { */
		Gson gson = new Gson();
		int flag = json.indexOf("newFileName");
		System.out.println(json);
		if (flag > 0) {

			Sign_order sign_order = gson.fromJson(
					getjson.getString("singnInfo"), Sign_order.class);
			sign_order.setSign_id(UUIDUtils.getUUID());
			int i = 0;
			csi.updatestate(sign_order.getOrder_id());
			i = csi.saveSignShipOrder(sign_order);
			// 生成jpeg图片
			String path = request.getSession().getServletContext()
					.getRealPath("WebRoot/signorderImages/");// 文件路径
			File filez = new File(path);
			if (!filez.exists()) {
				filez.mkdirs();
			}

			String newpath = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ newpath;
			String paths = basePath + "/WebRoot/signorderImages/"
					+ getjson.getString("newFileName");
			/*
			 * paths = paths.replaceAll("\\\\", "////");
			 * System.out.println(paths);
			 */
			int flg = csi.saveSignImages(UUIDUtils.getUUID(),
					sign_order.getOrder_id(), paths);
			if (flg > 0 && i > 0) {
				returnjson.put("successMsg", "订单签收成功");
				return returnjson.toString();
			} else {
				returnjson.put("errorMsg", "订单签收失败");
				return returnjson.toString();
			}
		} else {
			Sign_order sign_order = gson.fromJson(json, Sign_order.class);
			sign_order.setSign_id(UUIDUtils.getUUID());
			int i = 0;
			System.out.println("订单号：" + sign_order.getOrder_id());
			csi.updatestate(sign_order.getOrder_id());
			i = csi.saveSignShipOrder(sign_order);
			if (i > 0) {
				returnjson.put("successMsg", "订单签收成功");
				return returnjson.toString();
			} else {
				returnjson.put("errorMsg", "订单签收失败");
				return returnjson.toString();
			}

		}

		/*
		 * } catch (Exception e) { // TODO: handle exception
		 * returnjson.put("errorMsg", "系统异常"); return returnjson.toString(); }
		 */
	}

	@RequestMapping(params = "method=saveMapInfo")
	public @ResponseBody
	String saveMapInfo(String json) {
		JSONObject getjson = JSONObject.fromObject(json);
		JSONObject returnjson = new JSONObject();
		try {
			int s = mapService.deletecarbyid(getjson.getString("carid"));
			if (s == 0) {

			} else {

			}
		} catch (Exception e) {
			returnjson.put("errorMsg", "删除异常");
		}

		Maps maps = new Maps();
		String dbname = BaiduWeather.getTableName(maps.getNowdate());
		// int fg = MapsDao.savecarsinfo(dbname, mon);
		try {
			String url = "http://api.map.baidu.com/geoconv/v1/?coords="
					+ getjson.getString("lng") + "," + getjson.getString("lat")
					+ "&from=3&to=5&ak=iz6uMstBVDO8oDt1GrAv9ynV";
			String js = loadJSON(url);
			JSONObject obj = JSONObject.fromObject(js);
			if (obj.get("status").toString().equals("0")) {
				String lng = obj.getJSONArray("result").getJSONObject(0)
						.getString("x");
				String lat = obj.getJSONArray("result").getJSONObject(0)
						.getString("y");
				maps.setLng(lng);
				maps.setLat(lat);
			} else {
				maps.setLng(getjson.getString("lng"));
				maps.setLat(getjson.getString("lat"));
			}
			maps.setCarid(getjson.getString("carid"));
			maps.setCarno(getjson.getString("plate_number"));
			int i = mapService.saveMaps(maps);
			if (i > 0) {
				returnjson.put("successMsg", "临时表添加成功");
			} else {
				returnjson.put("errorMsg", "临时表添加失败");
			}

			int fg = mapService.savecarsinfo(dbname, maps);
			if (fg > 0) {
				returnjson.put("successMsg", "添加成功");
			} else {
				returnjson.put("errorMsg", "添加失败");
			}
		} catch (Exception e) {
			returnjson.put("errorMsg", "系统异常");
		}
		return returnjson.toString();
	}

	public static String loadJSON(String url) {
		StringBuilder json = new StringBuilder();
		try {
			URL oracle = new URL(url);
			URLConnection yc = oracle.openConnection();
			BufferedReader in = new BufferedReader(new InputStreamReader(
					yc.getInputStream()));
			String inputLine = null;
			while ((inputLine = in.readLine()) != null) {
				json.append(inputLine);
			}
			in.close();
		} catch (MalformedURLException e) {
		} catch (IOException e) {
			e.printStackTrace();
		}
		return json.toString();
	}

	@RequestMapping(params = "method=getUploadImage")
	public @ResponseBody
	String getUploadImage(String json, String imgString, String newFileName,
			String fileRoot, HttpServletRequest request) {
		if (imgString != null) {
			imgString = imgString.replaceAll(" ", "+");
			System.out.println("新来的！" + imgString.replaceAll(" ", "+"));
		}

		JSONObject returnjson = new JSONObject();
		try {
			/*
			 * String str=getjson.getString("imgString"); String
			 * newFileName=getjson.getString("newFileName");
			 */BASE64Decoder decoder = new BASE64Decoder();
			// Base64解码
			byte[] b = decoder.decodeBuffer(imgString);
			for (int i = 0; i < b.length; ++i) {
				if (b[i] < 0) {// 调整异常数据
					b[i] += 256;
				}
			}
			// 生成jpeg图片
			String path = request.getSession().getServletContext()
					.getRealPath("WebRoot/" + fileRoot + "/");// 文件路径
			File filez = new File(path);
			if (!filez.exists()) {
				filez.mkdirs();
			}
			String paths = path + "\\" + newFileName;// 新生成的图片
			OutputStream out = new BufferedOutputStream(new FileOutputStream(
					paths));
			out.write(b);
			out.flush();
			out.close();
			// AppVersion dep = uis.getAppVersion();
			returnjson.put("successMsg", "成功");
			return returnjson.toString();
		} catch (Exception e) {
			// TODO: handle exception
			returnjson.put("errorMsg", "系统异常");
			return returnjson.toString();
		}
	}

	/**
	 * 查询司机分配的订单
	 */
	@RequestMapping(params = "method=getCarOder")
	public @ResponseBody
	String getCarOder(String json) {

		JSONObject getjson = JSONObject.fromObject(json);
		JSONObject returnjson = new JSONObject();
		try {
			System.out.println(getjson.getString("car_id") + "车牌号");
			List<ShippingOrder> der = csi.getCarShipOrder(getjson
					.getString("car_id"));
			returnjson.put("successMsg", der);
			System.out.println(returnjson.toString());
			return returnjson.toString();
		} catch (Exception e) {
			// TODO: handle exception
			returnjson.put("errorMsg", "系统异常");
			return returnjson.toString();
		}
	}

	/**
	 * 查询消息
	 */
	@RequestMapping(params = "method=searchPushMessage")
	public @ResponseBody
	String searchPushMessage(String json) {
		JSONObject getjson = JSONObject.fromObject(json);
		JSONObject returnjson = new JSONObject();
		try {
			List<PushMessage> der = pushMessageService.searchPushMessage(
					getjson.getString("userid"), getjson.getString("username"));
			returnjson.put("successMsg", der);
			System.out.println(returnjson.toString());
			return returnjson.toString();
		} catch (Exception e) {
			// TODO: handle exception
			returnjson.put("errorMsg", "系统异常");
			return returnjson.toString();
		}
	}

	@RequestMapping(params = "method=searchMD5")
	public @ResponseBody
	String getMD5Str(String str) {
		System.out.println("md5转换前：" + str);
		MessageDigest messageDigest = null;

		try {
			messageDigest = MessageDigest.getInstance("MD5");

			messageDigest.reset();

			messageDigest.update(str.getBytes("UTF-8"));
		} catch (NoSuchAlgorithmException e) {
			System.out.println("NoSuchAlgorithmException caught!");
			// System.exit(-1);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		byte[] byteArray = messageDigest.digest();

		StringBuffer md5StrBuff = new StringBuffer();

		for (int i = 0; i < byteArray.length; i++) {
			if (Integer.toHexString(0xFF & byteArray[i]).length() == 1)
				md5StrBuff.append("0").append(
						Integer.toHexString(0xFF & byteArray[i]));
			else
				md5StrBuff.append(Integer.toHexString(0xFF & byteArray[i]));
		}
		JSONObject json = new JSONObject();
		json.put("sign", md5StrBuff.toString());
		System.out.println("MD5转换后：" + json.toString());
		return json.toString();
	}

	/**
	 * 查询协议
	 */
	@RequestMapping(params = "method=appGetCreateAgreement")
	public @ResponseBody
	String appGetCreateAgreement(String json) {
		JSONObject getjson = JSONObject.fromObject(json);
		JSONObject returnjson = new JSONObject();
		String driverId = getjson.getString("driverId");
		String rows = getjson.getString("rows");
		String length = getjson.getString("page");
		int row = 0;
		int page = 0;
		if (!"".equals(rows) && rows != null) {
			row = Integer.parseInt(rows);
		}
		if (!"".equals(length) && length != null) {
			page = Integer.parseInt(length);
		}

		List<CreateAgreement> list = cai.appGetCreateAgreementInfo(driverId,
				row, page);
		returnjson.put("successMsg", list);
		return returnjson.toString();
	}

	/**
	 * 查询协议下的订单
	 */
	@RequestMapping(params = "method=appGetAgreementShip")
	public @ResponseBody
	String appGetAgreementShip(String json) {

		JSONObject getjson = JSONObject.fromObject(json);
		JSONObject returnjson = new JSONObject();
		String agreementId = getjson.getString("agreement_id");
		String rows = getjson.getString("rows");
		String length = getjson.getString("page");
		String state = getjson.getString("state");
		int row = 0;
		int page = 0;
		if (!"".equals(rows) && rows != null) {
			row = Integer.parseInt(rows);
		}
		if (!"".equals(length) && length != null) {
			page = Integer.parseInt(length);
		}
		List<ShippingOrder> list = cai.appGetAgreementShip(agreementId, row,
				page, state);
		returnjson.put("successMsg", list);
		return returnjson.toString();
	}

	/**
	 * APP下单
	 */
	@RequestMapping(params = "method=appOverBooking")
	public @ResponseBody
	String appOverBooking(String json) {
		Gson gson = new Gson();// 定义json
		JSONObject getjson = JSONObject.fromObject(json);
		JSONObject returnjson = new JSONObject();
		String costomersid = getjson.getString("costomersid");// 客户id
		String user_id = getjson.getString("user_id");// 用户id
		// String shiping_order_num = getjson.getString("shiping_order_num");//
		// 下单订单号
		String df ="XD" +new SimpleDateFormat("yyMMdd").format(new Date());
		String b = os.xdselect(); // 方法
		int i=0;
		String c="";
		if(b!=null){
			 c= b.substring(b.length() - 6, b.length()); // 截取后6位
			 i = Integer.parseInt(c);// 转为int
			 i=i+1;		
			 if(i<10){
				 c=df+"00000"+i;					
			 }else if(i>=10&&i<100){
				 c=df+"0000"+i;				 
			 }else if(i>=100&&i<1000){
				 c=df+"000"+i;				 
			 }else if(i>=1000&&i<10000){
				 c=df+"00"+i;
				 
			 }else if(i>=10000&&i<100000){
				 c=df+"0"+i;	 
			 }else if(i>=100000&&i<1000000){
				
				 c=df+i;	 
			 }
		}else{
			 c=df+"000001";
		}
		String objson = getjson.getString("objson");
		int ii = os.getNumber(c);
		if (ii > 0) {
			returnjson.put("errorMsg", "运单号已存在");
		} else {
			Overbooking overbooking = gson.fromJson(objson, Overbooking.class);
			overbooking.setUser_id(costomersid);
			overbooking.setShiping_orders_id(UUIDUtils.getUUID());
			overbooking.setShiping_order_num(c);
			int j = os.insertInfo(overbooking);
			if (j > 0) {
				returnjson.put("successMsg", "下单成功");

			} else {
				returnjson.put("errorMsg", "下单失败");
			}
			/*
			 * List<Overbooking> list = gson.fromJson(objson, new
			 * TypeToken<List<Overbooking>>() { }.getType());
			 */
			/*
			 * for (Overbooking overbooking : list) {
			 * System.out.println("下单"+overbooking.getCustom_name());
			 * 
			 * 
			 * }
			 */
		}
		return returnjson.toString();
	}

	// app查询下单
	@RequestMapping(params = "method=appGetOverBooking")
	public @ResponseBody
	String appGetOverBooking(String json) {
		JSONObject getjson = JSONObject.fromObject(json);
		JSONObject returnjson = new JSONObject();
		String costomersid = getjson.getString("costomersid");// 客户id
		String user_id = getjson.getString("user_id");// 用户id
		String rows = getjson.getString("rows");
		String length = getjson.getString("page");
		int row = 0;
		int page = 0;
		if (!"".equals(rows) && rows != null) {
			row = Integer.parseInt(rows);
		}
		if (!"".equals(length) && length != null) {
			page = Integer.parseInt(length);
		}
		List<Overbooking> list = os.appGetOverBooking(row, page, costomersid);
		returnjson.put("successMsg", list);
		return returnjson.toString();
	}

	/**
	 * app异常上报
	 * 
	 */
	@RequestMapping(params = "method=appAddUnqualified")
	public @ResponseBody
	String appAddUnqualified(String json) {
		Gson gson = new Gson();// 定义json
		JSONObject getjson = JSONObject.fromObject(json);
		JSONObject returnjson = new JSONObject();
		String objson = getjson.getString("objson");
		Unqualified unqualified = gson.fromJson(objson, Unqualified.class);
		unqualified.setAbnormalid(UUIDUtils.getUUID());
		if (unqualified.getSend_time().equals("")) {
			unqualified.setSend_time(null);
		}
		if (unqualified.getInsurance().equals("")) {
			unqualified.setInsurance("0");
		}
		int a = tc.addunqualified(unqualified);

		if (a > 0) {
			returnjson.put("successMsg", "异常上报成功");

		} else {
			returnjson.put("errorMsg", "异常上报失败");
		}

		/*
		 * List<Overbooking> list = gson.fromJson(objson, new
		 * TypeToken<List<Overbooking>>() { }.getType());
		 */
		/*
		 * for (Overbooking overbooking : list) {
		 * System.out.println("下单"+overbooking.getCustom_name());
		 * 
		 * 
		 * }
		 */

		return returnjson.toString();
	}

	/**
	 * 车辆竞价消息查看
	 */
	@RequestMapping(params = "method=appVehbidPushMessage")
	public @ResponseBody
	String appVehbidPushMessage(String json) {
		JSONObject getjson = JSONObject.fromObject(json);
		JSONObject returnjson = new JSONObject();
		String driverId = getjson.getString("driverId");
		String rows = getjson.getString("rows");
		String length = getjson.getString("page");
		String is_vehbid = getjson.getString("is_vehbid");// 是否竞价（0未竞价，1已竞价）
		int row = 0;
		int page = 0;
		if (!"".equals(rows) && rows != null) {
			row = Integer.parseInt(rows);
		}
		if (!"".equals(length) && length != null) {
			page = Integer.parseInt(length);
		}
		List<CreateAgreement> agreements = cai.appVehbidPushMessage(driverId,
				row, page, is_vehbid);
		returnjson.put("successMsg", agreements);
		System.out.println(returnjson.toString());
		return returnjson.toString();
	}

	/**
	 * 车辆竞价
	 * 
	 * @param json
	 * @return
	 */
	@RequestMapping(params = "method=appVehbidAgreementDriver")
	public @ResponseBody
	String appVehbidAgreementDriver(String json) {
		JSONObject getjson = JSONObject.fromObject(json);
		JSONObject returnjson = new JSONObject();
		String driverId = getjson.getString("driverId");
		String agreement_id = getjson.getString("agreement_id");
		String vehiclebidding_id = getjson.getString("vehiclebidding_id");
		String vehiclebidding_message = getjson
				.getString("vehiclebidding_message");
		String vehiclebidding_price = getjson.getString("vehiclebidding_price");
		String is_receipt_free = getjson.getString("is_receipt_free");
		int i = cai.appVehbidAgreementDriver(driverId, agreement_id,
				vehiclebidding_message, vehiclebidding_price,
				vehiclebidding_id, is_receipt_free);
		if (i > 0) {
			returnjson.put("successMsg", "竞价成功");
		} else {
			returnjson.put("errorMsg", "竞价失败");
		}
		return returnjson.toString();
	}

	// 修改价格
	@RequestMapping(params = "method=appEidtPrice")
	public @ResponseBody
	String appEidtPrice(String json) {
		JSONObject getjson = JSONObject.fromObject(json);
		JSONObject returnjson = new JSONObject();
		/*
		 * String driverId = getjson.getString("driverId"); String agreement_id
		 * = getjson.getString("agreement_id");
		 */
		String vehiclebidding_id = getjson.getString("vehiclebidding_id");
		String price = getjson.getString("price");
		String is_edit = getjson.getString("is_edit");
		int i = vbs.appEidtPrice(vehiclebidding_id, price, is_edit);
		if (i > 0) {
			if (is_edit.equals("0")) {
				returnjson.put("successMsg", "您已拒绝修改价格");
			} else {
				returnjson.put("successMsg", "价格修改成功");
			}
		} else {
			returnjson.put("errorMsg", "价格修改失败");
		}
		return returnjson.toString();
	}

	// 客户获取评价的司机信息
	@RequestMapping(params = "method=appGetEvaluateInfo")
	public @ResponseBody
	String appGetEvaluateInfo(String json) {
		JSONObject getjson = JSONObject.fromObject(json);
		JSONObject returnjson = new JSONObject();
		String state = getjson.getString("state");// 0发货客户；1收货客户
		String costomerId = getjson.getString("costomer_id");
		String phone = getjson.getString("phone");
		List<CreateAgreement> createAgreements = cai.appGetEvaluateInfo(
				costomerId, phone, state);
		returnjson.put("successMsg", createAgreements);
		return returnjson.toString();
	}

	// 客户获取评价的司机信息
	@RequestMapping(params = "method=appEvaluateDriver")
	public @ResponseBody
	String appEvaluateDriver(String json) {
		Gson gson = new Gson();// 定义json
		JSONObject getjson = JSONObject.fromObject(json);
		JSONObject returnjson = new JSONObject();
		String state = getjson.getString("state");
		// String objson=getjson.getString("objson");
		String shiping_order_id = getjson.getString("shiping_order_id");// 订单id
		String customer_grade = getjson.getString("customer_grade");// 分数
		String customer_user = getjson.getString("customer_user");// 评价人
		String customer_bouns = getjson.getString("customer_bouns");// 评价内容
		Evaluate evaluate = new Evaluate();
		evaluate.setRatingid(UUIDUtils.getUUID());
		evaluate.setShiping_order_id(shiping_order_id);
		evaluate.setCustomer_grade(customer_grade);
		evaluate.setCustomer_bouns(customer_bouns);
		evaluate.setCustomer_user(customer_user);
		int i = 0;
		if (state.equals("0")) {// 发货客户
			i = cai.appCustomerEvaluateDriver(evaluate.getRatingid(),
					evaluate.getShiping_order_id(),
					evaluate.getCustomer_grade(), evaluate.getCustomer_bouns(),
					evaluate.getCustomer_user());

		} else if (state.equals("1")) {// 收货客户
			i = cai.appReceivingEvaluateDriver(evaluate.getRatingid(),
					evaluate.getShiping_order_id(),
					evaluate.getCustomer_grade(), evaluate.getCustomer_bouns(),
					evaluate.getCustomer_user());
		}
		if (i > 0) {
			returnjson.put("successMsg", "评价成功");
		} else {
			returnjson.put("errorMsg", "评价失败");
		}

		return returnjson.toString();
	}

}
