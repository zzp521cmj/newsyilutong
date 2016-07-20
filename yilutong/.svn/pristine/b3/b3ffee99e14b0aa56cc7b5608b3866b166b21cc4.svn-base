package com.jy.action;
/*
 * 理赔审核
 */
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.common.SessionInfo;
import com.jy.common.UUIDUtils;
import com.jy.dao.Json;
import com.jy.model.Claim_settlement;
import com.jy.model.Claim_settlementmap;
import com.jy.model.Customer;
import com.jy.model.RejectedRecord;
import com.jy.model.Settlement_Record;
import com.jy.model.ShippingOrder;
import com.jy.model.Unqualified;
import com.jy.model.User;
import com.jy.service.ClaimsExaminerService;

@Controller
@RequestMapping(value = "/claims.do")
public class ClaimsExaminerController {
  @Resource
  private ClaimsExaminerService ce;
  
  /*
	 * 跳转到主页面
	 */
	@RequestMapping(params="method=getclaim")
	public String getclaim(){
		return "claims_settlement/claims_examiner";
	}

	/*
	 *  查询全部
	 */
	@RequestMapping(params="method=checkQuery")
	public @ResponseBody
	Map checkQuery(String rows, String page,
			String numbersid,String claims_state, String claims_time,String claims_endtime, String custom_name,
			String receipt,HttpSession session,HttpServletRequest request,String did) {
		User user=(User)request.getSession().getAttribute(SessionInfo.SessionName);
		Integer rows1 = 0; // 当前的行数
		Integer page1 = 1; // 当前的页数
		if (rows != null && !rows.equals("")) {
			rows1 = Integer.valueOf(rows);
		}
		if (page != null && !page.equals("")) {
			page1 = Integer.valueOf(page);
		}
		//List<String>deptlist=(List<String>) session.getAttribute(SessionInfo.SessionDepts);
		List<String>deptlist=new ArrayList<String>();
		deptlist.add(did);
		List<Claim_settlementmap> list = ce.checkQuery((page1 - 1) * rows1, rows1, numbersid, claims_state, claims_time, claims_endtime, custom_name, receipt,deptlist);
		for (Claim_settlementmap list1 : list) {
			list1.setResponsible_people(user.getRealName());
		}
		int count = ce.count(numbersid, claims_state, claims_time, claims_endtime, custom_name, receipt,deptlist);
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
	
	// 跳转到一键审核页面的方法
		@RequestMapping(params = "method=getupdate")
		public String getupdate(String claimsid, HttpServletRequest request) {
			request.setAttribute("flg", claimsid);
			return "claims_settlement/vertical";
		}

		// 跳转到多条选中页面的方法
		@RequestMapping(params = "method=duo")
		public String duo(String claimsid, HttpServletRequest request) {
			request.setAttribute("flg", claimsid);
			return "claims_settlement/multiterm";
		}
		
		// 查询审核对应的id
		@RequestMapping(params = "method=selectID")
		public @ResponseBody
		Claim_settlement selectID(String id) {
			Claim_settlement ud = ce.selectID(id);
			
			return ud;
		}

		// 审核
		@RequestMapping(params = "method=review")
		public @ResponseBody
		Json review(String audit_opinion, String claimsid) {
			Json json = new Json();
			ShippingOrder sr=null;
			List<ShippingOrder> list=new ArrayList<ShippingOrder>();
			List<Claim_settlement> l=ce.recordInf(claimsid.split(","));
			for (Claim_settlement listl : l) {
				sr=new ShippingOrder();
				sr.setCost_summary_id(UUIDUtils.getUUID());
				sr.setCompensation_payments(listl.getCompensation_payments());
				list.add(sr);
			}
			int i = ce.review(audit_opinion,claimsid.split(","));
			int j=ce.addGold(list);
			if (i > 0) {
				json.setFlag(true);
				return json;
			} else {
				json.setFlag(false);
			}

			return json;
		}
		
		// 查询驳回id
		@RequestMapping(params = "method=bohuiId")
		public @ResponseBody
		Claim_settlement bohuiId(String id) { 
			Claim_settlement ct = ce.bohuiId(id);
		if(ct.getClaims_state()!=null && ct.getClaims_state().equals("0")){
				ct.setClaims_state("审核通过");
			}else if(ct.getClaims_state()!=null && ct.getClaims_state().equals("1")){
				ct.setClaims_state("未审核");
			}else if(ct.getClaims_state()!=null && ct.getClaims_state().equals("2")){
				ct.setClaims_state("审核未通过");
			}else if(ct.getClaims_state()!=null && ct.getClaims_state().equals("3")){
				ct.setClaims_state("待审核");
			}
			return ct;
		}

		// 驳回
		@RequestMapping(params = "method=bohuiInfo")
		public @ResponseBody
		Json bohuiInfo(String audit_opinion, String claimsid) {
			Json json = new Json();
			Settlement_Record rd=null;
			List<Settlement_Record> listre=new ArrayList<Settlement_Record>();
			List<Claim_settlement> u=ce.recordInfo(claimsid.split(","));
			for (Claim_settlement list : u) {
				rd=new Settlement_Record();
				rd.setRecord_id(UUIDUtils.getUUID());
				rd.setClaimsid(list.getClaimsid());
				rd.setAbnormalid(list.getAbnormalid());
				rd.setNumbersid(list.getNumbersid());
				rd.setCompensation_payments(list.getCompensation_payments());
				rd.setClaims_state(list.getClaims_state());
				rd.setClaims_time(list.getClaims_time());
				rd.setDamage_intensity(list.getDamage_intensity());
				rd.setVerifier(list.getVerifier());
				rd.setAudit_opinion(list.getAudit_opinion());
				rd.setSubmit_state(list.getSubmit_state());
			    listre.add(rd);
			}	
			int i = ce.bohuiInfo(audit_opinion, claimsid.split(","));
			int j=ce.insertInfo(listre);
			if (i > 0) {
				json.setFlag(true);
				return json;
			} else {
				json.setFlag(false);
			}
			return json;
		}
  
}
