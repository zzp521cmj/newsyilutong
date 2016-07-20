package com.jy.action;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import org.apache.ibatis.annotations.Param;
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
import com.jy.common.HttpSenderTest;
import com.jy.common.OrderExcelForPOI;
import com.jy.common.QRCodeEncoderHandler;
import com.jy.common.SessionInfo;
import com.jy.common.UUIDUtils;
import com.jy.csaction.BaseAction;
import com.jy.dao.Json;
import com.jy.dao.ShippingOrderDao;
import com.jy.model.Company;
import com.jy.model.Department;
import com.jy.model.MsgModel;
import com.jy.model.OrderCustom;
import com.jy.model.OrderHistory;
import com.jy.model.ShipperOrderImg;
import com.jy.model.ShippingOrder;
import com.jy.model.Sign_order;
import com.jy.model.User;
import com.jy.model.jiLuLiShi;
import com.jy.model.shipmentStatistics;
import com.jy.service.CompanyInfoService;
import com.jy.service.DepartmentService;
import com.jy.service.OrderInfoService;
import com.jy.service.ShippingOrderInfoService;
import com.jy.service.impl.OrderInfoServiceImpl;
/*
 * 货运订单管理
 * */
@Controller
@RequestMapping(value = "/shipOrder.do")
public class ShippingOrderInfoController  extends BaseAction{
	@Resource
	private ShippingOrderInfoService spp;
	@Resource
	private OrderInfoService OrderInfoService ;
	@Resource
	private DepartmentService depnService;
	@Resource
	private ShippingOrderInfoService csi;
	@Resource
	private OrderInfoService ocs;
	@Resource
	private ShippingOrderDao sos;
	@Resource
	private CompanyInfoService cif; 
	@RequestMapping(params = "method=getShipOrderInfo")
	public String getShipOrderInfoMan() {
		return "shipping_order/shippingOrderInfo";
	}

	// 跳转编辑页面并且获取合同的id 返回到页面
	@RequestMapping(params = "method=getEditShipOrderPage")
	public String getEditShipOrderPage(String pid, HttpServletRequest request) {
		request.setAttribute("flg", pid);
		return "shipping_order/EditShipOrder";
	}

	@RequestMapping(params = "method=getShipOrderPage")
	public String getShipOrderPage(String pid, HttpServletRequest request) {
		request.setAttribute("flg", pid);
		return "shipping_order/SearchShipOrder";
	}
	//打印
	@RequestMapping(params = "method=getShipOrderPrint")
	public String getShipOrderPrint(String pid, HttpServletRequest request) {
		ShippingOrder d = getUpdateShipOrder(pid);
		//是否回单
		if ("0".equals(d.getIs_recept_no())) {
			d.setIs_recept_no("√");
		} else if ("1".equals(d.getIs_recept_no())) {
			d.setIs_recept_no1("√");
		}
		//是否投保
		if ("".equals(d.getAffirm_value())&&d.getAffirm_value()==null) {
			d.setAffirm_value1("√");
			System.out.println(d.getAffirm_value1()+"1");
		} else {
			d.setAffirm_value2("√");
			System.out.println(d.getAffirm_value2()+"2");
		}
		//交接方式
		if ("0".equals(d.getSend_type())) {
			d.setSend_type0("√");
		} else if ("1".equals(d.getSend_type())) {
			d.setSend_type1("√");
		} else if ("2".equals(d.getSend_type())) {
			d.setSend_type2("√");
		} else if ("3".equals(d.getSend_type())) {
			d.setSend_type3("√");
		} else if ("4".equals(d.getSend_type())) {
			d.setSend_type4("√");
		}
		//付款方式
		if ("0".equals(d.getPay_type())) {  
			d.setPay_type1("√");
		} else if ("6".equals(d.getPay_type())) {
			d.setPay_type2("√");
		}
		if ("2".equals(d.getPay_type())) {  
			d.setPay_type3("√");
		} else if ("4".equals(d.getPay_type())||"5".equals(d.getPay_type())) {
			d.setPay_type4("√");
		}
		System.out.println(d.getPay_type()+"///////////////////////");
		request.setAttribute("sp", d);
		return "shipping_order/printer";
	}
	
	//打印一维码
	@RequestMapping(params = "method=getShipOrderPrintYwm")
	public String getShipOrderPrintYWM(String[] checkarray, HttpServletRequest request) {
		StringBuffer s=new StringBuffer();
		for(int i=0;i<checkarray.length;i++){
			s.append(checkarray[i]+",");
		}
		String num=s.substring(0,s.lastIndexOf(","));
		request.setAttribute("sp",num);
		return "shipping_order/printYWM";
	}
	//输出一维码
		@RequestMapping(params = "method=getShipYwm")
		public @ResponseBody String getShipYWM(String order_num, HttpServletResponse response) {
			String[] s=order_num.split(",");
			List<ShippingOrder> d = csi.getUpdateShipOrderArray(s);
			JSONObject obje=new JSONObject();
			obje.accumulate("Detail", d);
			return obje.toString();
		}
		/**
		 * 跳转电话预约界面
		 * */
    @RequestMapping(params ="method=phoneBooking")		
    public String phoneBooking(String checkarray, HttpServletRequest request){
    	//System.out.println(checkarray+"!!!!!!!");
    	request.setAttribute("flg", checkarray);
    	return "shipping_order/phoneBooking";
    }
	// 导入
	@RequestMapping(params = "method=imp")
	public String goimp() {
		return "shipping_order/maplinimp";
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
		File newfile = filez.createTempFile("shipOrder", prefix, filez);
		// System.out.println(newfile);
		String filesname = newfile.toString();
		filesname = filesname.substring(filesname.lastIndexOf("\\") + 1,
				filesname.length());
		request.setAttribute("filesname", filesname);
		myfile.transferTo(newfile);
		return "shipping_order/maplinimp";
	}

	// 上传开始保存到数据库
	@RequestMapping(params = "method=implinplan")
	public @ResponseBody
	String implinplan(HttpServletRequest request, String filename,String usersname,String pid) {
		String filepath = request.getSession().getServletContext()
				.getRealPath("WebRoot/orderFiles/" + filename);
		OrderExcelForPOI oef = new OrderExcelForPOI();
		String flag = "";
		try {
			flag = oef.impExcel(filepath,usersname,pid,request);
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
	@RequestMapping(params = "method=getShipOrder")
	public @ResponseBody
	Map getShipOrderInfo(String rows, String page, String name,
			String phone_number, String type, String start_date, String end_date,String pid,String phone,String order_state,String pay_type,String send_address,String weitoudanhao,HttpServletRequest request) {
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		User user=(User)request.getSession().getAttribute(SessionInfo.SessionName);
		List<ShippingOrder> list = csi.getShipOrderInfo((page1 - 1) * rows1,
				rows1, name, phone_number, type, start_date, end_date,pid,phone, order_state, pay_type, send_address,user.getId(),weitoudanhao);
		for (ShippingOrder sd : list) {
	        if (sd.getStocks_predestination() == null) {
	        	sd.setStocks_predestination("0");
			}
		}
		int count = csi.getShipOrder(name, phone_number, type, start_date,
				end_date,pid, phone, order_state, pay_type, send_address,user.getId(),weitoudanhao);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}

	/*
	 * 批量删除
	 */
	@RequestMapping(params = "method=deleteShipOrder")
	public @ResponseBody
	Json delShipOrder(String[] del) {
		Json json = new Json();
		csi.deleteShipToDemand(del);
		csi.deleteOrders(del);
		csi.deleteOrderEH(del);
		int truck = csi.deleteShipOrder(del);
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
		int num=csi.deleteOrderHistory(del);
		int truck = csi.isNotArrive(del);
		if (truck > 0&&num>0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}
	//发送短信
	@RequestMapping(params="method=sendOrderMsg")
	public @ResponseBody Json sendOrderMsg(String phone,String orderMsg){
		HttpSenderTest.pushMassage(phone, orderMsg);
		Json json=new Json();
		int truck=1;
		if (truck > 0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}
	//保存消息模板zzp添加
	@RequestMapping(params="method=sendMsgModelInfo")
	public @ResponseBody Json sendMsgModelInfo(String msgTitle,String msgContent){
		
		int truck=csi.sendMsgModelInfo(msgTitle,msgContent);
		Json json=new Json();
		if (truck > 0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}
	//消息模板selectzzp添加
		
		@RequestMapping(params="method=getMsgModel")
		public @ResponseBody List<Map<String, Object>> getMsgModel() {
			List<MsgModel> type = csi.getMsgModel();
			List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
			Map<String, Object> map = null;
			for (MsgModel rt : type) {
				map = new HashMap<String, Object>();
				map.put("id",rt.getModel_id());
				map.put("text", rt.getModel_title());
				list.add(map);
			}
			return list;
		}
		
		//保存消息模板zzp添加
		@RequestMapping(params="method=getMsgContent")
		public @ResponseBody String getMsgContent(String msgid){
			String truck=csi.sendMsgContent(msgid);
			return truck;
		}
	/*
	 * 批量达到
	 */
	@RequestMapping(params = "method=isArrive")
	public @ResponseBody
	Json isArrive(String[] del,String[] num,String custom_id) {
		List<OrderHistory> order=new ArrayList<OrderHistory>();
		for(int i=0;i<num.length;i++){
			OrderHistory h=new OrderHistory();
			h.setOrder_history_id(UUIDUtils.getUUID());
			h.setOrder_arrive_time(UUIDUtils.getUUID());
			h.setOrders_id(del[i]);
			h.setOrder_arrive_time(DateFormat.getDateTimeInstance().format(new Date()));
			h.setGoods_arrive_remakes(h.getOrder_arrive_time()+"---订单号为"+num[i]+"已经确认到达！");
			order.add(h);
		}
		int count=csi.saveOrderHistory(order);
		Json json = new Json();
		int numCutom=csi.isArriveCoustom(custom_id);
		int truck = csi.isArrive(del);
		if (truck > 0&& count>0 && numCutom >0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}
	// 跳转到添加页面
	@RequestMapping(params = "method=addShipOrder")
	public String addShipOrder(String pid,HttpServletRequest request) {
		request.setAttribute("flg", pid);
		return "shipping_order/AddShipOrder";
	}

	// 保存
	@RequestMapping(params = "method=saveShipOrder")
	public @ResponseBody
	Json saveShipOrder(ShippingOrder d,HttpServletRequest request) {
		User user=(User)request.getSession().getAttribute(SessionInfo.SessionName);
		shipmentStatistics ss = new shipmentStatistics();
	 	
		Json json = new Json();
		OrderCustom oc=ocs.getUpdateOrderCustom(d.getCustom_id());
		d.setPractiacl_num(d.getGoods_num());;
	    //d.setInvoice_state("0");
	    d.setCreat_type("4");
		d.setCar_number(oc.getCar_number());
		d.setCustom_name(oc.getCustom_name());
		d.setSend_station(oc.getSend_station());
		d.setSend_time(oc.getSend_time());
		d.setShiping_order_id(UUIDUtils.getUUID());
		d.setUpdatetime(DateFormat.getDateTimeInstance().format(new Date()));		
		d.setUser_id(user.getId());
		d.setCustomer_id(oc.getCustomer_id());
		d.setPaid_fu(d.getBack_fee());
		d.setReality_sum(d.getTransport_pay());
		d.setSetldaisk_trade(d.getTrade_agency());
		d.setPaidgf_fu(d.getTrade_agency());
		d.setPaid_fee(d.getDestination_fee());
		d.setHandling_shihou(d.getHandling_charge());
		if (oc.getCustomer_id()!=null || oc.getCustomer_id()!="") {
			 ss.setCustomer_id(oc.getCustomer_id());
		}      
        ss.setOrder_time(DateFormat.getDateTimeInstance().format(new Date()));
        ss.setShipment_statistics_id(UUIDUtils.getUUID());

		int truck = csi.saveShipOrder(d);
		ss.setTotality(truck);
		if (ss!=null) {
			@SuppressWarnings("unused")
			int groos = OrderInfoService.insertIntoShipStatis(ss);
		}
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
	@RequestMapping(params = "method=getUpdateShipOrder")
	public @ResponseBody
	ShippingOrder getUpdateShipOrder(String id) {
		ShippingOrder der = csi.getUpdateShipOrder(id);
		return der;
	}

	// 导入页面
	@RequestMapping(params = "method=inputShipOrder")
	public String inputShipOrder() {
		return "driver/InputDriver";
	}
	//判断是否核对正确（数据核对）
	public static boolean checkdatas(String num1,String num2){
			boolean flag=false;
			if((num1==null||num1.equals(""))&&(num2!=null&&!num2.equals(""))){
				
				flag=true;
			}else if((num2==null||num2.equals(""))&&(num1!=null&&!num1.equals(""))){
				flag=true;
				
			}else if((num2!=null&&!num2.equals(""))&&(num1!=null&&!num1.equals(""))&&!num1.equals(num2)){
				flag=true;
				
			}else{
				flag=false;
			}
			return flag;
		}
		//判断是否核对正确（数据核对）
		public static boolean checkfree(String num1,String num2){
				boolean flag=false;
				if((num1==null||num1.equals(""))&&(num2!=null&&!num2.equals(""))){
					
					flag=true;
				}else if((num2==null||num2.equals(""))&&(num1!=null&&!num1.equals(""))){
					flag=true;
					
				}else if((num2!=null&&!num2.equals(""))&&(num1!=null&&!num1.equals(""))){
					Float ff = Float.parseFloat(num1);
					 Float fss = Float.parseFloat(num2);
					 if(!ff.equals(fss)){
						 flag=true;
					 }else{
						 flag=false;
					 }
				}
				return flag;
			}
	// 修改
	@RequestMapping(params = "method=updateShipOrder")
	public @ResponseBody
	Json updateShipOrder(ShippingOrder sd,HttpServletRequest request) {
		User user=(User)request.getSession().getAttribute(SessionInfo.SessionName);
		ShippingOrder der = spp.getUpdateShipOrder(sd.getShiping_order_id());
		
		sd.setEhistory_id(UUIDUtils.getUUID());
		sd.setEdit_order(user.getUsername());
		sd.setPractiacl_num(sd.getGoods_num());
		
		sd.setPaid_fu(sd.getBack_fee());
		sd.setReality_sum(sd.getTransport_pay());
		sd.setSetldaisk_trade(sd.getTrade_agency());
		sd.setPaidgf_fu(sd.getTrade_agency());
		sd.setPaid_fee(sd.getDestination_fee());
		sd.setHandling_shihou(sd.getHandling_charge());
		sd.setUpdatetime(DateFormat.getDateTimeInstance().format(new Date()));
		if (sd.getTransport_pay() == null || sd.getTransport_pay() =="") {
			sd.setTransport_pay("0");
		}
		int i = csi.updateShipOrder(sd);//修改
		//spp.getCheckData(d.getShiping_order_id(),d);
		Json json = new Json();// 1 正常
		StringBuffer s = new StringBuffer();
		s.append("");
		boolean flag=true;
		if (checkdatas(sd.getShiping_order_num(),der.getShiping_order_num())) {
			flag=false;			
			s.append("把订单号："+der.getShiping_order_num()+"修改为"+sd.getShiping_order_num()+";");			
		} 
		if (checkdatas(sd.getWeituo_time(),der.getWeituo_time())) {
			flag=false;
			s.append("把委托时间："+der.getWeituo_time()+"修改为"+sd.getWeituo_time()+";");							
		}
		if (checkdatas(sd.getSend_type(),der.getSend_type())) {
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
			flag=false;
			s.append("把交接方式："+der.getSend_type()+"修改为"+sd.getSend_type()+";");							
		}
		if (checkdatas(sd.getFhdanweiname(),der.getFhdanweiname())) {
			flag=false;
			s.append("把发货人单位名称："+der.getFhdanweiname()+"修改为"+sd.getFhdanweiname()+";");							
		}
		if (checkdatas(sd.getSend_phone(),der.getSend_phone())) {
			flag=false;
			s.append("把发货人电话："+der.getSend_phone()+"修改为"+sd.getSend_phone()+";");							
		}
		if (checkdatas(sd.getSend_shouji(),der.getSend_shouji())) {
			flag=false;
			s.append("把发货人手机："+der.getSend_shouji()+"修改为"+sd.getSend_shouji()+";");							
		}
		if (checkdatas(sd.getFahuo_address(),der.getFahuo_address())) {
			flag=false;
			s.append("把发货人详细地址："+der.getFahuo_address()+"修改为"+sd.getFahuo_address()+";");
		}

		if (checkdatas(sd.getEnd_address(),der.getEnd_address())) {
		    flag = false;
		    s.append("把到站："+der.getEnd_address()+"修改为"+sd.getEnd_address()+";");
			
		}
		if (checkdatas(sd.getReceipt(),der.getReceipt())) {
			   flag = false;
			   s.append("把收货人："+der.getReceipt()+"修改为"+sd.getReceipt()+";");
			
		}
		if (checkdatas(sd.getReceipt_tel(),der.getReceipt_tel())) {
			   flag = false;
			   s.append("把收货人电话："+der.getReceipt_tel()+"修改为"+sd.getReceipt_tel()+";");
			
		}
		if (checkdatas(sd.getReceipt_phone(),der.getReceipt_phone())) {
			flag = false;
			 s.append("把收货人手机："+der.getReceipt_phone()+"修改为"+sd.getReceipt_phone()+";");			
		}
		if (checkdatas(sd.getReceipt_address(),der.getReceipt_address())) {
			flag = false;
			 s.append("把详细地址："+der.getReceipt_address()+"修改为"+sd.getReceipt_address()+";");						
		}
		if (checkdatas(sd.getShdanweiname(),der.getShdanweiname())) {
			flag = false;
			 s.append("把收货人单位名称："+der.getShdanweiname()+"修改为"+sd.getShdanweiname()+";");						
		}
		if (checkdatas(sd.getGoods_name(),der.getGoods_name())) {
			flag = false;
			s.append("把品名："+der.getGoods_name()+"修改为"+sd.getGoods_name()+";");			   		
		}
		if (checkdatas(sd.getGoods_packing(),der.getGoods_packing())) {
			flag = false;
			s.append("把包装："+der.getGoods_packing()+"修改为"+sd.getGoods_packing()+";");					
		}
		if (checkdatas(sd.getGoods_num(),der.getGoods_num())) {
			flag = false;
			s.append("把件数："+der.getGoods_num()+"修改为"+sd.getGoods_num()+";");					
		}

		if (checkfree(sd.getGoods_weight(),der.getGoods_weight())) {

			flag = false;
			s.append("把重量："+der.getGoods_weight()+"修改为"+sd.getGoods_weight()+";");						
		}
		if (checkfree(sd.getGoods_vol(),der.getGoods_vol())) {
			flag = false;
			s.append("把体积："+der.getGoods_vol()+"修改为"+sd.getGoods_vol()+";");							
		}
/*		if (checkdatas(sd.getPay_type(),der.getPay_type())) {
			flag = false;
			s.append("把体积："+der.getPay_type()+"修改为"+sd.getPay_type()+";");							
	
		}
		if (checkdatas(sd.getSend_type(),der.getSend_type())) {
			flag = false;
		    if(s.equals("")){
		    	s.append("交接方式");
			}else {
				s.append(",交接方式");
			}	
		}*/
		
		if (checkfree(sd.getAffirm_value(),der.getAffirm_value())) {
			flag = false;
			s.append("把投保价值："+der.getGoods_vol()+"修改为"+sd.getGoods_vol()+";");								
		}
		if (checkfree(sd.getFreight_fee(),der.getFreight_fee())) {
			flag = false;
			s.append("把运费："+der.getFreight_fee()+"修改为"+sd.getFreight_fee()+";");									
		}

		if (checkfree(sd.getPicking_fee(),der.getPicking_fee())) {
			flag = false;
			s.append("把提货费："+der.getPicking_fee()+"修改为"+sd.getPicking_fee()+";");											
		}
		if (checkfree(sd.getInsurance_fee(),der.getInsurance_fee())) {
			flag = false;
			s.append("把保价费："+der.getInsurance_fee()+"修改为"+sd.getInsurance_fee()+";");											
		}
		if (checkfree(sd.getAdorn_fee(),der.getAdorn_fee())) {
			flag = false;
			s.append("把其他费用："+der.getAdorn_fee()+"修改为"+sd.getAdorn_fee()+";");											
		}
		if (checkfree(sd.getReceivable_ground_fee(),der.getReceivable_ground_fee())) {
			flag = false;
			s.append("把装卸费："+der.getReceivable_ground_fee()+"修改为"+sd.getReceivable_ground_fee()+";");											
		}

		
		if (checkfree(sd.getUpstairs_fee(),der.getUpstairs_fee())) {
			flag = false;
			s.append("把上楼费："+der.getUpstairs_fee()+"修改为"+sd.getUpstairs_fee()+";");												
		}

		if (checkfree(sd.getSeized_fee(),der.getSeized_fee())) {
			flag = false;
			s.append("把直送费："+der.getSeized_fee()+"修改为"+sd.getSeized_fee()+";");												
		}

		if (checkfree(sd.getSeized_fee(),der.getSeized_fee())) {
			flag = false;
			s.append("把理货费："+der.getSeized_fee()+"修改为"+sd.getSeized_fee()+";");												
		}

		if (checkfree(sd.getInspect_fee(),der.getInspect_fee())) {
			flag = false;
			s.append("把开箱费："+der.getInspect_fee()+"修改为"+sd.getInspect_fee()+";");												

		}

		if (checkfree(sd.getDestination_fee(),der.getDestination_fee())) {
			flag = false;
			s.append("把代收运费："+der.getDestination_fee()+"修改为"+sd.getDestination_fee()+";");
		}

		if (checkfree(sd.getBack_fee(),der.getBack_fee())) {
			flag = false;
			s.append("把代返款："+der.getBack_fee()+"修改为"+sd.getBack_fee()+";");

	    }
		if (checkfree(sd.getHandling_charge(),der.getHandling_charge())) {
			flag = false;
			s.append("把手续费："+der.getHandling_charge()+"修改为"+sd.getHandling_charge()+";");

	    }
		
		if (checkfree(sd.getRates(),der.getRates())) {
			flag = false;
			s.append("把费率："+der.getRates()+"‰修改为"+sd.getRates()+"‰;");

	    }
		if (checkfree(sd.getShouxu_feelv(),der.getShouxu_feelv())) {
			flag = false;
			s.append("把费率："+der.getShouxu_feelv()+"‰修改为"+sd.getShouxu_feelv()+"‰;");

	    }
		if (checkfree(sd.getShouxu_feelv(),der.getShouxu_feelv())) {
			flag = false;
			s.append("把费率："+der.getShouxu_feelv()+"‰修改为"+sd.getShouxu_feelv()+"‰;");

	    }
		if (checkdatas(sd.getPrinted(),der.getPrinted())) {
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
			s.append("把运单打印："+der.getPrinted()+"修改为"+sd.getPrinted()+";");
		}
		if (checkdatas(sd.getMost_urgent(),der.getMost_urgent())) {
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
			s.append("把急货："+der.getMost_urgent()+"修改为"+sd.getMost_urgent()+";");
		}
		
		if (checkdatas(sd.getIs_recept_no(),der.getIs_recept_no())) {
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
			s.append("把要回单 ："+der.getIs_recept_no()+"修改为"+sd.getIs_recept_no()+";");
		}
		if (checkdatas(sd.getInvoice_state(),der.getInvoice_state())) {
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
			s.append("把要发票 ："+der.getInvoice_state()+"修改为"+sd.getInvoice_state()+";");
		}
		if (checkdatas(sd.getKonghuo(),der.getKonghuo())) {
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
			s.append("把控货："+der.getKonghuo()+"修改为"+sd.getKonghuo()+";");
		}
		if (checkdatas(sd.getFankuan_stata(),der.getFankuan_stata())) {
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
			s.append("把付款方式："+der.getKonghuo()+"修改为"+sd.getKonghuo()+";");
		}
		if (checkdatas(sd.getTrade_agency_stata(),der.getTrade_agency_stata())) {
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
			s.append("把付款方式："+der.getKonghuo()+"修改为"+sd.getKonghuo()+";");
		}
		if (checkdatas(sd.getPay_type(),der.getPay_type())) {
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
			s.append("把付费方式："+der.getPay_type()+"修改为"+sd.getPay_type()+";");
		}
		if (checkdatas(sd.getRemarks_fee(),der.getRemarks_fee())) {
			flag = false;
			s.append("把应收备注："+der.getRemarks_fee()+"修改为"+sd.getRemarks_fee()+";");
		}
		if (checkdatas(sd.getShouliwangdian(),der.getShouliwangdian())) {
			flag = false;
			s.append("把受理网点："+der.getShouliwangdian()+"修改为"+sd.getShouliwangdian()+";");
		}
		if (checkdatas(sd.getShipping_order_name(),der.getShipping_order_name())) {
			flag = false;
			s.append("把制单人："+der.getShipping_order_name()+"修改为"+sd.getShipping_order_name()+";");
		}
		if (checkdatas(sd.getBaozhuang_name(),der.getBaozhuang_name())) {
			flag = false;
			s.append("把包装人："+der.getBaozhuang_name()+"修改为"+sd.getBaozhuang_name()+";");
		}
		if (checkdatas(sd.getYewuyuan(),der.getYewuyuan())) {
			flag = false;
			s.append("把业务员："+der.getYewuyuan()+"修改为"+sd.getYewuyuan()+";");
		}
		


		if (checkfree(sd.getTransport_pay(),der.getTransport_pay())) {
			flag = false;
			s.append("把费用总和："+der.getTransport_pay()+"修改为"+sd.getTransport_pay()+";");

		}

		if(checkfree(sd.getTrade_agency(),der.getTrade_agency())){
			flag = false;
			s.append("把代收货款："+der.getTrade_agency()+"修改为"+sd.getTrade_agency()+";");
		}
		if (checkdatas(sd.getIs_recept(),der.getIs_recept())) {
			flag = false;
			s.append("把回单份数："+der.getIs_recept()+"修改为"+sd.getIs_recept()+";");
		}
		
	   if (checkdatas(sd.getRemarks(),der.getRemarks())) {
		   flag = false;
			s.append("把备注："+der.getRemarks()+"修改为"+sd.getRemarks()+";");
	   }
	   jiLuLiShi js = new jiLuLiShi();
	   js.setJilu_id(UUIDUtils.getUUID());
	   js.setXiugainame(user.getUsername());
	   js.setShiping_order_id(sd.getShiping_order_id());
		//int n=csi.saveOrderEHistory(sd);
		if (flag==true) {
		   }else {
			   js.setJilu_lishi(s.toString());
			   System.out.println(s.toString());
			//json.setAns(s.toString());
			int l = csi.InsertShippjilu(js);
			if (l>0) {
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
	ShippingOrder getShipOrderLength(String number) {
		ShippingOrder der = csi.getNumber(number);
		return der;
	}
	//重复订单号个数查询
	@RequestMapping(params = "method=getAorder")
	public @ResponseBody String getAorder(String number){
		int i=csi.getAorder(number);
		Json json=new Json();
		if(i>0){
			json.setFlag(false);
		}else{
			json.setFlag(true);
		}
		return json.toString();
	}

	// 车牌检索
	@RequestMapping(params = "method=getPlateNumberLength")
	public @ResponseBody
	String getPlateNumberLength(String number) {
		List<ShippingOrder> list = csi.getPlateNumberLength(number);
		JSONObject jb = null;
		JSONArray jsons = new JSONArray();
		for (ShippingOrder d : list) {
			jb = new JSONObject();
			jb.put("id", d.getTravel_card_id());
			jb.put("name", d.getPlate_number());
			jsons.add(jb);
		}
		return jsons.toString();
	}

	// 导出信息
	@RequestMapping(params = "method=outShipOrder")
	public @ResponseBody
	String outShipOrder(String[] checkarray,String custom_name1,HttpServletResponse response) {
		    String filename = "运单信息导出";
		//List<String> allCustom = csi.getAllCustom();
		String [] headtitle1 = {"发车时间", "委托时间",  "委托单号","运单号", "发货单位名称","发站","发货人","到站","收货人","电话","交接方式","品名","包装","件数","重量","体积","送货地址","代收款","运费总额","付款方式",
				"订单状态","回单","回扣","备注","应收送货费","应收其他费","应收备注","是否实际到达","配送时间","电话预约"};
		String [] fieldName1={"send_time","weituo_time", "weitoudanhao","shiping_order_num","fhdanweiname" ,"send_station","custom_name","end_address","receipt","receipt_tel","send_type","goods_name","goods_packing","goods_num","goods_weight","goods_vol",
				"receipt_address","trade_agency","transport_pay","pay_type",
				"shipping_order_state","is_recept","back_fee","remarks","take_fee","adorn_fee","remarks_fee","is_order_arrive","time_appointment","phone_state"};
	
		List<ShippingOrder> list = csi.getShipOrderAll(checkarray,custom_name1);		
		
		for (ShippingOrder spo : list) {
			if(spo.getPhone_state()!=""&&spo.getPhone_state()!=null){
			if (spo.getPhone_state().equals("0")) {
				spo.setPhone_state("否");
			}else if (spo.getPhone_state().equals("1")) {
				spo.setPhone_state("是");
			}
			}
			if (spo.getSend_type()!=null&&spo.getSend_type()!="") {
				
			
			if (spo.getSend_type().equals("0")) {
				spo.setSend_type("专车送货");
			}else if (spo.getSend_type().equals("1")) {
				spo.setSend_type("客户自提");
			}else if (spo.getSend_type().equals("2")) {
				spo.setSend_type("送货进仓");
			}else if (spo.getSend_type().equals("3")) {
				spo.setSend_type("送货上楼");
			}else if (spo.getSend_type().equals("4")) {
				spo.setSend_type("送货上门");
			}
			}
			if(spo.getIs_order_arrive()!=null&&spo.getIs_order_arrive()!=""){
			if(spo.getIs_order_arrive().equals("0")){
				spo.setIs_order_arrive("未到达");
			}else if(spo.getIs_order_arrive().equals("1")){
				spo.setIs_order_arrive("到达");
			}
			}
			if(spo.getPay_type()!=null&&spo.getPay_type()!=""){
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
			if(spo.getShipping_order_state()!=null&&spo.getShipping_order_state()!=""){
			if(spo.getShipping_order_state().equals("0")){
				spo.setShipping_order_state("未出库");
			}else if(spo.getShipping_order_state().equals("1")){
				spo.setShipping_order_state("出库");
			}else if(spo.getShipping_order_state().equals("2")){
				spo.setShipping_order_state("到达");
			}else if(spo.getShipping_order_state().equals("4")){
				spo.setShipping_order_state("签收");
			}
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
			ExportUtils.outputHeaders(headtitle1, workbook, custom_name1);
		
			
			ExportUtils.outputColums(fieldName1, list, workbook, 1, "运单信息导出");
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
	 * @param rows
	 * @param page
	 * @param id
	 * @param type
	 * @param start_date
	 * @param end_date
	 * @return
	 */
		@RequestMapping(params = "method=getShipOrderCA")
		public @ResponseBody
		Map getShipOrderCA(String rows, String page, 
				String id,String name,
				String phone_number, String type, String start_date, String end_date) {
			Integer rows1 = 0;// 当前有几行
			Integer page1 = 1;// 当前有几页
			if (rows != null && !"".equals(rows)) {
				rows1 = Integer.parseInt(rows);
			}
			if (page != null && !"".equals(page)) {
				page1 = Integer.parseInt(page);
			}
			List<ShippingOrder> list = csi.getShipOrderInfoCA((page1 - 1) * rows1,
					rows1, id, name, phone_number, type, start_date, end_date,null,null,null,null);

			int count = csi.getShipOrderCA(id, name, phone_number, type, start_date, end_date,null,null,null,null);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("total", count);
			map.put("rows", list);
			return map;
		}
		
		//协议制作订单查询
		@RequestMapping(params="method=getShipOrderCAM")
		public @ResponseBody Map getShipOrderCAM(String rows, String page, String[] pid){
			Integer rows1 = 0;// 当前有几行
			Integer page1 = 1;// 当前有几页
			if (rows != null && !"".equals(rows)) {
				rows1 = Integer.parseInt(rows);
			}
			if (page != null && !"".equals(page)) {
				page1 = Integer.parseInt(page);
			}
			List<ShippingOrder> list=csi.getShipOrderCAM((page1 - 1) * rows1,rows1,pid.length==0?null:pid);//当前页
			int count=pid.length;
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

	@RequestMapping(params = "method=getSignShipOrderInfo")
	public String getSignShipOrderInfo() {
		return "shipping_order/signShippingOrder";
	}
/*
 * custom_name:$.trim($("#custom_name").val()),
  				receipt:$.trim($("#receipt").val()),
  				address:$.trim($("#address").val()),
 * */
	// 全部查询
	@RequestMapping(params = "method=getSignShipOrder")
	public @ResponseBody
	Map getSignShipOrder(String rows, String page, String name, String start_date, String end_date,HttpSession session,
			String shipping_order_state,String custom_name,String receipt,String address,String dirivid,HttpServletRequest request) {
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
		if(user.getCostomersid()!=null&&!user.getCostomersid().equals("")){
			custom_name=user.getCostomersid();
		}else if(user.getDriver_id()!=null&&!user.getDriver_id().equals("")){
			dirivid=user.getDriver_id();
		}

		List<ShippingOrder> list = csi.getSignShipOrder((page1 - 1) * rows1,
				rows1, name, start_date, end_date,shipping_order_state,custom_name,receipt,address,dirivid);
		int count = csi.getSignShipOrdercount(name,start_date, end_date,shipping_order_state,custom_name,receipt,address,dirivid);
	
		
		/*List<ShippingOrder> list1 = csi.getSignShipOrder1((page1 - 1) * rows1,
				rows1, name, phone_number, type, start_date, end_date,user.getDid(),shipping_order_state);

		int count1 = csi.getSignShipOrdercount1(name, phone_number, type,
				start_date, end_date,user.getDid(),shipping_order_state);
		*/
		Map<String, Object> map = new HashMap<String, Object>();
		
		//list.addAll(list1);
		System.out.println(list.size());
		map.put("total", count);
		map.put("rows", list);
		return map;
	}
	
	/*
	 * 签收订单导出
	 */
	@RequestMapping(params = "method=OutGetSignShipOrder")
	public @ResponseBody List<ShippingOrder>  OutGetSignShipOrder(HttpServletResponse response,String[] headtitle, String[] fieldName, String name, String start_date, String end_date,HttpSession session,
			String shipping_order_state,String custom_name,String receipt,String address,String dirivid,String[] fieleid,HttpServletRequest request){
		User user = (User) request.getSession().getAttribute(
				SessionInfo.SessionName);
        String filename = "签收订单信息导出";
		List<ShippingOrder> list;
		System.out.println("状态"+shipping_order_state);
		//客户
		if(user.getCostomersid()!=null&&!user.getCostomersid().equals("")){
			custom_name=user.getCostomersid();
		}else if(user.getDriver_id()!=null&&!user.getDriver_id().equals("")){
			dirivid=user.getDriver_id();
		}
		if(fieleid!=null&&fieleid.length>0){
			list = csi.getSignOutput(null,null,null,null,null,null,null,null, fieleid);
		}else{
			
			
			list = csi.getSignOutput( name,start_date, end_date, shipping_order_state, custom_name, receipt, address,dirivid,null);
		}
		for (ShippingOrder so : list) {
			List<Department> depn = sos.getDepartment(so.getNdp_id());
			List<Department> dep = sos.getDepartment(so.getLdp_id());
			List<Company>  der = sos.getUpdateCompany(so.getCompany_id());
		for (Company dt : der) {
			if (dt.getCompany_name()!=null&&dt.getCompany_name()!="null"&&dt.getCompany_name()!="") {
				so.setCompany_id(dt.getCompany_name());
		}
		}		
		for (Department dp : depn) {
			if (dp.getDepartment_name()!=null&&dp.getDepartment_name()!="") {
				so.setNdp_id(dp.getDepartment_name());
				
			}
		}
		for (Department dt : dep) {
			if (dt.getDepartment_name()!=null&&dt.getDepartment_name()!="") {
				so.setLdp_id(dt.getDepartment_name());
				
			}
		}
		
			if (so.getShipping_order_state().equals("0")&&so.getShipping_order_state()!=null) {
				so.setShipping_order_state("未出库");
			} if (so.getShipping_order_state().equals("1")&&so.getShipping_order_state()!=null) {
				so.setShipping_order_state("配送中");
			}if (so.getShipping_order_state().equals("2")&&so.getShipping_order_state()!=null) {
				so.setShipping_order_state("转运中");
			}if (so.getShipping_order_state().equals("3")&&so.getShipping_order_state()!=null) {
				so.setShipping_order_state("已到达");
			}if (so.getShipping_order_state().equals("4")&&so.getShipping_order_state()!=null) {
				so.setShipping_order_state("签收");
			}if (so.getCheck_type()!=null&&so.getCheck_type()!="null"&&so.getCheck_type().equals("0")) {
				so.setCheck_type("发货人门点");
			}if (so.getCheck_type()!="null"&&so.getCheck_type()!=null&&so.getCheck_type().equals("1")) {
				so.setCheck_type("起运货运站");			
		    }if (so.getSend_type().equals("0")&&so.getSend_type()!=null&&so.getCheck_type()!="") {
				so.setSend_type("自提");
			}if (so.getSend_type().equals("1")&&so.getSend_type()!=null&&so.getCheck_type()!="") {
				so.setSend_type("送货");
			}if (so.getAgreement_type()!=null&&so.getAgreement_type()!=""&&so.getAgreement_type().equals("0")) {
				so.setAgreement_type("班线");
			}if (so.getAgreement_type()!=null&&so.getAgreement_type()!=""&&so.getAgreement_type().equals("1")) {
				so.setAgreement_type("配送");
			}if (so.getAgreement_type()!=null&&so.getAgreement_type()!=""&&so.getAgreement_type().equals("2")) {
				so.setAgreement_type("转运");
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
			ExportUtils.outputHeaders(headtitle, workbook, "签收订单信息导出");
			// 调用工具类生成内容
			ExportUtils.outputColums(fieldName, list, workbook, 1, "签收订单信息导出");
			workbook.write(ouputStream);
			ouputStream.flush();
			ouputStream.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;	
	}
	// 全部查询
	/**
	 * 协议制作订单查询方法
	 * @param rows
	 * @param page
	 * @param id
	 * @param type
	 * @param start_date
	 * @param end_date
	 * @return
	 */
		@RequestMapping(params = "method=getSignShipOrderCA")
		public @ResponseBody
		Map getSignShipOrderCA(String rows, String page, 
				String id,String startDate,String end_date,String ddId,String order_state,String pay_type,String perpole,String end_address,String send_address,String phone_number) {
			Integer rows1 = 0;// 当前有几行
			Integer page1 = 1;// 当前有几页
			if (rows != null && !"".equals(rows)) {
				rows1 = Integer.parseInt(rows);
			}
			if (page != null && !"".equals(page)) {
				page1 = Integer.parseInt(page);
			}
			List<ShippingOrder> list = csi.getShipOrderInfoCA((page1 - 1) * rows1,
					rows1, id,startDate, end_date, ddId, order_state, pay_type,perpole,end_address,send_address,phone_number);

			int count = csi.getShipOrderCA(id,startDate, end_date, ddId, order_state, pay_type,perpole,end_address,send_address,phone_number);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("total", count);
			map.put("rows", list);
			return map;
		}

	@RequestMapping(params = "method=getUpdateSignShipOrder")
	public @ResponseBody
	ShippingOrder getUpdateSignShipOrder(String id) {
		ShippingOrder der = csi.getUpdateSignShipOrder(id);
		return der;
	}
		
	// 跳转编辑页面并且获取id 返回到页面
	@RequestMapping(params = "method=getEditSignShipOrderPage")
	public String getEditSignShipOrderPage(String pid,String isok,
			HttpServletRequest request) {
		request.setAttribute("flg", pid);
		request.setAttribute("isok", isok);
		return "shipping_order/EditSignShipOrder";
	}

	public void saveHistory(String ids,String num, String message){
		List<OrderHistory> order=new ArrayList<OrderHistory>();
		OrderHistory h=new OrderHistory();
		h.setOrder_history_id(UUIDUtils.getUUID());
		h.setOrders_id(ids);
		h.setOrder_arrive_time(DateFormat.getDateTimeInstance().format(new Date()));
		h.setGoods_arrive_remakes(h.getOrder_arrive_time()+"---订单号为"+num+"\t"+message);
		order.add(h);
		int count=csi.saveOrderHistory(order);
	}
	@RequestMapping(params = "method=getQrcode")
	public void getQrcode(HttpServletResponse response,String orderId) {
		String content =orderId;
       QRCodeEncoderHandler handler = new QRCodeEncoderHandler(); 
       BufferedImage bi=handler.encoderQRCode(content,3);
       try {
		ImageIO.write(bi, "png", response.getOutputStream());
	} catch (IOException e) {
		e.printStackTrace();
	}
       System.out.println("encoder QRcode success");
	}
		@RequestMapping(params = "method=getdbrcode")
		public void getdbrcode(HttpServletResponse response,String orderId) {
			String format = MimeTypes.MIME_JPEG;// MimeTypes.MIME_JPEG  
			  
	        String text = orderId;  
	  
	        ByteArrayOutputStream bout = null;  
	        try  
	        {  
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
	  
	        }  
	        catch (Exception e)  
	        {  
	            //log.error("Error while generating barcode", e);  
	        }  
	        finally  
	        {  
	            if (bout != null)  
	            {  
	                try  
	                {  
	                    bout.close();  
	                }
	                catch (IOException e)  
	                {  
	                    // TODO Auto-generated catch block  
	                    e.printStackTrace();  
	                }  
	            }  
	  
	        }  
	       }
		public static Configuration buildCfg()  
	    {  
	        DefaultConfiguration cfg = new DefaultConfiguration("barcode");  
	        // Get type  
	  
	        String type = "code128";  
	        DefaultConfiguration child = new DefaultConfiguration(type);  
	        cfg.addChild(child);  
	        return cfg;  
	    }
		private String createXML(List<ShippingOrder> list) {  
	        Document document = DocumentHelper.createDocument();  
	        Element root = document.addElement("xml");  
	        Iterator<ShippingOrder> it = list.iterator();  
	        while (it.hasNext()) {  
	        	ShippingOrder so = it.next();  
	            Element edept = root.addElement("Detail");  
	            edept.addElement("shiping_order_num").addText(so.getShiping_order_num()+"");  
	            edept.addElement("receipt").addText("123");  
	            edept.addElement("receipt_tel").addText("123");  
	            edept.addElement("receipt_address").addText("123");

	        }
	        String xmlString = document.asXML();  
	        return xmlString;  
	    }
		@RequestMapping(params = "method=getShowOrder")
		public @ResponseBody
		List<OrderHistory> getShowOrder(String pid) {
			List<OrderHistory> historys=csi.getShowOrder(pid);
			return historys;
		}
		/**
		 * 电话预约
		 * */
		@RequestMapping(params ="method=updatePhone")
		public @ResponseBody Json  updatePhone(String [] del,String tiem,String maeks,HttpServletRequest request){
			
			Json json = new Json();
			int js = csi.updatePhone(del, tiem, maeks);
			if (js > 0) {
				json.setFlag(true);
				return json;
			}
			json.setFlag(false);
			return json;
		}
		
		//查看图片
		@RequestMapping(params = "method=up")
		public void upload(@RequestParam("file") MultipartFile file,
				HttpServletRequest request, HttpServletResponse response) {

			try {
				super.upload(file, "singshiporder", request);

				/*
				 * response.getWriter().print(super.getFileName());
				 * filename+=super.getFileName();
				 */
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		
		@RequestMapping(params = "method=getimgurl")
		public String getimgurl(String iurl, HttpServletRequest request) {
			List<ShipperOrderImg> listOrderImg = csi.getSingShiperOrderImg(iurl);
			System.out.println(listOrderImg.size());
			if (listOrderImg.size() == 0) {
				request.setAttribute("iurl", "");
			}
			request.setAttribute("iurl", listOrderImg);

			return "shipping_order/orderImg";
		}
			
		// 跳转编辑页面并且获取id 返回到页面
	    @RequestMapping(params = "method=saveSignShipOrder")
		public @ResponseBody
		Json saveSignShipOrder(Sign_order sign_order, HttpSession session) {
			sign_order.setSign_id(UUIDUtils.getUUID());
			if (sign_order.getSign_time() == null
					|| "".equals(sign_order.getSign_time())) {
				SimpleDateFormat dateFor = new SimpleDateFormat(
						"yyyy-MM-dd hh:mm:ss");
				sign_order.setSign_time(dateFor.format(new Date()));
			}
			int i = 0;
			Json json = new Json();
			i = csi.saveSignShipOrder(sign_order);
			if (i > 0) {
				int ii = 0;
				String filenames = (String) session.getAttribute("filename");
				if (filenames != null) {
					String[] filenNamess = filenames.split(",");
					List<ShipperOrderImg> shiOrdImg = new ArrayList<ShipperOrderImg>();
					for (int j = 0; j < filenNamess.length; j++) {
						ShipperOrderImg sOrdImg = new ShipperOrderImg();
						sOrdImg.setImage_id(UUIDUtils.getUUID());
						sOrdImg.setOrder_id(sign_order.getOrder_id());
						sOrdImg.setImageUrl(filenNamess[j]);
						shiOrdImg.add(sOrdImg);
					}
					int b = csi.saveFilename(shiOrdImg);
					if (b>0) {
						ii = csi.updatestate(sign_order.getOrder_id());
					}
				} else {
					ii = csi.updatestate(sign_order.getOrder_id());
				}
				if (ii > 0) {
					saveHistory(sign_order.getOrder_id(),
							sign_order.getOrder_number(),
							"签收,签收人:" + sign_order.getSign_user());
					session.removeAttribute("filename");
					json.setFlag(true);
					return json;
				}
			}

			json.setFlag(false);
			return json;
		}	
		
}
