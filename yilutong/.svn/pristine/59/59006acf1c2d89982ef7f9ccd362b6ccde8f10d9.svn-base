package com.jy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.Equipment_info;
import com.jy.model.TravelCard;
import com.jy.model.Truck;

public interface EquipmentManDao {
	// 设备一览
	List<Equipment_info> getEquipmentMan(int page, int rows,
			String equipment_number,String carid,String department_id,String dids,String dbName,String is_binding);
	List<Equipment_info> getOutPutEquipment(String equipment_number,String carid,String department_id,String dids,String dbName,String is_binding,@Param("array")String [] equid);
	List<Equipment_info> getEquipmentManInfoOne();

	int InfoManAdd(@Param("equi")Equipment_info equipment_info,@Param("db")String dbName);

	// 总条数
	int getCount(String equipment_number,String car_id,String department_id,String dids,String dbName,String is_binding);

	// 获取设备列表下拉框
	public List<Equipment_info> getEquipment_number(String search);
	// 获取车牌号列表下拉框
	public List<Equipment_info> getCar_id(String carid);
	// 获取车牌号列表下拉框
		public List<Equipment_info> getCar_idAdd(String carid);
	//删除设备
	int deleteEquipment(String[] del);
	//查询要修改的信息
	Equipment_info getUpdateEquipment(String pid,String dbName);
	//修改设备
	int updateEquipment(Equipment_info equipment_info);
	int updateDepart(Equipment_info equipment_info);
	//是否存在
	int checkEquipment(String equipment_number,String id);
	//是否可修改
	int checkEquipmentSinger(String equipment_number, String equipment_id);

	int createEquTable(String tablename);
	int createTingLiu(String tablename);
	
	int deleteEquTable(String tablename);
	int deleteZuixin(String eq,String car);
	int jieBang(String pid,String type);
	String getCarInfo(String num,String dbName);
	int bangCar(String carid,String pid);
	int getTrave(String carno);
}
