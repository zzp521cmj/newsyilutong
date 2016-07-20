package com.jy.service.impl;
/***
 * @author  黄清华
 * @param  全图监控模块
 * @since 1.6
 * @version 1.0
 * @throws null
 * @createtime 2015-6-3
 */
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.jy.common.UUIDUtils;
import com.jy.dao.MapDao;
import com.jy.model.Maps;
import com.jy.model.OldMointorData;
import com.jy.model.Remark;
import com.jy.model.ShippingOrder;
import com.jy.service.MapService;
@Component
public class MapServiceImpl implements MapService{

	@Resource private MapDao mapDao;
	public List<Maps> returncarinfo(String[] car) {
		return mapDao.returncarinfo(car);
	}
	public List<Maps> loadmapinfo(String carno,String cumoer) {
		List<Maps> mapjglist=null;
		try {
			//mapDao.l();
			mapjglist=mapDao.loadmapinfo(carno,cumoer);
			//mapDao.ul();
		} catch (Exception e) {
			e.printStackTrace();
			//mapDao.ul();
		}
		return mapjglist;
	}
	public List<Maps> loadallcarinfo(int rows, int page, String carno,String dept,String ydh,String cumorter) {
		List<Maps> list = mapDao.loadallcarinfo(rows, page,
				carno,dept,ydh,cumorter);
		return list;
	}
	public int loadallcarinfocount(String carno,String dept,String ydh,String cumorter) {
		int count = mapDao.loadallcarinfocount(carno,dept,ydh,cumorter);
		return count;
	}
	public List<Remark> getallremark() {
		List<Remark>allrmklist=null;
		try {
			allrmklist=mapDao.getallremark();
		} catch (Exception e) {
			return null;
		}
		return allrmklist;
	}
	public List<Remark> getallremarkbydname(String dname) {
		List<Remark>onermklist=null;
		try {
			onermklist=mapDao.getallremarkbydname(dname);
		} catch (Exception e) {
			//e.printStackTrace();
		}
		return onermklist;
	}
	public List<OldMointorData> gethfinfo(String carno) {
		List<OldMointorData> omdlist=null;
		try {
			omdlist=mapDao.gethfinfo(carno);
		} catch (Exception e) {
		}
		return omdlist;
	}
	/*public List<Maps> getcarnotoselect(String carno) {
		List<Maps>carnolist=null;
		try {
			carnolist=mapDao.getcarnotoselect(carno);
		} catch (Exception e) {
		}
		return carnolist;
	}*/
	/**
	 * 查询回放使用的坐标点
	 */
	public List<Maps> gethfmess(String carno, String starttime, String endtime) {
		List<Maps> maphflist=null;
		try {
			maphflist=mapDao.gethfmess(carno,starttime,endtime);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return maphflist;
	}
	public List<Maps> gethfmesspage(String carno, String starttime,
			String endtime, int rows, int page) {
		try {
			List<Maps> list=mapDao.gethfmesspage(carno, starttime, endtime, rows, page);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public int loadhfpage(String carno, String starttime, String endtime) {
		int count = mapDao.loadhfpage(carno, starttime, endtime);
		return count;
	}
	public int updateDepartment(String creatingUser, String institutionId) {
		// TODO Auto-generated method stub
		return 0;
	}
	public int saveMaps(Maps maps) {
		maps.setMonitorid(UUIDUtils.getUUID());
		maps.setState("1");
		int count = mapDao.saveMaps(maps);
		return count;
	}
	public int deletecarbyid(String carid) {
		int count = mapDao.deletecarbyid(carid);
		return count;
	}
	public int saveMapsweek(Maps maps) {
		maps.setMonitorid(UUIDUtils.getUUID());
		maps.setState("1");
		int count = mapDao.saveMapsweek(maps);
		return count;
	}
	public List<Maps> gethfmessnozero(String tablename,String carno, String starttime,
			String endtime,String dbname,String page) {
		List<Maps> maphflist=null;
		try {
			maphflist=mapDao.gethfmessnozero(tablename,carno,starttime,endtime,dbname,page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return maphflist;
	}
	/**
	 * zzp查询线路名称所属机构等
	 */
	public Maps getqtmessgage(String carno,String dbname) {
		// TODO Auto-generated method stub
		Maps map=mapDao.getqtmessgage(carno,dbname);
		return map;
	}
	public int gethfpage(String tablename,String carno, String starttime, String endtime){
		int num=0;
		try {
			num=mapDao.gethfpage(tablename,carno,starttime,endtime);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return num;
	}
	/**
	 * 首页订单显示
	 */
	public List<ShippingOrder> getShipOrderInfo(int rows, int page,
			String name, String phone_number, String type,String start_date,String end_date,String pid,String phone,String order_state,String pay_type,String send_address,String goods_name,String cumoer) {
		System.out.println(cumoer); 
		List<ShippingOrder> list=mapDao.getShipOrderInfo(rows, page, name, phone_number, type, start_date, end_date, pid, phone, order_state, pay_type, send_address,goods_name,cumoer);
		return list;
	}

	public int getShipOrder(String name, String phone_number,
			String type,String start_date,String end_date,String pid,String phone,String order_state,String pay_type,String send_address,String goods_name,String cumoer) {
		int count=mapDao.getShipOrder(name, phone_number, type, start_date, end_date, pid, phone, order_state, pay_type, send_address,goods_name,cumoer);
		return count;
	}
	public int savecarsinfo(String dbName, Maps maps) {
		return mapDao.savecarsinfo(dbName, maps);
	}
}
