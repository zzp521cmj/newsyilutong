package com.jy.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.common.SessionInfo;
import com.jy.common.UUIDUtils;
import com.jy.dao.Json;
import com.jy.model.Car_bid_record;
import com.jy.model.Demand_release;
import com.jy.model.TemporaryCar;
import com.jy.model.TravelCard;
import com.jy.model.Vehicle_auction;
import com.jy.service.Car_bid_recordInfoService;
import com.jy.service.Demand_releaseService;
import com.jy.service.TemporaryCarService;
import com.jy.service.TravelCardService;
import com.jy.service.UserInfoService;
import com.jy.service.VehicleAuctionService;
@Controller
@RequestMapping(value = "/Manual.do")
public class ManualController {
	@Resource
	private UserInfoService uis;
	@Resource
	private Car_bid_recordInfoService bid_recordInfoService;
	@Resource
	private TemporaryCarService cs;
	@Resource
	private TravelCardService ts;
	@Resource
	private Demand_releaseService dss;
	@Resource
	private VehicleAuctionService vs;
	@RequestMapping(params = "method=getManual")
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
		return "TemVehicle/Manual";
	}
	/**
	 * 去新增竞价页面
	 */
	@RequestMapping(params = "method=getAddManual")
	public String AddDemandReleasePage() {
		return "TemVehicle/addManual";
	}
	/**
	 * 分页查询
	 */
	@RequestMapping(params = "method=getManuals")
	public @ResponseBody
	Map<String, Object> getManuals(String page, String rows,
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
		List<Car_bid_record> list = 
				bid_recordInfoService.getManuals((page2 - 1) * rows1, rows1, zhuang, xie,
						models,truckTypeId,publisher,determine);
		
		int total = bid_recordInfoService.getManualsCount(zhuang, xie, models,truckTypeId,publisher,determine);
		// json返回串
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", total);
		map.put("rows", list);
		return map;
	}
	@RequestMapping(params = "method=getCars")
	public @ResponseBody
	List<Map<String, Object>> getLinshiCars() {
		
		List<TemporaryCar> list = cs.getCarsUser();
		List<Map<String, Object>> lists = new ArrayList<Map<String, Object>>();
		Map<String, Object> map = null;
		for (TemporaryCar tc : list) {
			map = new HashMap<String, Object>();
			map.put("id",tc.getTemporaryCarId());
			map.put("text", tc.getPlateNumber());
		
			lists.add(map);
		}
		return lists;
	}
	/**
	 * 去修改竞价页面
	 */
	@RequestMapping(params = "method=getEditManual")
	public String EditDemandReleasePage(String pid,String vid,String cid, HttpServletRequest request) {
		request.setAttribute("flg", pid);
		request.setAttribute("flg2", vid);
		request.setAttribute("flg3", cid);
		return "TemVehicle/editManual";
	}
	/**
	 * 去详细信息页面
	 */
	@RequestMapping(params = "method=getxinxiManual")
	public String getxinxiManual(String pid,String vid,String cid, HttpServletRequest request) {
		request.setAttribute("flg", pid);
		request.setAttribute("flg2", vid);
		request.setAttribute("flg3", cid);
		return "TemVehicle/xinxiManual";
	}
	/**
	 * 获取订单号
	 */
	@RequestMapping(params = "method=getDingdans")
	public String getDingdans() {
		
		
		
		return "TemVehicle/xinxiManual";
	}
	// 新增竞价
		@RequestMapping(params = "method=addManual")
		public @ResponseBody
		Json AddDemand_release(Car_bid_record record,String ids) {
			Json json = new Json();
			int add = bid_recordInfoService.addManual(record,ids);
			if (add > 0) {
				json.setFlag(true);
				return json;
			}
			json.setFlag(false);
			return json;
		}
		// 获取修改信息
		@RequestMapping(params = "method=getSelectManual")
		public @ResponseBody
		Car_bid_record getSelectManual(String pid,String vid,String cid) {
			Demand_release r = dss.getSelectDemand_release(pid);
			Car_bid_record d = new Car_bid_record();
			TravelCard car = ts.getOneCar(cid);
			Vehicle_auction v = vs.getVehicleAuctionRow(vid);
			d.setVehicleAuctionId(vid);
			d.setPrice(v.getPrice());
			d.setZhuang(r.getZhuang());
			d.setXie(r.getXie());
			d.setTemporary_car_id(cid);
			d.setTravel_card_id(cid);
			d.setPlate_number(car.getPlateNumber());
			d.setDemandReleaseId(pid);
			d.setCityOfLoadingId(r.getCityOfLoadingId());
			d.setUnloadingCityId(r.getUnloadingCityId());
			d.setZhuangCity(r.getZhuangCity());
			d.setXieCity(r.getXieCity());
			d.setLoadingAddress(r.getLoadingAddress());
			d.setUnloadingAddress(r.getUnloadingAddress());
			d.setTruckTypeId(r.getTruckTypeId());
			d.setPublisher(r.getPublisher());
			d.setRanges(r.getRanges());
			d.setWeight(r.getWeight());
			d.setModels(r.getModels());
			d.setRemarks(r.getRemarks());
			d.setContactInformation(r.getContactInformation());
			d.setLine_id(r.getLine_id());
			d.setLine_name(r.getLine_name());
			return d;
		}
		// 更新编辑竞价
		@RequestMapping(params = "method=updateManual")
		public  @ResponseBody
		Json updateManual(Car_bid_record r,String ids) {
			Json json = new Json();
			dss.delDingdan(r.getDemandReleaseId());
			if(ids.length()>0){
				String[] id = ids.split(",");
				for(int i=0;i<id.length;i++){
					dss.addDingdanid(UUIDUtils.getUUID(),id[i],r.getDemandReleaseId());
				}	
			}
			Demand_release d = new Demand_release();
			d.setZhuang(r.getZhuang());
			d.setXie(r.getXie());
			d.setDemandReleaseId(r.getDemandReleaseId());
			d.setCityOfLoadingId(r.getCityOfLoadingId());
			d.setUnloadingCityId(r.getUnloadingCityId());
			d.setZhuangCity(r.getZhuangCity());
			d.setXieCity(r.getXieCity());
			d.setLoadingAddress(r.getLoadingAddress());
			d.setUnloadingAddress(r.getUnloadingAddress());
			d.setTruckTypeId(r.getTruckTypeId());
			d.setPublisher(r.getPublisher());
			d.setRanges(r.getRanges());
			d.setWeight(r.getWeight());
			d.setModels(r.getModels());
			d.setRemarks(r.getRemarks());
			d.setContactInformation(r.getContactInformation());
			d.setLine_id(r.getLine_id());
			d.setLine_name(r.getLine_name());
			int i = dss.updateDemand_release(d);
			Vehicle_auction vv = new Vehicle_auction();
			vv.setVehicleAuctionId(r.getVehicleAuctionId());
			vv.setPrice(r.getPrice());
			TravelCard t =ts.getOneCar(r.getTemporary_car_id());
			vv.setUserid(t.getUser());
			vv.setTemporary_car_id(r.getTemporary_car_id());
			vs.updateManualAuction(vv);
			if (i > 0) {
				json.setFlag(true);
				return json;
			}
			json.setFlag(false);
			return json;
		}
		// 批量删除
		@RequestMapping(params = "method=delManual")
		public @ResponseBody
		Json deleteManual(String[] del,String[] vvv) {
			Json json = new Json();
			int delete = dss.deleteDemand_release(del);
			int i = vs.deleteManual(vvv);
			if (delete > 0) {
				json.setFlag(true);
				return json;
			}
			json.setFlag(false);
			return json;
		}
}
