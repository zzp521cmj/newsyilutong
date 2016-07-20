package com.jy.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.common.SessionInfo;
import com.jy.dao.Json;
import com.jy.model.TemporaryCar;
import com.jy.model.TravelCard;
import com.jy.model.User;
import com.jy.model.Vehicle_auction;
import com.jy.service.TemporaryCarService;
import com.jy.service.TravelCardService;
import com.jy.service.VehicleAuctionService;

/**
 * 2015年5月18日 Controller
 * 
 * @author zkj
 */
@Controller
@RequestMapping(value = "/vehicleAuction.do")
public class VehicleAuctionController {

	@Resource
	private VehicleAuctionService vehicleAuctionService;
	@Resource
	private TemporaryCarService cs;
	@Resource
	private TravelCardService ts;
	/**
	 * 新增竞价
	 */
	@RequestMapping(params = "method=getDemandRelease")
	public String DemandReleasePage(String pid, HttpServletRequest request) {
		request.setAttribute("flg", pid);
		return "TemVehicle/demandReleasePage";
	}

	// 获取修改信息
	@RequestMapping(params = "method=getSelectVehicle_auction")
	public @ResponseBody
	Vehicle_auction Vehicle_auction(String pid, HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute(
				SessionInfo.SessionName);
		String userid = user.getId();
		Vehicle_auction demand_release = vehicleAuctionService
				.getSelectVehicle_auction(pid, userid);
		return demand_release;
	}

	/**
	 * 查询分页显示自己的竞价
	 */
	@RequestMapping(params = "method=getVehicleAuction")
	public @ResponseBody
	Map<String, Object> getVehicleAuction(String page, String rows,
			String zhuang, String xie, String models, String truckTypeId,
			String determine, HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute(
				SessionInfo.SessionName);
		String userid1 = user.getId();
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
		List<Vehicle_auction> list = vehicleAuctionService
				.getVehicle_auctionInfo((page2 - 1) * rows1, rows1, zhuang,
						xie, models, truckTypeId, determine, userid1);
		int total = vehicleAuctionService.getCount(zhuang, xie, models,
				truckTypeId, determine, userid1);
		// json返回串
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", total);
		map.put("rows", list);
		return map;
	}

	// 批量删除
	@RequestMapping(params = "method=delVehicleAuction")
	public @ResponseBody
	Json delVehicleAuction(String[] del) {
		Json json = new Json();
		int delete = vehicleAuctionService.deleteManual(del);
		if (delete > 0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}
	// 竞价修改信息
	@RequestMapping(params = "method=getEditVehicle_auction")
	public @ResponseBody
	Json updateDemand_release(Vehicle_auction vehicle_auction,
			 HttpServletRequest request) {
		Json json = new Json();
		User user = (User) request.getSession().getAttribute(
				SessionInfo.SessionName);
		TravelCard cc = ts.getUserTemCar(user.getId());
		vehicle_auction.setTemporary_car_id(cc.getTravelCardId());
		int i = vehicleAuctionService.updateVehicle_auction(vehicle_auction,
				 user.getId());
		if (i > 0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}

	// 获取修改信息
	@RequestMapping(params = "method=getVehicleAuctionRow")
	public @ResponseBody
	Vehicle_auction getVehicleAuctionRow(String vehicleAuctionId) {
		Vehicle_auction vehicle_auction = vehicleAuctionService
				.getVehicleAuctionRow(vehicleAuctionId);
		return vehicle_auction;

	}

	// 进行竞价
	@RequestMapping(params = "method=AddVehicleAuction")
	public @ResponseBody
	Json AddVehicleAuction(Vehicle_auction vehicle_auction) {
		Json json = new Json();
		int i = vehicleAuctionService.updateVehicleAuctionRow(vehicle_auction);
		if (i > 0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}
	//车辆竞价最新确定车辆的信息
	@RequestMapping(params = "method=messageVehicle_auction")
	public @ResponseBody
	List<Vehicle_auction> messageVehicle_auction(String userid){
		List<Vehicle_auction> list=vehicleAuctionService.messageVehicle_auction(userid);
		System.out.println(list.size()+"   messageVehicle_auction");
		return list;
	}
}
