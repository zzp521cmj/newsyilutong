package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;

import com.jy.common.SessionInfo;
import com.jy.common.UUIDUtils;
import com.jy.dao.VehicleAuctionDao;
import com.jy.model.DetemineVehicle;
import com.jy.model.User;
import com.jy.model.Vehicle_auction;
import com.jy.service.VehicleAuctionService;


/**
 * 2015年5月18日  Controller
 * 
 * @author zkj
 */
@Component
public class VehicleAuctionServiceImpl implements VehicleAuctionService {
	@Resource
	public VehicleAuctionDao vehicleAuctionDao;
	
	public List<Vehicle_auction> getVehicle_auctionInfo(int page, int rows,String zhuang, String xie, String models,String truckTypeId,String determine,String userid1) {
		List<Vehicle_auction> list = vehicleAuctionDao.getVehicle_auctionInfo(page, rows,zhuang, xie, models,truckTypeId,determine,userid1);
		return list;
	}

	public int getCount(String zhuang, String xie, String models,String truckTypeId,String determine,String userid1) {
		
		int i = vehicleAuctionDao.getCount(zhuang, xie, models,truckTypeId,determine,userid1);
		return i;
	}
	
	/**
	 * 获取修改信息
	 */
	public Vehicle_auction getSelectVehicle_auction(String pid,String userid) {
		Vehicle_auction auction = vehicleAuctionDao.getSelectVehicle_auction(pid,userid);
		return auction;
	}
	
	//修改信息
	public int updateVehicle_auction(Vehicle_auction vehicle_auction,String userid) {
		int i = vehicleAuctionDao.deleteByPrimaryKey(vehicle_auction.getDemandReleaseId(),userid);
		vehicle_auction.setVehicleAuctionId(UUIDUtils.getUUID());
		vehicle_auction.setUserid(userid);
		vehicle_auction.setDetermine(0);
		int j = vehicleAuctionDao.insert(vehicle_auction);
		
		return j;
	}
	//获取用户的修改价格信息
	public Vehicle_auction getVehicleAuctionRow(String vehicleAuctionId) {
		Vehicle_auction vehicle_auction = vehicleAuctionDao.getVehicleAuctionRow(vehicleAuctionId);
		return vehicle_auction;
	}

	//竞价更新
	public int updateVehicleAuctionRow(Vehicle_auction vehicle_auction) {
		int o = vehicleAuctionDao.updateVehicleAuctionRow(vehicle_auction);
		return o;
	}

	public int updateManualAuction(Vehicle_auction vehicle_auction) {
		return vehicleAuctionDao.updateManualAuction(vehicle_auction);
	}

	public int deleteManual(String[] vvv) {
		return vehicleAuctionDao.deleteManual(vvv);
	}
	public List<Vehicle_auction> getVehicle_auctionInfoAll(String userid1,String istrue, String rownum, String rows) {
		// TODO Auto-generated method stub
		List<Vehicle_auction> list=vehicleAuctionDao.getVehicle_auctionInfoAll(userid1,istrue,rownum,rows);
		return list;
	}
	//车辆确定消息展示提醒
		public List<Vehicle_auction> messageVehicle_auction(String userid){
			List<Vehicle_auction> list=vehicleAuctionDao.messageVehicle_auction(userid);
			return list;
		}
		/**
		 * 通过需求id查询车的id 确定车辆绑定线路
		 */
		public Vehicle_auction getCarIdDete_Vehiche(String carid) {
			Vehicle_auction dv=vehicleAuctionDao.getCarIdDete_Vehiche(carid);
			return dv;
		}

}
