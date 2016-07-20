package com.jy.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;
import com.jy.common.UUIDUtils;
import com.jy.dao.Json;
import com.jy.model.RejectedRecord;
import com.jy.model.Unqualified;
import com.jy.service.UnqualifiedAuditService;

@Controller
@RequestMapping(value = "/inf.do")
public class UnqualifiedAuditController {
	private static final List<Unqualified> Unqualified = null;
	@Resource
	public UnqualifiedAuditService us;

	// 调转页面的方法
	@RequestMapping(params = "method=getSelect")
	public String getSelect() {
		return "order/unquali";
	}

	// 查询全部==
	@RequestMapping(params = "method=inquire")
	public @ResponseBody
	Map<String, Object> inquire(String rows, String page,
			String shiping_order_num, String custom_name, String send_time,String send1_time,
			String audit_state,String report_date,String report1_date) {
		Integer rows1 = 0; // 当前的行数
		Integer page1 = 1; // 当前的页数
		if (rows != null && !rows.equals("")) {
			rows1 = Integer.valueOf(rows);
		}
		if (page != null && !page.equals("")) {
			page1 = Integer.valueOf(page);
		}
		List<Unqualified> list = us.inquire((page1 - 1) * rows1, rows1,
				shiping_order_num, custom_name, send_time,send1_time, audit_state, report_date, report1_date);
		int count = us.count(shiping_order_num, custom_name, send_time,send1_time,
				audit_state,report_date, report1_date);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;

	}

	// 查询审核对应的id
	@RequestMapping(params = "method=updateInfo")
	public @ResponseBody
	Unqualified updateInfo(String id) {
		Unqualified ud = us.updateInfo(id);
		return ud;
	}

	// 审核
	@RequestMapping(params = "method=update")
	public @ResponseBody
	Json update(String reason,String abnormalid) {
		Json json = new Json();
		int i = us.update(reason,abnormalid.split(","));
		if (i > 0) {
			json.setFlag(true);
			return json;
		} else {
			json.setFlag(false);
		}

		return json;
	}

	// 查询客户名称的方法
	@RequestMapping(params = "method=inquireName")
	public @ResponseBody
	String inquireName(String name) {
		List<Unqualified> flist = us.inquireName(name);
		JSONObject jb = null;
		JSONArray jsons = new JSONArray();
		for (Unqualified f : flist) {
			jb = new JSONObject();
			jb.put("id", f.getCustom_name());
			jb.put("name", f.getCustom_name());
			jsons.add(jb);
		}
		return jsons.toString();
	}

	// 跳转到一键审核页面的方法
	@RequestMapping(params = "method=getupdate")
	public String getupdate(String abnormalid, HttpServletRequest request) {
		request.setAttribute("flg", abnormalid);
		return "order/bohui";
	}

	// 跳转到多条选中页面的方法
	@RequestMapping(params = "method=duo")
	public String duo(String abnormalid, HttpServletRequest request) {
		request.setAttribute("flg", abnormalid);

		return "order/audit";
	}

	// 查询驳回id
	@RequestMapping(params = "method=bohuiInfo")
	public @ResponseBody
	Unqualified bohuiInfo(String id) {
		Unqualified uf = us.bohuiInfo(id);
		return uf;
	}

	// 驳回
	@RequestMapping(params = "method=bohui")
	public @ResponseBody
	Json bohui(String reason, String abnormalid) {
		Json json = new Json();
		RejectedRecord rd=null;
		List<RejectedRecord> listre=new ArrayList<RejectedRecord>();
		List<Unqualified> u=us.recordInfo(abnormalid.split(","));
		for (Unqualified list : u) {
			rd=new RejectedRecord();
			rd.setReject_id(UUIDUtils.getUUID());
			rd.setAbnormalid(list.getAbnormalid());
			rd.setShiping_order_num(list.getShiping_order_num());
		    rd.setSend_time(list.getSend_time());  	
		    rd.setSend_station(list.getSend_station());
		    rd.setEnd_address(list.getEnd_address());
		    rd.setInsurance(list.getInsurance());
		    rd.setCustom_name(list.getCustom_name());
		    rd.setReceipt(list.getReceipt());
		    rd.setTypes_id(list.getTypes_id());
		    rd.setGoods_name(list.getGoods_name());
		    rd.setUnqualified_number(list.getUnqualified_number());
		    rd.setTrade_agency(list.getTrade_agency());
		    rd.setResponsible_institutions(list.getResponsible_institutions());
		    rd.setResponsible_people(list.getReport_people());
		    rd.setReport_people(list.getReport_people());
		    rd.setAgreement(list.getAgreement());
		    rd.setAgreement_paid(list.getAgreement_paid());
		    rd.setReference_price(list.getReference_price());
		    rd.setAgreement_Sign(list.getAgreement_Sign());
		    rd.setAbnormal_situation(list.getAbnormal_situation());
		    rd.setAudit_state(list.getAudit_state());
		    rd.setReport_date(list.getReport_date());
		    rd.setDocuments_state(list.getDocuments_state());
		    rd.setSubmission_time(list.getSubmission_time());
		    rd.setReason(list.getReason());
		    rd.setReject_date(list.getReport_date());	
		    listre.add(rd);
		}	
		int i = us.bohui(reason,abnormalid.split(","));
		int j=us.insertInfo(listre);
		if (i > 0) {
			json.setFlag(true);
			return json;
		} else {
			json.setFlag(false);
		}
		return json;
	}
}
