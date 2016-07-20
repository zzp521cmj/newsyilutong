package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.jy.common.UUIDUtils;
import com.jy.dao.ClassPlanDao;
import com.jy.model.ClassPlan;
import com.jy.model.PostClassline;
import com.jy.model.TravelCard;
import com.jy.service.ClassPlanService;

/**
 * 2015年5月25日 16:15:23
 * 
 * @author zzp
 * 班线管理serviceImpl
 * 
 */
@Component
public class ClassPlanServiceImpl implements ClassPlanService {
	@Resource
	public ClassPlanDao classPlanDao;
	/**
	 * 获取班线列表
	 */
	public List<PostClassline> getlinlist(String name) {
		// TODO Auto-generated method stub
		List<PostClassline> list=classPlanDao.getlinlist(name);
		return list;
	}
	/**
	 * 获取车辆列表
	 */
	public List<TravelCard> getCarInfo(String name) {
		// TODO Auto-generated method stub
		List<TravelCard> list=classPlanDao.getCarInfo(name);
		return list;
	}
	/**
	 * 添加自动任务计划
	 */
	public boolean addclassplan(ClassPlan classPlan) {
		// TODO Auto-generated method stub
		classPlan.setClassplan_id(UUIDUtils.getUUID());
		int flag=classPlanDao.addclassplan(classPlan);
		if(flag>0)
			return true;
		else
			return false;
	}
	/**
	 * 获取自动计划列表
	 */
	public List<ClassPlan> getClassPlanInfo(int page, Integer rows,
			String classlineName, String organization, String car_num) {
		
		// TODO Auto-generated method stub
		List<ClassPlan> list=classPlanDao.getClassPlanInfo(page,rows,classlineName,organization,car_num);
		return list;
	}
	/**
	 * 个数
	 */
	public int getCount(int page, Integer rows, String classlineName,
			String organization, String car_num) {
		// TODO Auto-generated method stub
		int num=classPlanDao.getCount(page,rows,classlineName,organization,car_num);
		return num;
	}
	/**
	 * 获取编辑信息
	 */
	public ClassPlan getClassPlanEditInfo(String pid) {
		// TODO Auto-generated method stub
		ClassPlan list=classPlanDao.getClassPlanEditInfo(pid);
		return list;
	}
	

	
}
