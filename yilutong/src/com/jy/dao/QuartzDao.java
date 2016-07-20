package com.jy.dao;

import java.util.List;

import com.jy.model.PostClassline;

public interface QuartzDao {
	/**
	 * 查询所有计划
	 * @return
	 */
	List<PostClassline> getPostClassLineInfo();
	/**
	 * 插入
	 * @param postClassline
	 */
	void insertPostClassLineInfo(PostClassline postClassline);
	/**
	 * 获取自动生成班线的个数
	 */
	int getPostLineCodeCount(String classlineId);
	
}
