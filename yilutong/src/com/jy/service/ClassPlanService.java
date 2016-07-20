package com.jy.service;

import java.util.List;

import com.jy.model.ClassLineToLinstandard;
import com.jy.model.ClassPlan;
import com.jy.model.LinStandard;
import com.jy.model.PostClassLineInfo;
import com.jy.model.PostClassline;
import com.jy.model.Remark;
import com.jy.model.TravelCard;
import com.jy.model.Vehicle_auction;

/**
 * 2015年5月23日 16:15:23
 * 
 * @author zzp
 * 班线管理service
 * 
 */
public interface ClassPlanService {
	
	/**
	 *  获取班线列表
	 * @param name
	 * @return
	 */
	List<PostClassline> getlinlist(String name);
	/**
	 * 获取车辆列表
	 * @param name
	 * @return
	 */
	List<TravelCard> getCarInfo(String name);
	/**
	 * 添加自动任务计划
	 * @param classPlan
	 * @return
	 */
	boolean addclassplan(ClassPlan classPlan);
	/**
	 * 获取自动计划列表
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
	 * @param i
	 * @param rows1
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
