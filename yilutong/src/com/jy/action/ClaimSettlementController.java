package com.jy.action;
/*
 * 理赔结算
 */
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.write.DateTime;



import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;
import com.jy.common.ExportUtils;
import com.jy.common.SessionInfo;
import com.jy.common.UUIDUtils;
import com.jy.dao.Json;
import com.jy.model.Between;
import com.jy.model.Claim_settlement;
import com.jy.model.Claim_settlementmap;
import com.jy.model.Customer;
import com.jy.model.RejectedRecord;
import com.jy.model.Settlement_Record;
import com.jy.model.ShippingOrder;
import com.jy.model.Unqualified;
import com.jy.model.User;
import com.jy.service.ClaimSettlementService;


@Controller
@RequestMapping(value = "/claims_settlement.do")
public class ClaimSettlementController {
	@Resource
	private ClaimSettlementService ce;
	
	/*
	 * 跳转到主页面
	 */
	@RequestMapping(params="method=getclaims")
	public String getclaims(){
		return "claims_settlement/claims_settlement";
	}

	/*
	 *  查询全部
	 */
	@RequestMapping(params="method=inquire")
	public @ResponseBody  // ddid 权限预留参数
	Map<String, Object> inquire(String rows, String page,
			String numbersid,String claims_state,String claims_time,String claims_endtime,String custom_name, String receipt,HttpServletRequest request,String ddid) {
		User user=(User)request.getSession().getAttribute(SessionInfo.SessionName);
		Integer rows1 = 0; // 当前的行数
		Integer page1 = 1; // 当前的页数
		if (rows != null && !rows.equals("")) {
			rows1 = Integer.valueOf(rows);
		}
		if (page != null && !page.equals("")) {
			page1 = Integer.valueOf(page);
		}
		List<Claim_settlementmap> list = ce.inquire((page1 - 1) * rows1, rows1, numbersid, claims_state, claims_time,claims_endtime, custom_name, receipt,ddid);
        for (Claim_settlementmap list1 : list) {
			list1.setResponsible_people(user.getRealName());
		}
		int count = ce.count(numbersid, claims_state, claims_time, claims_endtime, custom_name, receipt,ddid);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}
	/*
	 * 删除的方法
	 */
	@RequestMapping(params ="method=deleteTravel")
	public @ResponseBody
	Json deleteTravel(String[] del) {
		Json json = new Json();
		int list=ce.deleteTravel(del);
		ce.deleteween(del);
		if (list > 0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}
	/*
	 * 
	 *  跳转添加页面的方法
	 */
		@RequestMapping(params = "method=getadd")
		public String getadd(String claimsid, HttpServletRequest request) {
			String number = "000001";//编号
			SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
			String a=(df.format(new Date()));
			request.setAttribute("flg", claimsid);
			request.setAttribute("flg2", a);
			return "claims_settlement/claims_settlementadd";
		}
		
		
	
	/*
	 * 
	 *  跳转修改页面的方法
	 */
		@RequestMapping(params = "method=gupdate")
		public String gupdate(String claimsid, String abnormalid, HttpServletRequest request) {
			request.setAttribute("flg2", claimsid);
			request.setAttribute("flg", abnormalid);
			return "claims_settlement/claims_settlementupdate";
		}
		/*
		 *  查询修改对应的id
		 */
		@RequestMapping(params = "method=updateId")
		public @ResponseBody
		Claim_settlement updateId(String id) {
			Claim_settlement ct = ce.updateId(id);	
			
			return ct;
		}
		
		/*
		 * 
	   * 根据修改是id  查询中介表
	 */
	@RequestMapping(params = "method=updateween")	
	public @ResponseBody	
	List updateween(String id){
		List<Between> bn=ce.updateween(id);
		return bn;	
	}
	
		/*
		 *  修改
		 */
		@RequestMapping(params = "method=getupdate")
		public @ResponseBody
		Json getupdate(Claim_settlement claimsid,String []id) {
			Json json = new Json();			
			List<Between> bn=ce.updateween(claimsid.getClaimsid());
			String []ids=new String[bn.size()];
			for(int q=0;q<bn.size();q++){
				ids[q]=bn.get(q).getAbnormalid();
			}
			ce.updatestate(ids,"0");
			ce.updatestate(id,"1");
			String []cids=new String[1];
			cids[0]=claimsid.getClaimsid();			
			List<Between> bs=new ArrayList<Between>();
			for(int i=0;i<id.length;i++){
				Between b=new Between();
				b.setBetweenid(UUIDUtils.getUUID());
				b.setAbnormalid(id[i]);
				b.setClaimsid(claimsid.getClaimsid());
				bs.add(b);
			}
			ce.deleteween(cids);
			ce.insetinf(bs);
			int i=ce.getupdate(claimsid);
			if (i > 0) {
				json.setFlag(true);
				return json;
			} else {
				json.setFlag(false);
			}
			return json;
		}
		
		/**
		 * 提审跳转界面
		 * */
		@RequestMapping(params = "method=getArraignedClose")
	    public String getArraignedClose(String[] pid,HttpServletRequest request){
			request.setAttribute("pid", pid);
	    	return "claims_settlement/EreArraigned";
	    }
		/*
		 * 提交
		 */
		@RequestMapping(params = "method=updatedocuments")
		public  @ResponseBody Json updatedocuments(String[] claimsid,String did,String arraign_remarks){
			int a=ce.updateunqualified(claimsid,did,arraign_remarks);
			
			Json json=new Json();
			if(a>0){
				json.setFlag(true);
			}else{
				json.setFlag(false);
			}
			return json;
		}
		
		//跳转到驳回记录页面
			@RequestMapping(params="method=skip")
			public String skip(String record_id,HttpServletRequest request){
					request.setAttribute("flg", record_id);
				return "claims_settlement/rejected_Record";
				
			}
			
			 /*
			  * 查询驳回记录的id	
			  */
			@RequestMapping(params ="method=RecordList")	
			public @ResponseBody 
			Map<String,Object> RecordList(String claimsid){
				List<Settlement_Record> list=ce.RecordList(claimsid);
				int count=ce.Record(claimsid);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("total", count);
				map.put("rows", list);
				return map;	
			}
		/*
		 * 导出
		 */
				@RequestMapping(params = "method=exportunqualified")
				public @ResponseBody
				String exportunqualified(String datas, String[] headtitle, String[] fieldName,
						HttpServletResponse response, String numbersid,
						String claims_state, String claims_time,String claims_endtime, String custom_name,
						String receipt) {
					String filename = "理赔信息导出";
					List<Claim_settlementmap> list = ce.exportunqualified(numbersid, claims_state, claims_time, claims_endtime, custom_name, receipt);
					for (Claim_settlementmap claim_settlement : list) {
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
						ExportUtils.outputHeaders(headtitle, workbook, "理赔信息导出");
						// 调用工具类生成内容
						ExportUtils.outputColums(fieldName, list, workbook, 1, "理赔信息导出");
						workbook.write(ouputStream);
						ouputStream.flush();
						ouputStream.close();

					} catch (Exception e) {
						e.printStackTrace();
					}
					return null;
				}
				/*
				 * 查询发货的方法
				 */
				@RequestMapping(params = "method=inquireName")
				public @ResponseBody
				String inquireName(String custom_name) {
					List<Customer> flist = ce.inquireName(custom_name);
					JSONObject jb = null;
					JSONArray jsons = new JSONArray();
					for (Customer f : flist) {
						jb = new JSONObject();
						jb.put("id", f.getCustomer_id());
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
					List<Unqualified> flist = ce.inquireName1(receipt);
					JSONObject jb = null;
					JSONArray jsons = new JSONArray();
					for (Unqualified f : flist) {
						jb = new JSONObject();
						jb.put("id", f.getReceipt());
						jb.put("name", f.getReceipt());
						jsons.add(jb);
					}
					return jsons.toString();
				}
				
				/*
				 * 查询异常签收且审核通过的方法
				 */

				@RequestMapping(params = "method=abnormal")//ides添加时候参数为默认参数0  修改查询参数为null
				public @ResponseBody
				Map<String,Object> abnormal(String rows,String page,String submitfrontdate,
						String submintdqueendate,String custom_name,String shiping_order_num,String responsible_people,String types_id,String []ids,String ides) {
					Integer rows1 = 0; // 当前的行数
					Integer page1 = 1; // 当前的页数
					if (rows != null && !rows.equals("")) {
						rows1 = Integer.valueOf(rows);
					}
					if (page != null && !page.equals("")) {
						page1 = Integer.valueOf(page);
					}
				    List<Unqualified> list = ce.abnormal((page1 - 1) * rows1, rows1,submitfrontdate,submintdqueendate, custom_name, shiping_order_num, responsible_people, types_id,ids,ides);
				    System.out.println(custom_name+"------=========================");
				    int count = ce.abnormalcount(submitfrontdate, submintdqueendate, custom_name, shiping_order_num, responsible_people, types_id,ids,ides);

					Map<String, Object> map = new HashMap<String, Object>();
					map.put("total", count);
					map.put("rows", list);
					return map;
				}
				
				/*
				 * 查询异常情况的方法
				 */
				@RequestMapping(params = "method=nquiryDisplay")
				public @ResponseBody
				String nquiryDisplay(String types_id) {
					List<Unqualified> flist = ce.nquiryDisplay(types_id);
					JSONObject jb = null;
					JSONArray jsons = new JSONArray();
					for (Unqualified f : flist) {
						jb = new JSONObject();
						jb.put("id", f.getTypes_id());
						jb.put("name", f.getTypes_id());
						jsons.add(jb);
					}
					return jsons.toString();
				}
				
				/*
				 * 根据上报表id  修改是否理赔状态
				 */
				@RequestMapping(params="method=updatestate")
				
				public @ResponseBody
				Json updatestate(String [] id,String ides) {
					Json json = new Json();
					int i=ce.updatestate(id, ides);
					if (i > 0) {
						json.setFlag(true);
						return json;
					} else {
						json.setFlag(false);
					}
					return json;
				}
				
				 /*
				  * 添加的方法
				  */
				@RequestMapping(params="method=insertInfo")
				public @ResponseBody Json insertInfo(Claim_settlement cs,String[] id, HttpServletRequest request){
					User user=(User)request.getSession().getAttribute(SessionInfo.SessionName);
					cs.setUser_id(user.getId());				 				 
					cs.setClaimsid(UUIDUtils.getUUID());
					System.out.println("111");
					List<Between> bs=new ArrayList<Between>();
					for(int i=0;i<id.length;i++){
						Between b=new Between();
						b.setBetweenid(UUIDUtils.getUUID());
						b.setAbnormalid(id[i]);
						b.setClaimsid(cs.getClaimsid());
						bs.add(b);
					}
					int q=ce.insetinf(bs);
					int a=ce.insertInfo(cs);
					ce.updatestate(id,"1");
					Json json=new Json();
					if(a>0){
						json.setFlag(true);
					}
					return json;	
				}
				
				/* 
				 * 回单信息勾选导出
				 */
				@RequestMapping(params = "method=outShi")
	            public @ResponseBody
	           List<Claim_settlementmap> outShi(HttpServletResponse response,String[] headtitle,
	        		   String[] fieldName,String[] checkarray){
					String filename = "理赔结算信息导出";	
					List<Claim_settlementmap> list = ce.outShi(checkarray);
					for (Claim_settlementmap so : list) {
						if (so!=null) {				
						if (so.getClaims_state()!=null&&so.getClaims_state()!="null"&&so.getClaims_state().equals("0")) {
							so.setClaims_state("审核通过");
						} if (so.getClaims_state()!=null&&so.getClaims_state()!="null"&&so.getClaims_state().equals("1")) {
							so.setClaims_state("未审核");
						} if (so.getClaims_state()!=null&&so.getClaims_state()!="null"&&so.getClaims_state().equals("2")) {
							so.setClaims_state("审核未通过");
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
						ExportUtils.outputHeaders(headtitle, workbook, "理赔结算信息导出");
						// 调用工具类生成内容
						ExportUtils.outputColums(fieldName, list, workbook, 1, "理赔结算信息导出");
						workbook.write(ouputStream);
						ouputStream.flush();
						ouputStream.close();
					
					} catch (Exception e) {
						e.printStackTrace();
					}
					return null;	
				}
				
}
			

