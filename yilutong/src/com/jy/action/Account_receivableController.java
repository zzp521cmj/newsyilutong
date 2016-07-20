package com.jy.action;

import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.common.ExportUtils;
import com.jy.dao.Account_payableDao;
import com.jy.dao.Account_receivableDao;
import com.jy.model.Customer;
import com.jy.model.ShippingOrder;

@Controller
@RequestMapping(value = "/receivable.do")
public class Account_receivableController {
	
	@Resource
	private Account_receivableDao aro;
	
  //跳转到应收款页面
	@RequestMapping(params="method=skip")
	public String  skip(){
		return "expense_report/account_receivable";
		
	}
	
	/*
	 *  查询全部
	 */
	@RequestMapping(params="method=dueselect")
	public @ResponseBody
	Map<String, Object> dueselect(String rows, String page,
			String custom_name,String receipt, String shiping_order_num,String close_recheck) {
		Integer rows1 = 0; // 当前的行数
		Integer page1 = 1; // 当前的页数
		if (rows != null && !rows.equals("")) {
			rows1 = Integer.valueOf(rows);
		}
		if (page != null && !page.equals("")) {
			page1 = Integer.valueOf(page);
		}
		List<ShippingOrder> list = aro.dueselect((page1 - 1) * rows1, rows1, custom_name, receipt, shiping_order_num,close_recheck);
		int count = aro.count(custom_name, receipt, shiping_order_num,close_recheck);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;

	}
	
	
	/*
	 * 查询发货的方法
	 */
	@RequestMapping(params = "method=inquireName")
	public @ResponseBody
	String inquireName(String custom_name) {
		List<Customer> flist = aro.inquireName(custom_name);
		JSONObject jb = null;
		JSONArray jsons = new JSONArray();
		for (Customer f : flist) {
			jb = new JSONObject();
			jb.put("id", f.getCustomer_name());
			jb.put("name", f.getCustomer_name());
			jsons.add(jb);
		}
		return jsons.toString();
	}
	
	
	/*
	 * 查询收货客户的方法
	 */
	@RequestMapping(params = "method=inquireName1")
	public @ResponseBody
	String inquireName1(String receipt) {
		List<ShippingOrder> flist = aro.inquireName1(receipt);
		JSONObject jb = null;
		JSONArray jsons = new JSONArray();
		for (ShippingOrder f : flist) {
			jb = new JSONObject();
			jb.put("id", f.getReceipt());
			jb.put("name", f.getReceipt());
			jsons.add(jb);
		}
		return jsons.toString();
	}
	
	/*
	 * 导出
	 */
			@RequestMapping(params = "method=exportunqualified")
			public @ResponseBody
			String exportunqualified(String datas, String[] headtitle, String[] fieldName,
					HttpServletResponse response) {
				String filename = "应付款导出";
				List<ShippingOrder> list = aro.exportunqualified();
				/*for (ShippingOrder ShippingOrder : list) {
					if(claim_settlement.getClaims_state().equals("0")){
						claim_settlement.setClaims_state("审核过通");
					}else if(claim_settlement.getClaims_state().equals("1")){
						claim_settlement.setClaims_state("未审核");
					}else if(claim_settlement.getClaims_state().equals("2")){
						claim_settlement.setClaims_state("审核未通过");
					}
					if(claim_settlement.getSubmit_state().equals("1")){
						claim_settlement.setSubmit_state("未提交");
					}else if(claim_settlement.getSubmit_state().equals("0")){
						claim_settlement.setSubmit_state("已提交");
					}
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
					ExportUtils.outputHeaders(headtitle, workbook, "应付款导出");
					// 调用工具类生成内容
					ExportUtils.outputColums(fieldName, list, workbook, 1, "应付款导出");
					workbook.write(ouputStream);
					ouputStream.flush();
					ouputStream.close();

				} catch (Exception e) {
					e.printStackTrace();
				}
				return null;
			}
			
			/**
			 * 勾选导出
			 * 
			 * **/
			@RequestMapping(params = "method=outShi")
            public @ResponseBody
           List<ShippingOrder> outShi(HttpServletResponse response,String[] headtitle,
        		   String[] fieldName,String[] checkarray){
				String filename = "应付款导出";	;
				List<ShippingOrder> list = aro.outShi(checkarray);
				/*for (ShippingOrder so : list) {
					if (so!=null) {				
					if (so.getClaims_state()!=null&&so.getClaims_state()!="null"&&so.getClaims_state().equals("0")) {
						so.setClaims_state("审核通过");
					} if (so.getClaims_state()!=null&&so.getClaims_state()!="null"&&so.getClaims_state().equals("1")) {
						so.setClaims_state("未审核");
					} if (so.getClaims_state()!=null&&so.getClaims_state()!="null"&&so.getClaims_state().equals("2")) {
						so.setClaims_state("审核未通过");
					} 
				}
				}*/
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
					ExportUtils.outputHeaders(headtitle, workbook, "应付款导出");
					// 调用工具类生成内容
					ExportUtils.outputColums(fieldName, list, workbook, 1, "应付款导出");
					workbook.write(ouputStream);
					ouputStream.flush();
					ouputStream.close();
				
				} catch (Exception e) {
					e.printStackTrace();
				}
				return null;	
			}
}
