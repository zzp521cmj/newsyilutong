package com.jy.service;

import java.util.List;

import org.dom4j.DocumentException;

import com.jy.model.Car_length;
import com.jy.model.ConfirmMsg;
import com.jy.model.Source;
import com.jy.model.TemporaryCar;
import com.jy.model.TravelCard;
import com.jy.model.Truck;
/**
 * 临时车辆信息
 * @author lx
 */
public interface TemporaryCarService {
	/**
	 * 车辆一览
	 * @param page
	 * @param rows
	 * @param plateNumber
	 * @return
	 */
	public List<TemporaryCar> getTemCar(Integer page,Integer rows,String plateNumber,String carLength,String volume,String load_s,String source,String carType,String boxType);
	/**
	 * 总页数
	 * @return
	 */
	public int getCount(String plateNumber,String carLength,String volume,String load_s,String source,String carType,String boxType);
	/**
	 * 新增车辆
	 * @param tem
	 * @return
	 */
	public int addCar(TemporaryCar tem);
	/**
	 * 批量删除
	 * @param temporaryCarId
	 * @return
	 */
	public int deleteTemCar(String[] temporaryCarId);
	/**
	 * 获取修改信息
	 * @param temporaryCarId
	 * @return
	 */
	public TemporaryCar getEditTemCar(String temporaryCarId);
	/**
	 * 修改车辆信息
	 * @param tem
	 * @return
	 */
	public int editTemCar(TemporaryCar tem);
	/**
	 * 根据车牌号查询
	 * @param plateNumber
	 * @return
	 */
	public List<TemporaryCar> getCar_Num(String plateNumber,String xx);
	/**
	 * 来源信息
	 * @return
	 */
	public List<Source> getSource();
	/**
	 * 厢型信息
	 * @return
	 */
	public List<Car_length> getLength();
	public List<TemporaryCar> getAllCar(String plateNumber,String carLength,String volume,String load_s,String source,String carType,String boxType);
	public List<TemporaryCar> getCars();
	public List<TemporaryCar> getCarsUser();
	public boolean usercar(String car,String id);
	public TemporaryCar getUserTemCar(String id);
	public boolean delusercar(String id);
	public TemporaryCar getOneCar(String id);
	public String getXiang(String id);
	int getjingjia(String id);
	/**
	 * 添加获取确认车辆信息
	 * @param temporaryCarId
	 * @return
	 */
	public List<ConfirmMsg> getConfirmMsg(String temporaryCarId);
}
