package com.jy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.excel.bean.PostLineExcel;
import com.jy.model.ClassLineToLinstandard;
import com.jy.model.LinStandard;
import com.jy.model.PostClassLineInfo;
import com.jy.model.PostClassline;
import com.jy.model.Remark;


public interface PostLineDao {
	/**
	 * 获取首站点
	 * @param remarkName
	 * @return
	 */
	List<Remark> getRemark(String remarkName);
	
	/**
	 * 添加班线信息
	 * @param list
	 * @return
	 */
	int addPostLineInfo(@Param("list") List<PostClassLineInfo> list) throws Exception; 
	/**
	 * 添加班线基本信息
	 * @param pcl
	 * @return
	 */
	int addPostLine(PostClassline pcl);


	int getCount(String classlineName, String organization, String chufadian, String zhongdian);

	List<PostClassline> getPostLine(int page, Integer rows, String classlineName, String organization, String chufadian, String zhongdian);

	/**
	 * 获取基本信息
	 * @param pid
	 * @return
	 */
	PostClassline getSelectPostLine(String pid);
	/**
	 * 获取班线详细信息
	 * @param pid
	 * @return
	 */
	List<PostClassLineInfo> getPostClassLineInfo(String pid);
	
	/**
	 * 删除班线基本信息
	 * @param classlineId
	 * @return
	 */
	int deletePostLine(String classlineId) throws Exception;
	
	/**
	 * 删除班线详细信息
	 * @param classlineId
	 * @return
	 */
	int deletePostLineInfo(String classlineId)  throws Exception;

	/**
	 * 批量删除班线基本信息
	 * @param del
	 * @return
	 */
	int deletePostLinearrays(String[] del);
	
	/**
	 * 批量删除班线详细信息
	 * @param del
	 * @return
	 */
	int deletePostLineInfoarrays(String[] del);
	/**
	 * 获取线路
	 * @param linName
	 * @return
	 */
	List<LinStandard> getlinInfo(String linName);
	
	/**
	 * 绑定线路
	 * @param ctl
	 * @return
	 */
	int addCtl(List<ClassLineToLinstandard> ctl);
	
	/**
	 * 获取要修改的线路
	 * @param pid
	 * @return
	 */
	List<LinStandard> getlinesinfo(String pid);
	/**
	 * 删除关联的班线
	 * @param classlineId
	 * @return
	 */
	int deletelinesinfo(String classlineId);
	/**
	 * 批量删除线路
	 * @param del
	 * @return
	 */
	int deletelinesInfoarrays(String[] del);
	/**
	 * 获取详细信息
	 * @param pid
	 * @return
	 */
	PostClassline lookPostLineInfo(String pid);
	/**
	 * 导出
	 * @param classlineName
	 * @param organization
	 * @param chufadian
	 * @param zhongdian
	 * @return
	 */
	List<PostLineExcel> searchAll(String classlineName, String organization,
			String chufadian, String zhongdian);

}