package com.jy.service;

import java.util.List;

import com.jy.model.ConfirmMsg;
import com.jy.model.Demand_release;
import com.jy.model.DetemineVehicle;
import com.jy.model.User;

/**
 * 确定车辆的 service
 * @author zkj
 *
 */
public interface DetemineVehicleService {
	//查询对应的
	List<DetemineVehicle> getdetermineVehicle(int page,
			int rows,String pid);
	//总条数
	int getCount(String pid);
	//确定
	int updateDetermineVehicle(String pid,String sss);
	int checkDetermineVehicle(String pid);
	DetemineVehicle zuidiPrice(String plate_number);
	/**
	 * 获取car_id
	 * @param pid
	 * @return
	 */
	String getTemporary_carId(String pid);
	/**
	 * 获取设备id
	 * @param carid
	 * @return
	 */
	User getCannId(String carid);
	/**
	 * 添加确定车辆消息
	 * @param confirmMsg
	 * @return
	 */
	boolean saveConfirmMsg(ConfirmMsg confirmMsg);

	/**
	 * 查询没有确定需求的信息
	 */
	List<DetemineVehicle> getdetermineVehicleNotrue(String demandReleaseId);
	
	/**
	 * 没有确定车辆
	 * @param carids
	 * @return
	 */
	List<User> getCannIds(String[] carids);
}
