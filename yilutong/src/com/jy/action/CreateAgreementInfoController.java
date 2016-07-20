package com.jy.action;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.ibatis.annotations.Param;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.jy.common.ExportUtils;
import com.jy.common.OrderedProperties;
import com.jy.common.SessionInfo;
import com.jy.common.UUIDUtils;
import com.jy.dao.Json;
import com.jy.model.AgreementCarMessage;
import com.jy.model.Company;
import com.jy.model.CreateAgreement;
import com.jy.model.Driver;
import com.jy.model.GuanlianCA;
import com.jy.model.JySplitShiping;
import com.jy.model.OrderHistory;
import com.jy.model.ShippingOrder;
import com.jy.model.User;
import com.jy.model.VehiclevBidding;
import com.jy.model.jiLuLiShi;
import com.jy.service.CompanyInfoService;
import com.jy.service.CreateAgreementInfoService;

import com.jy.service.ShippingOrderInfoService;
import com.jy.thread.CAInfoPushMessage;

/*
 * 承运协议
 * */
@Controller
@RequestMapping(value = "/createA.do")
public class CreateAgreementInfoController {
	@Resource
	private CreateAgreementInfoService csi;
	@Resource
	private ShippingOrderInfoService soi;
	@Resource
	private CompanyInfoService cif;

	// 承运协议查询页面
	@RequestMapping(params = "method=getCreateAgreeInfo")
	public String getCreateAgreementInfoMan() {
		return "create_agreement/createAgreemenInfo";
	}

	// 跳转到制作协议详细页面
	@RequestMapping(params = "method=getEditCreateAgreePage")
	public String getEditCreateAgreementPage(String[] pid,
			HttpServletRequest request) {
		request.setAttribute("flg", pid);
		return "create_agreement/EditCreateAgreement";
	}

	// 制作承运协议跳转页面
	@RequestMapping(params = "method=getCreateAgreePage")
	public String getCreateAgreementPage() {
		return "create_agreement/searchCreateAgreement";
	}

	// 制作承运协议查询信息
	@RequestMapping(params = "method=getShipOrderCA")
	public @ResponseBody
	Map getShipOrderCA(String rows, String page, String id, String startDate,
			String end_date, String ddId, String order_state, String pay_type,
			String perpole, String end_address, String send_address,
			String phone_number, String send_type) {
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		List<ShippingOrder> list = csi.getShipOrderInfoCA((page1 - 1) * rows1,
				rows1, id, startDate, end_date, ddId, order_state, pay_type,
				perpole, end_address, send_address, phone_number, send_type);

		int count = csi.getShipOrderCA(id, startDate, end_date, ddId,
				order_state, pay_type, perpole, end_address, send_address,
				phone_number, send_type);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}

	// 跳转到详细页面
	@RequestMapping(params = "method=xiangxiEditCreateA")
	public String XxCreateAgreement(String pid, HttpServletRequest request) {
		request.setAttribute("pid", pid);
		return "create_agreement/xiangxiECAgreement";
	}

	/**
	 * 删除单个文件
	 * 
	 * @param sPath
	 *            被删除文件的文件名
	 * @return 单个文件删除成功返回true，否则返回false
	 */
	public boolean deleteFile(String sPath) {
		boolean flag;
		flag = false;
		File file = new File(sPath);
		// 路径为文件且不为空则进行删除
		if (file.isFile() && file.exists()) {
			file.delete();
			flag = true;
		}
		return flag;
	}

	@SuppressWarnings("rawtypes")
	@RequestMapping(params = "method=getCreateAgreement")
	public @ResponseBody
	Map getCreateAgreementInfo(String rows, String page, String id,
			String start_date, String end_date, String car_name,
			String car_number1, String agreement_type, String end_address,
			String start_address, String company_id, String phone_number,
			String order_state, String departid) {
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		List<CreateAgreement> list = csi.getCreateAgreementInfo((page1 - 1)
				* rows1, rows1, id, start_date, end_date, car_name,
				car_number1, agreement_type, end_address, company_id,
				phone_number, order_state, departid, start_address);
		/*
		 * for (int i = 0; i < list.size(); i++) { if (list.get(i).getIsagain()
		 * == 1) { list.get(i).setOrder_state(4); } }
		 */
		int count = csi.getCreateAgreement(id, start_date, end_date, car_name,
				car_number1, agreement_type, end_address, company_id,
				phone_number, order_state, departid, start_address);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}

	/*
	 * 批量删除
	 */
	@RequestMapping(params = "method=deleCreateA")
	public @ResponseBody
	Json delCreateAgreement(String[] del, String[] dela) {
		Json json = new Json();
		String message = "所在协议已作废";
		if (dela.length > 0) {
			int truck = csi.deleteCreateAgreement(dela);
			if (truck > 0) {
				List<GuanlianCA> list = csi.orderNumber(dela);
				String[] pid = new String[list.size()];
				int i = 0;
				for (GuanlianCA ca : list) {
					pid[i++] = ca.getOrder_id();
				}
				List<ShippingOrder> ships = soi.getShipOrderCAM((1 - 1)
						* pid.length, pid.length, pid.length == 0 ? null : pid);
				for (ShippingOrder sh : ships) {
					saveHistory(sh.getShiping_order_id(),
							sh.getShiping_order_num(), message);
				}
				json.setFlag(true);
			} else {
				json.setFlag(false);
			}
		}
		if (del.length > 0) {
			List<GuanlianCA> list = csi.orderNumber(del);
			int number = csi.deleToOder(del);
			int order = csi.deleState(list);
			int truck = csi.deleteCreateAgreement(del);
			if (truck > 0 && number > 0 && order > 0) {
				String[] pid = new String[list.size()];
				int i = 0;
				for (GuanlianCA ca : list) {
					pid[i++] = ca.getOrder_id();
				}
				List<ShippingOrder> ships = soi.getShipOrderCAM((1 - 1)
						* pid.length, pid.length, pid.length == 0 ? null : pid);
				for (ShippingOrder sh : ships) {
					saveHistory(sh.getShiping_order_id(),
							sh.getShiping_order_num(), message);
				}
				json.setFlag(true);
			} else {
				json.setFlag(false);

			}
		}
		/*
		 * List<GuanlianCA> list=csi.orderNumber(del); int
		 * number=csi.deleToOder(del); int order=csi.deleState(list);
		 * 
		 * int truck = csi.deleteCreateAgreement(del); if (truck >
		 * 0&&number>0&&order>0) { json.setFlag(true); return json; }
		 * json.setFlag(false);
		 */
		return json;
	}

	/**
	 * 承运协议选择司机信息
	 * 
	 * @param page
	 * @param rows
	 * @param plateNumber
	 * @return
	 */
	@RequestMapping(params = "method=getTravel")
	public @ResponseBody
	Map<String, Object> getTravel(String page, String rows, String plateNumber,
			String did, String carLength, String length_name) {
		// 当前第几页
		Integer page1 = 1;
		// 当前页一共几条
		Integer rows1 = 0;
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if ("".equals(did)) {
			did = null;
		}
		List<AgreementCarMessage> tr = csi.getTravel((page1 - 1) * rows1,
				rows1, plateNumber, did, carLength, length_name);
		int count = csi.getCount(plateNumber, did, carLength, length_name);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", tr);
		return map;

	}

	// 保存
	@RequestMapping(params = "method=saveCreateAgreement")
	public @ResponseBody
	Json saveCreateAgreement(CreateAgreement d, String[] pid, String data) {

		List<GuanlianCA> guanlianCAs = new ArrayList<GuanlianCA>();
		Json json = new Json();
		d.setAgreement_id(UUIDUtils.getUUID());
		if ("".equals(d.getAll_money())) {
			d.setAll_money("0.00");
		}
		Gson gson = new Gson();
		List<ShippingOrder> list = gson.fromJson(data,
				new TypeToken<List<ShippingOrder>>() {
				}.getType());
		for (ShippingOrder shippingOrder : list) {
			GuanlianCA ca = new GuanlianCA();
			ca.setOrder_id(shippingOrder.getShiping_order_id());
			ca.setAgreement_id(d.getAgreement_id());
			ca.setId(UUIDUtils.getUUID());
			ca.setShipping_order_num(shippingOrder.getShiping_order_num());
			guanlianCAs.add(ca);
		}
		SimpleDateFormat dateFormat = new SimpleDateFormat(
				"yyyy/MM/dd HH:mm:ss");
		String number = dateFormat.format(new Date());
		d.setAgreement_number(number.substring(0, 4) + number.substring(5, 7)
				+ number.substring(8, 10) + number.substring(11, 13)
				+ number.substring(14, 16) + number.substring(17, 19));
		d.setCreate_time(number);
		d.setNumber(pid.length);
		int truck = csi.saveCreateAgreement(d);// 保存协议信息
		int create = csi.saveAgreementToorder(guanlianCAs);// 保存协议订单关联信息
		int state = 0;
		String message = null;
		if (d.getAgreement_type() == 0) {
			/*
			 * message = "正在发往\t" + depnService.getDepartment(d.getLdp_id())
			 * .getDepartment_name() + "\t" + d.getCar_number1() +
			 * d.getCar_name() + "\t联系电话:" + d.getPhone_number();
			 * 
			 * state = csi.updateState(pid, 2);
			 */
		} else if (d.getAgreement_type() == 1) {
			message = "正在配送\t司机:" + d.getCar_number1() + d.getCar_name()
					+ "\t联系电话为:" + d.getPhone_number();
			state = csi.updateState(pid, 1);
		} else if (d.getAgreement_type() == 2) {
			message = "转运中\t"
					+ cif.getUpdateCompany(d.getCompany_id()).getCompany_name()
					+ "\t司机:" + d.getCar_number1() + "\t" + d.getCar_name()
					+ "\t联系电话:" + d.getPhone_number();
			state = csi.updateState(pid, 2);
		}
		List<ShippingOrder> ships = soi.getShipOrderCAM((1 - 1) * pid.length,
				pid.length, pid.length == 0 ? null : pid);

		for (ShippingOrder sh : ships) {
			saveHistory(sh.getShiping_order_id(), sh.getShiping_order_num(),// 保存历史记录
					message);
		}

		if (truck > 0 && create > 0 && state > 0) {
			// 承运协议推送APP

			json.setFlag(true);
			return json;
		} else {
			json.setFlag(false);
			return json;
		}

	}

	public void saveHistory(String ids, String num, String message) {
		List<OrderHistory> order = new ArrayList<OrderHistory>();
		OrderHistory h = new OrderHistory();
		h.setOrder_history_id(UUIDUtils.getUUID());
		h.setOrders_id(ids);
		h.setOrder_arrive_time(DateFormat.getDateTimeInstance().format(
				new Date()));
		h.setGoods_arrive_remakes(h.getOrder_arrive_time() + "---订单号为" + num
				+ "\t" + message);
		order.add(h);
		soi.saveOrderHistory(order);
	}

	// 修改查询
	@RequestMapping(params = "method=getUpdateCreateAgreement")
	public @ResponseBody
	CreateAgreement getUpdateCreateAgreement(String id) {
		CreateAgreement der = csi.getUpdateCreateAgreement(id);
		return der;
	}

	// 修改查询
	@RequestMapping(params = "method=getXXCreateAgreement")
	public @ResponseBody
	List<GuanlianCA> getXXCreateAgreement(String id) {
		List<GuanlianCA> der = csi.getXXCreateAgreement(id);
		return der;
	}

	// 导入页面
	@RequestMapping(params = "method=inputCreateAgreement")
	public String inputCreateAgreement() {
		return "driver/InputDriver";
	}

	// 修改承运协议
	@RequestMapping(params = "method=updateCreateAgreement")
	public @ResponseBody
	Json updateCreateAgreement(CreateAgreement d, String[] pid,
			HttpServletRequest request) {
		d.setCreate_time(DateFormat.getDateTimeInstance().format(new Date()));
		User user = (User) request.getSession().getAttribute(
				SessionInfo.SessionName);
		Json json = new Json();
		if ("".equals(d.getAll_money())) {
			d.setAll_money("0.00");
		}

		String message = null;
		CreateAgreement createAgreement = getUpdateCreateAgreement(d
				.getAgreement_id());

		StringBuffer s = new StringBuffer();
		boolean flag = true;
		s.append("所在协议号为：" + createAgreement.getAgreement_number());
		if (ShippingOrderInfoController.checkdatas(d.getAgreement_types(),
				createAgreement.getAgreement_types())) {
			flag = false;
			String str = "";
			if ("1".equals(d.getAgreement_types())) {
				str = "配送";
			} else if ("2".equals(d.getAgreement_types())) {
				str = "转运";
			}
			s.append("协议类型修改为:" + str);
		}
		/*
		 * if (ShippingOrderInfoController.checkdatas(d.getCompany_name(),
		 * createAgreement.getCompany_name())) { flag = false;
		 * s.append("中转公司修改为:" + d.getCompany_name()); } if
		 * (ShippingOrderInfoController.checkdatas(d.getCompany_tel(),
		 * createAgreement.getCompany_tel())) { flag = false;
		 * s.append("中转公司联系方式修改为：" + d.getCompany_tel()); } if
		 * (ShippingOrderInfoController.checkdatas( d.getCompany_number(),
		 * createAgreement.getCompany_number())) { flag = false;
		 * s.append("中转转运单号修改为" + d.getCompany_number()); } if
		 * (ShippingOrderInfoController.checkdatas(d.getSend_station(),
		 * createAgreement.getSend_station())) { flag = false; s.append("发站修改为:"
		 * + d.getSend_station()); } else if
		 * (ShippingOrderInfoController.checkdatas(d.getEnd_address(),
		 * createAgreement.getEnd_address())) { flag = false; s.append("到站修改为："
		 * + d.getEnd_address()); }
		 */
		if (ShippingOrderInfoController.checkfree(d.getAll_money(),
				createAgreement.getAll_money())) {
			flag = false;
			s.append("协议配送费修改为：" + d.getAll_money());
		}
		/*
		 * if (ShippingOrderInfoController.checkdatas(d.getCar_name(),
		 * createAgreement.getCar_name())) { flag = false; s.append("司机修改为：" +
		 * d.getCar_name()); } else if
		 * (ShippingOrderInfoController.checkdatas(d.getPhone_number(),
		 * createAgreement.getPhone_number())) { flag = false;
		 * s.append("司机联系方式修改为：" + d.getPhone_number()); } if
		 * (ShippingOrderInfoController.checkdatas(d.getCar_number1(),
		 * createAgreement.getCar_number1())) { flag = false; s.append("车牌号修改为："
		 * + d.getCar_number1()); } if
		 * (!d.getNumber().equals(createAgreement.getNumber())) { flag = false;
		 * s.append("协议中数量修改为：" + d.getNumber()); } if
		 * (ShippingOrderInfoController.checkfree(
		 * d.getAll_transportation_fee(),
		 * createAgreement.getAll_transportation_fee())) { flag = false;
		 * s.append("运单总运费修改为：" + d.getAll_transportation_fee()); } if
		 * (ShippingOrderInfoController.checkfree( d.getAll_trade_agency(),
		 * createAgreement.getAll_trade_agency())) { flag = false;
		 * s.append("运单总代收款修改为：" + d.getAll_trade_agency()); } if
		 * (ShippingOrderInfoController.checkfree( d.getAll_destination_fee(),
		 * createAgreement.getAll_destination_fee())) { flag = false;
		 * s.append("运单总代收运费修改为：" + d.getAll_destination_fee()); } if
		 * (ShippingOrderInfoController.checkfree( d.getAll_handling_charge(),
		 * createAgreement.getAll_handling_charge())) { flag = false;
		 * s.append("运单总手续费修改为：" + d.getAll_handling_charge()); } if
		 * (ShippingOrderInfoController.checkfree( d.getAll_change_handling(),
		 * createAgreement.getAll_change_handling())) { flag = false;
		 * s.append("中转总手续费修改为：" + d.getAll_change_handling()); } if
		 * (ShippingOrderInfoController.checkfree(d.getGoods_weight(),
		 * createAgreement.getGoods_weight())) { flag = false;
		 * s.append("总重量修改为：" + d.getAll_change_handling()); } if
		 * (ShippingOrderInfoController.checkfree(d.getGoods_vol(),
		 * createAgreement.getGoods_vol())) { flag = false; s.append("总体积修改为：" +
		 * d.getGoods_vol()); } if
		 * (ShippingOrderInfoController.checkfree(d.getGoods_num(),
		 * createAgreement.getGoods_num())) { flag = false; s.append("总件数修改为：" +
		 * d.getGoods_num()); }
		 */
	
		int state = 0;
		int i = csi.updateCreateAgreement(d);
		if (pid.length > 0) {
			List<ShippingOrder> ships = soi.getShipOrderCAM((1 - 1)
					* pid.length, pid.length, pid.length == 0 ? null : pid);

			if (d.getAgreement_type() == 0) {
				/*
				 * message = "正在发往\t" + depnService.getDepartment(d.getLdp_id())
				 * .getDepartment_name() + "\t" + d.getCar_number1() +
				 * d.getCar_name() + "\t联系电话:" + d.getPhone_number();
				 * 
				 * state = csi.updateState(pid, 2);
				 */
			} else if (d.getAgreement_type() == 1) {
				message = "协议已修改,正在配送\t司机:" + d.getCar_number1()
						+ d.getCar_name() + "\t联系电话为:" + d.getPhone_number();
				state = csi.updateState(pid, 1);
			} else if (d.getAgreement_type() == 2) {
				message = "协议已修改，转运中\t"
						+ cif.getUpdateCompany(d.getCompany_id())
								.getCompany_name() + "\t司机:"
						+ d.getCar_number1() + "\t" + d.getCar_name()
						+ "\t联系电话:" + d.getPhone_number();
				state = csi.updateState(pid, 2);
			}
			for (ShippingOrder sh : ships) {
				jiLuLiShi js = new jiLuLiShi();
				js.setJilu_id(UUIDUtils.getUUID());
				js.setXiugainame(user.getUsername());
				js.setShiping_order_id(sh.getShiping_order_id());
				if (flag == true) {
				} else {
					js.setJilu_lishi("订单号为：" + sh.getShiping_order_num() + ","
							+ s);
					soi.InsertShippjilu(js);
				}
				saveHistory(sh.getShiping_order_id(),
						sh.getShiping_order_num(),// 保存历史记录
						message);
			}
		}
		if (i > 0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}

	/*
	 * 重复查询
	 */
	@RequestMapping(params = "method=getNumber")
	public @ResponseBody
	CreateAgreement getCreateAgreementLength(String number) {
		CreateAgreement der = csi.getNumber(number);
		return der;
	}

	// 车牌检索
	@RequestMapping(params = "method=getPlateNumberLength")
	public @ResponseBody
	String getPlateNumberLength(String number) {
		List<CreateAgreement> list = csi.getPlateNumberLength(number);
		JSONObject jb = null;
		JSONArray jsons = new JSONArray();
		for (CreateAgreement d : list) {
			jb = new JSONObject();
			jb.put("id", d.getCar_id());
			jb.put("name", d.getCar_number1());
			jsons.add(jb);
		}
		return jsons.toString();
	}

	// 查询中转 getCompany
	@RequestMapping(params = "method=getCompany")
	public @ResponseBody
	String getCompany(String name) {
		List<Company> list = csi.getCompany(name);
		JSONObject jb = null;
		JSONArray jsons = new JSONArray();
		for (Company c : list) {
			jb = new JSONObject();
			jb.put("id", c.getCompany_id());
			jb.put("name", c.getCompany_name());
			jb.put("ren", c.getEnd_people());
			jb.put("phones", c.getEnd_phone());
			jsons.add(jb);
		}
		return jsons.toString();
	}

	/**
	 * 导出信息
	 * 
	 * @param agreementIds
	 * @param start_date
	 * @param end_date
	 * @param car_name
	 * @param car_number1
	 * @param agreement_type
	 * @param end_address
	 * @param company_id
	 * @param phone_number
	 * @param order_state
	 * @param departid
	 * @param response
	 * @return
	 * @throws FileNotFoundException
	 */
	@RequestMapping(params = "method=outAgreement")
	public @ResponseBody
	String outAgreement(String[] agreementIds, String start_date,
			String end_date, String car_name, String car_number1,
			String agreement_type, String end_address, String company_id,
			String phone_number, String order_state, String departid,
			HttpServletResponse response) throws FileNotFoundException {
		String filename = "协议信息导出";
		OrderedProperties prop = new OrderedProperties();
		InputStream in = CreateAgreementInfoController.class
				.getResourceAsStream("/../agreementData.properties");
		// InputStream in = new BufferedInputStream (new
		// FileInputStream("../webapps\\surmax\\agreementData.properties"));
		List<String> headtitle = new ArrayList<String>();
		List<String> fieldName = new ArrayList<String>();
		try {
			prop.load(in);
			Iterator<String> it = prop.stringPropertyNames().iterator();
			while (it.hasNext()) {
				String key = it.next();
				headtitle.add(key);
				fieldName.add(prop.getProperty(key));
			}
			in.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} // /加载属性列表
		List<CreateAgreement> list = csi.getCreateAgreementAll(agreementIds,
				start_date, end_date, car_name, car_number1, agreement_type,
				end_address, company_id, phone_number, order_state, departid);
		/*
		 * for (CreateAgreement ship : list) { if
		 * ("0".equals(ship.getAgreement_type())) { ship.setChange_pay("");
		 * ship.setSend_fee(""); ship.setChange_remarks("");
		 * ship.setSend_remarks(""); ship.setChange_other("");
		 * ship.setPractiacl_num("0"); } else if
		 * ("1".equals(ship.getAgreement_type())) { ship.setChange_pay("");
		 * ship.setChange_remarks(""); ship.setChange_other(""); } else if
		 * ("2".equals(ship.getAgreement_type())) { ship.setSend_fee("");
		 * ship.setSend_remarks(""); ship.setPractiacl_num("0"); } }
		 */
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
			ExportUtils.outputHeaders(
					(String[]) headtitle.toArray(new String[headtitle.size()]),
					workbook, "协议信息导出");
			// 调用工具类生成内容
			ExportUtils.outputColums(
					(String[]) fieldName.toArray(new String[fieldName.size()]),
					list, workbook, 1, "协议信息导出");
			workbook.write(ouputStream);
			ouputStream.flush();
			ouputStream.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping(params = "method=selectAgreement")
	public String selectCompany() {
		return "create_agreement/selectCompany";
	}

	@RequestMapping(params = "method=selectCar")
	public String selectCar() {
		return "create_agreement/selectCar";
	}

	/*
	 * 制作协议修改运单价格
	 */

	@RequestMapping(params = "method=updataMoney")
	public @ResponseBody
	String updataMoney(String id, String practiacl_num, String send_fee,
			String send_remarks, String change_pay, String change_remarks,
			String chanage_pay_type, String change_other, String upstairs_fee,
			String change_back_fee, String change_back_type,
			String change_handling, String paidtc_fu, String change_feilv,
			HttpServletRequest request) throws UnsupportedEncodingException {
		User user = (User) request.getSession().getAttribute(
				SessionInfo.SessionName);
		if (send_remarks != null) {
			send_remarks = new String(send_remarks.getBytes("ISO-8859-1"),
					"utf-8");
		}
		if (change_remarks != null) {
			change_remarks = new String(change_remarks.getBytes("ISO-8859-1"),
					"utf-8");
		}
		ShippingOrder shippingOrder = csi.getUpdateShipping(id);
		StringBuffer s = new StringBuffer();
		boolean flag = true;

		s.append("订单号为：" + shippingOrder.getShiping_order_num() + ",");
		if (ShippingOrderInfoController.checkfree(change_pay,
				shippingOrder.getChange_pay())) {
			flag = false;
			s.append("应付中转费修改为" + change_pay + ",");
		}
		if (ShippingOrderInfoController.checkdatas(change_remarks,
				shippingOrder.getChange_remarks())) {
			flag = false;
			s.append("中转费备注修改为" + change_remarks + ",");
		}
		if (ShippingOrderInfoController.checkdatas(chanage_pay_type,
				shippingOrder.getChanage_pay_type())) {
			flag = false;
			String str = "";
			if ("0".equals(chanage_pay_type)) {
				str = "回付";
			} else if ("1".equals(chanage_pay_type)) {
				str = "到付";
			} else if ("2".equals(chanage_pay_type)) {
				str = "现付";
			}
			s.append("中转费付款方式修改为" + str + ",");
		}
		if (ShippingOrderInfoController.checkfree(change_other,
				shippingOrder.getChange_other())) {
			flag = false;
			s.append("中转其他费用修改为" + change_other + ",");
		}
		if (ShippingOrderInfoController.checkfree(change_feilv,
				shippingOrder.getChange_feilv())) {
			flag = false;
			s.append("中转手续费率修改为" + change_feilv + ",");
		}
		if (ShippingOrderInfoController.checkfree(change_handling,
				shippingOrder.getChange_handling())) {
			flag = false;
			s.append("中转手续费修改为" + change_handling + ",");
		}
		csi.updataMoney(id, practiacl_num, send_fee, send_remarks, change_pay,
				change_remarks, chanage_pay_type, change_other, upstairs_fee,
				change_back_fee, change_back_type, change_handling, paidtc_fu,
				change_feilv);
		jiLuLiShi js = new jiLuLiShi();
		js.setJilu_id(UUIDUtils.getUUID());
		js.setXiugainame(user.getUsername());
		js.setShiping_order_id(id);
		if (flag == true) {
		} else {
			js.setJilu_lishi(s.toString());
			soi.InsertShippjilu(js);
		}
		return null;
	}

	/**
	 * 修改总金额
	 * */
	@RequestMapping(params = "method=updataZong")
	public @ResponseBody
	Json updataZong(String cid, String money) {
		Json json = new Json();
		int i = csi.updataZong(cid, money, null);
		if (i > 0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}

	/**
	 * 移除协议中的订单
	 * */
	@RequestMapping(params = "method=removeShip")
	public @ResponseBody
	Json removeShip(String cid, String[] pid) {
		Json json = new Json();
		// 删除中间表
		int i = csi.removeShip(cid, pid);
		csi.updataZong(cid, null, pid.length);

		// 重制未签收的订单
		List<GuanlianCA> list = new ArrayList<GuanlianCA>();
		for (int j = 0; j < pid.length; j++) {
			GuanlianCA lian = new GuanlianCA();
			lian.setOrder_id(pid[j]);
			list.add(lian);
		}
		csi.deleState(list);

		// 添加移除信息
		String message = "已从协议中移除";
		List<ShippingOrder> ships = soi.getShipOrderCAM((1 - 1) * pid.length,
				pid.length, pid.length == 0 ? null : pid);
		for (ShippingOrder sh : ships) {
			saveHistory(sh.getShiping_order_id(), sh.getShiping_order_num(),
					message);
		}
		if (i > 0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}

	// 修改承运协议
	@RequestMapping(params = "method=modifyselectCompany")
	public String modifyselectCompany() {
		return "create_agreement/modifyselectCompany";
	}

	@RequestMapping(params = "method=modifyselectCar")
	public String modifyselectCar() {
		return "create_agreement/modifyselectCar";
	}

	/**
	 * 跳转详细页面
	 * */
	@RequestMapping(params = "method=getShippingCollect")
	public String getShippingCollect(String pid, HttpServletRequest request) {
		System.out.println("id号码：" + pid);
		request.setAttribute("flg", pid);
		return "payableCheckd/ShippingChecked";
	}

	// 跳转到拆分订单信息页面
	@RequestMapping(params = "method=getSplitShipperPage")
	public String getSplitShipperPage(String[] pid, HttpServletRequest request) {
		request.setAttribute("flg", pid);
		return "create_agreement/splitShipperPage";
	}

	// 获取要拆分的订单信息
	@RequestMapping(params = "method=getSplitShipOrderMessage")
	public @ResponseBody
	List<ShippingOrder> getSplitShipOrderMessage(String[] pid) {

		return csi.getSplitShipOrderMessage(pid);
	}

	// 拆分订单修改要拆分的订单信息
	@RequestMapping(params = "method=getSplitUpdateShipOrderMessage")
	public String getSplitUpdateShipOrderMessage(String rows,
			HttpServletRequest request) {
		/*
		 * Gson gson = new Gson(); List<ShippingOrder> list =
		 * gson.fromJson(rows, new TypeToken<List<ShippingOrder>>()
		 * {}.getType());
		 */
		request.setAttribute("rows", rows);
		return "create_agreement/splitEditShipOrder";
	}

	// 拆分订单修改要拆分的订单信息
	@RequestMapping(params = "method=saveSplitShipOrderMessage")
	public @ResponseBody
	boolean saveSplitShipOrderMessage(String newRows, String oldShippId) {
		Gson gson = new Gson();
		List<JySplitShiping> jssList = new ArrayList<JySplitShiping>();
		List<ShippingOrder> list = gson.fromJson(newRows,
				new TypeToken<List<ShippingOrder>>() {
				}.getType());
		for (ShippingOrder shippingOrder : list) {
			shippingOrder.setShiping_order_id(UUIDUtils.getUUID());
			JySplitShiping jySplitShiping = new JySplitShiping();
			jySplitShiping.setId(UUIDUtils.getUUID());
			jySplitShiping.setShiping_id(oldShippId);
			jySplitShiping.setSplit_id(shippingOrder.getShiping_order_id());
			jssList.add(jySplitShiping);
		}
		int i = 0;
		int b = csi.getSplitOldShipOrder(oldShippId);
		if (b > 0) {
			i = 1;
		} else {
			i = csi.saveSplitOldShipOrder(oldShippId);
		}
		if (i > 0) {
			int j = csi.saveSplitNewShipOrder(list);
			int ii = csi.saveSplitShipOrderMessage(jssList);
			if (j > 0 && ii > 0) {
				csi.deleteSplitShipOrder(oldShippId);
				return true;
			}
		}
		return false;
	}

	/**
	 * 推送消息
	 * 
	 * @param agreement_id
	 * @return
	 */
	@RequestMapping(params = "method=pushCAMessage")
	public @ResponseBody
	String pushCAMessage(String[] agreement_id) {
		// 获取5公里的司机id 将来修改
		List<Driver> drivers = csi.getPushDriverId();
		List<VehiclevBidding> vehbidPushs = new ArrayList<VehiclevBidding>();// 定义协议推送
		if (drivers != null && drivers.size() != 0) {
			for (int i = 0; i < agreement_id.length; i++) {
				for (Driver driver2 : drivers) {
					int b = csi.getVehbidInfo(driver2.getDriverId(),
							agreement_id[i]);// 查看推送消息是不是在推送表中
					if (b == 0) {
						VehiclevBidding vPush = new VehiclevBidding();
						vPush.setVehiclebidding_id(UUIDUtils.getUUID());
						vPush.setAgreement_id(agreement_id[i]);
						vPush.setDriver_id(driver2.getDriverId());
						vPush.setIs_vehbid("0");
						vehbidPushs.add(vPush);

					}
				}
			}
			if (vehbidPushs.size() > 0) {
				csi.insertVehbidPush(vehbidPushs);
			}
			String str = csi.getDriverChannelId(drivers);
			int driverCount = 0;// 司机个数
			int caCount = agreement_id.length;// 协议个数
			if (!str.equals("")) {
				String[] channelId = str.split(",");
				driverCount = channelId.length;
				String message = "您有车辆竞价消息,请点击查看";
				String title = "车辆竞价消息";
				JSONObject jsonCustormCont = new JSONObject();
				JSONObject json = new JSONObject();
				json.put("type", "0");
				jsonCustormCont.put("successMsg", json);
				new Thread(new CAInfoPushMessage(message, channelId, title,
						"1", jsonCustormCont)).start();

			}
			String rtStr = driverCount + "#" + caCount;
			return rtStr;

		}
		return "0#0";
	}

	/**
	 * 打印承运协议
	 * 
	 * @param agreementId
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "method=printerCAMessage")
	public String printerCAMessage(String agreementId,
			HttpServletRequest request) {
		CreateAgreement createAgreement = csi.getPrinterAgreement(agreementId);
		request.setAttribute("createAgreement", createAgreement);
		return "create_agreement/printerAgreemen";

	}

	/**
	 * 承运信息导出
	 * 
	 * @param orderIds
	 * @param agreementId
	 * @param response
	 * @return
	 * @throws FileNotFoundException
	 */
	@RequestMapping(params = "method=outAgreementShipp")
	public @ResponseBody
	String outAgreementShipp(String[] orderIds, String agreementId,
			HttpServletResponse response) throws FileNotFoundException {
		String filename = "协议运单导出";
		OrderedProperties prop = new OrderedProperties();
		InputStream in = CreateAgreementInfoController.class
				.getResourceAsStream("/../agreementOrder.properties");
		// InputStream in = new BufferedInputStream (new
		// FileInputStream("../webapps\\surmax\\agreementData.properties"));
		List<String> headtitle = new ArrayList<String>();
		List<String> fieldName = new ArrayList<String>();
		try {
			prop.load(in);
			Iterator<String> it = prop.stringPropertyNames().iterator();
			while (it.hasNext()) {
				String key = it.next();
				headtitle.add(key);
				fieldName.add(prop.getProperty(key));
			}
			in.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} // /加载属性列表

		List<ShippingOrder> list = csi.getCreateAgreementOrder(orderIds,
				agreementId);
		if (list.size() > 0) {
			for (ShippingOrder spo : list) {
				if (spo.getPhone_state() != "" && spo.getPhone_state() != null) {
					if (spo.getPhone_state().equals("0")) {
						spo.setPhone_state("否");
					} else if (spo.getPhone_state().equals("1")) {
						spo.setPhone_state("是");
					}
				}
				if (spo.getSend_type() != null && spo.getSend_type() != "") {

					if (spo.getSend_type().equals("0")) {
						spo.setSend_type("专车送货");
					} else if (spo.getSend_type().equals("1")) {
						spo.setSend_type("客户自提");
					} else if (spo.getSend_type().equals("2")) {
						spo.setSend_type("送货进仓");
					} else if (spo.getSend_type().equals("3")) {
						spo.setSend_type("送货上楼");
					} else if (spo.getSend_type().equals("4")) {
						spo.setSend_type("送货上门");
					}
				}
				if (spo.getIs_order_arrive() != null
						&& spo.getIs_order_arrive() != "") {
					if (spo.getIs_order_arrive().equals("0")) {
						spo.setIs_order_arrive("未到达");
					} else if (spo.getIs_order_arrive().equals("1")) {
						spo.setIs_order_arrive("到达");
					}
				}
				if (spo.getPay_type() != null && spo.getPay_type() != "") {
					if (spo.getPay_type().equals("0")) {
						spo.setPay_type("回付 ");
					} else if (spo.getPay_type().equals("1")) {
						spo.setPay_type("提付");
					} else if (spo.getPay_type().equals("2")) {
						spo.setPay_type("现付");
					} else if (spo.getPay_type().equals("3")) {
						spo.setPay_type("货到前付");
					} else if (spo.getPay_type().equals("4")) {
						spo.setPay_type("发货方月结");
					} else if (spo.getPay_type().equals("5")) {
						spo.setPay_type("收货方月结");
					} else if (spo.getPay_type().equals("6")) {
						spo.setPay_type("货到付款");
					}
				}
				if (spo.getShipping_order_state() != null
						&& spo.getShipping_order_state() != "") {
					if (spo.getShipping_order_state().equals("0")) {
						spo.setShipping_order_state("未出库");
					} else if (spo.getShipping_order_state().equals("1")) {
						spo.setShipping_order_state("出库");
					} else if (spo.getShipping_order_state().equals("2")) {
						spo.setShipping_order_state("到达");
					} else if (spo.getShipping_order_state().equals("4")) {
						spo.setShipping_order_state("签收");
					}
				}
			}
		}
		/*
		 * List<CreateAgreement> list = csi.getCreateAgreementAll(agreementIds,
		 * start_date, end_date, car_name, car_number1, agreement_type,
		 * end_address, company_id, phone_number, order_state, departid);
		 */
		/*
		 * for (CreateAgreement ship : list) { if
		 * ("0".equals(ship.getAgreement_type())) { ship.setChange_pay("");
		 * ship.setSend_fee(""); ship.setChange_remarks("");
		 * ship.setSend_remarks(""); ship.setChange_other("");
		 * ship.setPractiacl_num("0"); } else if
		 * ("1".equals(ship.getAgreement_type())) { ship.setChange_pay("");
		 * ship.setChange_remarks(""); ship.setChange_other(""); } else if
		 * ("2".equals(ship.getAgreement_type())) { ship.setSend_fee("");
		 * ship.setSend_remarks(""); ship.setPractiacl_num("0"); } }
		 */
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
			ExportUtils.outputHeaders(
					(String[]) headtitle.toArray(new String[headtitle.size()]),
					workbook, "协议运单信息导出");
			// 调用工具类生成内容
			ExportUtils.outputColums(
					(String[]) fieldName.toArray(new String[fieldName.size()]),
					list, workbook, 1, "协议运单信息导出");
			workbook.write(ouputStream);
			ouputStream.flush();
			ouputStream.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
