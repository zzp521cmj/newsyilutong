package com.jy.service.impl;
/***
 * @author  黄清华
 * @param  标准路线的实体类（LinStandard）
 * @since 1.6
 * @version 1.0
 * @throws null
 * @createtime 2015-5-20
 */
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.jy.common.UUIDUtils;
import com.jy.dao.LinStandardDao;
import com.jy.model.Driver;
import com.jy.model.LinStandard;
import com.jy.model.Linstandard_truck;
import com.jy.model.PostClassLineInfo;
import com.jy.model.PostClassline;
import com.jy.model.Remark;
import com.jy.model.ShippingOrder;
import com.jy.model.Warehouse;
import com.jy.service.LinStandardService;

@Service("LinStandardService")
public class LinStandardServiceImpl implements LinStandardService{
	@Resource
	private LinStandardDao linStandardDao;
	
	public boolean savelinstandard(LinStandard lst) {
		try {
			lst.setLinid(UUIDUtils.getUUID());
			linStandardDao.savelinstandard(lst);
			return true;
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}
	}

	public List<LinStandard> getlinlist(int id) {
		return null;
	}

	public List<PostClassline> getlinlist(String name) {
		List<PostClassline> linlist=new ArrayList<PostClassline>();
		try {
			linlist=linStandardDao.getlinlist(name);
		} catch (Exception e) {
			System.out.println(e);
		}
		return linlist;
	}

	public List<PostClassLineInfo> getlinbyid(String id) {
		List<PostClassLineInfo>plilist=new ArrayList<PostClassLineInfo>();
		try {
			plilist=linStandardDao.getlinbyid(id);
		} catch (Exception e) {
			System.out.println(e);
		}
		return plilist;
	}

	public List<LinStandard> getLinInfo(int rows, int page, String linname) {
		List<LinStandard> list=linStandardDao.getLinInfo(rows,page,linname);
		return list;
	}

	public int getLin(String linname) {
		int count =linStandardDao.getLin(linname);
		return count;
	}

	public List<LinStandard> getLinbyid(String linid) {
		List<LinStandard>plilist=new ArrayList<LinStandard>();
		try {
			plilist=linStandardDao.getLinbyid(linid);
		} catch (Exception e) {
			System.out.println(e);
		}
		return plilist;
	}

	public List<LinStandard> getLinName(String linname) {
		List<LinStandard>plilist=new ArrayList<LinStandard>();
		try {
			plilist=linStandardDao.getLinName(linname);
		} catch (Exception e) {
			System.out.println(e);
		}
		return plilist;
	}

	public int deleteLinById(String[] del) {
		int flag=linStandardDao.deleteLinById(del);
		return flag;
	}

	public int checkname(String linname) {
		return linStandardDao.checkname(linname);
	}
	
	public List<Remark> getRemark(String id) {
		return linStandardDao.getRemark(id);
	}
	public int getLincount(String[] del){
		return linStandardDao.getLincount(del);
	}
	//点击创建路线获取班线的名称还有编号
	public List<PostClassline> getlinnameandno(String lxid) {
		try {
			return linStandardDao.getlinnameandno(lxid);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}

	public List<LinStandard> getallLinInfo(String linname) {
		try {
			return linStandardDao.getallLinInfo(linname);
		} catch (Exception e) {
			e.printStackTrace();return null;
		}
	}

	public int bdcar(List<Linstandard_truck> ltlist) {
		int i=0;
		try {
			i=linStandardDao.bdcar(ltlist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}

	public List<Linstandard_truck> getlincar(String getLinbyidforbd) {
		return linStandardDao.getlincar(getLinbyidforbd);
	}

	public int deletecarbyno(String linid) {
		return linStandardDao.deletecarbyno(linid);
	}
	/**
	 * 查询重复的线路绑定
	 * @param linid
	 * @param tId
	 * @return
	 */
	public int checkAgain(String linid,String tid){
		return linStandardDao.checkAgain(linid, tid);
	}
	/**
	 * 保存车辆和线路的绑定
	 * @param lt
	 * @return
	 */
	public int saveLinstand(Linstandard_truck lt){
		return linStandardDao.saveLinstand(lt);
	}

	public List<ShippingOrder> getorderbyaid(String aid) {
		return linStandardDao.getorderbyaid(aid);
	}

	public List<Warehouse> getallremark() {
		List<Warehouse>allrmklist=null;
		try {
			allrmklist=linStandardDao.getallremark();
		} catch (Exception e) {
			return null;
		}
		return allrmklist;
	}

	public List<Warehouse> getallremarkbydname(String dname) {
		List<Warehouse>onermklist=null;
		try {
			onermklist=linStandardDao.getallremarkbydname(dname);
		} catch (Exception e) {
			//e.printStackTrace();
		}
		return onermklist;
	}
}
