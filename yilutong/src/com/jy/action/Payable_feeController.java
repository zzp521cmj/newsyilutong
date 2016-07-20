package com.jy.action;

import java.io.OutputStream;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.common.ExportUtils;
import com.jy.common.SessionInfo;
import com.jy.common.UUIDUtils;
import com.jy.dao.Json;
import com.jy.model.Confluence;
import com.jy.model.Mingxi;
import com.jy.model.OrderCustom;
import com.jy.model.Settlement;
import com.jy.model.ShippingOrder;
import com.jy.model.User;
import com.jy.service.CollectService;
import com.jy.service.Payable_feeService;
import com.jy.service.UserInfoService;

@Controller
@RequestMapping(value = "/payable.do")
public class Payable_feeController {
	private static final Date Date = null;
	@Resource
	private CollectService cs;
	@Resource
	private Payable_feeService pay;
	private UserInfoService us;
	User user = new User();

	// 应付中转费
	@RequestMapping(params = "method=get")
	public String getPayable_fee() {
		return "payable/payable";
	}
	@RequestMapping(params = "method=getPayableRedirect")
	public String getPayableRedirect(){
		return "payableCheckd/PayableChecked";
	}

	// 跳转编辑页面并且获取合同的id 返回到页面
	@RequestMapping(params = "method=getEditCompanyPage")
	public String getEdittCompanyPage(String[] pid, String pid2,
			HttpServletRequest request) {
		request.setAttribute("flg", pid);
		request.setAttribute("write_off", pid2);
		return "payable/Editpayable";
	}

	// 跳转编辑页面并且获取合同的id 返回到页面
	@RequestMapping(params = "method=getEditCompanyPagez")
	public String getEdittCompanyPagez(String pid, String pid2,
			HttpServletRequest request) {
		request.setAttribute("flg", pid);
		request.setAttribute("write_off2", pid2);
		return "payable/Editother";
	}

	// 跳转编辑页面并且获取合同的id 返回到页面
	@RequestMapping(params = "method=getEditCompanyPagef")
	public String getEdittCompanyPagef(String pid, String pid2,
			HttpServletRequest request) {
		request.setAttribute("flg", pid);
		request.setAttribute("write_off4", pid2);
		return "payable/Editloading";
	}

	// 跳转编辑页面并且获取合同的id 返回到页面
	@RequestMapping(params = "method=getEditCompanyPage1")
	public String getEdittCompanyPage1(String pid, HttpServletRequest request) {
		request.setAttribute("flg", pid);
		return "payable/EditDelivery";
	}

	/**
	 * 应付中转费核销导出Excel
	 * */
	@RequestMapping(params = "method=getPayableOutpa")
	public @ResponseBody
	List<ShippingOrder> getPayableOutpa(HttpServletResponse response,
			String[] headtitle, String[] fieldName) {
		String filename = "应付中转费核销";
		List<ShippingOrder> list = pay.getPayableOutpa();
		for (ShippingOrder sd : list) {
			if (sd.getSend_type() != null && sd.getSend_type() != ""
					&& sd.getSend_type().equals("0")) {
				sd.setSend_type("自提");
			} else if (sd.getSend_type() != null && sd.getSend_type() != ""
					&& sd.getSend_type().equals("1")) {
				sd.setSend_type("送货");
			}
			if (sd.getPay_type() != null && sd.getPay_type() != ""
					&& sd.getPay_type().equals("0")) {
				sd.setPay_type("回付");
			} else if (sd.getPay_type() != null && sd.getPay_type() != ""
					&& sd.getPay_type().equals("1")) {
				sd.setPay_type("提付");
			} else if (sd.getPay_type() != null && sd.getPay_type() != ""
					&& sd.getPay_type().equals("2")) {
				sd.setPay_type("现付");
			} else if (sd.getPay_type() != null && sd.getPay_type() != ""
					&& sd.getPay_type().equals("3")) {
				sd.setPay_type("货到前付");
			}
			if (sd.getWrite_off() != null && sd.getWrite_off() != ""
					&& sd.getWrite_off().equals("0")) {
				sd.setWrite_off("打卡");
			} else if (sd.getWrite_off() != null && sd.getWrite_off() != ""
					&& sd.getWrite_off().equals("1")) {
				sd.setWrite_off("现金");
			} else if (sd.getWrite_off() != null && sd.getWrite_off() != ""
					&& sd.getWrite_off().equals("3")) {
				sd.setWrite_off("未核销");
			}
		}
		try {
			// 声明一个工作簿
			HSSFWorkbook workbook = new HSSFWorkbook();
			// 生成一个表格
			response.setContentType("application/vnd.ms-excel;");
			response.setHeader("Content-Disposition", "attachment;filename=\""
					+ new String(filename.getBytes("gbk"), "iso-8859-1")
					+ ".xls\"");
			OutputStream ouputStream = response.getOutputStream();
			// 调用工具类创建表头
			ExportUtils.outputHeaders(headtitle, workbook, "应付中转费核销");
			// 调用工具类生成内容
			ExportUtils.outputColums(fieldName, list, workbook, 1, "应付中转费核销");
			workbook.write(ouputStream);
			ouputStream.flush();
			ouputStream.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// 全部查询
	@RequestMapping(params = "method=getPayable_fee")
	public @ResponseBody
	Map getPayable_fee(String rows, String page, String shiping_order_num,
			String receipt, String fee_date, String dd, String create_time,
			String yy, String write_off, String send_station,
			String goods_name, String goods_num, String pay_type, String paid,
			String company_name) {
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		List<ShippingOrder> list = pay.getPayable_fee((page1 - 1) * rows1,
				rows1, shiping_order_num, receipt, fee_date, dd, create_time,
				yy, write_off, send_station, goods_name, goods_num, pay_type,
				paid, company_name);
		int count = pay.getPayable_feeInfo(shiping_order_num, receipt,
				fee_date, dd, create_time, yy, write_off, send_station,
				goods_name, goods_num, pay_type, paid, company_name);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}

	// 修改
	@RequestMapping(params = "method=updateShippingOrder")
	public @ResponseBody
	Json updateShippingOrder(ShippingOrder d, HttpServletRequest request) {
		// 修改
		Json json = new Json();

		String change_fee1 = request.getParameter("change_fee1");
		d.setChange_fee1(change_fee1);
		int i = pay.updateShippingOrder(d);
		if (i > 0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}

	// 修改查询
	@RequestMapping(params = "method=getUpdateCompany")
	public @ResponseBody
	ShippingOrder getUpdateCompany(String id) {
		ShippingOrder der = pay.getUpdateShippingOrder(id);
		return der;
	}

	/**
	 * 
	 * 核销
	 * 
	 * @param id
	 * @return
	 */
	// 修改查询
	@RequestMapping(params = "method=getUpdateCompanys")
	public @ResponseBody
	ShippingOrder getUpdateCompans(String id) {
		ShippingOrder der = pay.getUpdateShippingOrders(id);
		return der;
	}

	@RequestMapping(params = "method=gety")
	public String getDelivery() {
		return "payable/delivery";
	}

	// 修改
	@RequestMapping(params = "method=updateShippingOrders")
	public @ResponseBody
	Json updateShippingOrders(ShippingOrder d, HttpServletRequest request) {
		Json json = new Json();
		String send_remarks = request.getParameter("send_remarks");
		d.setSend_remarks(send_remarks);
		String send_remarks1 = request.getParameter("send_remarks1");
		d.setSend_remarks1(send_remarks1);
		String paid1 = request.getParameter("paid1");
		d.setPaid1(paid1);
		String paid = request.getParameter("paid");
		d.setPaid(paid);
		String send_fee1 = request.getParameter("send_fee1");
		d.setChange_fee1(send_fee1);
		int i = pay.updateShippingOrders(d);
		return json;
	}

	// 修改查询
	@RequestMapping(params = "method=getUpdate")
	public @ResponseBody
	ShippingOrder getUpdate(String id) {
		ShippingOrder der = pay.getUpdate(id);
		return der;
	}

	// 修改
	@RequestMapping(params = "method=update")
	public @ResponseBody
	Json update1(ShippingOrder d,String [] pid, HttpServletRequest request) {
		Json json = new Json();
		boolean flag = false;
		json.setFlag(flag);
		try {
			String[] s = d.getShiping_order_id().split(",");
			List<ShippingOrder> list10 = pay.selectinfo(s);
			List<User> list20 = pay.selectfo(user);
			for (ShippingOrder op : list10) {
				if ("3".equals(op.getWrite_off1())) {

					for (int i = 0; i < list10.size(); i++) {
						SimpleDateFormat df = new SimpleDateFormat(
								"yyyy-MM-dd HH:mm:ss");// 设置日期格式
						User user = (User) request.getSession().getAttribute(
								SessionInfo.SessionName);
						d.setPeople_song(user.getUsername());
						d.setSend_fee1(op.getSend_fee1());
						d.setShiping_order_num(op.getShiping_order_num());
						d.setSend_date(df.format(new Date()));
						int truk = pay.update(op.getShiping_order_id(),
								d.getWrite_off1(), d.getSend_remarks1(),

								d.getSend_date(), d.getPeople_song());
					}
					List<Confluence> list1 = new ArrayList<Confluence>();
					Confluence co = new Confluence();
					SimpleDateFormat dfc = new SimpleDateFormat(
							"yyyy-MM-dd HH:mm:ss");// 设置日期格式
					co.setFee_date(d.getSend_date());
					co.setDirection("支出");
					co.setSource("1");
					co.setHappen(op.getSend_fee1());
					co.setId(op.getShiping_order_id());
					co.setProject("应付送货费核销");
					co.setShiping_order_num(op.getShiping_order_num());
					co.setHandle("实付送货费");
					co.setConf_id(UUIDUtils.getUUID());
					list1.add(co);
					int flat = pay.insertinfo(list1);

					List<Mingxi> ls = new ArrayList<Mingxi>();
					Mingxi mx = new Mingxi();
					SimpleDateFormat df1 = new SimpleDateFormat(
							"yyyy-MM-dd HH:mm:ss");// 设置日期格式
					mx.setHappen_date(df1.format(new Date()));
					mx.setSubject("应付送货费核销");
					mx.setSubject_two("送货费");
					mx.setMingxi_id(op.getShiping_order_id());
					mx.setSubject_three(d.getWrite_off1());
					mx.setMoney(op.getSend_fee1());
					mx.setRemarks(op.getSend_remarks1());
					mx.setShiping_order_num(op.getShiping_order_num());
					mx.setCustomer_name(op.getCustom_name());
					mx.setConsignee(op.getReceipt());
					mx.setId(UUIDUtils.getUUID());
					mx.setLaiyuan("支出");
					// System.out.println(op.getCompany_id()+"??????????$$$$$######");
					mx.setCompany_id(op.getCompany_id());// 中转公司id
					mx.setShiping_order_num(op.getShiping_order_num());
					mx.setCar_name(op.getCar_name());
					mx.setPeople_song(op.getPeople_song());
					// System.out.println("@@@@@@@@@"+op.getCar_name());
					ls.add(mx);
					int add = pay.add(ls);
					List<Settlement> lt = new ArrayList<Settlement>();
					Settlement st = new Settlement();

					st.setWrite_project("实付送货费");
					st.setWrite_data(d.getSend_date());
					st.setWrite_id(UUIDUtils.getUUID());
					st.setWrite_people(d.getPeople_song());
					st.setWrite_money(d.getSend_fee1());
					st.setWrite_fangshi(d.getWrite_off1());
					st.setRemarks(op.getSend_remarks1());
					lt.add(st);
					int a = pay.addSettlement(lt);
					System.out.println(d.getSend_fee1());
				} else {
				}
			}
			return json;
		} catch (Exception e) {
			return json;
		}
	}

	// 修改查询
	@RequestMapping(params = "method=getUpdate1")
	public @ResponseBody
	ShippingOrder getUpdate1(String id) {
		ShippingOrder der = pay.getupdate1(id);
		return der;
	}

	// 修改结算
	@RequestMapping(params = "method=update1")
	public @ResponseBody
	Json update9(ShippingOrder d,String [] pid, HttpServletRequest request) {
		Json json = new Json();
		boolean flag = false;
		json.setFlag(flag);
		// try {
		String[] s = d.getShiping_order_id().split(",");
		List<ShippingOrder> list10 = pay.selectinfo(s);
		int truk=0;
		for (ShippingOrder sq : list10) {
			

				SimpleDateFormat df = new SimpleDateFormat(
						"yyyy-MM-dd HH:mm:ss");// 设置日期格式
				d.setFee_date(df.format(new Date()));
				User user = (User) request.getSession().getAttribute(
						SessionInfo.SessionName);
				d.setPeople_zhong(user.getUsername());
				System.out.println(d.getChange_check_remarks());
				System.out.println(d.getChange_write_off());
				System.out.println(d.getChange_write_off());
				
				
				System.out.println(d.getChange_check_remarks());
				System.out.println(d.getChange_bank());
				System.out.println(d.getChange_card());
				truk = pay.update1(sq.getShiping_order_id(),d.getChange_write_off(), d.getFee_date(), d.getPeople_zhong(),d.getChange_check_remarks(),d.getChange_bank(),d.getChange_card(),d.getChange_sige_name());
			
		}
		
		if (truk>0) {
			System.out.println("chenggongn");
		}
		return json;
		// } catch (Exception e) {
		// return json;
		// }
	}

	// 全部查询
	@RequestMapping(params = "method=getDelivery")
	public @ResponseBody
	Map getDelivery(String rows, String page, String send_station,
			String end_address, String send_time, String yy, String car_name,
			String send_date, String dd, String create_time, String ss,
			String write_off1, String receipt, String goods_name,
			String goods_num, String pay_type, String send_fee, String sp) {
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}

		List<ShippingOrder> list = pay.getDelivery((page1 - 1) * rows1, rows1,
				send_station, end_address, send_time, yy, car_name, send_date,
				dd, create_time, ss, write_off1, receipt, goods_name,
				goods_num, pay_type, send_fee, sp);

		int count = pay.getDeliveryInfo(send_station, end_address, send_time,
				yy, car_name, send_date, dd, create_time, ss, write_off1,
				receipt, goods_name, goods_num, pay_type, send_fee, sp);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}
	/**
	 * 应付送货费核销勾选导出
	 * */
	@RequestMapping(params = "method=getGouXuanOutpa")
	public List<ShippingOrder> getGouXuanOutpa(HttpServletResponse response,
			String[] headtitle, String[] fieldName,String[] checkarray) {
		String filename = "应付送货费核销";
		List<ShippingOrder> list = pay.getGouXuanOutpa(checkarray);
		ScriptEngine se = new ScriptEngineManager().getEngineByName("JavaScript");
		for (ShippingOrder sd : list) {		  
			if (sd.getPaid_chayi()==null||sd.getPaid_chayi()=="") {
				sd.setPaid_chayi(sd.getPaid());
			}
				if (sd.getPaid_chayi()!=null&&sd.getPaid_chayi()!=""&&sd.getPaid()!=null&&sd.getPaid()!="") {
					sd.setTifu_chayi(Float.valueOf(sd.getPaid_chayi())-Float.valueOf(sd.getPaid()));	
				}
			if (sd.getPay_type() != null && sd.getPay_type() != ""
					&& sd.getPay_type().equals("0")) {
				sd.setPay_type("回付");
			} else if (sd.getPay_type() != null && sd.getPay_type() != ""
					&& sd.getPay_type().equals("1")) {
				sd.setPay_type("提付");
			} else if (sd.getPay_type() != null && sd.getPay_type() != ""
					&& sd.getPay_type().equals("2")) {
				sd.setPay_type("现付");
			} else if (sd.getPay_type() != null && sd.getPay_type() != ""
					&& sd.getPay_type().equals("3")) {
				sd.setPay_type("货到前付");
			}
			if (sd.getWrite_off() != null && sd.getWrite_off() != ""
					&& sd.getWrite_off().equals("0")) {
				sd.setWrite_off("打卡");
			} else if (sd.getWrite_off() != null && sd.getWrite_off() != ""
					&& sd.getWrite_off().equals("1")) {
				sd.setWrite_off("现金");
			} else if (sd.getWrite_off() != null && sd.getWrite_off() != ""
					&& sd.getWrite_off().equals("3")) {
				sd.setWrite_off("未核销");
			}
		}
		try {
			// 声明一个工作簿
			HSSFWorkbook workbook = new HSSFWorkbook();
			// 生成一个表格
			response.setContentType("application/vnd.ms-excel;");
			response.setHeader("Content-Disposition", "attachment;filename=\""
					+ new String(filename.getBytes("gbk"), "iso-8859-1")
					+ ".xls\"");
			OutputStream ouputStream = response.getOutputStream();
			// 调用工具类创建表头
			ExportUtils.outputHeaders(headtitle, workbook, "应付送货费核销");
			// 调用工具类生成内容
			ExportUtils.outputColums(fieldName, list, workbook, 1, "应付送货费核销");
			workbook.write(ouputStream);
			ouputStream.flush();
			ouputStream.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}


	/**
	 * 应付送货费核销导出
	 * */
	@RequestMapping(params = "method=getDiliveryleOutpa")
	public List<ShippingOrder> getDiliveryleOutpa(HttpServletResponse response,
			String[] headtitle, String[] fieldName) {
		String filename = "应付送货费核销";
		List<ShippingOrder> list = pay.getDiliveryleOutpa();
		for (ShippingOrder sd : list) {
			if (sd.getPay_type() != null && sd.getPay_type() != ""
					&& sd.getPay_type().equals("0")) {
				sd.setPay_type("回付");
			} else if (sd.getPay_type() != null && sd.getPay_type() != ""
					&& sd.getPay_type().equals("1")) {
				sd.setPay_type("提付");
			} else if (sd.getPay_type() != null && sd.getPay_type() != ""
					&& sd.getPay_type().equals("2")) {
				sd.setPay_type("现付");
			} else if (sd.getPay_type() != null && sd.getPay_type() != ""
					&& sd.getPay_type().equals("3")) {
				sd.setPay_type("货到前付");
			}
			if (sd.getWrite_off() != null && sd.getWrite_off() != ""
					&& sd.getWrite_off().equals("0")) {
				sd.setWrite_off("打卡");
			} else if (sd.getWrite_off() != null && sd.getWrite_off() != ""
					&& sd.getWrite_off().equals("1")) {
				sd.setWrite_off("现金");
			} else if (sd.getWrite_off() != null && sd.getWrite_off() != ""
					&& sd.getWrite_off().equals("3")) {
				sd.setWrite_off("未核销");
			}
		}
		try {
			// 声明一个工作簿
			HSSFWorkbook workbook = new HSSFWorkbook();
			// 生成一个表格
			response.setContentType("application/vnd.ms-excel;");
			response.setHeader("Content-Disposition", "attachment;filename=\""
					+ new String(filename.getBytes("gbk"), "iso-8859-1")
					+ ".xls\"");
			OutputStream ouputStream = response.getOutputStream();
			// 调用工具类创建表头
			ExportUtils.outputHeaders(headtitle, workbook, "应付送货费核销");
			// 调用工具类生成内容
			ExportUtils.outputColums(fieldName, list, workbook, 1, "应付送货费核销");
			workbook.write(ouputStream);
			ouputStream.flush();
			ouputStream.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}

	/**
	 * 应付其他费
	 */
	@RequestMapping(params = "method=getOthers")
	public String getOther() {
		return "payable/other";
	}

	// 全部查询
	@RequestMapping(params = "method=getOther")
	public @ResponseBody
	Map getOther(String rows, String page, String shiping_order_num,
			String receipt, String other_date, String ss, String write_off2,
			String send_station, String goods_name, String goods_num,
			String payble_other) {
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}

		List<ShippingOrder> list = pay.getOther((page1 - 1) * rows1, rows1,
				shiping_order_num, receipt, other_date, ss, write_off2,
				send_station, goods_name, goods_num, payble_other);

		int count = pay.getOtherInfo(shiping_order_num, receipt, other_date,
				ss, write_off2, send_station, goods_name, goods_num,
				payble_other);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}

	// 修改
	@RequestMapping(params = "method=updateShippingOrderz")
	public @ResponseBody
	Json updateShippingOrderz(ShippingOrder d, HttpServletRequest request) {
		Json json = new Json();
        System.out.println("//////////////////中转费："+d.getChange_fee());
        System.out.println("feife:"+d.getPaid_chayi());
        System.out.println("'实付中转费:"+d.getChange_fee1());
        System.out.println("'中转备注"+d.getChange_remarks());
        System.out.println("中转hexiao备注"+d.getFee_remarks());
		int i = pay.updateShippingOrderz(d);
		if (i>0) {
			json.setFlag(true);
		}
		return json;

	}

	// 修改
	@RequestMapping(params = "method=up")
	public @ResponseBody
	Json up(ShippingOrder d, HttpServletRequest request) {
		// 修改
		Json json = new Json();
		String unloading_remarks = request.getParameter("unloading_remarks");
		d.setUnloading_remarks(unloading_remarks);
		String unloading_fee1 = request.getParameter("unloading_fee1");
		d.setUnloading_fee1(unloading_fee1);

		int i = pay.up(d);
		if (i > 0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}

	// 修改
	@RequestMapping(params = "method=updateShippingOrderf")
	public @ResponseBody
	Json updateShippingOrderf(OrderCustom d, HttpServletRequest request) {
		// 修改
		Json json = new Json();
		String loading_remarks = request.getParameter("loading_remarks");
		d.setLoading_remarks(loading_remarks);
		String adorn_fee1 = request.getParameter("adorn_fee1");
		//d.setAdorn_fee1(adorn_fee1);
		int i = pay.updateShippingOrderf(d);
		if (i > 0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}

	@RequestMapping(params = "method=updaptez")
	public @ResponseBody
	Json updateShippingOrderp(ShippingOrder d, HttpServletRequest request) {
		// 修改
		Json json = new Json();
		String other_remarks = request.getParameter("other_remarks");
		d.setOther_remarks(other_remarks);

		String other_remarks1 = request.getParameter("other_remarks1");
		d.setOther_remarks1(other_remarks1);

		String send_other = request.getParameter("send_other");
		d.setSend_other(send_other);
		d.setHappen(send_other);
		int i = pay.updaptez(d);
		if (i > 0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}

	// 修改查询
	@RequestMapping(params = "method=getUpdateCompanyz")
	public @ResponseBody
	ShippingOrder getUpdateCompanyz(String id) {
		ShippingOrder der = pay.getUpdateShippingOrderz(id);
		return der;
	}

	// 修改查询
	@RequestMapping(params = "method=getupdatez")
	public @ResponseBody
	ShippingOrder getUpdateCompanyp(String id) {
		ShippingOrder der = pay.getupdatez(id);
		return der;
	}

	// 修改查询
	@RequestMapping(params = "method=getUpdateCompanyf")
	public @ResponseBody
	OrderCustom getUpdateCompanyf(String id) {
		OrderCustom der = pay.getUpdateShippingOrderf(id);
		return der;
	}

	// 修改查询
	@RequestMapping(params = "method=getUpdate2")
	public @ResponseBody
	ShippingOrder getUpdate2(String id) {
		ShippingOrder der = pay.getupdate2(id);
		return der;
	}

	// 修改
	@RequestMapping(params = "method=update2")
	public @ResponseBody
	Json update2(ShippingOrder d, HttpServletRequest request) {
		Json json = new Json();
		boolean flag = false;
		json.setFlag(flag);
		try {

			String[] s = d.getShiping_order_id().split(",");
			List<ShippingOrder> list10 = pay.selectinfo(s);
			List<User> list20 = pay.selectfo(user);
			for (ShippingOrder op : list10) {
				if ("3".equals(op.getWrite_off2())) {

					for (int i = 0; i < list10.size(); i++) {
						SimpleDateFormat df = new SimpleDateFormat(
								"yyyy-MM-dd HH:mm:ss");// 设置日期格式
						d.setOther_date(df.format(new Date()));
						User user = (User) request.getSession().getAttribute(
								SessionInfo.SessionName);
						d.setPeople_other(user.getUsername());
						int truk = pay.feijiazhen(op.getShiping_order_id(),
								d.getWrite_off2(), d.getOther_date(),
								d.getPeople_other(), d.getOther_remarks1());
					}

					List<Confluence> list1 = new ArrayList<Confluence>();
					SimpleDateFormat df = new SimpleDateFormat(
							"yyyy-MM-dd HH:mm:ss");// 设置日期格式
					Confluence co = new Confluence();
					SimpleDateFormat dfc = new SimpleDateFormat(
							"yyyy-MM-dd HH:mm:ss");// 设置日期格式
					co.setFee_date(d.getOther_date());
					co.setDirection("支出");
					co.setSource("1");
					co.setHappen(op.getSend_other());
					co.setId(op.getShiping_order_id());
					co.setProject("应付其他费核销");
					co.setConf_id(UUIDUtils.getUUID());
					co.setShiping_order_num(op.getShiping_order_num());
					co.setHandle("实付其他费");
					list1.add(co);

					int flat = pay.insertinfo(list1);

					List<Mingxi> ls = new ArrayList<Mingxi>();
					Mingxi mx = new Mingxi();
					SimpleDateFormat df1 = new SimpleDateFormat(
							"yyyy-MM-dd HH:mm:ss");// 设置日期格式
					mx.setHappen_date(df1.format(new Date()));
					mx.setSubject("应付其他费核销");
					mx.setSubject_two("其他费");
					mx.setMingxi_id(op.getShiping_order_id());
					mx.setSubject_three(d.getWrite_off2());
					mx.setMoney(op.getSend_other());
					mx.setRemarks(op.getOther_remarks1());
					mx.setShiping_order_num(op.getShiping_order_num());
					mx.setCustomer_name(op.getCustom_name());
					mx.setConsignee(op.getReceipt());
					mx.setId(UUIDUtils.getUUID());
					mx.setLaiyuan("支出");
					ls.add(mx);
					int add = pay.add(ls);
					List<Settlement> list = new ArrayList<Settlement>();
					Settlement sl = new Settlement();
					sl.setWrite_id(UUIDUtils.getUUID());
					sl.setShiping_order_num(op.getShiping_order_num());
					sl.setWrite_data(d.getOther_date());
					sl.setWrite_fangshi(d.getWrite_off2());
					sl.setWrite_people(d.getPeople_other());
					sl.setWrite_money(op.getSend_other());
					sl.setWrite_project("实付其他费");
					sl.setRemarks(op.getOther_remarks1());
					list.add(sl);
					int p = pay.addSettlement(list);
				} else {
				}
			}
			return json;
		} catch (Exception e) {
			return json;
		}
	}

	// 应付装卸费
	@RequestMapping(params = "method=geti")
	public String getInstall() {
		return "payable/install";
	}

	// 应付装卸费
	@RequestMapping(params = "method=geys")
	public String geys() {
		return "payable/loading";
	}

	// 全部查询
	@RequestMapping(params = "method=getInstall")
	public @ResponseBody
	Map getInstall(String rows, String page, String shiping_order_num,
			String receipt, String zhuangxie_date, String ss,
			String write_off3, String send_station, String goods_name,
			String goods_num, String pay_type, String payble_coolie) {
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}

		List<ShippingOrder> list = pay.getInstall((page1 - 1) * rows1, rows1,
				shiping_order_num, receipt, zhuangxie_date, ss, write_off3,
				send_station, goods_name, goods_num, pay_type, payble_coolie);

		int count = pay.getInstallInfo(shiping_order_num, receipt,
				zhuangxie_date, ss, write_off3, send_station, goods_name,
				goods_num, pay_type, payble_coolie);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}

	// 跳转编辑页面并且获取合同的id 返回到页面
	@RequestMapping(params = "method=getEditCompanyPagev")
	public String getEdittCompanyPagev(String pid, String pid2,
			HttpServletRequest request) {
		request.setAttribute("flg", pid);
		request.setAttribute("write_off3", pid2);
		return "payable/Editinstall";
	}

	@RequestMapping(params = "method=getUpdate3")
	public @ResponseBody
	OrderCustom getUpdate3(String id) {
		OrderCustom der = pay.getupdate3(id);
		return der;
	}

	@RequestMapping(params = "method=update3")
	public @ResponseBody
	Json update3(OrderCustom d, HttpServletRequest request) {
		Json json = new Json();
		boolean flag = false;
		json.setFlag(flag);
		try {
			String[] s = d.getCustom_id().split(",");
			List<OrderCustom> list10 = pay.select(s);
			for (OrderCustom oc : list10) {
				if ("3".equals(oc.getWrite_off4())) {
					for (int i = 0; i < s.length; i++) {
						SimpleDateFormat df = new SimpleDateFormat(
								"yyyy-MM-dd HH:mm:ss");// 设置日期格式
						d.setZhuangxie_date(df.format(new Date()));
						User user = (User) request.getSession().getAttribute(
								SessionInfo.SessionName);
						d.setPeople_zhuang(user.getUsername());
						int truk = pay.update3(oc.getCustom_id(),
								d.getWrite_off4(), d.getLoading_remarks(),
								d.getZhuangxie_date(), d.getPeople_zhuang());
					}
					// List<OrderCustom> list = pay.select(s);
					// for (OrderCustom sy : list) {
					List<Confluence> list1 = new ArrayList<Confluence>();
					SimpleDateFormat df = new SimpleDateFormat(
							"yyyy-MM-dd HH:mm:ss");// 设置日期格式
					Confluence co = new Confluence();
					SimpleDateFormat dfc = new SimpleDateFormat(
							"yyyy-MM-dd HH:mm:ss");// 设置日期格式
					co.setFee_date(d.getZhuangxie_date());
					co.setDirection("支出");
					co.setSource("1");
					//co.setHappen(oc.getAdorn_fee1());
					co.setId(oc.getCustom_id());
					co.setProject("应付装卸费核销(按车核销)");
					co.setConf_id(UUIDUtils.getUUID());
					co.setShiping_order_num(oc.getCustom_name());
					co.setHandle("实付装卸费");
					list1.add(co);

					int flat = pay.insertinfo(list1);
					// }
					// List<OrderCustom> st = pay.select(s);
					// for (OrderCustom sq : list) {
					List<Mingxi> ls = new ArrayList<Mingxi>();
					Mingxi mx = new Mingxi();
					SimpleDateFormat df1 = new SimpleDateFormat(
							"yyyy-MM-dd HH:mm:ss");// 设置日期格式
					mx.setHappen_date(df1.format(new Date()));
					mx.setSubject("应付装卸费核销(按车核销)");
					mx.setSubject_two("装卸费（大车）");
					mx.setMingxi_id(oc.getCustom_id());
					mx.setSubject_three(d.getWrite_off4());
					//mx.setMoney(oc.getAdorn_fee1());
					mx.setRemarks(oc.getLoading_remarks());
					mx.setShiping_order_num(oc.getCustom_name());
					mx.setCustomer_name(oc.getCustom_name());
					mx.setId(UUIDUtils.getUUID());
					mx.setLaiyuan("支出");
					ls.add(mx);
					int add = pay.add(ls);
					List<Settlement> list = new ArrayList<Settlement>();
					Settlement sl = new Settlement();
					sl.setWrite_id(UUIDUtils.getUUID());
					sl.setShiping_order_num(oc.getCustom_name());
					sl.setWrite_data(d.getZhuangxie_date());
					sl.setWrite_fangshi(d.getWrite_off4());
					//sl.setWrite_money(oc.getAdorn_fee1());
					sl.setWrite_project("应付装卸费（车）");
					sl.setWrite_people(d.getPeople_zhuang());
					sl.setRemarks(oc.getLoading_remarks());
					list.add(sl);
					int q = pay.addSettlement(list);
				} else {
				}
			}
			return json;
		} catch (Exception e) {
			return json;
		}
	}

	/**
	 * 应付装卸费（按车核销）
	 * 
	 */
	// 应付装卸费
	@RequestMapping(params = "method=gets")
	public String getLoading() {
		return "payable/loading";
	}

	// 全部查询
	@RequestMapping(params = "method=getLoading")
	public @ResponseBody
	Map getLoading(String rows, String page, String custom_name,
			String send_station, String zhuangxie_date, String aa,
			String write_off4, String send_time, String bb,
			String receipt_time, String cc, String car_number,
			String driver_name) {
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}

		List<OrderCustom> list = pay.getLoading((page1 - 1) * rows1, rows1,
				custom_name, send_station, zhuangxie_date, aa, write_off4,
				send_time, bb, receipt_time, cc, car_number, driver_name);

		int count = pay.getLoadingInfo(custom_name, send_station,
				zhuangxie_date, aa, write_off4, send_time, bb, receipt_time,
				cc, car_number, driver_name);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}

	// 修改查询
	@RequestMapping(params = "method=getUpdate4")
	public @ResponseBody
	ShippingOrder getUpdate4(String id) {
		ShippingOrder der = pay.getUpdate4(id);
		return der;
	}

	// 修改
	// 修改
	@RequestMapping(params = "method=update4")
	public @ResponseBody
	Json update4(ShippingOrder d, HttpServletRequest request) {
		Json json = new Json();
		boolean flag = false;
		json.setFlag(flag);
		try {

			String[] s = d.getShiping_order_id().split(",");
			List<ShippingOrder> list10 = pay.selectinfo(s);
			for (ShippingOrder so : list10) {
				if ("3".equals(so.getWrite_off3())) {
					for (int i = 0; i < list10.size(); i++) {
						SimpleDateFormat df = new SimpleDateFormat(
								"yyyy-MM-dd HH:mm:ss");// 设置日期格式
						d.setZhuangxie_date(df.format(new Date()));
						User user = (User) request.getSession().getAttribute(
								SessionInfo.SessionName);
						d.setPeople_zhuang(user.getUsername());
						int truk = pay.update4(so.getShiping_order_id(),
								d.getWrite_off3(), d.getZhuangxie_date(),

								d.getPeople_zhuang(), d.getUnloading_remarks());
					}

					List<Confluence> list1 = new ArrayList<Confluence>();
					SimpleDateFormat df = new SimpleDateFormat(
							"yyyy-MM-dd HH:mm:ss");// 设置日期格式
					Confluence co = new Confluence();
					SimpleDateFormat dfc = new SimpleDateFormat(
							"yyyy-MM-dd HH:mm:ss");// 设置日期格式
					co.setFee_date(d.getZhuangxie_date());
					co.setDirection("支出");
					co.setSource("1");
					co.setHappen(so.getUnloading_fee1());
					co.setId(so.getShiping_order_id());
					co.setProject("应付装卸费核销（按票）");
					co.setConf_id(UUIDUtils.getUUID());
					co.setShiping_order_num(so.getShiping_order_num());
					co.setHandle("实付装卸费(票)");
					list1.add(co);

					int flat = pay.insertinfo(list1);
					List<Mingxi> ls = new ArrayList<Mingxi>();
					Mingxi mx = new Mingxi();
					SimpleDateFormat df1 = new SimpleDateFormat(
							"yyyy-MM-dd HH:mm:ss");// 设置日期格式
					mx.setHappen_date(df1.format(new Date()));
					mx.setSubject("应付装卸费核销（按票）");
					mx.setSubject_two("装卸费");
					mx.setMingxi_id(so.getShiping_order_id());
					mx.setSubject_three(d.getWrite_off3());
					mx.setMoney(so.getUnloading_fee1());
					mx.setRemarks(so.getUnloading_remarks());
					mx.setShiping_order_num(so.getShiping_order_num());
					mx.setCustomer_name(so.getCustom_name());
					mx.setConsignee(so.getReceipt());
					mx.setId(UUIDUtils.getUUID());
					mx.setLaiyuan("支出");
					ls.add(mx);
					int add = pay.add(ls);
					List<Settlement> list = new ArrayList<Settlement>();
					Settlement sp = new Settlement();
					sp.setWrite_id(UUIDUtils.getUUID());
					sp.setShiping_order_num(so.getShiping_order_num());
					sp.setWrite_project("实付装卸费（按票）");
					sp.setWrite_fangshi(d.getWrite_off3());
					sp.setWrite_data(d.getZhuangxie_date());
					sp.setWrite_money(so.getUnloading_fee1());
					sp.setWrite_people(d.getPeople_zhuang());
					sp.setRemarks(so.getUnloading_remarks());
					list.add(sp);
					int p = pay.addSettlement(list);

				} else {
				}
			}
			return json;
		} catch (Exception e) {
			return json;
		}
	}

	// 应付中转费 取消核销

	@RequestMapping(params = "method=editZhongzhuan")
	public @ResponseBody
	Json updateCompany(ShippingOrder d, String pid[]) {
		Json json = new Json();
		boolean flag = false;
		json.setFlag(flag);
		List<ShippingOrder> list10 = pay.selectinfo(pid);
		for (ShippingOrder op : list10) {
			d.setWrite_off("3");

			d.setFee_date(null);
			d.setPeople_zhong(null);
			int truk = pay.editZhongzhuan(op.getShiping_order_id(),
					d.getWrite_off(), d.getFee_date(), d.getPeople_zhong());
			int i = pay.delConf(pid);
			int v = pay.delMingxi(pid);

		}

		return json;
	}

	// 应付中转费 取消核销

	@RequestMapping(params = "method=updateSonghuo")
	public @ResponseBody
	Json updateSonghuo(ShippingOrder d, String pid[]) {
		Json json = new Json();
		boolean flag = false;
		json.setFlag(flag);
		List<ShippingOrder> list10 = pay.selectinfo(pid);
		for (ShippingOrder op : list10) {
			d.setWrite_off1("3");
			ShippingOrder sp = new ShippingOrder();
			d.setSend_date(sp.getSend_date());
			d.setPeople_song(null);
			int truk = pay.updateSonghuo(op.getShiping_order_id(),
					d.getWrite_off1(), d.getSend_date(), d.getPeople_song());
			int i = pay.delConf(pid);
			int v = pay.delMingxi(pid);
		}
		return json;
	}

	// 应付装卸费（按票）

	@RequestMapping(params = "method=editZhuang")
	public @ResponseBody
	Json editZhuang(ShippingOrder d, String pid[]) {
		Json json = new Json();
		boolean flag = false;
		json.setFlag(flag);
		List<ShippingOrder> list10 = pay.selectinfo(pid);
		for (ShippingOrder op : list10) {
			d.setWrite_off3("3");
			ShippingOrder sp = new ShippingOrder();
			d.setZhuangxie_date(sp.getZhuangxie_date());
			d.setPeople_zhuang(null);
			int truk = pay.editZhuang(op.getShiping_order_id(),
					d.getWrite_off3(), d.getZhuangxie_date(),
					d.getPeople_zhuang());
			int i = pay.delConf(pid);
			int v = pay.delMingxi(pid);
		}
		return json;
	}

	// 应付其他费

	@RequestMapping(params = "method=editOther1")
	public @ResponseBody
	Json editOther1(ShippingOrder d, String pid[]) {
		Json json = new Json();
		boolean flag = false;
		json.setFlag(flag);
		List<ShippingOrder> list10 = pay.selectinfo(pid);
		for (ShippingOrder op : list10) {
			ShippingOrder sp = new ShippingOrder();
			d.setWrite_off2("3");
			d.setOther_date(sp.getOther_date());
			d.setPeople_other(null);
			int truk = pay.editOther1(op.getShiping_order_id(),
					d.getWrite_off2(), d.getOther_date(), d.getPeople_other());
			int i = pay.delConf(pid);
			int v = pay.delMingxi(pid);
		}
		return json;
	}

	// 应付装卸费取消核销

	@RequestMapping(params = "method=editZhuangxie")
	public @ResponseBody
	Json editZhuangxie(OrderCustom d, String pid[]) {
		Json json = new Json();
		boolean flag = false;
		json.setFlag(flag);
		List<OrderCustom> list10 = pay.select(pid);
		for (OrderCustom op : list10) {
			d.setWrite_off4("3");
			OrderCustom oc = new OrderCustom();
			d.setZhuangxie_date(oc.getZhuangxie_date());
			d.setPeople_zhuang(null);
			int truk = pay.editZhuangxie(op.getCustom_id(), d.getWrite_off4(),
					d.getZhuangxie_date(), d.getPeople_zhuang());
			int i = pay.delConf(pid);
			int v = pay.delMingxi(pid);
		}
		return json;
	}

	// 勾选导出
	@RequestMapping(params = "method=daochufrom")
	public @ResponseBody
	List<ShippingOrder> exportCost(HttpServletResponse response,
			String[] headtitle, String[] fieldName, String[] checkarray) {
		String filename = "应付款信息导出";
		System.out.println("==========");
		List<ShippingOrder> list = pay.exportCost(checkarray);
		for (ShippingOrder sd : list) {
			if (sd.getSend_type() != null && sd.getSend_type() != ""
					&& sd.getSend_type().equals("0")) {
				sd.setSend_type("自提");
			} else if (sd.getSend_type() != null && sd.getSend_type() != ""
					&& sd.getSend_type().equals("1")) {
				sd.setSend_type("送货");
			}
			if (sd.getPay_type() != null && sd.getPay_type() != ""
					&& sd.getPay_type().equals("0")) {
				sd.setPay_type("回付");
			} else if (sd.getPay_type() != null && sd.getPay_type() != ""
					&& sd.getPay_type().equals("1")) {
				sd.setPay_type("提付");
			} else if (sd.getPay_type() != null && sd.getPay_type() != ""
					&& sd.getPay_type().equals("2")) {
				sd.setPay_type("现付");
			} else if (sd.getPay_type() != null && sd.getPay_type() != ""
					&& sd.getPay_type().equals("3")) {
				sd.setPay_type("货到前付");
			}
			if (sd.getWrite_off() != null && sd.getWrite_off() != ""
					&& sd.getWrite_off().equals("0")) {
				sd.setWrite_off("打卡");
			} else if (sd.getWrite_off() != null && sd.getWrite_off() != ""
					&& sd.getWrite_off().equals("1")) {
				sd.setWrite_off("现金");
			} else if (sd.getWrite_off() != null && sd.getWrite_off() != ""
					&& sd.getWrite_off().equals("3")) {
				sd.setWrite_off("未核销");
			}

			// 实收
			if (sd.getPaid_chayi() != "") {
				sd.setPaid_chayi(sd.getPaid_chayi());

			} else {
				sd.setPaid_chayi(sd.getPaid());

			}

			// 差异
			if (sd.getPaid() != null && sd.getPaid() != ""
					&& sd.getPaid_chayi() != null && sd.getPaid_chayi() != "") {

				String a = sd.getPaid_chayi();
				double b = (new Double(a).doubleValue());
				String c = sd.getPaid();
				double d = (new Double(c).doubleValue());
				sd.setTifu_chayi(b - d);
				double lina = sd.getTifu_chayi();

			} else if (sd.getPaid() == null && sd.getPaid() == ""
					&& sd.getPaid_chayi() == "" && sd.getPaid_chayi() == null) {
				sd.setTifu_chayi(0.00);
			}

			// 实收
			if (sd.getChange_fee() != "") {
				sd.setChange_fee(sd.getChange_fee());
			} else {
				sd.setChange_fee(sd.getChange_fee1());
			}

			// 差异
			if (sd.getChange_fee() != null && sd.getChange_fee() != ""&&sd.getChange_fee1()!=null&&sd.getChange_fee1()!="") {
				String a = sd.getChange_fee1();
				double b = (new Double(a).doubleValue());
				String c = sd.getChange_fee();
			    double d = (new Double(c).doubleValue());
			    sd.setChayi_zhongzhuanfei(b-d);
				double cha = sd.getChayi_zhongzhuanfei();
			} else if (sd.getChange_fee() == "" && sd.getChange_fee() == null&&sd.getChange_fee1()!=null&&sd.getChange_fee1()!="") {
				sd.setChayi_zhongzhuanfei(sd.getChayi_zhongzhuanfei());
			}
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
			ExportUtils.outputHeaders(headtitle, workbook, "应付中转费导出");
			// 调用工具类生成内容
			ExportUtils.outputColums(fieldName, list, workbook, 1, "应付中转费导出");
			workbook.write(ouputStream);
			ouputStream.flush();
			ouputStream.close();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("cahth  + ===============" + checkarray);
		}
		return null;
	}
	// 全部查询
	@RequestMapping(params = "method=getPayableCheckd")
	public @ResponseBody Map getPayableCheckd(String rows, String page, String shiping_order_num,String receipt, String fee_date, String dd, String create_time,String yy, String write_off, String send_station,String goods_name, String goods_num, String pay_type, String paid,String company_name) {
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		List<ShippingOrder> list = pay.getPayableCheckd((page1 - 1) * rows1,rows1, shiping_order_num, receipt, fee_date, dd, create_time,yy, write_off, send_station, goods_name, goods_num, pay_type,paid, company_name);
		int count = pay.getPayableCheckdCount(shiping_order_num, receipt, fee_date, dd, create_time, yy, write_off, send_station, goods_name, goods_num, pay_type, paid, company_name);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}
	// 中转公司结算审核 详细信息查询
	@RequestMapping(params = "method=getShippingChecked")
	public @ResponseBody Map getShippingChecked(String rows, String page, String pid) {
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		List<ShippingOrder> list = pay.getShippingChecked((page1 - 1) * rows1,rows1, pid);
		int count = pay.getShippingCheckedCount(pid);
				
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}
	//跳转到提审页面
	@RequestMapping(params="method=getCasePayable")
	public String getCasePayable(HttpServletRequest request,String[] pid){
		System.out.println(pid.length);
		request.setAttribute("pid", pid);
		return "payableCheckd/CasePayable";
	}
	//中转公司结算提审
	@RequestMapping(params = "method=setShiPayable")
	public@ResponseBody Json setShiPayable(String[] pid,String arraign_name,String did,String arraign_remarks,HttpServletRequest request){
		User user=(User) request.getSession().getAttribute(SessionInfo.SessionName);
		Json json = new Json();
		int i = pay.setShippingChedked(pid, user.getId(), did, arraign_remarks);
		if (i>0) {
			json.setFlag(true);
		}
		return json;
	}
	/**
	 * 审核redirect
	 * **/
	@RequestMapping(params ="method=redirectPage")
	public String redirectPage(String[] id,HttpServletRequest request){
		//System.out.println("id"+id);
		request.setAttribute("id",id[0]);
		return "payableCheckd/EditothPayable";
	}
	
	//查询费用
	@RequestMapping(params = "method=getshipinCollect")
	public @ResponseBody ShippingOrder getshipinCollect(String id) {
		ShippingOrder der = pay.getShippingXheck(id);
		return der;
	}
	/**
	 * 审核
	 * **/
	@RequestMapping(params ="method=updateCheckCollect")
	public@ResponseBody Json updateCheckCollect(String [] id,String username,String close_recheck_remarks,String change_fee1,String change_pay,String trade_agency){
		Json json = new Json();
	List<ShippingOrder> list = pay.getShippingOrder(id);
		int oo= 0;
		ShippingOrder or = null;
	    List<ShippingOrder> order =new ArrayList<ShippingOrder>();
		for (ShippingOrder oc : list) {	
			or = new ShippingOrder();
			or.setCost_summary_id(UUIDUtils.getUUID());
			or.setCustom_id(oc.getCustom_id());
			or.setCustom_name(oc.getCustom_name());
			or.setCustomer_id(oc.getCustomer_id());
			//or.setClose_recheck_time(oc.getClose_recheck_time());
			or.setShiping_order_id(oc.getShiping_order_id());
			or.setShiping_order_num(oc.getShiping_order_num());
			or.setTake_fee(oc.getTake_fee());
			or.setSend_fee(oc.getSend_fee());
			or.setAdorn_fee(oc.getAdorn_fee());
			or.setChange_fee(oc.getChange_fee());
			or.setReceivable_ground_fee(oc.getReceivable_ground_fee());
			or.setUpstairs_fee(oc.getUpstairs_fee());
			or.setDeliver_fee(oc.getDeliver_fee());
			or.setInspect_fee(oc.getInspect_fee());
			or.setSeized_fee(oc.getSeized_fee());
			or.setBack_fee(oc.getBack_fee());
			or.setTransport_pay(oc.getTransport_pay());
			or.setTrade_agency(oc.getTrade_agency());
			or.setPeople_name(username);
			System.out.println(oc.getShiping_order_id()+"////"+oo++);
			int i = pay.UpdatePayableCheck(username,oc.getShiping_order_id());
			if (i>0 ){
				json.setFlag(true);
			}
		}
		order.add(or);
		//int sh = cs.delectCollShi(or, id);		
		//int j = cs.insertCostShiping(order);
		
		System.out.println("审核");
		//int l = pay.UpdatePayaleCompany(id, change_fee1, change_pay, close_recheck_remarks);
	
		return json;	
	}
	/**
	 * 驳回
	 * **/
	@RequestMapping(params ="method=updateCheckReject")
	public@ResponseBody Json updateCheckReject(String [] id,String username,String close_recheck_remarks,String change_fee1,String change_pay,String trade_agency){
		Json json = new Json();
		System.out.println("!!!!!!!!!!!!!!!!!!!"+id.length);
	List<ShippingOrder> list = pay.getShippingOrder(id);
	
	    List<ShippingOrder> order =new ArrayList<ShippingOrder>();
		for (ShippingOrder oc : list) {	
			int i = pay.UpdatePayableReject(username,oc.getShiping_order_id());
			
			if (i>0) {
				json.setFlag(true);
			}
		}
	
		return json;	
	}
}
