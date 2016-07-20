package com.jy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.Car_length;
import com.jy.model.ConfirmMsg;
import com.jy.model.Source;
import com.jy.model.TemporaryCar;
/**
 * @author lx
 *临时车辆信息
 */
public interface TemporaryCarDao {
	/**
	 * 车辆信息一览
	 * @param page
	 * @param rows
	 * @param plateNumber
	 * @return
	 *
	 */
	List<TemporaryCar> getTemCar(Integer page,Integer rows,String plateNumber,String carLength,String volume,String load_s,String source,String carType,String boxType);
	/**
	 * 总条数
	 * @return
	 */
	int getCount(String plateNumber,String carLength,String volume,String load_s,String source,String carType,String boxType);
	/**
	 * 新增车辆
	 * @param tem
	 * @return
	 */
	int addCar(TemporaryCar tem);
	/**
	 * 获取修改信息
	 * @param temporaryCarId
	 * @return
	 */
	TemporaryCar getEditTemCar(String temporaryCarId);
	/**
	 * 修改车辆信息
	 * @param tem
	 * @return
	 */
	int editTemCar(TemporaryCar tem);
	/**
	 * 批量删除
	 * @param temporaryCarId
	 * @return
	 */
	int deleteTemCar(@Param("array") String[] temporaryCarId);
	
	/**
	 * 根据车牌号查询
	 * @param plateNumber
	 * @return
	 */
	List<TemporaryCar> getCar_Num(String plateNumber,String xx);
	/**
	 * 获取来源信息
	 * @return
	 */
	List<Source> getSource();
	/**
	 * 获取厢型
	 * @return
	 */
	List<Car_length> getLength();
	List<TemporaryCar> getCars();
	List<TemporaryCar> getCarsUser();
	int usercar(String car,String id);
	int delusercar(String id);
	TemporaryCar getUserTemCar(String id);
	TemporaryCar getOneCar(String id);
	String getXiang(String id);
	List<TemporaryCar> getAllCar(String plateNumber,String carLength,String volume,String load_s,String source,String carType,String boxType);
	/**
	 * 确认车辆msg
	 * @param temporaryCarId
	 * @return
	 */
	List<ConfirmMsg> getConfirmMsg(String temporaryCarId);
	int getjingjia(String id);
}