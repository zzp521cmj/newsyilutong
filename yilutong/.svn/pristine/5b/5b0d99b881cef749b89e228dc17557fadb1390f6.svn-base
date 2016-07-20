package com.jy.action;

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
import com.jy.model.Car_length;
import com.jy.model.City_info;
import com.jy.model.Demand_release;
import com.jy.model.LinStandard;
import com.jy.model.ShippingOrder;
import com.jy.model.User;
import com.jy.service.PaiCheDanService;
import com.jy.service.ShippingOrderInfoService;
import com.jy.service.UserInfoService;

/**
 * 2015年5月13日 11:30:48 Controller
 * 
 * @author zkj
 */
@Controller
@RequestMapping(value = "/paichedan.do")
public class PaiCheDanController {

	@Resource
	private PaiCheDanService paichedanService;
	@Resource
	private UserInfoService uis;
	@Resource
	private ShippingOrderInfoService csi;
	/**
	 * 去需求发布页面
	 */
	@RequestMapping(params = "method=getDemandRelease")
	public String DemandReleasePage(String menu_id,HttpSession session) {
		Integer[] rid =(Integer[])session.getAttribute(SessionInfo.SessionRote);
		Integer id = Integer.parseInt(menu_id);
		List<String> list = uis.getFunctions(id,rid);
		if(list.size()>0){
		StringBuffer bf = new StringBuffer();
		for(String ss:list){
			bf.append(ss);
			bf.append(",");
			
		}
		bf.deleteCharAt(bf.length()-1);
		session.setAttribute("function", bf.toString());
		}else{
			session.setAttribute("function", "");
			
		}
		return "paichedan/demandRelease";
	}

	/**
	 * 去新增竞价页面
	 */
	@RequestMapping(params = "method=getAddDemandRelease")
	public String AddDemandReleasePage() {
		return "paichedan/addDemandRelease";
	}
	/**
	 * 获取需求订单号
	 */
	@RequestMapping(params = "method=getDemendDingdan")
	public @ResponseBody List<String> getDemendDingdan(String dd) {
		return paichedanService.getDemendDingdan(dd);
	}
	
	/**
	 * 去车辆竞价页面
	 */
	@RequestMapping(params = "method=VehicleAuctionPage")
	public String VehicleAuctionPage(String menu_id,HttpSession session) {
		Integer[] rid =(Integer[])session.getAttribute(SessionInfo.SessionRote);
		Integer id = Integer.parseInt(menu_id);
		List<String> list = uis.getFunctions(id,rid);
		if(list.size()>0){
		StringBuffer bf = new StringBuffer();
		for(String ss:list){
			bf.append(ss);
			bf.append(",");
			
		}
		bf.deleteCharAt(bf.length()-1);
		session.setAttribute("function", bf.toString());
		}else{
			session.setAttribute("function", "");
			
		}
		return "paichedan/VehicleAuction";
	}


	/**
	 * 去修改竞价页面
	 */
	@RequestMapping(params = "method=getEditDemandRelease")
	public String EditDemandReleasePage(String pid, HttpServletRequest request) {
		System.out.println(pid+"panduanId来啦");
		request.setAttribute("flg", pid);
		return "paichedan/editDemandRelease";
	}
	@RequestMapping(params = "method=getdingdan")
	public String dingdan(String deid,String xxx,HttpServletRequest request) {
		if(xxx!=null&&!"".equals(xxx)){
		request.setAttribute("xxx", xxx);	
		}
		request.setAttribute("deid", deid);
		return "paichedan/dingdanPage";
	}
	/**
	 * 去详细信息页面
	 */
	@RequestMapping(params = "method=getxinxiDemandRelease")
	public String getxinxiDemandRelease(String pid, HttpServletRequest request) {
		request.setAttribute("flg", pid);
		return "paichedan/xinxiDemandRelease";
	}
	/**
	 * 去修改竞价页面
	 */
	@RequestMapping(params = "method=getEditVehicleAuction")
	public String EditVehicleAuction(String pid, HttpServletRequest request) {
		request.setAttribute("flg", pid);
		return "paichedan/editVehicleAuction";
	}

	// 获取修改信息
	@RequestMapping(params = "method=getSelectDemand_release")
	public @ResponseBody
	Demand_release getSelectDemand_release(String pid) {
		Demand_release demand_release = paichedanService.getSelectDemand_release(pid);
		return demand_release;
	}
	// 获取修改信息
		@RequestMapping(params = "method=getLineCity")
		public @ResponseBody
		LinStandard getLineCity(String id) {
			LinStandard l = paichedanService.getLineCity(id);
			return l;
		}

	// 更新编辑竞价
	@RequestMapping(params = "method=updateDemand_releaseInfo")
	public  @ResponseBody
	Json updateDemand_release(Demand_release demand_release,String ids) {
		Json json = new Json();
		 paichedanService.delDingdan(demand_release.getDemandReleaseId());
		if(ids.length()>0){
			String[] id = ids.split(",");
			for(int i=0;i<id.length;i++){
				paichedanService.addDingdanid(UUIDUtils.getUUID(),id[i],demand_release.getDemandReleaseId());
			}	
		}
		int i = paichedanService.updateDemand_release(demand_release);
		if (i > 0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}

	/**
	 * 分页查询
	 */
	@RequestMapping(params = "method=getDemand_release")
	public @ResponseBody
	Map<String, Object> getDemand_release(String page, String rows,
			String zhuang, String xie, String models,String truckTypeId,String publisher,String determine) {
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
		List<Demand_release> list = paichedanService
				.getDemand_releaseInfo((page2 - 1) * rows1, rows1, zhuang, xie,
						models,truckTypeId,publisher,determine);
		int total = paichedanService.getCount(zhuang, xie, models,truckTypeId,publisher,determine);
		// json返回串
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", total);
		map.put("rows", list);
		return map;
	}
	/**
	 * 分页查询
	 */
	@RequestMapping(params = "method=getDemand_releasePage")
	public @ResponseBody
	Map<String, Object> getDemand_releasePage(String page, String rows,
			String zhuang, String xie, String models,String truckTypeId,String publisher,String determine) {
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
		List<Demand_release> list = paichedanService
				.getDemand_releaseInfoPage((page2 - 1) * rows1, rows1, zhuang, xie,
						models,truckTypeId,publisher,determine);
		int total = paichedanService.getCount(zhuang, xie, models,truckTypeId,publisher,determine);
		// json返回串
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", total);
		map.put("rows", list);
		return map;
	}
	@RequestMapping(params = "method=getDemand_releaseIndex")
	public @ResponseBody List<Demand_release> getDemand_releaseIndex(){
	List<Demand_release> list = paichedanService.getDemand_releaseIndex();
	return list;
	}

	// 获取装货城市下拉框列表
	@RequestMapping(params = "method=getCity_info")
	public @ResponseBody
	String getCity_info(String cityinfo) {
		List<City_info> list = paichedanService.getCity_info(cityinfo);
		JSONObject jb = null;
		JSONArray jsons = new JSONArray();
		for (City_info city_info : list) {
			jb = new JSONObject();
			jb.put("id", city_info.getCitycode());
			jb.put("name", city_info.getCityname());
			jsons.add(jb);
		}
		return jsons.toString();
	}
	@RequestMapping(params = "method=getLine")
	public @ResponseBody String getLine(String search){
		List<LinStandard> list = paichedanService.getLines(search);
		JSONObject jb=null;
		JSONArray jsons=new JSONArray();
		for (LinStandard t: list) {
			jb=new JSONObject();
			jb.put("id", t.getLinid());
			jb.put("name",t.getLinname());
			jsons.add(jb);
		}
			return jsons.toString();
	}
	// 获取项目名称
	@RequestMapping(params = "method=getCar_length")
	public @ResponseBody
	List<Map<String, Object>> getCar_length() {
		List<Car_length> list = paichedanService.getCar_length();
		List<Map<String, Object>> returnlist = new ArrayList<Map<String, Object>>();
		Map<String, Object> maps = null;
		for (Car_length car_length : list) {
			maps = new HashMap<String, Object>();
			maps.put("id", car_length.getLength_id());
			maps.put("text", car_length.getLength_name());
			returnlist.add(maps);
		}
		return returnlist;
	}

	// 新增竞价
	@RequestMapping(params = "method=addDemand_release")
	public @ResponseBody
	Json AddDemand_release(Demand_release demand_release,String ids,HttpSession session) {
		System.out.println("我到了");
		String demend_id = UUIDUtils.getUUID();
		String[] id = ids.split(",");
		if(ids.length()>0){
			for(int i=0;i<id.length;i++){
				paichedanService.addDingdanid(UUIDUtils.getUUID(),id[i],demend_id);
			}
		}
		Json json = new Json();
		User user = (User)session.getAttribute(SessionInfo.SessionName);
		demand_release.setPublisher(user.getUsername());
		demand_release.setDemandReleaseId(demend_id);
		int add = paichedanService.addDemand_release(demand_release);
		if (add > 0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}

	// 批量删除
	@RequestMapping(params = "method=delDemand_release")
	public @ResponseBody
	Json deletePlan(String[] del) {
		Json json = new Json();
		for(int i = 0;i<del.length;i++){
			paichedanService.delDingdan(del[i]);
			
		}
		int delete = paichedanService.deleteDemand_release(del);
		if (delete > 0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}
	// 确定车辆是否确定
		@RequestMapping(params = "method=getDetermine")
		public @ResponseBody
		Json getDetermine(String id) {
			Json json = new Json();
			int delete = paichedanService.getDetermine(id);
			if (delete > 0) {
				json.setFlag(true);
				return json;
			}
			json.setFlag(false);
			return json;
		}
	//进行竞价
	@RequestMapping(params = "method=AddVehicleAuction")
	public  @ResponseBody
	Json AddVehicleAuction(Demand_release demand_release,HttpServletRequest request) {
		Json json = new Json();
		User user=(User)request.getSession().getAttribute(SessionInfo.SessionName);
		demand_release.setUserid(user.getId());
		int i = paichedanService.addDemand_release1(demand_release);
		if (i > 0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}
	//获取订单信息
	@RequestMapping(params = "method=getdingdans")
	public @ResponseBody
	List<ShippingOrder> getdingdans( String name,
			String phone_number, String type,String start_date,String end_date) {
		List<ShippingOrder> rows =paichedanService.getDingdans(name, phone_number, type,start_date,end_date);
		//int count = csi.getShipOrder(name, phone_number, type,start_date,end_date);
		return rows;
	}
	//获取订单信息
	@RequestMapping(params = "method=getPrintPCD")
	public String getPrintPCD(String pid,HttpServletRequest request) {
		Demand_release demand_release = paichedanService.getSelectDemand_release(pid);
		request.setAttribute("printinfo", demand_release);
		return "paichedan/printpcd";
	}
	
}
