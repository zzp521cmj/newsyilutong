package com.jy.service;

import java.util.List;

import com.jy.model.Equipment_info;
import com.jy.model.TravelCard;
import com.jy.model.Truck;

/**
 * 2015年5月5日 11:54:51
 * 
 * @author zkj 设备管理service
 */
public interface EquipmentManService {
	// 设备查询
	public List<Equipment_info> getEquipmentManInfo(int page, int rows,String equipment_number,String carid,String department_id,String dids,String dbName,String is_binding);
	public List<Equipment_info> getOutPutEquipment(String [] equid,String equipment_number,String carid,String department_id,String dids,String dbName,String is_binding);
	public List<Equipment_info> getEquipmentManInfoOne();
	int InfoManAdd(Equipment_info equipment_info,String dbName);
	// 获取总条数
	public int getCount(String equipment_number,String carid,String department_id,String dids,String dbName,String is_binding);
	//获取设备列表下拉框
	public List<Equipment_info> getEquipment_number(String search);
	//获取车牌号列表下拉框
	public List<Equipment_info> getCar_id(String carid);
	// 获取车牌号列表下拉框
	public List<Equipment_info> getCar_idAdd(String carid);
	//删除设备
	public int deleteEquipment(String[] del);
	//查询修改的信息
	public Equipment_info getUpdateEquipment(String pid,String dbName);
	//修改设备信息
	public int updateEquipment(Equipment_info equipment_info);
	//分配
	public int updateDepart(Equipment_info equipment_info);
	//是否重复
	public int checkEquipment(String equipment_number,String id);
	public int checkEquipmentSinger(String equipment_number, String equipment_id);
	public int createEquTable(String string);
	public int deleteEquTable(String string);
	public int deleteZuixin(String string,String car);
	public int jieBang(String pid,String type);
	public String getCarInfo(String num,String dbName);
	public int bangCar(String carid,String pid);
	
	
	public int getTrave(String carno);
	
	public int createTingLiu(String string);
	
	
}
