package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.jy.common.UUIDUtils;
import com.jy.dao.QuartzDao;
import com.jy.model.PostClassline;
import com.jy.service.QuartzService;
@Component
public class QuartzServiceImpl implements QuartzService {
	@Resource
	public QuartzDao quartzDao;
	
	/**
	 * 查询所有计划
	 * @return
	 */
	public List<PostClassline> getPostClassLineInfo() {
		// TODO Auto-generated method stub
		List<PostClassline> list=quartzDao.getPostClassLineInfo();
		return list;
	}
	/**
	 * 插入  按天，1、永不结束
	 */
	public void insertPostClassLineInfo(PostClassline postClassline) {
		// TODO Auto-generated method stub
		postClassline.setAutoId(UUIDUtils.getUUID());
		quartzDao.insertPostClassLineInfo(postClassline);
	}
	
	/**
	 * 获取自动生成班线的个数
	 */
	public int getPostLineCodeCount(String classlineId) {
		// TODO Auto-generated method stub
		int count=quartzDao.getPostLineCodeCount(classlineId);
		return count;
	}
}
