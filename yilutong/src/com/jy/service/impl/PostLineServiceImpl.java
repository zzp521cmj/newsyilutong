package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;


import com.jy.common.UUIDUtils;
import com.jy.dao.PostLineDao;
import com.jy.excel.bean.PostLineExcel;
import com.jy.model.ClassLineToLinstandard;
import com.jy.model.Demand_release;
import com.jy.model.LinStandard;
import com.jy.model.PostClassLineInfo;
import com.jy.model.PostClassline;
import com.jy.model.Remark;
import com.jy.service.PostLineService;
import common.Logger;

/**
 * 2015年5月25日 16:15:23
 * 
 * @author zzp
 * 班线管理serviceImpl
 * 
 */
@Component
public class PostLineServiceImpl implements PostLineService {
	@Resource
	public PostLineDao postLineDao;
	/**
	 * 获取首站点
	 */
	public List<Remark> getRemark(String remarkName) {
		// TODO Auto-generated method stub
		List<Remark> list=postLineDao.getRemark(remarkName);
		return list;
	}
	@Transactional
	public boolean addPostLineInfo(List<PostClassLineInfo> list) {
		// TODO Auto-generated method stub\
		
		int flag;
		try {
			flag = postLineDao.addPostLineInfo(list);
			if(flag>0)
				return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}
		
		return false;
		
	}
	
	public String addPostLine(PostClassline pcl) {
		String siteId=UUIDUtils.getUUID();
		pcl.setClasslineId(siteId);
		int pclId=postLineDao.addPostLine(pcl);
		if(pclId>0)
			return siteId;
		else
			return null;
		// TODO Auto-generated method stub
		
	}
	public List<PostClassline> getPostLine(int page, Integer rows,String classlineName, String organization, String chufadian,
			String zhongdian) {
		// TODO Auto-generated method stub
		List<PostClassline> postline = postLineDao.getPostLine(page,rows, classlineName,  organization,  chufadian, zhongdian);
		
		return postline;
	}
	public int getCount(String classlineName,String organization,String chufadian,String zhongdian) {
		// TODO Auto-generated method stub
		int count=postLineDao.getCount(classlineName,organization,chufadian,zhongdian);
		return count;
	}

	/**
	 * 获取基本信息
	 * @param pid
	 * @return
	 */
	public PostClassline getSelectPostLine(String pid) {
		// TODO Auto-generated method stub
		PostClassline postClassline=postLineDao.getSelectPostLine(pid);
		return postClassline;
	}

	/**
	 * 获取班线详细信息
	 * @param pid
	 * @return
	 */
	public List<PostClassLineInfo> getPostClassLineInfo(String pid) {
		// TODO Auto-generated method stub
		List<PostClassLineInfo> postClassLineInfos=postLineDao.getPostClassLineInfo(pid);
		return postClassLineInfos;
	}
	
	/**
	 * 删除指定班线信息
	 * @param classlineId
	 * @return
	 */
	public int deletePostLine(String classlineId) {
		// TODO Auto-generated method stub
		try {
			int delpostline=postLineDao.deletePostLine(classlineId);
			int delpostlineinfo=postLineDao.deletePostLineInfo(classlineId);
			int deletelinesinfo=postLineDao.deletelinesinfo(classlineId);
		} catch (Exception e) {
			// TODO: handle exception
			return 0;
		}
		return 1;
	}
	/**
	 * 批量删除
	 */
	public int deletePostLine(String[] del) {
		// TODO Auto-generated method stub
		int delpostline=postLineDao.deletePostLinearrays(del);
		int delpostlineinfo=postLineDao.deletePostLineInfoarrays(del);
		int deletelinesInfoarrays=postLineDao.deletelinesInfoarrays(del);
		return deletelinesInfoarrays;
	}
	/**
	 * 获取线路
	 */
	public List<LinStandard> getlinInfo(String linName) {
		// TODO Auto-generated method stub
		List<LinStandard>  list=postLineDao.getlinInfo(linName);
		return list;
	}
	/**
	 * 绑定线路
	 */
	public boolean addCtl(List<ClassLineToLinstandard> ctl) {
		// TODO Auto-generated method stub
		int flag;
		try {
			flag = postLineDao.addCtl(ctl);
			if(flag>0)
				return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}
		
		return false;
	}
	/**
	 * 获取修改的线路
	 */
	public List<LinStandard> getlinesinfo(String pid) {
		// TODO Auto-generated method stub
		List<LinStandard> list=postLineDao.getlinesinfo(pid);
		return list;
	}
	/**
	 * 获取详细信息
	 */
	public PostClassline lookPostLineInfo(String pid) {
		// TODO Auto-generated method stub
		PostClassline postClassline= postLineDao.lookPostLineInfo(pid);
		return postClassline;
	}
	/**
	 * 导出
	 */
	public List<PostLineExcel> searchAll(String classlineName,
			String organization, String chufadian, String zhongdian) {
		// TODO Auto-generated method stub
		List<PostLineExcel> list=postLineDao.searchAll(classlineName,organization,chufadian,zhongdian);
		return list;
	}
	

	
}
