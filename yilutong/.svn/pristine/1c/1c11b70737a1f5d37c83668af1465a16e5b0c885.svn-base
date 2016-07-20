package com.jy.action;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.avalon.framework.configuration.Configuration;
import org.apache.avalon.framework.configuration.DefaultConfiguration;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.krysalis.barcode4j.BarcodeGenerator;
import org.krysalis.barcode4j.BarcodeUtil;
import org.krysalis.barcode4j.output.bitmap.BitmapCanvasProvider;
import org.krysalis.barcode4j.tools.MimeTypes;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jy.common.ExportUtils;
import com.jy.common.OrderExcelForPOI;
import com.jy.common.QRCodeEncoderHandler;
import com.jy.common.SessionInfo;
import com.jy.common.UUIDUtils;
import com.jy.dao.Json;
import com.jy.model.OrderCustom;

import com.jy.model.CustomerModel;
import com.jy.model.Delivery;
import com.jy.model.ShippingManual;
import com.jy.model.ShippingOrder;
import com.jy.model.Sign_order;
import com.jy.model.User;
import com.jy.model.jiLuLiShi;
import com.jy.service.OrderInfoService;
import com.jy.service.ShippingManualInfoService;
import com.jy.service.ShippingOrderInfoService;
import com.jy.service.UserInfoService;

/*
 * 货运订单管理
 * */
@Controller
@RequestMapping(value = "/shipManual.do")
public class ShippingManualInfoController {
	@Resource
	private ShippingOrderInfoService sos;
	@Resource
	private ShippingOrderInfoService spp;
	@Resource
	private ShippingManualInfoService csi;
	@Resource
	private OrderInfoService ocs;
	@Resource
	private ShippingOrderInfoService shp;
	@Resource
	private UserInfoService uis;
	/*@Resource
	private NumberToCN CN ;
*/
	@RequestMapping(params = "method=getShipManualInfo")
	public String getShipManualInfoMan(String menu_id,
			HttpServletRequest request, HttpSession session) {
		System.out.println("menu_id:" + menu_id);
		Integer[] rid = (Integer[]) session
				.getAttribute(SessionInfo.SessionRote);
		Integer id = Integer.parseInt(menu_id);
		List<String> list = uis.getFunctions(id, rid);
		if (list.size() > 0) {
			StringBuffer bf = new StringBuffer();
			for (String ss : list) {
				bf.append(ss);
				bf.append(",");

			}
			bf.deleteCharAt(bf.length() - 1);
			request.setAttribute("function", bf.toString());
			System.out.println(bf.toString());
			// session.setAttribute("function", bf.toString());
		}
		return "shipping_manual/shippingManualInfo";
	}

	// 跳转编辑页面并且获取合同的id 返回到页面
	@RequestMapping(params = "method=getEditShipManualPage")
	public String getEditShipManualPage(String pid, HttpServletRequest request) {
		request.setAttribute("flg", pid);
		return "shipping_manual/EditShipManual";
	}

	// 跳转手动录入运单修改
	@RequestMapping(params = "method=toshippingManualInfoPage")
	public String toshippingManualInfoPage(String pid,
			HttpServletRequest request) {
		return "shipping_manual/editshippingManualInfo";
	}

	@RequestMapping(params = "method=getShipManualPage")
	public String getShipManualPage(String pid, HttpServletRequest request) {
		request.setAttribute("flg", pid);
		return "shipping_manual/SearchShipManual";
	}

	// 打印
	@RequestMapping(params = "method=getShipManualPrint")
	public String getShipManualPrint(String[] pid, HttpServletRequest request) {
		/* ShippingOrder d = getUpdateShipManual(pid); */
		/*
		 * if (d.getSend_type() .equals("0") ) { d.setSendtype("√"); } else if
		 * (d.getSend_type().equals(1)) { d.setSendtype1("√"); }
		 * 
		 * if (d.getPay_type() == 0) { d.setPaytype("回付"); } else if
		 * (d.getPay_type() == 1) { d.setPaytype("提付"); } else if
		 * (d.getPay_type() == 2) { d.setPaytype("现付");s } else if
		 * (d.getPay_type() == 3) { d.setPaytype("货到前付"); }
		 */

		// request.setAttribute("sp", d);
		// 更新打印状态
		int flag = csi.updateprinttype(pid);
		return "shipping_manual/printYWM";
	}

	// 打印一维码
	@RequestMapping(params = "method=getShipManualPrintYwm")
	public String getShipManualPrintYWM(String[] checkarray,
			HttpServletRequest request) {
		StringBuffer s = new StringBuffer();
		for (int i = 0; i < checkarray.length; i++) {
			s.append(checkarray[i] + ",");
		}
		String num = s.substring(0, s.lastIndexOf(","));
		request.setAttribute("sp", num);
		return "shipping_manual/printYWM";
	}

	// 输出一维码
	@RequestMapping(params = "method=getShipYwm")
	public @ResponseBody
	String getShipYWM(String order_num, HttpServletResponse response) {
		String[] s = order_num.split(",");
		List<ShippingManual> d = csi.getUpdateShipManualArray(s);		
		JSONObject obje = new JSONObject();
		obje.accumulate("Detail", d);
		return obje.toString();
	}

	// 导入
	@RequestMapping(params = "method=imp")
	public String goimp() {
		return "shipping_manual/maplinimp";
	}

	// 做导入前的上传处理
	@RequestMapping(params = "method=startimplinplan")
	public String startimplinplan(HttpServletRequest request,
			@RequestParam(value = "files") MultipartFile files)
			throws IllegalStateException, IOException {
		String path = request.getSession().getServletContext()
				.getRealPath("WebRoot/orderFiles/");// 文件路径
		// System.out.println(path);
		File filez = new File(path);
		if (!filez.exists()) {
			filez.mkdirs();
		}
		MultipartFile myfile = files;
		String filename = myfile.getOriginalFilename();
		String prefix = filename.substring(filename.lastIndexOf("."));
		File newfile = filez.createTempFile("shipManual", prefix, filez);
		// System.out.println(newfile);
		String filesname = newfile.toString();
		filesname = filesname.substring(filesname.lastIndexOf("\\") + 1,
				filesname.length());
		request.setAttribute("filesname", filesname);
		myfile.transferTo(newfile);
		return "shipping_manual/maplinimp";
	}

	// 上传开始保存到数据库
	@RequestMapping(params = "method=implinplan")
	public @ResponseBody
	String implinplan(HttpServletRequest request, String filename,
			String usersname, String pid) {
		String filepath = request.getSession().getServletContext()
				.getRealPath("WebRoot/orderFiles/" + filename);
		OrderExcelForPOI oef = new OrderExcelForPOI();
		String flag = "";
		try {
			flag = oef.impExcel(filepath, usersname, pid, request);
			deleteFile(filepath); // 执行上传文件删除操作
			return flag;

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(flag
					+ "===========================================");
			return flag;
		}

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

	// 全部查询
	@RequestMapping(params = "method=getShipManual")
	public @ResponseBody
	Map getShipManualInfo(String rows, String page, String start_time,
			String end_time, String send_station, String end_address,
			String num, String receipt, String custom_name, String order_state,
			String pay_type, String send_type, String goods_name,
			String weitoudanhao, HttpServletRequest request) {
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		User user = (User) request.getSession().getAttribute(
				SessionInfo.SessionName);
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		List<ShippingOrder> list = csi.getShipManualInfo((page1 - 1) * rows1,
				rows1, start_time, end_time, send_station, end_address, num,
				receipt, custom_name, order_state, pay_type, send_type,
				goods_name, user.getId(), weitoudanhao);
		
		for (ShippingOrder so : list) {
			if("1".equals(so.getIs_recept_no())){
			    so.setIs_recept_no1("√");				
			}else{
				so.setIs_recept_no0("√");
			}
			if ("0".equals(so.getPay_type())) {
				so.setPay_type0("√");
			}else if("1".equals(so.getPay_type())){
				so.setPay_type1("√");
			}else if("2".equals(so.getPay_type())){
				so.setPay_type2("√");
			}else if("3".equals(so.getPay_type())){
				so.setPay_type3("√");
			}else if("4".equals(so.getPay_type())||"5".equals(so.getPay_type())){
				so.setPay_type4("√");
			}			
			if ("0".equals(so.getSend_type())) {
				so.setSend_type0("√");
			} else if ("1".equals(so.getSend_type())) {
				so.setSend_type1("√");
			}else if ("2".equals(so.getSend_type())) {
				so.setSend_type2("√");
			}else if ("3".equals(so.getSend_type())) {
				so.setSend_type3("√");
			}else if ("4".equals(so.getSend_type())) {
				so.setSend_type4("√");
			}
			if (so.getAffirm_value()!=null&&so.getAffirm_value()!="") {
				so.setAffirm_value1("√");
			} else {
				so.setAffirm_value2("√");
			}
		}

		int count = csi.getShipManual(start_time, end_time, send_station,
				end_address, num, receipt, custom_name, order_state, pay_type,
				send_type, goods_name, user.getId(), weitoudanhao);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}

	// 运单修改全部查询
	@RequestMapping(params = "method=editgetShipManual")
	public @ResponseBody
	Map editgetShipManual(String rows, String page, String start_time,
			String end_time, String send_station, String end_address,
			String num, String receipt, String custom_name, String order_state,
			String pay_type, String send_type, String goods_name,
			String weitoudanhao, HttpServletRequest request) {
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		User user = (User) request.getSession().getAttribute(
				SessionInfo.SessionName);
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		List<ShippingOrder> list = csi.editgetShipManualInfo((page1 - 1)
				* rows1, rows1, start_time, end_time, send_station,
				end_address, num, receipt, custom_name, order_state, pay_type,
				send_type, goods_name, user.getId(), weitoudanhao);

		int count = csi.editgetShipManual(start_time, end_time, send_station,
				end_address, num, receipt, custom_name, order_state, pay_type,
				send_type, goods_name, user.getId(), weitoudanhao);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}

	/*
	 * 批量删除
	 */
	@RequestMapping(params = "method=deleteShipManual")
	public @ResponseBody
	Json delShipManual(String[] del) {
		Json json = new Json();
		shp.deleteOrders(del);
		csi.deleteShip(del);
		int truck = csi.deleteShipManual(del);
		if (truck > 0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}

	/*
	 * 批量取消到达
	 */
	@RequestMapping(params = "method=isNotArrive")
	public @ResponseBody
	Json isNotArrive(String[] del) {
		Json json = new Json();
		int truck = csi.isNotArrive(del);
		if (truck > 0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}

	/*
	 * 批量达到
	 */
	@RequestMapping(params = "method=isArrive")
	public @ResponseBody
	Json isArrive(String[] del) {
		Json json = new Json();
		int truck = csi.isArrive(del);
		if (truck > 0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}

	// 跳转到添加页面
	@RequestMapping(params = "method=addShipManual")
	public String addShipManual(String pid, HttpServletRequest request) {
		request.setAttribute("flg", pid);
		return "shipping_manual/AddShipManual";
	}

	// 保存
	@RequestMapping(params = "method=saveShipManual")
	public @ResponseBody
	Json saveShipManual(ShippingOrder d, HttpServletRequest request) {
		Json json = new Json();
		CustomerModel cm = new CustomerModel();
		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		String dateString = formatter.format(currentTime);
		System.out.println(dateString);
		// CustomerModel cm1 = new CustomerModel();
		User user = (User) request.getSession().getAttribute(
				SessionInfo.SessionName);
		d.setShiping_order_id(UUIDUtils.getUUID());
		d.setPractiacl_num(d.getGoods_num());
		d.setCreat_type("0");

		d.setPaid_fu(d.getBack_fee());
		d.setReality_sum(d.getTransport_pay());
		d.setSetldaisk_trade(d.getTrade_agency());
		d.setPaidgf_fu(d.getTrade_agency());
		d.setPaid_fee(d.getDestination_fee());
		d.setHandling_shihou(d.getHandling_charge());
        
        System.out.println(d.getGoods_packing()+"/////////////////////");
		/*
		 * if (d.getDuty_rate() == ""||d.getDuty_rate() == null) {
		 * d.setDuty_rate("0"); }
		 */
		d.setUser_id(user.getId());

		cm.setCustomer_id(UUIDUtils.getUUID());
		cm.setCus_address_shou(d.getReceipt_address());
		cm.setCusr_address_fa(d.getFahuo_address());
		cm.setCus_name_shou(d.getReceipt());
		cm.setCus_name_fa(d.getCustom_name());
		cm.setCus_tel_fa(d.getSend_phone());
		cm.setCus_teltoo_fa(d.getSend_shouji());
		cm.setCus_tel_sahou(d.getSend_shouji());
		cm.setCus_teltoo_sahou(d.getReceipt_phone());
		cm.setCustomer_num(dateString);

		if (d.getCustomer_id() == null || d.getCustomer_id() == "") {
			d.setCustomer_id(cm.getCustomer_id());
			int i = csi.InsertItoCusFahuo(cm);
		}
		if (d.getCourid() == null || d.getCourid() == "") {
			int j = csi.InsertItoCusShouhuo(cm);
		}
		int truck = csi.saveShipManual(d);// 添加

		if (truck > 0) {
			json.setFlag(true);
			return json;
		} else {
			json.setFlag(false);
			return json;
		}

	}

	// 修改查询
	/*
	 * 订单重复查询
	 */
	@RequestMapping(params = "method=getUpdateShipManual")
	public @ResponseBody
	ShippingOrder getUpdateShipManual(String id) {
		ShippingOrder der = csi.getUpdateShipManual(id);
		return der;
	}

	// 导入页面
	@RequestMapping(params = "method=inputShipManual")
	public String inputShipManual() {
		return "driver/InputDriver";
	}

	// 修改
	@RequestMapping(params = "method=updateShipManual")
	public @ResponseBody
	Json updateShipManual(ShippingOrder sd, HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute(
				SessionInfo.SessionName);
		ShippingOrder der = spp.getUpdateShipOrder(sd.getShiping_order_id());

		sd.setEhistory_id(UUIDUtils.getUUID());
		sd.setEdit_order(user.getUsername());
		sd.setUpdatetime(DateFormat.getDateTimeInstance().format(new Date()));
		sd.setPractiacl_num(sd.getGoods_num());
		sd.setPaid_fu(sd.getBack_fee());
		sd.setReality_sum(sd.getTransport_pay());
		sd.setSetldaisk_trade(sd.getTrade_agency());
		sd.setPaidgf_fu(sd.getTrade_agency());
		sd.setPaid_fee(sd.getDestination_fee());
		sd.setHandling_shihou(sd.getHandling_charge());
		Json json = new Json();
		// int n=csi.updateShip(d);//添加记录表
		int i = csi.updateShipManual(sd);// 修改
		if (sd.getTransport_pay() == null || sd.getTransport_pay() == "") {
			sd.setTransport_pay("0");
		}
		StringBuffer s = new StringBuffer();
		s.append("");
		boolean flag = true;
		if (checkdatas(sd.getShiping_order_num(), der.getShiping_order_num())) {
			flag = false;
			s.append("把订单号：" + der.getShiping_order_num() + "修改为"
					+ sd.getShiping_order_num() + ";");
		}
		if (checkdatas(sd.getWeituo_time(), der.getWeituo_time())) {
			flag = false;
			s.append("把委托时间：" + der.getWeituo_time() + "修改为"
					+ sd.getWeituo_time() + ";");
		}
		if (checkdatas(sd.getSend_type(), der.getSend_type())) {
			if ("0".equals(sd.getSend_type())) {
				sd.setSend_type("自提");
			}
			if ("1".equals(sd.getSend_type())) {
				sd.setSend_type("送货");
			}
			if ("0".equals(der.getSend_type())) {
				sd.setSend_type("自提");
			}
			if ("1".equals(der.getSend_type())) {
				sd.setSend_type("送货");
			}
			flag = false;
			s.append("把交接方式：" + der.getSend_type() + "修改为" + sd.getSend_type()
					+ ";");
		}
		if (checkdatas(sd.getFhdanweiname(), der.getFhdanweiname())) {
			flag = false;
			s.append("把发货人单位名称：" + der.getFhdanweiname() + "修改为"
					+ sd.getFhdanweiname() + ";");
		}
		if (checkdatas(sd.getSend_phone(), der.getSend_phone())) {
			flag = false;
			s.append("把发货人电话：" + der.getSend_phone() + "修改为"
					+ sd.getSend_phone() + ";");
		}
		if (checkdatas(sd.getSend_shouji(), der.getSend_shouji())) {
			flag = false;
			s.append("把发货人手机：" + der.getSend_shouji() + "修改为"
					+ sd.getSend_shouji() + ";");
		}
		if (checkdatas(sd.getFahuo_address(), der.getFahuo_address())) {
			flag = false;
			s.append("把发货人详细地址：" + der.getFahuo_address() + "修改为"
					+ sd.getFahuo_address() + ";");
		}

		if (checkdatas(sd.getEnd_address(), der.getEnd_address())) {
			flag = false;
			s.append("把到站：" + der.getEnd_address() + "修改为"
					+ sd.getEnd_address() + ";");

		}
		if (checkdatas(sd.getReceipt(), der.getReceipt())) {
			flag = false;
			s.append("把收货人：" + der.getReceipt() + "修改为" + sd.getReceipt() + ";");

		}
		if (checkdatas(sd.getReceipt_tel(), der.getReceipt_tel())) {
			flag = false;
			s.append("把收货人电话：" + der.getReceipt_tel() + "修改为"
					+ sd.getReceipt_tel() + ";");

		}
		if (checkdatas(sd.getReceipt_phone(), der.getReceipt_phone())) {
			flag = false;
			s.append("把收货人手机：" + der.getReceipt_phone() + "修改为"
					+ sd.getReceipt_phone() + ";");
		}
		if (checkdatas(sd.getReceipt_address(), der.getReceipt_address())) {
			flag = false;
			s.append("把详细地址：" + der.getReceipt_address() + "修改为"
					+ sd.getReceipt_address() + ";");
		}
		if (checkdatas(sd.getShdanweiname(), der.getShdanweiname())) {
			flag = false;
			s.append("把收货人单位名称：" + der.getShdanweiname() + "修改为"
					+ sd.getShdanweiname() + ";");
		}
		if (checkdatas(sd.getGoods_name(), der.getGoods_name())) {
			flag = false;
			s.append("把品名：" + der.getGoods_name() + "修改为" + sd.getGoods_name()
					+ ";");
		}
		if (checkdatas(sd.getGoods_packing(), der.getGoods_packing())) {
			flag = false;
			s.append("把包装：" + der.getGoods_packing() + "修改为"
					+ sd.getGoods_packing() + ";");
		}
		if (checkdatas(sd.getGoods_num(), der.getGoods_num())) {
			flag = false;
			s.append("把件数：" + der.getGoods_num() + "修改为" + sd.getGoods_num()
					+ ";");
		}

		if (checkfree(sd.getGoods_weight(), der.getGoods_weight())) {

			flag = false;
			s.append("把重量：" + der.getGoods_weight() + "修改为"
					+ sd.getGoods_weight() + ";");
		}
		if (checkfree(sd.getGoods_vol(), der.getGoods_vol())) {
			flag = false;
			s.append("把体积：" + der.getGoods_vol() + "修改为" + sd.getGoods_vol()
					+ ";");
		}
		/*
		 * if (checkdatas(sd.getPay_type(),der.getPay_type())) { flag = false;
		 * s.append("把体积："+der.getPay_type()+"修改为"+sd.getPay_type()+";");
		 * 
		 * } if (checkdatas(sd.getSend_type(),der.getSend_type())) { flag =
		 * false; if(s.equals("")){ s.append("交接方式"); }else { s.append(",交接方式");
		 * } }
		 */

		if (checkfree(sd.getAffirm_value(), der.getAffirm_value())) {
			flag = false;
			s.append("把投保价值：" + der.getGoods_vol() + "修改为" + sd.getGoods_vol()
					+ ";");
		}
		if (checkfree(sd.getFreight_fee(), der.getFreight_fee())) {
			flag = false;
			s.append("把运费：" + der.getFreight_fee() + "修改为"
					+ sd.getFreight_fee() + ";");
		}

		if (checkfree(sd.getPicking_fee(), der.getPicking_fee())) {
			flag = false;
			s.append("把提货费：" + der.getPicking_fee() + "修改为"
					+ sd.getPicking_fee() + ";");
		}
		if (checkfree(sd.getInsurance_fee(), der.getInsurance_fee())) {
			flag = false;
			s.append("把保价费：" + der.getInsurance_fee() + "修改为"
					+ sd.getInsurance_fee() + ";");
		}
		if (checkfree(sd.getAdorn_fee(), der.getAdorn_fee())) {
			flag = false;
			s.append("把其他费用：" + der.getAdorn_fee() + "修改为" + sd.getAdorn_fee()
					+ ";");
		}
		if (checkfree(sd.getReceivable_ground_fee(),
				der.getReceivable_ground_fee())) {
			flag = false;
			s.append("把装卸费：" + der.getReceivable_ground_fee() + "修改为"
					+ sd.getReceivable_ground_fee() + ";");
		}

		if (checkfree(sd.getUpstairs_fee(), der.getUpstairs_fee())) {
			flag = false;
			s.append("把上楼费：" + der.getUpstairs_fee() + "修改为"
					+ sd.getUpstairs_fee() + ";");
		}

		if (checkfree(sd.getSeized_fee(), der.getSeized_fee())) {
			flag = false;
			s.append("把直送费：" + der.getSeized_fee() + "修改为" + sd.getSeized_fee()
					+ ";");
		}

		if (checkfree(sd.getSeized_fee(), der.getSeized_fee())) {
			flag = false;
			s.append("把理货费：" + der.getSeized_fee() + "修改为" + sd.getSeized_fee()
					+ ";");
		}

		if (checkfree(sd.getInspect_fee(), der.getInspect_fee())) {
			flag = false;
			s.append("把开箱费：" + der.getInspect_fee() + "修改为"
					+ sd.getInspect_fee() + ";");

		}

		if (checkfree(sd.getDestination_fee(), der.getDestination_fee())) {
			flag = false;
			s.append("把代收运费：" + der.getDestination_fee() + "修改为"
					+ sd.getDestination_fee() + ";");
		}

		if (checkfree(sd.getBack_fee(), der.getBack_fee())) {
			flag = false;
			s.append("把代返款：" + der.getBack_fee() + "修改为" + sd.getBack_fee()
					+ ";");

		}
		if (checkfree(sd.getHandling_charge(), der.getHandling_charge())) {
			flag = false;
			s.append("把手续费：" + der.getHandling_charge() + "修改为"
					+ sd.getHandling_charge() + ";");

		}

		if (checkfree(sd.getRates(), der.getRates())) {
			flag = false;
			s.append("把费率：" + der.getRates() + "‰修改为" + sd.getRates() + "‰;");

		}
		if (checkfree(sd.getShouxu_feelv(), der.getShouxu_feelv())) {
			flag = false;
			s.append("把费率：" + der.getShouxu_feelv() + "‰修改为"
					+ sd.getShouxu_feelv() + "‰;");

		}
		if (checkfree(sd.getShouxu_feelv(), der.getShouxu_feelv())) {
			flag = false;
			s.append("把费率：" + der.getShouxu_feelv() + "‰修改为"
					+ sd.getShouxu_feelv() + "‰;");

		}
		if (checkdatas(sd.getPrinted(), der.getPrinted())) {
			flag = false;
			if ("1".equals(sd.getPrinted())) {
				sd.setPrinted("机打运单");
			}
			if ("0".equals(sd.getPrinted())) {
				sd.setPrinted("机打标签");
			}
			if ("1".equals(der.getPrinted())) {
				der.setPrinted("机打运单");
			}
			if ("0".equals(der.getPrinted())) {
				der.setPrinted("机打标签");
			}
			s.append("把运单打印：" + der.getPrinted() + "修改为" + sd.getPrinted()
					+ ";");
		}
		if (checkdatas(sd.getMost_urgent(), der.getMost_urgent())) {
			flag = false;
			if ("0".equals(sd.getMost_urgent())) {
				sd.setMost_urgent("否");
			}
			if ("1".equals(sd.getMost_urgent())) {
				sd.setMost_urgent("是");
			}
			if ("0".equals(der.getMost_urgent())) {
				der.setMost_urgent("否");
			}
			if ("1".equals(der.getMost_urgent())) {
				der.setMost_urgent("是");
			}
			s.append("把急货：" + der.getMost_urgent() + "修改为"
					+ sd.getMost_urgent() + ";");
		}

		if (checkdatas(sd.getIs_recept_no(), der.getIs_recept_no())) {
			flag = false;
			if ("0".equals(sd.getIs_recept_no())) {
				sd.setIs_recept_no("否");
			}
			if ("1".equals(sd.getIs_recept_no())) {
				sd.setIs_recept_no("是");
			}
			if ("0".equals(der.getIs_recept_no())) {
				der.setIs_recept_no("否");
			}
			if ("1".equals(der.getIs_recept_no())) {
				der.setIs_recept_no("是");
			}
			s.append("把要回单 ：" + der.getIs_recept_no() + "修改为"
					+ sd.getIs_recept_no() + ";");
		}
		if (checkdatas(sd.getInvoice_state(), der.getInvoice_state())) {
			flag = false;
			if ("1".equals(sd.getInvoice_state())) {
				sd.setInvoice_state("否");
			}
			if ("0".equals(sd.getInvoice_state())) {
				sd.setInvoice_state("是");
			}
			if ("1".equals(der.getInvoice_state())) {
				der.setInvoice_state("否");
			}
			if ("0".equals(der.getInvoice_state())) {
				der.setInvoice_state("是");
			}
			s.append("把要发票 ：" + der.getInvoice_state() + "修改为"
					+ sd.getInvoice_state() + ";");
		}
		if (checkdatas(sd.getKonghuo(), der.getKonghuo())) {
			flag = false;
			if ("0".equals(sd.getKonghuo())) {
				sd.setPrinted("否");
			}
			if ("1".equals(sd.getKonghuo())) {
				sd.setPrinted("是");
			}
			if ("0".equals(der.getKonghuo())) {
				der.setPrinted("否");
			}
			if ("1".equals(der.getKonghuo())) {
				der.setPrinted("是");
			}
			s.append("把控货：" + der.getKonghuo() + "修改为" + sd.getKonghuo() + ";");
		}
		if (checkdatas(sd.getFankuan_stata(), der.getFankuan_stata())) {
			flag = false;
			if ("0".equals(sd.getFankuan_stata())) {
				sd.setFankuan_stata("现返");
			}
			if ("1".equals(sd.getFankuan_stata())) {
				sd.setFankuan_stata("到返");
			}
			if ("0".equals(der.getFankuan_stata())) {
				der.setFankuan_stata("现返");
			}
			if ("1".equals(der.getFankuan_stata())) {
				der.setFankuan_stata("到返");
			}
			s.append("把付款方式：" + der.getKonghuo() + "修改为" + sd.getKonghuo()
					+ ";");
		}
		if (checkdatas(sd.getTrade_agency_stata(), der.getTrade_agency_stata())) {
			flag = false;
			if ("0".equals(sd.getTrade_agency_stata())) {
				sd.setTrade_agency_stata("现付");
			}
			if ("1".equals(sd.getTrade_agency_stata())) {
				sd.setTrade_agency_stata("到付");
			}
			if ("0".equals(der.getTrade_agency_stata())) {
				der.setTrade_agency_stata("现付");
			}
			if ("1".equals(der.getTrade_agency_stata())) {
				der.setTrade_agency_stata("到付");
			}
			s.append("把付款方式：" + der.getKonghuo() + "修改为" + sd.getKonghuo()
					+ ";");
		}
		if (checkdatas(sd.getPay_type(), der.getPay_type())) {
			flag = false;
			if ("0".equals(sd.getPay_type())) {
				sd.setPay_type("回付");
			}
			if ("1".equals(sd.getPay_type())) {
				sd.setPay_type("提付");
			}
			if ("2".equals(sd.getPay_type())) {
				sd.setPay_type("现付");
			}
			if ("3".equals(sd.getPay_type())) {
				sd.setPay_type("货到前付");
			}
			if ("6".equals(sd.getPay_type())) {
				sd.setPay_type("货到付款");
			}
			if ("4".equals(sd.getPay_type())) {
				sd.setPay_type("发货方月结");
			}
			if ("5".equals(sd.getPay_type())) {
				sd.setPay_type("收货方月结");
			}
			if ("0".equals(der.getPay_type())) {
				der.setPay_type("回付");
			}
			if ("1".equals(der.getPay_type())) {
				der.setPay_type("提付");
			}
			if ("2".equals(der.getPay_type())) {
				der.setPay_type("现付");
			}
			if ("3".equals(der.getPay_type())) {
				der.setPay_type("货到前付");
			}
			if ("6".equals(der.getPay_type())) {
				der.setPay_type("货到付款");
			}
			if ("4".equals(der.getPay_type())) {
				der.setPay_type("发货方月结");
			}
			if ("5".equals(der.getPay_type())) {
				der.setPay_type("收货方月结");
			}
			s.append("把付费方式：" + der.getPay_type() + "修改为" + sd.getPay_type()
					+ ";");
		}
		if (checkdatas(sd.getRemarks_fee(), der.getRemarks_fee())) {
			flag = false;
			s.append("把应收备注：" + der.getRemarks_fee() + "修改为"
					+ sd.getRemarks_fee() + ";");
		}
		if (checkdatas(sd.getShouliwangdian(), der.getShouliwangdian())) {
			flag = false;
			s.append("把受理网点：" + der.getShouliwangdian() + "修改为"
					+ sd.getShouliwangdian() + ";");
		}
		if (checkdatas(sd.getShipping_order_name(),
				der.getShipping_order_name())) {
			flag = false;
			s.append("把制单人：" + der.getShipping_order_name() + "修改为"
					+ sd.getShipping_order_name() + ";");
		}
		if (checkdatas(sd.getBaozhuang_name(), der.getBaozhuang_name())) {
			flag = false;
			s.append("把包装人：" + der.getBaozhuang_name() + "修改为"
					+ sd.getBaozhuang_name() + ";");
		}
		if (checkdatas(sd.getYewuyuan(), der.getYewuyuan())) {
			flag = false;
			s.append("把业务员：" + der.getYewuyuan() + "修改为" + sd.getYewuyuan()
					+ ";");
		}

		if (checkfree(sd.getTransport_pay(), der.getTransport_pay())) {
			flag = false;
			s.append("把费用总和：" + der.getTransport_pay() + "修改为"
					+ sd.getTransport_pay() + ";");

		}

		if (checkfree(sd.getTrade_agency(), der.getTrade_agency())) {
			flag = false;
			s.append("把代收货款：" + der.getTrade_agency() + "修改为"
					+ sd.getTrade_agency() + ";");
		}
		if (checkdatas(sd.getIs_recept(), der.getIs_recept())) {
			flag = false;
			s.append("把回单份数：" + der.getIs_recept() + "修改为" + sd.getIs_recept()
					+ ";");
		}
		if (checkdatas(sd.getCustom_name(), der.getCustom_name())) {
			flag = false;
			s.append("把发货客户：" + der.getCustom_name() + "修改为"
					+ sd.getCustom_name() + ";");
		}
		if (checkdatas(sd.getSend_station(), der.getSend_station())) {
			flag = false;
			s.append("把发站：" + der.getSend_station() + "修改为"
					+ sd.getSend_station() + ";");
		}
		if (checkdatas(sd.getRemarks(), der.getRemarks())) {
			flag = false;
			s.append("把备注：" + der.getRemarks() + "修改为" + sd.getRemarks() + ";");
		}
		jiLuLiShi js = new jiLuLiShi();
		js.setJilu_id(UUIDUtils.getUUID());
		js.setXiugainame(user.getUsername());
		js.setShiping_order_id(sd.getShiping_order_id());
		if (flag == true) {
		} else {
			js.setJilu_lishi(s.toString());
			System.out.println(s.toString());
			int l = sos.InsertShippjilu(js);
			if (l > 0) {
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
	 * 订单重复查询
	 */
	@RequestMapping(params = "method=getNumber")
	public @ResponseBody
	ShippingManual getShipManualLength(String number) {
		ShippingManual der = csi.getNumber(number);
		return der;
	}

	// 重复订单号个数查询
	@RequestMapping(params = "method=getAorder")
	public @ResponseBody
	String getAorder(String number) {
		int i = csi.getAorder(number);
		Json json = new Json();
		if (i > 0) {
			json.setFlag(false);
		} else {
			json.setFlag(true);
		}
		return json.toString();
	}

	// 车牌检索
	@RequestMapping(params = "method=getPlateNumberLength")
	public @ResponseBody
	String getPlateNumberLength(String number) {
		List<ShippingManual> list = csi.getPlateNumberLength(number);
		JSONObject jb = null;
		JSONArray jsons = new JSONArray();
		for (ShippingManual d : list) {
			jb = new JSONObject();
			jb.put("id", d.getTravel_card_id());
			jb.put("name", d.getPlate_number());
			jsons.add(jb);
		}
		return jsons.toString();
	}

	// 导出信息
	@RequestMapping(params = "method=outShipManual")
	public @ResponseBody
	String outShipManual(String datas, String[] headtitle, String[] fieldName,
			HttpServletResponse response, String name, String plate_number,
			String type, String start_date, String end_date) {
		String filename = "运单信息导出";
		ShippingManual list1 = new ShippingManual();
		List<ShippingManual> list = csi.getShipManualAll(name, plate_number,
				type, start_date, end_date);
		for (ShippingManual shippingManual : list) {

			if (shippingManual.getSend_type().equals("1")) {
				list1.setSend_type("");
			}
		}

		// ExportExcel<Agreement> esx= new ExportExcel<Agreement>();
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
			ExportUtils.outputHeaders(headtitle, workbook, "运单信息导出");
			// 调用工具类生成内容
			ExportUtils.outputColums(fieldName, list, workbook, 1, "运单信息导出");
			workbook.write(ouputStream);
			ouputStream.flush();
			ouputStream.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 协议制作订单查询方法
	 * 
	 * @param rows
	 * @param page
	 * @param id
	 * @param type
	 * @param start_date
	 * @param end_date
	 * @return
	 */
	@RequestMapping(params = "method=getShipManualCA")
	public @ResponseBody
	Map getShipManualCA(String rows, String page, String id, String name,
			String phone_number, String type, String start_date, String end_date) {
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		List<ShippingManual> list = csi.getShipManualInfoCA(
				(page1 - 1) * rows1, rows1, id, name, phone_number, type,
				start_date, end_date, null, null, null);

		int count = csi.getShipManualCA(id, name, phone_number, type,
				start_date, end_date, null, null, null);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}

	// 协议制作订单查询
	@RequestMapping(params = "method=getShipManualCAM")
	public @ResponseBody
	Map getShipManualCAM(String rows, String page, String[] pid) {
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		List<ShippingManual> list = csi.getShipManualCAM((page1 - 1) * rows1,
				rows1, pid.length == 0 ? null : pid);// 当前页
		int count = pid.length;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}

	/**
	 * 签收订单
	 * 
	 * @author H
	 * @serial v1.0
	 * @time 2015.8.7
	 */

	@RequestMapping(params = "method=getSignShipManualInfo")
	public String getSignShipManualInfo() {
		return "shipping_order/signShipManual";
	}

	// 全部查询
	@RequestMapping(params = "method=getSignShipManual")
	public @ResponseBody
	Map getSignShipManual(String rows, String page, String name,
			String phone_number, String type, String start_date,
			String end_date, HttpSession session, String shipping_order_state) {
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		User user = (User) session.getAttribute(SessionInfo.SessionName);
		List<ShippingManual> list = csi.getSignShipManual((page1 - 1) * rows1,
				rows1, name, phone_number, type, start_date, end_date,
				shipping_order_state);

		int count = csi.getSignShipManualcount(name, phone_number, type,
				start_date, end_date, shipping_order_state);

		List<ShippingManual> list1 = csi.getSignShipManual1(
				(page1 - 1) * rows1, rows1, name, phone_number, type,
				start_date, end_date, user.getDid(), shipping_order_state);

		int count1 = csi.getSignShipManualcount1(name, phone_number, type,
				start_date, end_date, user.getDid(), shipping_order_state);

		Map<String, Object> map = new HashMap<String, Object>();

		list.addAll(list1);
		System.out.println(list.size());
		map.put("total", (count + count1));
		map.put("rows", list);
		return map;
	}

	// 全部查询
	/**
	 * 协议制作订单查询方法
	 * 
	 * @param rows
	 * @param page
	 * @param id
	 * @param type
	 * @param start_date
	 * @param end_date
	 * @return
	 */
	@RequestMapping(params = "method=getSignShipManualCA")
	public @ResponseBody
	Map getSignShipManualCA(String rows, String page, String id, String name,
			String phone_number, String type, String start_date,
			String end_date, String send_station, String end_address,
			String car_number) {
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		List<ShippingManual> list = csi.getShipManualInfoCA(
				(page1 - 1) * rows1, rows1, id, name, phone_number, type,
				start_date, end_date, send_station, end_address, car_number);

		int count = csi.getShipManualCA(id, name, phone_number, type,
				start_date, end_date, send_station, end_address, car_number);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}

	@RequestMapping(params = "method=getUpdateSignShipManual")
	public @ResponseBody
	ShippingManual getUpdateSignShipManual(String id) {
		ShippingManual der = csi.getUpdateSignShipManual(id);
		return der;
	}

	// 跳转编辑页面并且获取id 返回到页面
	@RequestMapping(params = "method=getEditSignShipManualPage")
	public String getEditSignShipManualPage(String pid, String isok,
			HttpServletRequest request) {
		request.setAttribute("flg", pid);
		request.setAttribute("isok", isok);
		return "shipping_manual/EditSignShipManual";
	}

	@RequestMapping(params = "method=getimgurl")
	public String getimgurl(String iurl, HttpServletRequest request) {
		request.setAttribute("iurl", iurl);
		return "shipping_manual/orderImg";
	}

	// 判断是否核对正确（数据核对）
	public boolean checkdatas(String num1, String num2) {
		boolean flag = false;
		if ((num1 == null || num1.equals(""))
				&& (num2 != null && !num2.equals(""))) {

			flag = true;
		} else if ((num2 == null || num2.equals(""))
				&& (num1 != null && !num1.equals(""))) {
			flag = true;

		} else if ((num2 != null && !num2.equals(""))
				&& (num1 != null && !num1.equals("")) && !num1.equals(num2)) {
			flag = true;

		} else {
			flag = false;
		}
		return flag;
	}

	// 判断是否核对正确（数据核对）
	public boolean checkfree(String num1, String num2) {
		boolean flag = false;
		if ((num1 == null || num1.equals(""))
				&& (num2 != null && !num2.equals(""))) {

			flag = true;
		} else if ((num2 == null || num2.equals(""))
				&& (num1 != null && !num1.equals(""))) {
			flag = true;

		} else if ((num2 != null && !num2.equals(""))
				&& (num1 != null && !num1.equals(""))) {
			Float ff = Float.parseFloat(num1);
			Float fss = Float.parseFloat(num2);
			if (!ff.equals(fss)) {
				flag = true;
			} else {
				flag = false;
			}
		}
		return flag;
	}

	// 跳转编辑页面并且获取id 返回到页面
	@RequestMapping(params = "method=saveSignShipManual")
	public @ResponseBody
	Json saveSignShipManual(Sign_order sign_order) {
		sign_order.setSign_id(UUIDUtils.getUUID());
		int i = 0;
		csi.updatestate(sign_order.getOrder_id());
		Json json = new Json();
		i = csi.saveSignShipManual(sign_order);
		if (i > 0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}

	@RequestMapping(params = "method=getQrcode")
	public void getQrcode(HttpServletResponse response, String orderId) {
		String content = orderId;
		QRCodeEncoderHandler handler = new QRCodeEncoderHandler();
		BufferedImage bi = handler.encoderQRCode(content, 3);
		try {
			ImageIO.write(bi, "png", response.getOutputStream());
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("encoder QRcode success");
	}

	@RequestMapping(params = "method=getdbrcode")
	public void getdbrcode(HttpServletResponse response, String orderId) {
		String format = MimeTypes.MIME_JPEG;// MimeTypes.MIME_JPEG

		String text = orderId;

		ByteArrayOutputStream bout = null;
		try {
			BarcodeUtil util = BarcodeUtil.getInstance();

			Configuration cfg = buildCfg();
			BarcodeGenerator gen = util.createBarcodeGenerator(cfg);

			bout = new ByteArrayOutputStream(4096);

			int dpi = 250; // 分辨率
			int orientation = 0;

			BitmapCanvasProvider bitmap = new BitmapCanvasProvider(bout,
					format, dpi, BufferedImage.TYPE_BYTE_BINARY, false,
					orientation);

			gen.generateBarcode(bitmap, text);
			bitmap.finish();
			response.setContentType(format);
			response.setContentLength(bout.size());
			response.getOutputStream().write(bout.toByteArray());
			response.getOutputStream().flush();

		} catch (Exception e) {
			// log.error("Error while generating barcode", e);
		} finally {
			if (bout != null) {
				try {
					bout.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

		}
	}

	public static Configuration buildCfg() {
		DefaultConfiguration cfg = new DefaultConfiguration("barcode");
		// Get type

		String type = "code128";
		DefaultConfiguration child = new DefaultConfiguration(type);
		cfg.addChild(child);
		return cfg;
	}

	private String createXML(List<ShippingManual> list) {
		Document document = DocumentHelper.createDocument();
		Element root = document.addElement("xml");
		Iterator<ShippingManual> it = list.iterator();
		while (it.hasNext()) {
			ShippingManual so = it.next();
			Element edept = root.addElement("Detail");
			edept.addElement("shiping_order_num").addText(
					so.getShiping_order_num() + "");
			edept.addElement("receipt").addText("123");
			edept.addElement("receipt_tel").addText("123");
			edept.addElement("receipt_address").addText("123");

		}
		String xmlString = document.asXML();
		return xmlString;
	}

	/**
	 * 手动录入核对跳转页面
	 * **/
	@RequestMapping(params = "method=checkData")
	public String checkData(String checkarray, HttpServletRequest request) {
		// System.out.println("id:"+checkarray);
		request.setAttribute("flg", checkarray);
		return "shipping_manual/CheckData";
	}

	/**
	 * 手动录入核对
	 * **/
	/* @RequestMapping(params ="method=getCheckData") */
	public Json getCheckData(String pid, ShippingOrder sd) {
		ShippingOrder der = spp.getUpdateShipOrder(pid);
		sd.setShiping_order_id(pid);

		Json json = new Json();// 1 正常
		StringBuffer s = new StringBuffer();
		s.append("");
		boolean flag = true;
		if (checkdatas(sd.getShiping_order_num(), der.getShiping_order_num())) {
			flag = false;
			if (s.equals("")) {
				s.append("订单号");
			} else {
				s.append(",订单号");
			}
		}
		/*
		 * if (!sd.getSend_station().equals(der.getSend_station())) {
		 * 
		 * System.out.println(sd.getSend_station()+"页面的");
		 * System.out.println(der.getSend_station()+"数据库来的");
		 * System.out.println("//////////////////////////////"); flag=false;
		 * if(s.equals("")){ s.append("发站"); }else{ s.append(",发站"); }
		 * 
		 * }
		 */
		/*
		 * if (!sd.getCustom_name().equals(der.getCustom_name())) {
		 * System.out.println(sd.getCustom_name()+"页面的");
		 * System.out.println(der.getCustom_name()+"数据库来的"); flag=false;
		 * if(s.equals("")){ s.append("发货人名称"); }else { s.append(",发货人名称"); } }
		 */
		if (checkdatas(sd.getSend_phone(), der.getSend_phone())) {
			flag = false;
			if (s.equals("")) {
				s.append("发货人电话");
			} else {
				s.append(",发货人电话");
			}
		}

		if (checkdatas(sd.getEnd_address(), der.getEnd_address())) {
			flag = false;
			if (s.equals("")) {
				s.append("到站");
			} else {
				s.append(",到站");
			}

		}
		if (checkdatas(sd.getReceipt(), der.getReceipt())) {
			flag = false;
			if (s.equals("")) {
				s.append("收货人");
			} else {
				s.append(",收货人");
			}
		}
		if (checkdatas(sd.getReceipt_tel(), der.getReceipt_tel())) {
			flag = false;
			if (s.equals("")) {
				s.append("收货人电话");
			} else {
				s.append(",收货人电话");
			}
		}
		if (checkdatas(sd.getReceipt_phone(), der.getReceipt_phone())) {
			flag = false;
			if (s.equals("")) {
				s.append("收货人手机");
			} else {
				s.append(",收货人手机");
			}
		}
		if (checkdatas(sd.getReceipt_address(), der.getReceipt_address())) {
			flag = false;
			if (s.equals("")) {
				s.append("详细地址");
			} else {
				s.append(",详细地址");
			}
		}
		if (checkdatas(sd.getGoods_name(), der.getGoods_name())) {
			flag = false;
			if (s.equals("")) {
				s.append("品名");
			} else {
				s.append(",品名");
			}
		}
		if (checkdatas(sd.getGoods_packing(), der.getGoods_packing())) {
			flag = false;
			if (s.equals("")) {
				s.append("包装");
			} else {
				s.append(",包装");
			}
		}
		if (checkdatas(sd.getGoods_num(), der.getGoods_num())) {
			flag = false;
			if (s.equals("")) {
				s.append("件数");
			} else {
				s.append(",件数");
			}
		}

		if (checkfree(sd.getGoods_weight(), der.getGoods_weight())) {

			flag = false;
			if (s.equals("")) {
				s.append("重量");
			} else {
				s.append(",重量");
			}
		}
		if (checkfree(sd.getGoods_vol(), der.getGoods_vol())) {
			flag = false;
			if (s.equals("")) {
				s.append("体积");
			} else {
				s.append(",体积");
			}
		}
		if (checkdatas(sd.getTransport_mode(), der.getTransport_mode())) {
			flag = false;
			if (s.equals("")) {
				s.append("运输方式");
			} else {
				s.append(",运输方式");
			}
		}
		if (checkdatas(sd.getSend_type(), der.getSend_type())) {
			flag = false;
			if (s.equals("")) {
				s.append("交接方式");
			} else {
				s.append(",交接方式");
			}
		}

		if (checkfree(sd.getFreight_fee(), der.getFreight_fee())) {
			flag = false;
			if (s.equals("")) {
				s.append("运费");
			} else {
				s.append(",运费");
			}
		}

		if (checkfree(sd.getPicking_fee(), der.getPicking_fee())) {
			flag = false;
			if (s.equals("")) {
				s.append("提货费");
			} else {
				s.append(",提货费");
			}
		}
		if (checkfree(sd.getInsurance_fee(), der.getInsurance_fee())) {
			flag = false;
			if (s.equals("")) {
				s.append("保价费");
			} else {
				s.append(",保价费");
			}
		}
		if (checkfree(sd.getAdorn_fee(), der.getAdorn_fee())) {
			flag = false;
			if (s.equals("")) {
				s.append("其他费用");
			} else {
				s.append(",其他费用");
			}
		}
		if (checkfree(sd.getReceivable_ground_fee(),
				der.getReceivable_ground_fee())) {
			flag = false;
			if (s.equals("")) {
				s.append("装卸费");
			} else {
				s.append(",装卸费");
			}
		}

		if (checkfree(sd.getUpstairs_fee(), der.getUpstairs_fee())) {
			flag = false;
			if (s.equals("")) {
				s.append("上楼费");
			} else {
				s.append(",上楼费");
			}
		}

		if (checkfree(sd.getSeized_fee(), der.getSeized_fee())) {
			flag = false;
			if (s.equals("")) {
				s.append("直送费");
			} else {
				s.append(",直送");
			}
		}

		if (checkfree(sd.getSeized_fee(), der.getSeized_fee())) {
			flag = false;
			if (s.equals("")) {
				s.append("理货费");
			} else {
				s.append(",理货费");
			}
		}

		if (checkfree(sd.getInspect_fee(), der.getInspect_fee())) {
			flag = false;
			if (s.equals("")) {
				s.append("开箱费");
			} else {
				s.append(",开箱费");
			}
		}

		if (checkfree(sd.getDestination_fee(), der.getDestination_fee())) {
			flag = false;
			if (s.equals("")) {
				s.append("到付款");
			} else {
				s.append(",到付款");
			}
		}

		if (checkfree(sd.getBack_fee(), der.getBack_fee())) {
			flag = false;
			if (s.equals("")) {

				s.append("回扣");
			} else {
				s.append(",回扣");
			}
		}
		if (checkdatas(sd.getRemarks_fee(), der.getRemarks_fee())) {
			flag = false;
			if (s.equals("")) {
				s.append("应收备注");
			} else {
				s.append(",应收备注");
			}
		}
		if (checkdatas(sd.getPay_type(), der.getPay_type())) {
			flag = false;
			if (s.equals("")) {
				s.append("付费方式");
			} else {
				s.append(",付费方式");
			}
		}

		if (checkfree(sd.getTransport_pay(), der.getTransport_pay())) {
			flag = false;
			if (s.equals("")) {
				s.append("费用总和");
			} else {
				s.append(",费用总和");
			}
		}

		if (checkfree(sd.getTrade_agency(), der.getTrade_agency())) {
			flag = false;
			if (s.equals("")) {

				s.append("代收款");
			} else {
				s.append(",代收款");
			}
		}
		if (checkdatas(sd.getIs_recept(), der.getIs_recept())) {
			flag = false;
			if (s.equals("")) {
				s.append("回单份数");
			} else {
				s.append(",回单份数");
			}
		}
		if (checkdatas(sd.getInvoice_state(), der.getInvoice_state())) {
			flag = false;
			if (s.equals("")) {
				s.append("是否开票");
			} else {
				s.append(",是否开票");
			}
		}
		if (checkfree(sd.getDuty_rate(), der.getDuty_rate())) {

			flag = false;
			if (s.equals("")) {
				s.append("税率");
			} else {
				System.out.println("税率" + sd.getDuty_rate());
				System.out.println("税率" + der.getDuty_rate());
				s.append(",税率");
			}
		}
		if (checkdatas(sd.getRemarks(), der.getRemarks())) {
			flag = false;
			if (s.equals("")) {
				s.append("备注");
			} else {
				s.append(",备注");
			}
		}
		if (flag == true) {

			int i = csi.updateCheck(sd);
			if (i > 0) {
				json.setAns("1");
			}

		} else {
			json.setAns(s.toString());
		}

		return json;
	}

	/**
	 * 运单审核跳转
	 * **/
	@RequestMapping(params = "method=getCheckshPing")
	public String getCheckshPing() {

		return "shipping_manual/CheckShip";
	}

	/**
	 * 运单审核查询
	 * **/
	@RequestMapping(params = "method=getShipCheckInfo")
	public @ResponseBody
	Map getShipCheckInfo(String rows, String page, String check_shping_time,
			String shiping_order_id, String send_type, String custom_name,
			String shipping_order_state, String receipt, String goods_name,
			HttpServletRequest request) {
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
		List<ShippingOrder> list = csi.getShipCheckInfo((page1 - 1) * rows1,
				rows1, check_shping_time, shiping_order_id, send_type,
				custom_name, shipping_order_state, receipt, goods_name,
				user.getId());
		int count = csi.getShipCheckInfoConun(check_shping_time,
				shiping_order_id, send_type, custom_name, shipping_order_state,
				receipt, goods_name, user.getId());
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("total", count);
		map.put("rows", list);
		return map;

	}

	/**
	 * 手动录入添加查询跳转
	 * */
	@RequestMapping(params = "method=getcustomSelect")
	public String getcustomSelect(String name, HttpServletRequest request) {
		request.setAttribute("name", name);
		return "shipping_manual/CustomerFahuo";
	}

	@RequestMapping(params = "method=getCustomerFahuo")
	public @ResponseBody
	Map getCustomerFahuo(String rows, String page, String name) {
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		List<CustomerModel> list = csi.getCustomerFahuo((page1 - 1) * rows1,
				rows1, name);
		int count = csi.getCustomerFahuoCount(name);
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("total", count);
		map.put("rows", list);
		return map;
	}

	/**
	 * 手动录入添加查询跳转
	 * */
	@RequestMapping(params = "method=getcustomSelectShou")
	public String getcustomSelectShou(String name, HttpServletRequest request) {
		request.setAttribute("name", name);
		return "shipping_manual/CustomerShouHuo";
	}

	@RequestMapping(params = "method=getCustomerShouHuo")
	public @ResponseBody
	Map getCustomerShouHuo(String rows, String page, String name) {
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		List<CustomerModel> list = csi.getCustomerShouHuo((page1 - 1) * rows1,
				rows1, name);
		int count = csi.getCustomerShouHuoCount(name);
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("total", count);
		map.put("rows", list);
		return map;
	}

}
