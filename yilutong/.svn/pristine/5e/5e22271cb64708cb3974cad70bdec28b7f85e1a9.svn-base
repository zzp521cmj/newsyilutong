package com.jy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.Insurance;
import com.jy.model.Source;
import com.jy.model.TemporaryCar;
/**
 * @author lx
 *保险信息
 */
public interface InsuranceDao {
	
	/**
	 * 车辆信息一览
	 * @param page
	 * @param rows
	 * @param plateNumber
	 * @return
	 */
	List<Insurance> getInsurance(Integer page,Integer rows,String plateNumber);
	List<Insurance> getAllInsurance(String plateNumber);
	/**
	 * 总条数
	 * @return
	 */
	int getCount(String plateNumber);
	/**
	 * 新增车辆
	 * @param tem
	 * @return
	 */
	int addInsurance(Insurance in);
	/**
	 * 获取修改信息
	 * @param temporaryCarId
	 * @return
	 */
	Insurance getEditInsurance(String insuranceId);
	/**
	 * 修改车辆信息
	 * @param tem
	 * @return
	 */
	int editInsurance(Insurance in);
	/**
	 * 批量删除
	 * @param temporaryCarId
	 * @return
	 */
	int deleteInsurance(@Param("array") String[] insuranceId);
	
	/**
	 * 根据车牌号查询
	 * @param plateNumber
	 * @return
	 */
	List<Insurance> getCar_Num(String travelCardId);
	/*
	 * 当月过期保险
	 * */
	List<Insurance>dangyueInsurance(String year,String month);
}
