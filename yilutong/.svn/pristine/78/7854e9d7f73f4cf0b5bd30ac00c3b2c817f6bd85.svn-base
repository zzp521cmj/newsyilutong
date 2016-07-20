package com.jy.action;

import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.common.ExportUtils;
import com.jy.model.CreateAgreement;
import com.jy.model.OrderCustom;
import com.jy.model.ShippingOrder;
import com.jy.service.MarginOrderService;

/*
 * 毛利管理
 * */
@Controller
@RequestMapping(value = "/margin.do")
public class MarginOrderController {
	@Resource
	private MarginOrderService mos;
	@RequestMapping(params = "method=getShipOrderMargin")
	public String getShipOrderMargin() {
		return "margin/orderShippingOrderMargin";
	}
	@RequestMapping(params = "method=getSourceShipMargin")
	public String getOrderCustomMargin() {
		return "margin/orderCustomMargin";
	}
	@RequestMapping(params = "method=getSearchShipMargin")
	public String getSearchShipMargin(String custom_id,HttpServletRequest request) {
		request.setAttribute("custom_id", custom_id);
		return "margin/shippingOrderMargin";
	}
	
	@RequestMapping(params = "method=getSourceShip")
	public @ResponseBody
	Map getSourceShip(String rows, String page, 
			String name ,String start_date1,String end_date2,String start_date,String end_date,String car_number,String driver_name) {
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		List<CreateAgreement> list = mos.getMarginOrder((page1 - 1) * rows1,rows1, name, start_date1, end_date2, start_date, end_date, car_number, driver_name, null, null,null);
		int count = mos.getMarginOrderCount(name, start_date1, end_date2, start_date, end_date, car_number, driver_name, null, null);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}
	@RequestMapping(params = "method=getShipOrder")
	public @ResponseBody 
	Map getShipOrder(String rows, String page, String name,
			String phone_number, String type, String start_date, String end_date,String pid,String phone,String order_state,String pay_type,String send_address,String custom_id) {
		
		List<ShippingOrder> ships=new ArrayList<ShippingOrder>();
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		List<ShippingOrder> list = mos.getMarginShip((page1 - 1) * rows1,
				rows1, name, phone_number, type, start_date, end_date,pid,phone, order_state, pay_type, send_address,custom_id);
		int count = mos.getMarginShipCount(name, phone_number, type, start_date,
				end_date,pid, phone, order_state, pay_type, send_address,custom_id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}
	
	/*
	 * 导出
	 * */
	@RequestMapping(params = "method=outSourceShip")
	public @ResponseBody
	List<OrderCustom> outSourceShip(HttpServletResponse response,String[] headtitle, String[] fieldName,String name ,String start_date1,String end_date2,String start_date,String end_date,String car_number,String driver_name,String [] charray) {
		String filename = "毛利信息导出";
		List<CreateAgreement> list=new ArrayList<CreateAgreement>();
		if(charray!=null&&charray.length>0){
			list=mos.getMarginOrder(null, null, null, null, null, null, null, null, null, null, null,charray);
		}else{
			list=mos.getMarginOrder(null, null, name, start_date1, end_date2, start_date, end_date, car_number, driver_name, null, null,null);
			
		}
		float tals=0;
		float talf=0;
		float ml=0;		
		for(int i=0;i<list.size();i++){
			tals=Float.parseFloat(list.get(i).getTransport_pays())+tals;
			talf=Float.parseFloat(list.get(i).getAll_money())+talf;
			ml=Float.parseFloat(list.get(i).getMoney_cha())+ml;
		}
		CreateAgreement ca=new CreateAgreement();
		ca.setCreate_time("合计");
		ca.setTransport_pays(tals+"0");
		ca.setAll_money(talf+"0");
		ca.setMoney_cha(ml+"0");
		list.add(ca);
	/*	for(OrderCustom os:list){
			if(os.getPaid3()==null||"".equals(os.getPaid3())){
				os.setPaid3("0");
			}
			if(os.getTrade_agency()==null||"".equals(os.getTrade_agency())){
				os.setTrade_agency("0");
			}
			if(os.getPaid()==null||"".equals(os.getPaid())){
				os.setPaid("0");
			}
			if(os.getPaid1()==null||"".equals(os.getPaid1())){
				os.setPaid1("0");
			}
			if(os.getTrade_agency()==null||"".equals(os.getTrade_agency())){
				os.setTrade_agency("0");
			}
			if(os.getTrade_sum()==null||"".equals(os.getTrade_sum())){
				os.setTrade_sum("0");
			}
			if(os.getReality_sum()==null||"".equals(os.getReality_sum())){
				os.setReality_sum("0");
			}
			Double Trade_sum=Double.parseDouble(os.getTrade_sum())+Double.parseDouble(os.getPaid())+Double.parseDouble(os.getTrade_agency());
			Double Reality_sum=Double.parseDouble(os.getTrade_sum())+Double.parseDouble(os.getPaid())+Double.parseDouble(os.getPaid1());
			os.setTrade_sum(Trade_sum.toString());//代收合计
			os.setReality_sum(Reality_sum.toString());//实收合计
			
			if(os.getChange_pay()==null||"".equals(os.getChange_pay())){
				os.setChange_pay("0");
			}
			if(os.getSend_fee()==null||"".equals(os.getSend_fee())){
				os.setSend_fee("0");
			}
			if(os.getAdorn_fee2()==null||"".equals(os.getAdorn_fee2())){
				os.setAdorn_fee2("0");
			}
			if(os.getPayble_other()==null||"".equals(os.getPayble_other())){
				os.setPayble_other("0");
			}
			if(os.getPay_sum()==null||"".equals(os.getPay_sum())){
				os.setPay_sum("0");
			}
			Double pay_sum=Double.parseDouble(os.getPay_sum())+Double.parseDouble(os.getChange_pay())+Double.parseDouble(os.getAdorn_fee2())+Double.parseDouble(os.getSend_fee())+Double.parseDouble(os.getPayble_other());
			os.setPay_sum(pay_sum.toString());//应付款合计
			
			if(os.getChange_fee1()==null||"".equals(os.getChange_fee1())){
				os.setChange_fee1("0");
			}
			if(os.getSend_fee1()==null||"".equals(os.getSend_fee1())){
				os.setSend_fee1("0");
			}
			if(os.getAdorn_fee1()==null||"".equals(os.getAdorn_fee1())){
				os.setAdorn_fee1("0");
			}
			if(os.getSend_other()==null||"".equals(os.getSend_other())){
				os.setSend_other("0");
			}
			if(os.getReality_pay_sum()==null||"".equals(os.getReality_pay_sum())){
				os.setReality_pay_sum("0");
			}
			Double Reality_pay_sum=Double.parseDouble(os.getReality_pay_sum())+Double.parseDouble(os.getChange_fee1())+Double.parseDouble(os.getSend_fee1())+Double.parseDouble(os.getAdorn_fee1())+Double.parseDouble(os.getSend_other());
			os.setReality_pay_sum(Reality_pay_sum.toString());//实付款合计
			
			if(os.getRemarks_fee2()==null||"".equals(os.getRemarks_fee2())){
				os.setRemarks_fee2("0");
			}
			if(os.getTrunk_fee_c()==null||"".equals(os.getTrunk_fee_c())){
				os.setTrunk_fee_c("0");
			}
			if(os.getTake_fee_c()==null||"".equals(os.getTake_fee_c())){
				os.setTake_fee_c("0");
			}
			if(os.getBorn_fee()==null||"".equals(os.getBorn_fee())){
				os.setBorn_fee("0");
			}
			if(os.getAdorn_fee_c()==null||"".equals(os.getAdorn_fee_c())){
				os.setAdorn_fee_c("0");
			}
			if(os.getFee_sum_c()==null||"".equals(os.getFee_sum_c())){
				os.setFee_sum_c("0");
			}
			Double fee_sum_c=Double.parseDouble(os.getFee_sum_c())+Double.parseDouble(os.getTrunk_fee_c())+Double.parseDouble(os.getTake_fee_c())+Double.parseDouble(os.getBorn_fee())+Double.parseDouble(os.getAdorn_fee_c());
			os.setFee_sum_c(fee_sum_c.toString());
			
			if(os.getTrunk_fee1_c()==null||"".equals(os.getTrunk_fee1_c())){
				os.setTrunk_fee1_c("0");
			}
			if(os.getTake_fee1_c()==null||"".equals(os.getTake_fee1_c())){
				os.setTake_fee1_c("0");
			}
			if(os.getAdorn_fee1_c()==null||"".equals(os.getAdorn_fee1_c())){
				os.setAdorn_fee1_c("0");
			}
			if(os.getReality_fee_sum_c()==null||"".equals(os.getReality_fee_sum_c())){
				os.setReality_fee_sum_c("0");
			}
			Double reality_fee_sum_c=Double.parseDouble(os.getReality_fee_sum_c())+Double.parseDouble(os.getTrunk_fee1_c())+Double.parseDouble(os.getTake_fee1_c())+Double.parseDouble(os.getAdorn_fee1_c())+Double.parseDouble(os.getBorn_fee());
			os.setReality_fee_sum_c(reality_fee_sum_c.toString());
		}*/
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
			ExportUtils.outputHeaders(headtitle, workbook, "毛利信息导出");
			// 调用工具类生成内容
			ExportUtils.outputColums(fieldName, list, workbook, 1, "毛利信息导出");
			workbook.write(ouputStream);
			ouputStream.flush();
			ouputStream.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping(params = "method=outShipOrder")
	public @ResponseBody 
	List<ShippingOrder> outShipOrder(HttpServletResponse response,String[] headtitle,String[] fieldName,String custom_id) {
		System.out.println("-=-=-=-=--"+custom_id);
		String filename = "单票毛利信息导出";
		List<ShippingOrder> list=mos.getMarginShip(null,null,null,null,null,null,null,null,null,null,null,null,custom_id);
		for(ShippingOrder os:list){
			if(os.getTrade_agency()==null||"".equals(os.getTrade_agency())){
				os.setTrade_agency("0");
			}
			if(os.getPaid()==null||"".equals(os.getPaid())){
				os.setPaid("0");
			}
			if(os.getPaid1()==null||"".equals(os.getPaid1())){
				os.setPaid1("0");
			}
			if(os.getTrade_sum()==null||"".equals(os.getTrade_sum())){
				os.setTrade_sum("0");
			}
			if(os.getReality_sum()==null||"".equals(os.getReality_sum())){
				os.setReality_sum("0");
			}
			Double Trade_sum=Double.parseDouble(os.getTrade_sum())+Double.parseDouble(os.getTrade_agency())+Double.parseDouble(os.getPaid());
			Double Reality_sum=Double.parseDouble(os.getReality_sum())+Double.parseDouble(os.getPaid1())+Double.parseDouble(os.getPaid());
			os.setTrade_sum(Trade_sum.toString());//代收合计
			os.setReality_sum(Reality_sum.toString());//实收合计
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
			ExportUtils.outputHeaders(headtitle, workbook, "单票毛利信息导出");
			// 调用工具类生成内容
			ExportUtils.outputColums(fieldName, list, workbook, 1, "单票毛利信息导出");
			workbook.write(ouputStream);
			ouputStream.flush();
			ouputStream.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	@RequestMapping(params = "method=updataRemarkCustom")
	public @ResponseBody 
	String updataRemarkCustom(String id,String remarks_fee1,String remarks_fee2) throws UnsupportedEncodingException {
		if(remarks_fee1!=null){
			remarks_fee1=new String(remarks_fee1.getBytes("ISO-8859-1"),"utf-8");
		}
		if(remarks_fee2!=null){
			remarks_fee2=new String(remarks_fee2.getBytes("ISO-8859-1"),"utf-8");
		}
		int i=mos.updataRemarkCustom(id, remarks_fee1, remarks_fee2);
		return null;
	}
	@RequestMapping(params = "method=updataRemarkShip")
	public @ResponseBody 
	String updataRemarkShip(String id,String charge_remark1,String charge_remark2) throws UnsupportedEncodingException {
		if(charge_remark1!=null){
			charge_remark1=new String(charge_remark1.getBytes("ISO-8859-1"),"utf-8");
		}
		if(charge_remark2!=null){
			charge_remark2=new String(charge_remark2.getBytes("ISO-8859-1"),"utf-8");
		}
		int i=mos.updataRemarkShip(id, charge_remark1, charge_remark2);
		return null;
	}
	
}
