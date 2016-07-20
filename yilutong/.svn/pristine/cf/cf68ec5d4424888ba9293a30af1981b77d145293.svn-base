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

import com.google.gson.reflect.TypeToken;
import com.jy.common.GSONUtils;

import com.jy.common.UUIDUtils;
import com.jy.dao.Json;
import com.jy.model.ClassLineToLinstandard;
import com.jy.model.ClassPlan;
import com.jy.model.LinStandard;
import com.jy.model.PostClassLineInfo;
import com.jy.model.PostClassline;
import com.jy.model.Remark;
import com.jy.model.TravelCard;
import com.jy.model.User;
import com.jy.model.Vehicle_auction;
import com.jy.service.ClassPlanService;
import com.jy.service.PostLineService;
/**
 * 自动发车计划
 * @author zzp
 *
 */
@Controller
@RequestMapping(value = "/automaticPlan.do")
public class ClassPlanController {

	@Resource
	private ClassPlanService classPlanService;

	/**
	 * 自动计划页面跳转
	 * @return String
	 * @param
	 */
	@RequestMapping(params = "method=toclassplaninfo")
	public String toclassplaninfo() {
		return "classplan/classplanInfo";
	}

	/**
	 * 班线管理新增页面跳转
	 * @return String
	 * @param
	 */
	@RequestMapping(params = "method=addClassPlan")
	public String addClassPlan() {
		return "classplan/addClassPlan";
	}
	/**
	 * 班线管理修改页面跳转
	 * @return String
	 * @param
	 */
	@RequestMapping(params = "method=editClassPlan")
	public String editClassPlan(String pid,HttpServletRequest request) {
		request.setAttribute("pid", pid);
		return "classplan/editClassPlan";
	}
	
	/**
	 * 获取编辑信息
	 * @param pid
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "method=getClassPlanEditInfo")
	public @ResponseBody
	ClassPlan getClassPlanEditInfo(String pid,HttpServletRequest request) {
		
		ClassPlan list = classPlanService.getClassPlanEditInfo(pid);
		JSONObject json=new JSONObject();
		// json返回串
		
		return list;
	}
	/**
	 * 查询分页显示自己的竞价
	 */
	@RequestMapping(params = "method=getClassPlanInfo")
	public @ResponseBody
	Map<String, Object> getClassPlanInfo(String page, String rows, String classlineName,String organization,String car_num,HttpServletRequest request) {
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
		List<ClassPlan> list = classPlanService.getClassPlanInfo((page2 - 1) * rows1, rows1, classlineName,organization,car_num);
		int total = classPlanService.getCount((page2 - 1) * rows1, rows1, classlineName,organization,car_num);
		// json返回串
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", total);
		map.put("rows", list);
		return map;
	}
	/**
	 * 获取班线列表
	 * @param name
	 * @return
	 */
	@RequestMapping(params = "method=getclassline")
	public @ResponseBody
	String getclassline(String name) {
		List<PostClassline> list = classPlanService.getlinlist(name);
		JSONObject jb = null;
		JSONArray jsons = new JSONArray();
		for (PostClassline p : list) {
			jb = new JSONObject();
			jb.put("id", p.getClasslineId());
			jb.put("name", p.getClasslineName());
			jsons.add(jb);
		}
		return jsons.toString();
	}
	
	/**
	 * 获取车辆列表
	 * @param name
	 * @return
	 */
	@RequestMapping(params = "method=getCarInfo")
	public @ResponseBody
	String getCarInfo(String name) {
		List<TravelCard> list = classPlanService.getCarInfo(name);
		JSONObject jb = null;
		JSONArray jsons = new JSONArray();
		for (TravelCard p : list) {
			jb = new JSONObject();
			jb.put("id", p.getTravelCardId());
			jb.put("name", p.getPlateNumber());
			jsons.add(jb);
		}
		return jsons.toString();
	}
	
	/**
	 * 新增发车计划表
	 * @param name
	 * @return
	 */
	@RequestMapping(params = "method=addclassplan")
	public @ResponseBody
	Json addclassplan(ClassPlan classPlan,String repetition_periods) {
		classPlan.setRepetition_period(repetition_periods);
		boolean flag=classPlanService.addclassplan(classPlan);
		Json json=new Json();
		if(flag)
			json.setFlag(true);
		else
			json.setFlag(false);
		return json;
	}
}
