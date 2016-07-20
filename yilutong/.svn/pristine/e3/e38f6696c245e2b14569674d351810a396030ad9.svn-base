package com.jy.service;

import java.util.List;

import com.jy.excel.bean.PostLineExcel;
import com.jy.model.ClassLineToLinstandard;
import com.jy.model.LinStandard;
import com.jy.model.PostClassLineInfo;
import com.jy.model.PostClassline;
import com.jy.model.Remark;

/**
 * 2015年5月23日 16:15:23
 * 
 * @author zzp
 * 班线管理service
 * 
 */
public interface PostLineService {
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
	boolean addPostLineInfo(List<PostClassLineInfo> list);
	
	/**
	 * 添加班线基本信息
	 * @param pcl
	 * @return
	 */
	String addPostLine(PostClassline pcl);
	
	/**
	 * 获取班线管理信息
	 * @param zhongdian 
	 * @param chufadian 
	 * @param organization 
	 * @param classlineName 
	 * @param i
	 * @param rows1
	 * @return
	 */
	List<PostClassline> getPostLine(int page, Integer rows, String classlineName, String organization, String chufadian, String zhongdian);
	/**
	 * 查询个数
	 * @param zhongdian 
	 * @param chufadian 
	 * @param organization 
	 * @param classlineName 
	 * @return
	 */
	int getCount(String classlineName, String organization, String chufadian, String zhongdian);
	
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
	 * 删除对应班线信息
	 * @param classlineId
	 * @return
	 */
	int deletePostLine(String classlineId);
	
	/**
	 * 批量删除对应班线信息
	 * @param del
	 * @return
	 */
	int deletePostLine(String[] del);
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
	boolean addCtl(List<ClassLineToLinstandard> ctl);
	
	/**
	 * 获取要修改的线路
	 * @param pid
	 * @return
	 */
	List<LinStandard> getlinesinfo(String pid);

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
