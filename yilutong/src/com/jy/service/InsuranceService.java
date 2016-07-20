package com.jy.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.Insurance;
import com.jy.model.Source;
/**
 * 保险信息
 *@author lx
 */
public interface InsuranceService {

	/**
	 * 车辆信息一览
	 * @param page
	 * @param rows
	 * @param plateNumber
	 * @return
	 */
	public List<Insurance> getInsurance(Integer page,Integer rows,String plateNumber);
	public List<Insurance> getAllInsurance(String plateNumber);
	/**
	 * 总条数
	 * @return
	 */
	public int getCount(String plateNumber);
	/**
	 * 新增车辆
	 * @param tem
	 * @return
	 */
	public int addInsurance(Insurance in);
	/**
	 * 获取修改信息
	 * @param temporaryCarId
	 * @return
	 */
	public Insurance getEditInsurance(String insuranceId);
	/**
	 * 修改车辆信息
	 * @param tem
	 * @return
	 */
	public int editInsurance(Insurance in);
	/**
	 * 批量删除
	 * @param temporaryCarId
	 * @return
	 */
	public int deleteInsurance(@Param("array") String[] insuranceId);
	
	/**
	 * 根据车牌号查询
	 * @param plateNumber
	 * @return
	 */
	public List<Insurance> getCar_Num(String travelCardId);
	/*
	 * 当月过期保险
	 * */
	List<Insurance>dangyueInsurance(String year,String month);
}
