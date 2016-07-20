package com.jy.action;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.text.DateFormat;
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
import com.jy.model.CreateAgreement;
import com.jy.model.Delivery;
import com.jy.model.OrderCustom;
import com.jy.model.ShippingOrder;
import com.jy.model.Sign_order;
import com.jy.model.User;
import com.jy.service.DeliveryInfoService;


/*
 *  库存管理管理
 * */
@Controller
@RequestMapping(value = "/delivery.do")
public class DeliveryInfoController {
	@Resource
	private DeliveryInfoService dsi;

/**
 * 配送结算记录
 * @return
 */
	@RequestMapping(params = "method=agreemOrderInfo")
	public String getDeliveryInfoMan() {
		return "delivery/agreemOrderInfo";
	}
	//总库存表
	@RequestMapping(params = "method=deliverGoodsInfo")
	public String getDeliveryMan() {
		return "delivery/deliverGoodsInfo";
	}
	//转运记录表
	@RequestMapping(params = "method=gettransferGoodsInfo")
	public String getDeliveryIMan() {
		return "delivery/transferGoodsInfo";
	}
	//签收记录表
	@RequestMapping(params = "method=getDeliverySign")
	public String getDeliveryIIIMan() {
		return "delivery/signGoodsInfo";
	}
	// 跳转编辑页面并且获取合同的id 返回到页面
	@RequestMapping(params = "method=getEditDeliveryPage")
	public String getEditDeliveryrPage(String pid, HttpServletRequest request) {
		request.setAttribute("flg", pid);
		return "shipping_order/EditDelivery";
	}

	//结算记录
	@RequestMapping(params = "method=setlOrderInfo")
	public String getDeliveryPage() {
		return "delivery/setlOrderInfo";
	}
	
	/*//打印
	@RequestMapping(params = "method=getDeliveryPrint")
	public String getDeliveryPrint(String pid, HttpServletRequest request) {
		ShippingOrder d = getUpdateDelivery(pid);
		if (d.getSend_type() == 0) {
			d.setSendtype("√");
		} else if (d.getSend_type() == 1) {
			d.setSendtype1("√");
		}
		if (d.getCheck_type() == 0) {
			d.setChecktype("√");
		} else if (d.getCheck_type() == 1) {
			d.setChecktype1("√");
		}
		if (d.getPay_type() == 0) {
			d.setPaytype("现付");
		} else if (d.getPay_type() == 1) {
			d.setPaytype("到付");
		} else if (d.getPay_type() == 2) {
			d.setPaytype("月结");
		} else if (d.getPay_type() == 3) {
			d.setPaytype("打卡");
		}

		request.setAttribute("sp", d);
		return "shipping_order/printer";
	}
	*/
	//打印一维码
	@RequestMapping(params = "method=getDeliveryPrintYwm")
	public String getDeliveryPrintYWM(String[] checkarray, HttpServletRequest request) {
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
			List<Delivery> d = dsi.getUpdateDeliveryArray(s);
			JSONObject obje=new JSONObject();
			obje.accumulate("Detail", d);
			return obje.toString();
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
		File newfile = filez.createTempFile("delivery", prefix, filez);
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
	@RequestMapping(params = "method=getDelivery")
	public @ResponseBody
	Map getDeliveryInfo(String rows, String page, String send_type,String num,String start_time,String end_time,String types) {
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		List<ShippingOrder> list = dsi.getDeliveryInfo((page1 - 1) * rows1,rows1, send_type, num, start_time, end_time,null,types);
		int count = dsi.getDelivery(send_type, num, start_time, end_time,types);
				/*for(Delivery d:list){
			if(d.getPay_type()==0){
				d.setHf_pay(d.getTransport_pay());
			}else if(d.getPay_type()==1){
				//paid
			}else if(d.getPay_type()==2){;
				d.setXf_pay(d.getTransport_pay());
			}else if(d.getPay_type()==3){
				d.setHdqf_pay(d.getTransport_pay());
			}
	//实收总运费
			if(d.getPaid()!=""&&d.getPaid()!=null&&d.getPaid1()!=""&&d.getPaid1()!=null){		
				d.setSum_pay(String.valueOf(Integer.parseInt(d.getPaid().substring(0,d.getPaid().length()-3))+Integer.parseInt(d.getPaid1().substring(0, d.getPaid1().length()-3)))+".00");
			}else if(d.getPaid()!=""&&d.getPaid()!=null&&(d.getPaid1()==""||d.getPaid1()==null)){
				d.setSum_pay(String.valueOf(Integer.parseInt(d.getPaid().substring(0, d.getPaid().length()-3)))+".00");
				}else if(d.getPaid1()!=""&&d.getPaid1()!=null&&(d.getPaid()==""||d.getPaid()==null)){
					d.setSum_pay(String.valueOf(Integer.parseInt(d.getPaid1().substring(0, d.getPaid1().length()-3)))+".00");
				}*/

			/*//中转成本
			if(d.getChange_fee()!=""&&d.getChange_fee()!=null&&d.getChange_other()!=""&&d.getChange_other()!=null){
				d.setChange_local(String.valueOf(Integer.parseInt(d.getChange_fee().substring(0, d.getChange_fee().length()-3))+Integer.parseInt(d.getChange_other().substring(0, d.getChange_other().length()-3)))+".00");
			}else if(d.getChange_fee()!=""&&d.getChange_fee()!=null&&(d.getChange_other()==""||d.getChange_other()==null)){
				d.setChange_local(String.valueOf(Integer.parseInt(d.getChange_fee().substring(0, d.getChange_fee().length()-3)))+".00");
			}else if(d.getChange_other()!=""&&d.getChange_other()!=null&&(d.getChange_fee()==""||d.getChange_fee()==null)){
				d.setChange_local(String.valueOf(Integer.parseInt(d.getChange_other().substring(0, d.getChange_other().length()-3)))+".00");
			}
			//付款日期
		if(d.getOthers_date()!=""&&d.getOthers_date()!=null){
			d.setPaydayString(d.getOthers_date());
		}else if(d.getOthers_date()==""){
			d.setPaydayString(d.getOthers_date());
		}else if(d.getOthers_date()==null){
			d.setPaydayString(d.getOthers_date());
		}*/
		//贷款扣
		/*
		if(d.getTransport_pay()!=""&&d.getTransport_pay()!=null&&d.getSum_pay()!=""&&d.getSum_pay()!=null){
			d.setDaikuanString(String.valueOf(Integer.parseInt(d.getTransport_pay().substring(0, d.getTransport_pay().length()-3))-Integer.parseInt(d.getSum_pay().substring(0, d.getSum_pay().length()-3)))+".00");			
		}else if(d.getTransport_pay()!=""&&d.getTransport_pay()!=null&&(d.getSum_pay()==""||d.getSum_pay()==null)){
			d.setDaikuanString(String.valueOf(Integer.parseInt(d.getTransport_pay().substring(0, d.getTransport_pay().length()-3)))+".00");
		}else if(d.getSum_pay()!=""&&d.getSum_pay()!=null&&(d.getTransport_pay()==""&&d.getTransport_pay()==null)){
			d.setDaikuanString("-"+String.valueOf(Integer.parseInt(d.getSum_pay().substring(0, d.getSum_pay().length()-3)))+".00");
		}	*/
		/*System.out.println(d.getTransport_pay().substring(0,d.getTransport_pay().length()-3)+"===");
		System.out.println(d.getSum_pay().substring(0, d.getSum_pay().length()-3));		
		System.out.println("===================================================");
		}*/	
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}
	//查询结算记录
	@RequestMapping(params = "method=getDeliverySetle")
	public @ResponseBody
	Map getDeliverySetle(String rows, String page,String num,String start_time,String end_time,String table_name,String table_type,String free,String things) {
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		if(table_type==null||table_type.equals("")){//应收运费结算
			table_name="jy_settlementy_history";
			table_type="0";
			free="ji.transport_pay";
			things=" 1=1";
		}else if(table_type.equals("0")){//代收运费应付 回扣=代收-总
			table_name="jy_settlementy_history";
			table_type="1";
			free="ji.back_fee";
			things=" (ji.back_fee IS NOT NULL AND  ji.back_fee!='' AND  ji.back_fee!=0)";
		}else if(table_type.equals("1")){//代收款应付
			table_name="jy_settlementy_history";
			table_type="2";
			free="ji.trade_agency";
			things=" (ji.trade_agency IS NOT NULL AND  ji.trade_agency!='' AND  ji.trade_agency!=0)";
		}else if(table_type.equals("2")){//代收款应收
			table_name="jy_settlemengf_history";
			table_type="1";
			free="ji.trade_agency";
			things=" (ji.trade_agency IS NOT NULL AND  ji.trade_agency!='' AND  ji.trade_agency!=0)";
		}else if(table_type.equals("3")){//中转应付
			table_name="jy_settlemengf_history";
			table_type="1";
			free="ji.change_pay";
			things="  1=1";
		}else if(table_type.equals("4")){//应收代收运费 代收=总+回扣
			table_name="jy_settlementy_ys_history";
			table_type="0";
			free="ji.destination_fee";
			things="  (ji.destination_fee IS NOT NULL AND  ji.destination_fee!='' AND  ji.destination_fee!=0)";
		}else if(table_type.equals("5")){//应收手续费
			table_name="jy_settlementy_ys_history";
			table_type="1";
			free="ji.handling_charge";
			things="  (ji.handling_charge IS NOT NULL AND  ji.handling_charge!='' AND  ji.handling_charge!=0)";
		}else if(table_type.equals("6")){//配送费应付
			table_name="jy_delivery_clearing";
			table_type="0";
			free="ji.send_fee";
			things=" 1=1";
		}
		 List<ShippingOrder>  list = dsi.getDeliverySetle((page1 - 1) * rows1,	rows1,  num, start_time, end_time, table_name, table_type,null,free,things);
		int count = dsi.getSetle(num, start_time, end_time, table_name, table_type,things,free);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}
	//配送结算记录查询
		@RequestMapping(params = "method=deliverGoods")
		public @ResponseBody
		Map deliverGoodsInfo(String rows, String page,String num,String start_time,String end_time) {
			Integer rows1 = 0;// 当前有几行
			Integer page1 = 1;// 当前有几页	
			if (rows != null && !"".equals(rows)) {
				rows1 = Integer.parseInt(rows);
			}
			if (page != null && !"".equals(page)) {
				page1 = Integer.parseInt(page);
			}
			List<CreateAgreement> list = dsi.deliverGoodsInfo((page1 - 1) * rows1,rows1, num, start_time, end_time,null);
			int count = dsi.deliverGoods(num, start_time, end_time);
			Map<String, Object> map = new HashMap<String, Object>();	
			map.put("total", count);
			map.put("rows", list);
			System.out.println(list.size());
			/*System.out.println(send_time);
			System.out.println("===========");
			System.out.println(send_timet);*/
			return map;
		}
		
		
		
	
	//查询中转
		@RequestMapping(params = "method=gettransferGoods")
		public @ResponseBody
		Map gettransferGoodsInfo(String rows, String page,String  endaddress,String num,String carnum,String receipt,String changecompany,String pay_type,String goods_name,String goods_num,String order_state,String send_time,String end_date,String customid) {
			Integer rows1 = 0;// 当前有几行
			Integer page1 = 1;// 当前有几页
			if (rows != null && !"".equals(rows)) {
				rows1 = Integer.parseInt(rows);
			}
			if (page != null && !"".equals(page)) {
				page1 = Integer.parseInt(page);
			}
			System.out.println(pay_type);
			List<Delivery> list = dsi.gettransferGoodsInfo((page1 - 1) * rows1,
					rows1,    endaddress, num, carnum, receipt, changecompany, pay_type, goods_name, goods_num, order_state, send_time, end_date, customid);
			int count = dsi.gettransferGoods(endaddress, num, carnum, receipt, changecompany, pay_type, goods_name, goods_num, order_state, send_time, end_date, customid);
			System.out.println(count);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("total", count);
			map.put("rows", list);
			return map;
		}
	
	
	//总库从表导出
	@RequestMapping(params = "method=outgetDeliveryInfo")
	public @ResponseBody String  outgetDeliveryInfo(String datas, String[] headtitle,String[] fieldName,
			HttpServletResponse response,String send_type,String num,String start_time,String end_time,String name,String []checkarray,String types) {
		String filename =name+ "运单导出";
		List<ShippingOrder> list;
		if(checkarray!=null&&checkarray.length>0){
			list = dsi.getDeliveryInfo(null, null, null, null, null, null,checkarray,null);
		}else{
			list = dsi.getDeliveryInfo(null, null, send_type, num, start_time, end_time,null,types);
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
		//调用工具类创建表头
			ExportUtils.outputHeaders(headtitle,workbook,filename);
		//调用工具类生成内容
			ExportUtils.outputColums(fieldName, list,workbook,1,filename);
			workbook.write(ouputStream);
			ouputStream.flush();
			ouputStream.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	//结算记录表导出
	@RequestMapping(params = "method=getDeliverySetleout")
	public @ResponseBody String  getDeliverySetles(String datas, String[] headtitle,String[] fieldName,
			HttpServletResponse response,String num,String start_time,String end_time,String table_name,String table_type,String name,String []checkarray,String free,String things) {
		String filename = name+"结算记录表导出";
		if(table_type==null||table_type.equals("")){//应收运费结算
			table_name="jy_settlementy_history";
			table_type="0";
			free="ji.transport_pay";
			things=" 1=1";
		}else if(table_type.equals("0")){//代收运费应付 回扣=代收-总
			table_name="jy_settlementy_history";
			table_type="1";
			free="ji.back_fee";
			things=" (ji.back_fee IS NOT NULL AND  ji.back_fee!='' AND  ji.back_fee!=0)";
		}else if(table_type.equals("1")){//代收款应付
			table_name="jy_settlementy_history";
			table_type="2";
			free="ji.trade_agency";
			things=" (ji.trade_agency IS NOT NULL AND  ji.trade_agency!='' AND  ji.trade_agency!=0)";
		}else if(table_type.equals("2")){//代收款应收
			table_name="jy_settlemengf_history";
			table_type="1";
			free="ji.trade_agency";
			things=" (ji.trade_agency IS NOT NULL AND  ji.trade_agency!='' AND  ji.trade_agency!=0)";
		}else if(table_type.equals("3")){//中转应付
			table_name="jy_settlemengf_history";
			table_type="2";
			free="ji.change_pay";
			things="  (ji.change_pay IS NOT NULL AND  ji.change_pay!='' AND  ji.change_pay!=0)";
		}else if(table_type.equals("4")){//应收代收运费 代收=总+回扣
			table_name="jy_settlementy_ys_history";
			table_type="0";
			free="ji.destination_fee";
			things="  (ji.destination_fee IS NOT NULL AND  ji.destination_fee!='' AND  ji.destination_fee!=0)";
		}else if(table_type.equals("5")){//应收手续费
			table_name="jy_settlementy_ys_history";
			table_type="1";
			free="ji.handling_charge";
			things="  (ji.handling_charge IS NOT NULL AND  ji.handling_charge!='' AND  ji.handling_charge!=0)";
		}else if(table_type.equals("6")){//配送费应付
			table_name="jy_delivery_clearing";
			table_type="1";
			free="ji.send_fee";
			things=" 1=1";
		}
		List<ShippingOrder> list;
		if(checkarray!=null&&checkarray.length>0){
			list = dsi.getDeliverySetle(null, null, null, null, null,table_name, table_type ,checkarray,free,things);
		}else{
			list = dsi.getDeliverySetle(null, null, num, start_time, end_time, table_name, table_type,null,free,things);
		}
		
		float tals=0;
		float talf=0;
		float ml=0;		
		for(int i=0;i<list.size();i++){
			tals=Float.parseFloat(list.get(i).getTransport_pay())+tals;
			talf=Float.parseFloat(list.get(i).getReality_sum())+talf;
			ml=Float.parseFloat(list.get(i).getTrade_cha())+ml;
		}
		ShippingOrder ca=new ShippingOrder();
		ca.setShiping_order_num("合计");
		ca.setTransport_pay(tals+"0");
		ca.setReality_sum(talf+"0");
		ca.setTrade_cha(ml+"0");
		list.add(ca);
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
			ExportUtils.outputHeaders(headtitle,workbook,filename);
		//调用工具类生成内容
			ExportUtils.outputColums(fieldName, list,workbook,1,filename);
			workbook.write(ouputStream);
			ouputStream.flush();
			ouputStream.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// 配送结算记录导出
		@RequestMapping(params = "method=outDeliveryout")
		public @ResponseBody
		String outDeliveryout(String datas, String[] headtitle, String[] fieldName,
				HttpServletResponse response,String num,String start_time,String end_time,String [] checkarray) {
			String filename = "配送结算导出";
			List<CreateAgreement> list;
			if(checkarray!=null&&checkarray.length>0){
				list = dsi.deliverGoodsInfo(null, null, null, null, null  ,checkarray);
			}else{
				list = dsi.deliverGoodsInfo(null, null, num, start_time, end_time,null);
			}
			float tals=0;
			float talf=0;
			float ml=0;		
			for(int i=0;i<list.size();i++){
				tals=Float.parseFloat(list.get(i).getReceivable_fee())+tals;
				talf=Float.parseFloat(list.get(i).getAll_money())+talf;
				ml=Float.parseFloat(list.get(i).getTrade_cha())+ml;
			}
			CreateAgreement ca=new CreateAgreement();
			ca.setAgreement_number("合计");
			ca.setReceivable_fee(tals+"0");
			ca.setAll_money(talf+"0");
			ca.setTrade_cha(ml+"0");
			list.add(ca);
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
				ExportUtils.outputHeaders(headtitle, workbook, filename);
				// 调用工具类生成内容
				ExportUtils.outputColums(fieldName, list, workbook, 1, filename);
				workbook.write(ouputStream);
				ouputStream.flush();
				ouputStream.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}
	
	
	/*
	 * 批量删除
	 */
	@RequestMapping(params = "method=deleteDelivery")
	public @ResponseBody
	Json delDelivery(String[] del) {
		Json json = new Json();
		/*int i=dsi.deleteShipToDemand(del);*/
		int truck =dsi.deleteDelivery(del);
		if (truck > 0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}

	// 跳转到添加页面
	@RequestMapping(params = "method=addDelivery")
	public String addDelivery(String pid,HttpServletRequest request) {
		request.setAttribute("flg", pid);
		return "shipping_order/AddDelivery";
	}

	// 保存
	@RequestMapping(params = "method=saveDelivery")
	public @ResponseBody
	Json saveDelivery(Delivery d) {
		Json json = new Json();
		
	
		if(d.getIs_recept().equals("")||d.getIs_recept()==null){
			d.setIs_recept("0");
		}
		int truck = dsi.saveDelivery(d);
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
	@RequestMapping(params = "method=getUpdateDelivery")
	public @ResponseBody
	Delivery getUpdateDelivery(String id) {
		Delivery der = dsi.getUpdateDelivery(id);
		return der;
	}

	// 导入页面
	@RequestMapping(params = "method=inputDelivery")
	public String inputDelivery() {
		return "driver/InputDriver";
	}

	// 修改
	@RequestMapping(params = "method=updateDelivery")
	public @ResponseBody
	Json updateDelivery(Delivery d) {
		d.setUpdatetime(DateFormat.getDateTimeInstance().format(new Date()));
		Json json = new Json();
		int i = dsi.updateDelivery(d);
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
	Delivery getDeliveryLength(String number) {
		Delivery der = dsi.getNumber(number);
		return der;
	}
	//重复订单号个数查询
	@RequestMapping(params = "method=getAorder")
	public @ResponseBody String getAorder(String number){
		int i=dsi.getAorder(number);
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
		List<Delivery> list = dsi.getPlateNumberLength(number);
		JSONObject jb = null;
		JSONArray jsons = new JSONArray();
		for (Delivery d : list) {
			jb = new JSONObject();
			/*jb.put("id", d.getTravel_card_id());
			jb.put("name", d.getPlate_number());*/
			jsons.add(jb);
		}
		return jsons.toString();
	}

	// 导出信息
	@RequestMapping(params = "method=outDelivery")
	public @ResponseBody
	String outDelivery(String datas, String[] headtitle, String[] fieldName,
			HttpServletResponse response, String name, String plate_number,
			String type, String start_date, String end_date) {
		String filename = "运单信息导出";
		List<Delivery> list = dsi.getDeliveryAll(name, plate_number,
				type, start_date, end_date);
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
	 * @param rows
	 * @param page
	 * @param id
	 * @param type
	 * @param start_date
	 * @param end_date
	 * @return
	 */
		@RequestMapping(params = "method=getDeliveryCA")
		public @ResponseBody
		Map getDeliveryCA(String rows, String page, 
				String id,String type,  String start_date, String end_date) {
			Integer rows1 = 0;// 当前有几行
			Integer page1 = 1;// 当前有几页
			if (rows != null && !"".equals(rows)) {
				rows1 = Integer.parseInt(rows);
			}
			if (page != null && !"".equals(page)) {
				page1 = Integer.parseInt(page);
			}
			List<Delivery> list = dsi.getDeliveryInfoCA((page1 - 1) * rows1,
					rows1, id, type, start_date, end_date,null,null,null);

			int count = dsi.getDeliveryCA(id, type,
					start_date, end_date,null,null,null);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("total", count);
			map.put("rows", list);
			return map;
		}
		
		//协议制作订单查询
		@RequestMapping(params="method=getDeliveryCAM")
		public @ResponseBody Map getDeliveryCAM(String rows, String page, String[] pid){
			Integer rows1 = 0;// 当前有几行
			Integer page1 = 1;// 当前有几页
			if (rows != null && !"".equals(rows)) {
				rows1 = Integer.parseInt(rows);
			}
			if (page != null && !"".equals(page)) {
				page1 = Integer.parseInt(page);
			}
			List<Delivery> list=dsi.getDeliveryCAM((page1 - 1) * rows1,rows1,pid.length==0?null:pid);//当前页
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

	@RequestMapping(params = "method=getSignDeliveryInfo")
	public String getSignDeliveryInfo() {
		return "shipping_order/signDelivery";
	}

	// 全部查询
	@RequestMapping(params = "method=getSignDelivery")
	public @ResponseBody
	Map getSignDelivery(String rows, String page, String name,
			String phone_number, String type, String start_date, String end_date,HttpSession session,String shipping_order_state) {
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		User user=(User)session.getAttribute(SessionInfo.SessionName);
		List<Delivery> list = dsi.getSignDelivery((page1 - 1) * rows1,
				rows1, name, phone_number, type, start_date, end_date,shipping_order_state);

		int count = dsi.getSignDeliverycount(name, phone_number, type,
				start_date, end_date,shipping_order_state);
		
		
		List<Delivery> list1 =dsi.getSignDelivery1((page1 - 1) * rows1,
				rows1, name, phone_number, type, start_date, end_date,user.getDid(),shipping_order_state);

		int count1 = dsi.getSignDeliverycount1(name, phone_number, type,
				start_date, end_date,user.getDid(),shipping_order_state);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		list.addAll(list1);
		System.out.println(list.size());
		map.put("total", (count+count1));
		map.put("rows", list);
		return map;
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
		@RequestMapping(params = "method=getSignDeliveryCA")
		public @ResponseBody
		Map getSignDeliveryCA(String rows, String page, 
				String id,String type,  String start_date, String end_date,String send_station,String end_address,String car_number) {
			Integer rows1 = 0;// 当前有几行
			Integer page1 = 1;// 当前有几页
			if (rows != null && !"".equals(rows)) {
				rows1 = Integer.parseInt(rows);
			}
			if (page != null && !"".equals(page)) {
				page1 = Integer.parseInt(page);
			}
			List<Delivery> list = dsi.getDeliveryInfoCA((page1 - 1) * rows1,
					rows1, id, type, start_date, end_date,send_station,end_address,car_number);

			int count = dsi.getDeliveryCA(id, type,
					start_date, end_date,send_station,end_address,car_number);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("total", count);
			map.put("rows", list);
			return map;
		}

	@RequestMapping(params = "method=getUpdateSignDelivery")
	public @ResponseBody
	Delivery getUpdateSignDelivery(String id) {
		Delivery der = dsi.getUpdateSignDelivery(id);
		return der;
	}
		
	// 跳转编辑页面并且获取id 返回到页面
	@RequestMapping(params = "method=getEditSignDeliveryPage")
	public String getEditSignDeliveryPage(String pid,String isok,
			HttpServletRequest request) {
		request.setAttribute("flg", pid);
		request.setAttribute("isok", isok);
		return "shipping_order/EditSignDelivery";
	}
	@RequestMapping(params = "method=getimgurl")
	public String getimgurl(String iurl,
			HttpServletRequest request) {
		request.setAttribute("iurl", iurl);
		return "shipping_order/orderImg";
	}
	
	// 跳转编辑页面并且获取id 返回到页面
	@RequestMapping(params = "method=saveSignDelivery")
	public @ResponseBody
	Json saveSignDelivery(Sign_order sign_order) {
		sign_order.setSign_id(UUIDUtils.getUUID());
		int i = 0;
		dsi.updatestate(sign_order.getOrder_id());
		Json json = new Json();
		i = dsi.saveSignDelivery(sign_order);
		if (i > 0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
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
		//送货记录表导出
		@RequestMapping(params = "method=outDeliverGoods")
		public @ResponseBody String  outDeliverGoods(String datas, String[] headtitle,String[] fieldName,
				HttpServletResponse response,String send_time,String send_timet,String num ,String carnum ,String signperson ,String goods_name,String goods_num ,String car_name,String receipt_address,String order_state,String customid) {
			String filename = "送货记录导出";
			String pid = "";
			List<Delivery> list = dsi.outdeliverGoodsInfo(send_time, send_timet, num , carnum , signperson , goods_name, goods_num , car_name, receipt_address, order_state, customid);
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
				ExportUtils.outputHeaders(headtitle,workbook,"送货记录导出列表");
			//调用工具类生成内容
				ExportUtils.outputColums(fieldName, list,workbook,1,"送货记录导出列表");
				workbook.write(ouputStream);
				ouputStream.flush();
				ouputStream.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}
		
	
		//转运记录表导出
				@RequestMapping(params = "method=outgettransferGoods")
				public @ResponseBody String  outgettransferGoods(String datas, String[] headtitle,String[] fieldName,
						HttpServletResponse response,String  endaddress,String num,String carnum,String receipt,String changecompany,String pay_type,String goods_name,String goods_num,String order_state,String send_time,String end_date,String customid) {
					String filename = "转运记录表导出";
					String pid = "";
					List<Delivery> list = dsi.outgettransferGoods(endaddress, num, carnum, receipt, changecompany, pay_type, goods_name, goods_num, order_state, send_time, end_date, customid);
					for(Delivery d:list){
						
						if(d.getPay_type()==0){
							d.setHf_pay(d.getTransport_pay());
						}else if(d.getPay_type()==1){
							//paid
						}else if(d.getPay_type()==2){;
							d.setXf_pay(d.getTransport_pay());
						}else if(d.getPay_type()==3){
							d.setHdqf_pay(d.getTransport_pay());
						}
					}
					
					System.out.println(list.size());
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
						ExportUtils.outputHeaders(headtitle,workbook,"转运记录表导出列表");
					//调用工具类生成内容
						ExportUtils.outputColums(fieldName, list,workbook,1,"转运记录表导出列表");
						workbook.write(ouputStream);
						ouputStream.flush();
						ouputStream.close();

					} catch (Exception e) {
						e.printStackTrace();
					}
					return null;
				}
				
		/**
		 * 提货记录车牌号查询
		 */
		@RequestMapping(params="method=selectCarNumber")
		public  @ResponseBody String selectCarNumber(String custom_id){
			System.out.println(custom_id);
			List<Delivery> list=dsi.selectCarNumber(custom_id);
			JSONArray jsons = new JSONArray();
			JSONObject jb = null;
			for(Delivery de:list){
				jb=new JSONObject();
				jb.put("id", de.getCustom_id());
				System.out.println(de.getCustom_id());
				jb.put("name", de.getCar_number());
				jsons.add(jb);
			}
			return jsons.toString();	
		}
		
		 /**
		  * 中转公司名查询
		  * @param company
		  * @return
		  */
		@RequestMapping(params="method=selectCompany")
		public	   @ResponseBody String selectCompany(String  company){
			System.out.println(company);
			List<Delivery> list=dsi.selectCompany(company);
			System.out.println(list.size());
			JSONArray jsons = new JSONArray();
			JSONObject jb = null;
			for(Delivery de:list){
				jb=new JSONObject();
				jb.put("id", de.getCompany_id());
				System.out.println( de.getCompany_name()+"========");
				jb.put("name", de.getCompany_name());
				jsons.add(jb);
			}
			return jsons.toString();	
		 	 }
		 	
		 		/**
		 	 	 * 送货记录表车牌号查询
		 	 	 * @param car_id
		 	 	 * @return
		 	 	 */
		@RequestMapping(params="method=selectSendCar")
		public	   @ResponseBody String selectSendCar(String  car_id){
			System.out.println(car_id);
			List<Delivery> list=dsi.selectSendCar(car_id);
			JSONArray jsons = new JSONArray();
			JSONObject jb = null;
			for(Delivery de:list){
				jb=new JSONObject();
				jb.put("id", de.getCar_id());
				jb.put("name", de.getCar_number1());
				jsons.add(jb);
			}
			return jsons.toString();	
		 	 		 }
		 	 		
		 		
		 		/**
		 		 * 转运（中转）记录表车牌号查询
		 		 * @param car_id
		 		 * @return
		 		 */
		@RequestMapping(params="method=selectChangeCar")
		public	  @ResponseBody String selectChangeCar(String  car_id){
System.out.println(car_id);
			List<Delivery> list=dsi.selectChangeCar(car_id);
			JSONArray jsons = new JSONArray();
			JSONObject jb = null;
			for(Delivery de:list){
				jb=new JSONObject();
				jb.put("id", de.getCar_id());
				jb.put("name", de.getCar_number1());
				jsons.add(jb);
			}
			return jsons.toString();	
		  }
		/**
 		 * 总库存表车牌号查询
 		 * @param car_id
 		 * @return
 		 */
		@RequestMapping(params="method=selectCar")
		public	  @ResponseBody String selectCar(String  car_id){
		System.out.println(car_id);
			List<Delivery> list=dsi.selectCar(car_id);
			JSONArray jsons = new JSONArray();
			JSONObject jb = null;
			for(Delivery de:list){
				jb=new JSONObject();
				jb.put("id", de.getCar_id());
				jb.put("name", de.getCar_number1());
				jsons.add(jb);
			}
			return jsons.toString();	
		  }
		/**
 		 * 总库存表客户名称查询
 		 * @param custom_name
 		 * @return
 		 */
		/*@RequestMapping(params="method=selectCustom")
		public	  @ResponseBody String selectCustom(String  custom_name){
			List<Delivery> list=dsi.selectCustom(custom_name);
			System.out.println("==========");
			System.out.println(list.size());
			JSONArray jsons = new JSONArray();
			JSONObject jb = null;
			for(Delivery de:list){
				jb=new JSONObject();
				jb.put("id", de.getCustom_id());
				jb.put("name", de.getCustom_name());
				jsons.add(jb);
			}
			return jsons.toString();	
		  }
		*/
		
		@RequestMapping(params = "method=selectCustom")
		public @ResponseBody
		String selectCustom(String custom_name) {
			List<OrderCustom> list = dsi.selectCustom(custom_name);
			JSONObject jb = null;
			JSONArray jsons = new JSONArray();
			for (OrderCustom d : list) {
				jb = new JSONObject();
				jb.put("id", d.getCustomer_id());
				jb.put("name", d.getCustomer_name());
				jsons.add(jb);
			}
			return jsons.toString();
		}
		
		
}
