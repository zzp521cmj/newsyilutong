package com.jy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.Demand_release;
import com.jy.model.DetemineVehicle;
import com.jy.model.Vehicle_auction;

/**
 * 2015年5月18日 Controller
 * 
 * @author zkj
 */
public interface VehicleAuctionDao {

	// 分页查询
	List<Vehicle_auction> getVehicle_auctionInfo(int page, int rows,String zhuang, String xie, String models,String truckTypeId,String determine,String userid1);

	// 总条数
	int getCount(String zhuang, String xie, String models,String truckTypeId,String determine,String userid1);

	//获取修改信息
	Vehicle_auction getSelectVehicle_auction(String pid,String userid);
	//获取修改信息
//	Vehicle_auction getVehicle_auction();
	
	//delete
	int deleteByPrimaryKey(String demandReleaseId,String userid);

	//新增
	int insert(Vehicle_auction record);

	//获取用户的修改价格信息
	Vehicle_auction getVehicleAuctionRow(String vehicleAuctionId);
	
	
	//竞价更新
	public int updateVehicleAuctionRow(Vehicle_auction vehicle_auction);
	int insertSelective(Vehicle_auction record);

	Vehicle_auction selectByPrimaryKey(String vehicleAuctionId);

	int updateByPrimaryKeySelective(Vehicle_auction record);
	int updateManualAuction(Vehicle_auction record);

	int updateByPrimaryKey(Vehicle_auction record);
	int deleteManual(@Param("array") String[] del);
	/**
	 * 查询该用户全部竞价
	 * @param userid1
	 * @param istrue 
	 *  @param istrue 
	 * @param rows 
	 * @param rownum 
	 * @return
	 */
	List<Vehicle_auction> getVehicle_auctionInfoAll(String userid1, String istrue, String rownum, String rows);
	//车辆确定消息展示提醒
	List<Vehicle_auction> messageVehicle_auction(String userid);
	/**
	 * 通过需求id查询车的id 确定车辆绑定线路
	 * @param carid
	 * @return
	 */
	public Vehicle_auction getCarIdDete_Vehiche(String carid);
}
