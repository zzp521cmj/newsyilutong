package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.jy.dao.DetemineVehicleDao;
import com.jy.model.ConfirmMsg;
import com.jy.model.Demand_release;
import com.jy.model.DetemineVehicle;
import com.jy.model.User;
import com.jy.service.DetemineVehicleService;

/**
 * 确定车辆的  service实现
 * @author zkj
 */
@Component
public class DetemineVehicleServiceImpl implements DetemineVehicleService {
	@Resource
	private DetemineVehicleDao detemineVehicleDao;
	//查询分页
	public List<DetemineVehicle> getdetermineVehicle(int page,int rows,String pid) {
		List<DetemineVehicle> detemineVehicle = detemineVehicleDao.getdetermineVehicle(page,rows,pid);
		return detemineVehicle;
		
	}
	//总条数
	public int getCount(String pid) {
		int i = detemineVehicleDao.getCount(pid);
		return i;
	}
	//确定操作
	public int updateDetermineVehicle(String pid,String sss) {
		int i = detemineVehicleDao.updateDetermineVehicle(pid);
		int s = detemineVehicleDao.updateDetermine(sss);
		return i;
	}
	public int checkDetermineVehicle(String pid) {
		// TODO Auto-generated method stub
		return detemineVehicleDao.checkDetermineVehicle(pid);
	}
	public DetemineVehicle zuidiPrice(String plate_number){
		return detemineVehicleDao.zuidiPrice(plate_number);
	}
	/**
	 * 获取carid
	 * 
	 */
	public String getTemporary_carId(String pid) {
		// TODO Auto-generated method stub
		System.out.println(pid);
		String carid=detemineVehicleDao.getTemporary_carId(pid);
		return carid;
	}
	/**
	 * 获取设备id
	 */
	public User getCannId(String carid) {
		// TODO Auto-generated method stub
		User user=detemineVehicleDao.getCannId(carid);
		return user;
	}
	/**
	 * 保存确认车辆信息
	 */
	public boolean saveConfirmMsg(ConfirmMsg confirmMsg) {
		// TODO Auto-generated method stub
		int flag=detemineVehicleDao.saveConfirmMsg(confirmMsg);
		return false;
	}
	/**
	 * 查询没有确定需求的信息
	 */
	public List<DetemineVehicle> getdetermineVehicleNotrue(
			String demandReleaseId) {
		// TODO Auto-generated method stub
		 List<DetemineVehicle> list=detemineVehicleDao.getdetermineVehicleNotrue(demandReleaseId);

		return list;
	}
	/**
	 * 没有确定车辆cannlids
	 */
	public List<User> getCannIds(String[] carids) {
		// TODO Auto-generated method stub
		List<User> users=detemineVehicleDao.getCannIds(carids);
		return users;
	}
	
}
