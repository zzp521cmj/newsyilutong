package com.jy.action;

import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.jy.common.ExportUtils;
import com.jy.common.UUIDUtils;
import com.jy.dao.Json;
import com.jy.model.Customer;
import com.jy.model.Receipt;
import com.jy.model.ShippingOrder;
import com.jy.model.invoice;
import com.jy.service.ReceiptService;

@Controller
@RequestMapping(value = "/receipt.do")
public class ReceiptController {
	
	@Resource
	private ReceiptService  receiptservice;
	
	@RequestMapping(params = "method=receipt")
	public String receipt(){
		return "order/ReceiptOrders";
	}
	@RequestMapping(params = "method=selectreceipt")
	public @ResponseBody Map selectreceipt(String rows, String page,String receiptstartdate,String receiptendate,String shiping_order_num,String invoice_state,String whether,String pid){
		Integer rows1=0;
		Integer page1=1;
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		System.out.println("查询==="+whether);
		List<invoice> list=receiptservice.selectReceipt((page1 - 1) * rows1,rows1, receiptstartdate, receiptendate, shiping_order_num, invoice_state, whether,pid);
		int count=receiptservice.selectReceiptlist(receiptstartdate, receiptendate, shiping_order_num, invoice_state, whether,pid);
				
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}
	
	
	@RequestMapping(params = "method=disposereceipt")
	public  @ResponseBody Json disposereceipt(Receipt receipt,String  pid ,String receipt_number,String remarks){
		int b = 0;

	int a=0;
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
			receipt.setReceipt_id(UUIDUtils.getUUID());
			receipt.setOrder_id(pid);
			receipt.setReceipt_number(receipt_number);
			receipt.setReceipt_remark(remarks);
			receipt.setReceipt_dime(df.format(new Date()));
			System.out.println("时间是"+df.format(new Date()));
			System.out.println("订单号"+receipt.getOrder_id()+"uuID"+receipt.getReceipt_id()+"编号"+receipt.getReceipt_number());
			a=receiptservice.updatetype(pid);
			b=receiptservice.disposereceipt(receipt);
	
		Json json=new Json();
		if(b>0||a>0){
			json.setFlag(true);
		}else{
			json.setFlag(false);
		}
		return json;
		
	}
	
	
	
	
	@RequestMapping(params="method=getRemarkslist")
	public @ResponseBody Map<String,Object> getRemarks(String page,String rows,String remark_name,String order_id,String kuhu_date,String kuhu_dates){
		//当前第几页
		Integer page2=1;
		//当前页一共几条
		Integer rows1=0;
		if(page!=null&&!"".equals(page)){
			page2= Integer.parseInt(page);
		}
		if(rows!=null&&!"".equals(rows)){
			rows1= Integer.parseInt(rows);
		}
		int total = receiptservice.getCount(remark_name, order_id,kuhu_date,kuhu_dates);
		List<Customer> list=receiptservice.getRemarks((page2-1)*rows1,rows1,remark_name, order_id,kuhu_date,kuhu_dates);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("total", total);
		map.put("rows", list);
		return map;
	}
	
	
	
	
	
	@RequestMapping(params="method=ReceiptOrder")
	public String shTraspfree(HttpServletRequest request,String  pid){			
		request.setAttribute("flg", pid);
	
		return "order/ReceiptOrder";
	}
	
	@RequestMapping(params="method=makedispose")
	public String makedispose(HttpServletRequest request,String  pid){			
		request.setAttribute("flg", pid);
	System.out.println("传过来的订单id"+pid);
		return "order/makedispose";
	}

	@RequestMapping(params = "method=selectlistreceipt")
	public @ResponseBody Json selectlistreceipt(String[] pid){
		Json json = new Json();
		int cc=0;
		
		for (String string : pid) {
			
			System.out.println();
			int a=receiptservice.selectreceipt(string);
			System.out.println("计算相差的天数"+a);
			if(a>30){
				cc=cc+1;
				a=0;
			}
		}
		if(cc<1){
			json.setFlag(false);
			return json;
		}else{
			json.setFlag(true);
			return json;
		}
	}
	
	//批量取消发票
		@RequestMapping(params = "method=updatereceipt")
		public @ResponseBody
		Json updatereceipt(String[] pid) {
			Json json = new Json();
			int cc=0;
			for (String string : pid) {
				int a=receiptservice.selectreceipt(string);
				if(a>30){
					cc++;
					json.setFlag(false);
					return json;
				}
			}
			int ee=receiptservice.offupdatetype(pid);
			int list=receiptservice.updatereceipt(pid);
			if (list > 0||ee>0) {
				json.setFlag(true);
				return json;
			}
			json.setFlag(false);
			return json;
			}
		
		
		//客户导出
		@RequestMapping(params = "method=getRemarkdc")
		public @ResponseBody List<Customer> getRemarkdc(HttpServletResponse response,String[] headtitle, String[] fieldName,String ddId, String remark_name,String order_id,String kuhu_date,String kuhu_dates,String [] checkarray){
			String filename = "发票客户信息导出";	
			List<Customer> list;
			if(checkarray!=null&&checkarray.length>0){
				list= receiptservice.getRemarkdc(null,null,null,null,checkarray);					
			}else{
				list= receiptservice.getRemarkdc(remark_name, order_id, kuhu_date, kuhu_dates, null);
				
			}
		
			for (Customer customer : list) {
				if(customer.getCustomer_grade()!=null){
				if(customer.getCustomer_grade().equals("0")){
					customer.setCustomer_grade("散货");
				}else if(customer.getCustomer_grade().equals("1")) {
					customer.setCustomer_grade("大宗");			
				}else if(customer.getCustomer_grade().equals("2")){
					customer.setCustomer_grade("项目落仓");
				}else{
					customer.setCustomer_grade("");
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
		
		//发票导出
		@RequestMapping(params = "method=selectinvoices")
		public @ResponseBody List<invoice> selectinvoices(HttpServletResponse response,String[] headtitle, String[] fieldName,String ddId, String receiptstartdate,String receiptendate,String shiping_order_num,String invoice_state,String whether,String pids,String [] checkarray){
			String filename = "发票信息导出";	
			List<invoice> list;
			System.out.println(checkarray.length);
			if(checkarray!=null&&checkarray.length>0){
				list= receiptservice.selectinvoices(null,null,null,null,null,pids,checkarray);			
			}else{
				list= receiptservice.selectinvoices(receiptstartdate, receiptendate, shiping_order_num,invoice_state,whether,pids, null);
				
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
		
		
		
		
}
