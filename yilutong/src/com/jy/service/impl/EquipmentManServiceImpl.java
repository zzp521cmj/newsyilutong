package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.jy.common.UUIDUtils;
import com.jy.dao.EquipmentManDao;
import com.jy.model.Equipment_info;
import com.jy.model.TravelCard;
import com.jy.model.Truck;
import com.jy.service.EquipmentManService;

@Component
public class EquipmentManServiceImpl implements EquipmentManService {
	@Resource
	public EquipmentManDao equipmentManDao;

	// 查询
	public List<Equipment_info> getEquipmentManInfo(int page, int rows,String equipment_number,String carid,String department_id,String dids,String dbName,String is_binding) {
		List<Equipment_info> list = equipmentManDao.getEquipmentMan(page, rows,equipment_number, carid,department_id,dids,dbName,is_binding);
		return list;
	}
	public List<Equipment_info> getOutPutEquipment(String [] equid,String equipment_number,String carid,String department_id,String dids,String dbName,String is_binding){
		List<Equipment_info> list = equipmentManDao.getOutPutEquipment(equipment_number, carid,department_id,dids,dbName,is_binding,equid);
		return list;
	}
	public List<Equipment_info> getEquipmentManInfoOne() {
		List<Equipment_info> equipment_infos = equipmentManDao.getEquipmentManInfoOne();
		return equipment_infos;
	}
	/**
	 * 新增
	 */
	public int InfoManAdd(Equipment_info equipment_info,String dbName) {
		equipment_info.setEquipment_id(UUIDUtils.getUUID());
		int i = equipmentManDao.InfoManAdd(equipment_info,dbName);
		return i;
	}

	// 获取总条数
	public int getCount(String equipment_number,String car_id,String department_id,String dids,String dbName,String is_binding) {
		int i = equipmentManDao.getCount(equipment_number, car_id,department_id,dids,dbName,is_binding);
		return i;
	}
	//获取设备号下拉的数据
	public List<Equipment_info> getEquipment_number(String search) {
		equipmentManDao.getEquipment_number(search);
		return equipmentManDao.getEquipment_number(search);
	}
	//获取车牌号列表下拉框
	public List<Equipment_info> getCar_id(String carid) {
		equipmentManDao.getCar_id(carid);
		return equipmentManDao.getCar_id(carid);
	}
	public int deleteEquipment(String[] del) {
		int flag=equipmentManDao.deleteEquipment(del);
		return flag;
	}
	public Equipment_info getUpdateEquipment(String pid,String dbName) {
		// TODO Auto-generated method stub
		Equipment_info equipment_info=equipmentManDao.getUpdateEquipment(pid,dbName);
		return equipment_info;
	}
	public int updateEquipment(Equipment_info equipment_info) {
		// TODO Auto-generated method stub
		int flag=equipmentManDao.updateEquipment(equipment_info);
		return flag;
	}
	public int updateDepart(Equipment_info equipment_info){
		int flag=equipmentManDao.updateDepart(equipment_info);
		return flag;
	}
	
	public int checkEquipment(String equipment_number,String id) {
		// TODO Auto-generated method stub
		int flag=equipmentManDao.checkEquipment(equipment_number,id);
		return flag;
	}
	public int checkEquipmentSinger(String equipment_number, String equipment_id) {
		// TODO Auto-generated method stub
		int flag=equipmentManDao.checkEquipmentSinger(equipment_number,equipment_id);
		return flag;
	}
	// 获取车牌号列表下拉框
	public List<Equipment_info> getCar_idAdd(String carid) {
		List<Equipment_info>list=equipmentManDao.getCar_idAdd(carid);
		return list;
	}
	public int createEquTable(String tablename) {
		// TODO Auto-generated method stub
		int falg=equipmentManDao.createEquTable(tablename);
		return falg;
	}
	public int createTingLiu(String tablename) {
		// TODO Auto-generated method stub
		int falg=equipmentManDao.createTingLiu(tablename);
		return falg;
	}
	
	public int deleteEquTable(String tablename) {
		// TODO Auto-generated method stub
		int falg=equipmentManDao.deleteEquTable(tablename);
		return falg;
	}
	public int deleteZuixin(String eq,String car) {
		// TODO Auto-generated method stub
		int falg=equipmentManDao.deleteZuixin(eq,car);
		return falg;
	}
	public int jieBang(String pid,String type) {
		// TODO Auto-generated method stub
		int falg=equipmentManDao.jieBang(pid,type);
		return falg;
	}
	public String getCarInfo(String num,String dbName){
		return equipmentManDao.getCarInfo(num,dbName);
	}
	public int bangCar(String carid,String pid){
		return equipmentManDao.bangCar(carid,pid);
	}
	public int getTrave(String carno){
		return equipmentManDao.getTrave(carno);
	}
}
