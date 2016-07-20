package com.jy.dao;

import java.util.List;

import com.jy.model.ConfirmMsg;
import com.jy.model.Demand_release;
import com.jy.model.DetemineVehicle;
import com.jy.model.User;

/**
 * 确定车辆的 Dao
 * @author zkj
 *
 */
public interface DetemineVehicleDao {
	public List<DetemineVehicle> getdetermineVehicle(int page, int rows,String pid);
	public int getCount(String pid);
	//确定操作
	public int updateDetermineVehicle(String pid);
	int checkDetermineVehicle(String pid);
	int updateDetermine(String sss);
	DetemineVehicle zuidiPrice(String plate_number);
	/**
	 * 获取carid
	 * @param pid
	 * @return
	 */
	public String getTemporary_carId(String pid);
	/**
	 * 获取设备id
	 * @param carid
	 * @return
	 */
	public User getCannId(String carid);
	/**
	 * 获取指定需求信息
	 */
	public Demand_release getdetermineVehicleMsg(String sss);
	/**
	 * 保存确定车辆msg
	 * @param confirmMsg
	 * @return
	 */
	public int saveConfirmMsg(ConfirmMsg confirmMsg);
	/**
	 * 查询没有确定需求的信息
	 * @param demandReleaseId
	 * @return
	 */
	public List<DetemineVehicle> getdetermineVehicleNotrue(
			String demandReleaseId);
	/**
	 * 没有确定的cannids
	 * @param carids
	 * @return
	 */
	public List<User> getCannIds(String[] carids);
}
