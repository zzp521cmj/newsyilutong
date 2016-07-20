package com.jy.action;

import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.common.ExportUtils;
import com.jy.dao.waybillDao;
import com.jy.model.ShippingManual;
import com.jy.model.ShippingOrder;
@Controller
@RequestMapping(value = "/waybill.do")
public class waybillInfoController {
	@Resource
	private waybillDao waybillDao;
	private String end_time;
	
	@RequestMapping(params="method=getwaybill")
	public String waybill(){
		return "shipping_order/waybillInfo";
		
	}
	// 全部查询
		@RequestMapping(params = "method=getShipManual")
		public @ResponseBody
		Map getShipManualInfo(String rows, String page, String start_time,String end_time,String send_station,String end_address,String num,String receipt,String custom_name,String order_state,String pay_type ,String send_type,String goods_name) {
			Integer rows1 = 0;// 当前有几行
			Integer page1 = 1;// 当前有几页
			if (rows != null && !"".equals(rows)) {
				rows1 = Integer.parseInt(rows);
			}
			if (page != null && !"".equals(page)) {
				page1 = Integer.parseInt(page);
			}
			List<ShippingOrder> list = waybillDao.getShipManualInfo((page1 - 1) * rows1,
					rows1, start_time, end_time, send_station, end_address, num, receipt, custom_name, order_state, pay_type , send_type, goods_name);
			
			int count = waybillDao.getShipManual(start_time, end_time, send_station, end_address, num, receipt, custom_name, order_state, pay_type , send_type, goods_name);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("total", count);
			map.put("rows", list);
			return map;
		}
		// 导出
		@RequestMapping(params = "method=outShipManual")
		public @ResponseBody
		String outShipManual(String datas, String[] headtitle, String[] fieldName,
				HttpServletResponse response,String start_time,String end_time,String send_station,String end_address,String num,String receipt,String custom_name,String order_state,String pay_type ,String send_type,String goods_name) {
			String filename = "运单信息导出";
			List<ShippingOrder> list = waybillDao.getShipManuals(start_time, end_time, send_station, end_address, num, receipt, custom_name, order_state, pay_type, send_type, goods_name);
			System.out.println("导出查询到的长度===="+list.size());
			for (ShippingOrder spo : list) {
				if (spo.getSend_type().equals("0")) {
					spo.setSend_type("送货");
				}else if (spo.getSend_type().equals("1")) {
					spo.setSend_type("自提");
				}
				if(spo.getCreat_type().equals("0")){
						spo.setCreat_type("手录");
					}else if(spo.getCreat_type().equals("1")){
						spo.setCreat_type("PC端录入");
					}else if (spo.getCreat_type().equals("2")) {
						spo.setCreat_type("无缝对接");		
				}else if (spo.getCreat_type().equals("3")) {
					spo.setCreat_type("APP端录入");		
				}
				if(spo.getPhone_state().equals("0")){
					spo.setPhone_state("是");
				}else if(spo.getPhone_state().equals("1")){
					spo.setPhone_state("否");
				}
				if(spo.getInvoice_state().equals("0")){
					spo.setInvoice_state("否");
				}else if(spo.getInvoice_state().equals("1")){
					spo.setInvoice_state("是");
				}
				if(spo.getShiping_check().equals("0")){
					
					spo.setShiping_check("未核对");
				}else if(spo.getShiping_check().equals("1")){
					
					spo.setShiping_check("已核对");
				}
				
	if(spo.getTransport_mode().equals("0")){
					
					spo.setTransport_mode("普快");
				}else if(spo.getTransport_mode().equals("1")){
					
					spo.setTransport_mode("特快");
				}
				
				if (spo.getPay_type().equals("0")) {
					spo.setPay_type("回付 ");
				} else if (spo.getPay_type().equals("1")) {
					spo.setPay_type("提付");
				} else if (spo.getPay_type().equals("2")) {
					spo.setPay_type("现付");
				} else if (spo.getPay_type().equals("3")) {
					spo.setPay_type("货到前付");
				} 
				
				if(spo.getShipping_order_state().equals("0")){
					spo.setShipping_order_state("未出库");
				}else if(spo.getShipping_order_state().equals("1")){
					spo.setShipping_order_state("配送中");
				}else if(spo.getShipping_order_state().equals("2")){
					spo.setShipping_order_state("转运中");
				}else if(spo.getShipping_order_state().equals("3")){
					spo.setShipping_order_state("到达");
				}else if(spo.getShipping_order_state().equals("4")){
					spo.setShipping_order_state("签收");
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
		
		
		// 勾选导出
				@RequestMapping(params = "method=outShipManuals")
				public @ResponseBody
				String outShipManuals(String datas, String[] headtitle1, String[] fieldName1,
						HttpServletResponse response,String[] ShippingOrderid) {
					String filename = "运单信息导出";
					List<ShippingOrder> list = waybillDao.outShi(ShippingOrderid);
					for (ShippingOrder spo : list) {
						if (spo.getSend_type().equals("0")) {
							spo.setSend_type("送货");
						}else if (spo.getSend_type().equals("1")) {
							spo.setSend_type("自提");
						}
						if(spo.getCreat_type().equals("0")){
								spo.setCreat_type("手录");
							}else if(spo.getCreat_type().equals("1")){
								spo.setCreat_type("PC端录入");
							}else if (spo.getCreat_type().equals("2")) {
								spo.setCreat_type("无缝对接");		
						}else if (spo.getCreat_type().equals("3")) {
							spo.setCreat_type("APP端录入");		
						}
						if(spo.getPhone_state().equals("0")){
							spo.setPhone_state("是");
						}else if(spo.getPhone_state().equals("1")){
							spo.setPhone_state("否");
						}
						if(spo.getInvoice_state().equals("0")){
							spo.setInvoice_state("是");
						}else if(spo.getInvoice_state().equals("1")){
							spo.setInvoice_state("否");
						}
						if(spo.getShiping_check().equals("0")){
							
							spo.setShiping_check("未核对");
						}else if(spo.getShiping_check().equals("1")){
							
							spo.setShiping_check("已核对");
						}
						if(spo.getTransport_mode().equals("0")){
							
							spo.setTransport_mode("普快");
						}else if(spo.getTransport_mode().equals("1")){
							
							spo.setTransport_mode("特快");
						}else{
							
							spo.setTransport_mode("普快");
						}
						
						if (spo.getPay_type().equals("0")) {
							spo.setPay_type("回付 ");
						} else if (spo.getPay_type().equals("1")) {
							spo.setPay_type("提付");
						} else if (spo.getPay_type().equals("2")) {
							spo.setPay_type("现付");
						} else if (spo.getPay_type().equals("3")) {
							spo.setPay_type("货到前付");
						} 
						
						if(spo.getShipping_order_state().equals("0")){
							spo.setShipping_order_state("未出库");
						}else if(spo.getShipping_order_state().equals("1")){
							spo.setShipping_order_state("配送中");
						}else if(spo.getShipping_order_state().equals("2")){
							spo.setShipping_order_state("转运中");
						}else if(spo.getShipping_order_state().equals("3")){
							spo.setShipping_order_state("到达");
						}else if(spo.getShipping_order_state().equals("4")){
							spo.setShipping_order_state("签收");
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
						ExportUtils.outputHeaders(headtitle1, workbook, "运单信息导出");
						// 调用工具类生成内容
						ExportUtils.outputColums(fieldName1, list, workbook, 1, "运单信息导出");
						workbook.write(ouputStream);
						ouputStream.flush();
						ouputStream.close();

					} catch (Exception e) {
						e.printStackTrace();
					}
					return null;
				}
		
}
