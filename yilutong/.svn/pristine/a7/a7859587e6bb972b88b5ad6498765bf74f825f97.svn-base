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
import com.jy.model.Unqualified;
import com.jy.model.invoice;
import com.jy.service.ReceiptService;
import com.jy.service.invoiceService;

@Controller
@RequestMapping(value = "/invoice.do")
public class invoiceControoller {
	
	@Resource
	private invoiceService  invoiceService;
	
	@RequestMapping(params = "method=invoice")
	public String receipt(){
		return "invoice/invoiceinfo";
	}
	
	@RequestMapping(params = "method=selectinvoice")
	public @ResponseBody Map selectinvoice(String rows, String page,String receiptstartdate,String receiptendate,String shiping_order_num,String invoice_state,String whether){
		Integer rows1=0;
		Integer page1=1;
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		System.out.println("状态"+ whether);
		List<invoice> list=invoiceService.selectinvoice((page1 - 1) * rows1,rows1, receiptstartdate, receiptendate, shiping_order_num, invoice_state, whether);
		int count=invoiceService.selectinvoicelist(receiptstartdate, receiptendate, shiping_order_num, invoice_state, whether);
				
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}
	
	
	// 导出信息
			@RequestMapping(params = "method=outShipunqualified")
			public @ResponseBody
			String outShipunqualified(String datas, String[] headtitle, String[] fieldName,
					HttpServletResponse response,String receiptstartdate,String receiptendate,String shiping_order_num,String invoice_state,String whether,String [] invoiceid) {
				String filename = "开票信息导出";
				List<invoice> list;
			if(invoiceid.length>0){
				list=invoiceService.selectinvoices(null,null,null,null,null,invoiceid);
				
			}else{
				list = invoiceService.selectinvoices(receiptstartdate, receiptendate, shiping_order_num, invoice_state, whether,null);
			}
				for (invoice invoicess : list) {	
				if(invoicess.getInvoice_type()!=null){
				if(invoicess.getInvoice_type().equals("0")){
					invoicess.setInvoice_type("已处理");
				}else if(invoicess.getInvoice_type().equals("1")){
					invoicess.setInvoice_type("未处理");
				};
				}else{
					invoicess.setInvoice_type("未处理");
				}
				if(invoicess.getReceipt_dime()==null){
					invoicess.setReceipt_dime("还未处理");
				}
				if(invoicess.getReceipt_remark()==null){
					invoicess.setReceipt_remark("还未处理");
				}
				if(invoicess.getReceipt_number()==null){
					invoicess.setReceipt_number("还未处理");
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
					ExportUtils.outputHeaders(headtitle, workbook, "发票信息导出");
					// 调用工具类生成内容
					ExportUtils.outputColums(fieldName, list, workbook, 1, "发票信息导出");
					workbook.write(ouputStream);
					ouputStream.flush();
					ouputStream.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				return null;
			}
//勾选导出信息
			@RequestMapping(params = "method=outShipunqualifieds")
			public @ResponseBody
			String outShipunqualifieds(String datas, String[] headtitle1, String[] fieldName1,
					HttpServletResponse response,String [] invoiceid) {
				String filename = "开票信息导出";
	
				for (String string : invoiceid) {
					System.out.println(string);
				}
				List<invoice> list = invoiceService.outShi(invoiceid);
			for (invoice invoicess : list) {
			
				if(invoicess.getInvoice_type()!=null){
				if(invoicess.getInvoice_type().equals("0")){
					invoicess.setInvoice_type("已处理");
				}else if(invoicess.getInvoice_type().equals("1")){
					invoicess.setInvoice_type("未处理");
				};
				}else{
					invoicess.setInvoice_type("未处理");
				
					
				}
				if(invoicess.getReceipt_dime()==null){
					invoicess.setReceipt_dime("还未处理");
				}
				if(invoicess.getReceipt_remark()==null){
					invoicess.setReceipt_remark("还未处理");
				}
				if(invoicess.getReceipt_number()==null){
					invoicess.setReceipt_number("还未处理");
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
				ExportUtils.outputHeaders(headtitle1, workbook, "发票信息导出");
				// 调用工具类生成内容
				ExportUtils.outputColums(fieldName1, list, workbook, 1, "发票信息导出");
				workbook.write(ouputStream);
				ouputStream.flush();
				ouputStream.close();
			
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;	
			}
			}