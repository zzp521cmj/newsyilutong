package com.jy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.ClassLineToLinstandard;
import com.jy.model.ClassPlan;
import com.jy.model.LinStandard;
import com.jy.model.PostClassLineInfo;
import com.jy.model.PostClassline;
import com.jy.model.Remark;
import com.jy.model.TravelCard;


public interface ClassPlanDao {
	/**
	 * 获取班线列表
	 * @param name
	 * @return
	 */
	List<PostClassline> getlinlist(String name);
	
	/**
	 * 获取固定车辆
	 * @param name
	 * @return
	 */
	List<TravelCard> getCarInfo(String name);
	
	/**
	 * 添加自动计划任务表
	 * @param classPlan
	 * @return
	 */
	int addclassplan(ClassPlan classPlan);
	/**
	 * 获取自动计划表
	 * @param page
	 * @param rows
	 * @param classlineName
	 * @param organization
	 * @param car_num
	 * @return
	 */
	List<ClassPlan> getClassPlanInfo(int page, Integer rows,
			String classlineName, String organization, String car_num);
	/**
	 * 获取个数
	 * @param page
	 * @param rows
	 * @param classlineName
	 * @param organization
	 * @param car_num
	 * @return
	 */
	int getCount(int page, Integer rows, String classlineName,
			String organization, String car_num);
	
	/**
	 * 获取编辑信息
	 * @param pid
	 * @return
	 */
	ClassPlan getClassPlanEditInfo(String pid);

}