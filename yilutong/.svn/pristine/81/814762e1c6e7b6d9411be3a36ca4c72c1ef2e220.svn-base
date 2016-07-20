package com.jy.action;



import java.io.OutputStream;
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
import com.jy.common.UUIDUtils;
import com.jy.dao.Json;
import com.jy.model.OrderCustom;
import com.jy.model.RejectedRecord;
import com.jy.model.ShippingOrder;
import com.jy.model.Unqualified;
import com.jy.service.UnqualifiedService;

@Controller
@RequestMapping(value = "/unqualified.do")
public class UnqualifiedController {
	@Resource
	private UnqualifiedService tc;
	@RequestMapping(params = "method=getunqualified")
	public String getunqualified() {
		return "order/unqualified";
	}
	//跳转到单个审核页面
			@RequestMapping(params="method=shSettlement")
			public String shTraspfree(HttpServletRequest request,String [] pid){			
				request.setAttribute("pid", pid);
				return "order/thSettlement";
			}
	//跳转到修改的页面
	@RequestMapping(params = "method=getupdateunqualified")
	public String getupdateunqualified(String pid, HttpServletRequest request) {

		request.setAttribute("flg", pid);
		return "order/unquualifiedUpdate";
	}
	//跳转到添加的页面
	@RequestMapping(params = "method=unqualifiedadd")
	public String unqualifiedadd() {
		return "order/unquualifiedAdd";
	}
	//跳转到查询所有运单的页面
		@RequestMapping(params = "method=getselectorder")
		public String getselectorder() {
			return "order/selectOrder";
		}
	@RequestMapping(params = "method=selectunqualified")
	public @ResponseBody Unqualified selectunqualified(String pid){
		Unqualified unqualified=tc.getunqualified(pid);
		return unqualified;
	}
	@RequestMapping(params = "method=addunqualified")
	public @ResponseBody Json addunqualified(Unqualified unqualified){
		unqualified.setAbnormalid(UUIDUtils.getUUID());

		int a=tc.addunqualified(unqualified);
		Json json=new Json();
		if(a>0){
			json.setFlag(true);
		}else{
			json.setFlag(false);
		}
		return json;
	}
	
	@RequestMapping(params = "method=selectunqualifieds")
	public @ResponseBody
	Map selectunqualifieds(String page, String rows,String reportedfrontdate,
			String reportedqueendate, String submitfrontdate,
			String submintdqueendate, String auditsign, String documents_state,
			String shiping_order_num) {
		// 当前第几页
		Integer page2 = 1;
		// 当前页一共几条
		Integer rows1 = 0;
		if (page != null && !"".equals(page)) {
			page2 = Integer.parseInt(page);
		}
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}

		List<Unqualified> list = tc.selectunqualified((page2 - 1) * rows1, rows1, reportedfrontdate, reportedqueendate, submitfrontdate, submintdqueendate, auditsign, documents_state, shiping_order_num);
		int count = tc.selectunqualifiedlist(reportedfrontdate, reportedqueendate, submitfrontdate, submintdqueendate, auditsign, documents_state, shiping_order_num);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}
	//修改是否提交
	@RequestMapping(params = "method=updatedocuments")
	public  @ResponseBody Json updatedocuments(String [ ] pid,String did,String notes){
		int a=tc.updateunqualified(pid,did,notes);
		Json json=new Json();
		if(a>0){
			json.setFlag(true);
		}else{
			json.setFlag(false);
		}
		return json;
	}
	//批量删除
	@RequestMapping(params = "method=deleteunqualifieds")
	public @ResponseBody
	Json deleteunqualifieds(String[] del) {
		Json json = new Json();
		int list=tc.deletequalified(del);
		
		if (list > 0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}
	// 修改查询
		/*
		 * 运单重复查询
		 */

		@RequestMapping(params = "method=getUpdateunqualifie")
		public @ResponseBody Json
		 getUpdateunqualifie(Unqualified unqualified) {

			Json json = new Json();
			
			int i = tc.getUpdateunqualifie(unqualified);
			
			if (i > 0) {
				json.setFlag(true);
				return json;
			}
			json.setFlag(false);
			return json;
		}
		//查询一条
		@RequestMapping(params = "method=getselectunqualified")
		public @ResponseBody Unqualified getselectunqualified(String pid){
			Unqualified unqualified =tc.getselectunqualified(pid);
			
			return unqualified;
		}
		
		// 导出信息
		@RequestMapping(params = "method=outShipunqualified")
		public @ResponseBody
		String outShipunqualified(String datas, String[] headtitle, String[] fieldName,
				HttpServletResponse response,String reportedfrontdate,
				String reportedqueendate, String submitfrontdate,
				String submintdqueendate, String auditsign,
				String shiping_order_num,String [] checkarray) {
			String filename = "异常信息导出";
			List<Unqualified> list;
			
			if(checkarray.length>0){
			
				list= tc.exportunqualified(null,null,null,null,null,null,null,checkarray);
			}else{
			
				list= tc.exportunqualified(reportedfrontdate, reportedqueendate, submitfrontdate, submintdqueendate, auditsign, null, shiping_order_num, null);
			}
			 
			for (Unqualified unqualified : list) {
				if(unqualified.getAudit_state().equals("0")){
					unqualified.setAudit_state("未审核");
				}else if(unqualified.getAudit_state().equals("1")){
					unqualified.setAudit_state("审核中");
				}else if(unqualified.getAudit_state().equals("2")){
					unqualified.setAudit_state("审核通过");
				}else if(unqualified.getAudit_state().equals("3")){
					unqualified.setAudit_state("审核未通过");
				}
				if(unqualified.getDocuments_state().equals("1")){
					unqualified.setDocuments_state("未提交");
				}else if(unqualified.getDocuments_state().equals("0")){
					unqualified.setDocuments_state("已提交");
				}
				if(unqualified.getSubmission_time()==null){
					unqualified.setSubmission_time("未提交");
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
		 * 回单信息勾选导出
		 * 
		 * **/
		@RequestMapping(params = "method=outShi")
		public @ResponseBody List<ShippingOrder> outShi(HttpServletResponse response,String[] headtitle1, String[] fieldName1,String[] checkarray){
			String filename = "异常信息导出";	
			List<Unqualified> list = tc.outShi(checkarray);
				for (Unqualified unqualified : list) {
					if(unqualified.getAudit_state().equals("0")){
						unqualified.setAudit_state("未审核");
					}else if(unqualified.getAudit_state().equals("1")){
						unqualified.setAudit_state("审核中");
					}else if(unqualified.getAudit_state().equals("2")){
						unqualified.setAudit_state("审核通过");
					}else if(unqualified.getAudit_state().equals("3")){
						unqualified.setAudit_state("审核未通过");
					}
					if(unqualified.getDocuments_state().equals("1")){
						unqualified.setDocuments_state("未提交");
					}else if(unqualified.getDocuments_state().equals("0")){
						unqualified.setDocuments_state("已提交");
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
				ExportUtils.outputHeaders(headtitle1, workbook, "回单信息导出");
				// 调用工具类生成内容
				ExportUtils.outputColums(fieldName1, list, workbook, 1, "上报信息导出");
				workbook.write(ouputStream);
				ouputStream.flush();
				ouputStream.close();
			
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;	
		}
		

	//跳转到驳回记录页面
		@RequestMapping(params="method=skip")
	public String skip(String abnormalid,HttpServletRequest request){
			request.setAttribute("flg", abnormalid);
		return "order/rejected_Record";
		
	}
    //查询驳回记录的id	
	@RequestMapping(params ="method=Record")	
	public @ResponseBody 
	Map<String,Object> RecordList(String abnormalid){
		List<RejectedRecord> list=tc.RecordList(abnormalid);
		int count=tc.Record(abnormalid);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;	
	}

		@RequestMapping(params = "method=selectorder")
		public @ResponseBody
		Map selectorder(String page, String rows,String orderid,String ordername) {
			// 当前第几页
			Integer page2 = 1;
			// 当前页一共几条
			Integer rows1 = 0;
			if (page != null && !"".equals(page)) {
				page2 = Integer.parseInt(page);
			}
			if (rows != null && !"".equals(rows)) {
				rows1 = Integer.parseInt(rows);
			}
			List<ShippingOrder> list = tc.selectorder((page2 - 1) * rows1, rows1,orderid,ordername);
			
			int count = tc.selectorderlist(orderid,ordername);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("total", count);
			map.put("rows", list);
			return map;
		}
}
