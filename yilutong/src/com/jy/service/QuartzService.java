package com.jy.service;

import java.util.List;

import com.jy.model.PostClassline;

public interface QuartzService {
	/**
	 * 查询所有计划
	 * @return
	 */
	List<PostClassline> getPostClassLineInfo();
	
	/**
	 * 插入按天，1、永不结束
	 * @param postClassline
	 */
	void insertPostClassLineInfo(PostClassline postClassline);
	/**
	 * 获取自动生成班线的个数
	 * @return
	 */
	int getPostLineCodeCount(String classlineId);
}
