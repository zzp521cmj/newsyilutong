package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.jy.common.UUIDUtils;
import com.jy.dao.TemporaryCarDao;
import com.jy.model.Car_length;
import com.jy.model.ConfirmMsg;
import com.jy.model.Source;
import com.jy.model.TemporaryCar;
import com.jy.service.TemporaryCarService;
/**
 * 临时车辆信息
 * @author lx
 */
@Component
public class TemporaryCarServiceImpl implements TemporaryCarService {
	@Resource 
	private TemporaryCarDao temdao;
	/**
	 * 车辆信息一览
	 */
	public List<TemporaryCar> getTemCar(Integer page,Integer rows,String plateNumber,String carLength,String volume,String load_s,String source,String carType,String boxType) {
		List<TemporaryCar> list = temdao.getTemCar( page, rows, plateNumber,carLength,volume,load_s,source,carType,boxType);
		return list;
	}
	/**
	 * 总页数
	 */
	public int getCount(String plateNumber,String carLength,String volume,String load_s,String source,String carType,String boxType) {
		int i = temdao.getCount(plateNumber,carLength,volume,load_s,source,carType,boxType);
		return i;
	}
	/**
	 * 新增车辆
	 */
	public int addCar(TemporaryCar tem) {
		tem.setTemporaryCarId(UUIDUtils.getUUID());
		int car = temdao.addCar(tem);
		return car;
	}
	/**
	 * 批量删除
	 */
	public int deleteTemCar(String[] temporaryCarId) {
		int del1 = temdao.deleteTemCar(temporaryCarId);
		return del1;
	}
	/**
	 * 获取修改信息
	 */
	public TemporaryCar getEditTemCar(String temporaryCarId) {
		TemporaryCar tem = temdao.getEditTemCar(temporaryCarId);
		return tem;
	}
	/**
	 * 修改车辆信息
	 */
	public int editTemCar(TemporaryCar tem) {
		int edit = temdao.editTemCar(tem);
		return edit;
	}

	/**
	 * 根据车牌号查询
	 */
	public List<TemporaryCar> getCar_Num(String plateNumber,String xx) {
		List<TemporaryCar> list = temdao.getCar_Num(plateNumber,xx);
		return list;
	}
	/**
	 * 来源信息
	 */
	public List<Source> getSource() {
		List<Source> list = temdao.getSource();
		return list;
	}
	/**
	 * 厢型信息
	 * 
	 */
	public List<Car_length> getLength() {
		List<Car_length> length=temdao.getLength();
		return length;
	}
	public List<TemporaryCar> getCars() {
		return temdao.getCars();
		
	}
	public boolean usercar(String car,String id) {
		int i = temdao.usercar(car,id);
		if(i>0)
			return true;
			else
			return false;
	}
	public TemporaryCar getUserTemCar(String id) {
		return temdao.getUserTemCar(id);
	}
	public boolean delusercar(String id) {
		int i = temdao.delusercar(id);
		if(i>0)
			return true;
			else
			return false;
	}
	public List<TemporaryCar> getCarsUser() {
		return temdao.getCarsUser();
	}
	public TemporaryCar getOneCar(String id) {
		return temdao.getOneCar(id);
	}
	public String getXiang(String id) {
		return temdao.getXiang(id);
	}
	public List<TemporaryCar> getAllCar(String plateNumber,String carLength,String volume,String load_s,String source,String carType,String boxType) {
		return temdao.getAllCar(plateNumber, carLength, volume, load_s, source, carType, boxType);
	}
	/**
	 * 确认车辆msg
	 */
	public List<ConfirmMsg> getConfirmMsg(String temporaryCarId) {
		// TODO Auto-generated method stub
		List<ConfirmMsg> list=temdao.getConfirmMsg(temporaryCarId);
		return list;
	}
	public int getjingjia(String id) {
		
		return temdao.getjingjia(id);
	}
}
