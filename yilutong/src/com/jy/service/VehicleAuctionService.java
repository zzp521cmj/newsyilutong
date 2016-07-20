package com.jy.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.jy.model.Demand_release;
import com.jy.model.DetemineVehicle;
import com.jy.model.Vehicle_auction;

/**
 * 2015年5月18日 Controller
 * 
 * @author zkj
 */
public interface VehicleAuctionService {
	/**
	 * 分页查询自己的竞价
	 * 
	 * @param page
	 * @param rows
	 * @return
	 */
	List<Vehicle_auction> getVehicle_auctionInfo(int page, int rows,
			String zhuang, String xie, String models, String truckTypeId,
			String determine, String userid1);

	/**
	 * 总行数
	 * 
	 * @return
	 */
	int getCount(String zhuang, String xie, String models, String truckTypeId,
			String determine, String userid1);

	// 获取修改信息
	Vehicle_auction getSelectVehicle_auction(String pid, String userid);

	// 修改信息
	int updateVehicle_auction(Vehicle_auction vehicle_auction, String userid);
	
	//获取用户的修改价格信息
	Vehicle_auction getVehicleAuctionRow(String vehicleAuctionId);

	int updateVehicleAuctionRow(Vehicle_auction vehicle_auction);
	int updateManualAuction(Vehicle_auction vehicle_auction);
	int deleteManual(String[] vvv);
	/**
	 * 查询该用户全部竞价
	 * @param userid1
	 * @param istrue 
	 * @param rows 
	 * @param rownum 
	 * @return
	 */
	List<Vehicle_auction> getVehicle_auctionInfoAll(String userid1,String istrue, String rownum, String rows);
	//车辆确定消息展示提醒
		List<Vehicle_auction> messageVehicle_auction(String userid);
		/**
		 * 通过需求id查询车的id 确定车辆绑定线路
		 * @param carid
		 * @return
		 */
		public Vehicle_auction  getCarIdDete_Vehiche(String carid);
}
