package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import com.jy.common.UUIDUtils;
import com.jy.dao.ShippingManualDao;
import com.jy.model.CustomerModel;
import com.jy.model.ShippingManual;
import com.jy.model.ShippingOrder;
import com.jy.model.Sign_order;
import com.jy.service.ShippingManualInfoService;


@Service("ShippingManualInfoService")

public class ShippingManualInfoServiceImpl  implements ShippingManualInfoService{
	@Resource
	private ShippingManualDao sm_dao;
	//查询分页

	public List<ShippingOrder> getShipManualInfo(int rows, int page,String start_time,String end_time,String send_station,String end_address,String num,String receipt,String custom_name,String order_state,String pay_type ,String send_type,String goods_name,String userid,String weitoudanhao) {
		 List<ShippingOrder> list=sm_dao.getShipManualInfo(rows, page,   start_time, end_time, send_station, end_address, num, receipt, custom_name, order_state, pay_type , send_type, goods_name,userid,weitoudanhao);
		return list;
	}

	public int getShipManual(String start_time,String end_time,String send_station,String end_address,String num,String receipt,String custom_name,String order_state,String pay_type ,String send_type,String goods_name,String userid,String weitoudanhao) {
		int count=sm_dao.getShipManual(start_time, end_time, send_station, end_address, num, receipt, custom_name, order_state, pay_type , send_type, goods_name ,userid,weitoudanhao);
		return count;
	}

	public int deleteShipManual(String[] del) {
		int i=sm_dao.deleteShipManual(del);
		return i;
	}
	
	public int saveShipManual(ShippingOrder d) {
		int i=sm_dao.saveShipManual(d);
		return i;
	}

	public ShippingOrder getUpdateShipManual(String id) {
		ShippingOrder sp=sm_dao.getUpdateShipManual(id);
		return sp;
	}

	public int updateShipManual(ShippingOrder d) {
		int i=sm_dao.updateShipManual(d);
		return i;
	}

	public List<ShippingManual> getPlateNumberLength(String number) {
		List<ShippingManual> list=sm_dao.getPlateNumberLength(number);
		return list;
	}

	public List<ShippingManual> getShipManualAll(String name,
			String phone_number, String type,String start_date,String end_date) {
		List<ShippingManual> list=sm_dao.getShipManualAll(name, phone_number, type,start_date,end_date);
		return list;
	}
		//重复订单号
	public ShippingManual getNumber(String number) {
		ShippingManual der=sm_dao.getNumber(number);
		return der;
	}

	public List<ShippingManual> getSignShipManual(int rows, int page,
			String name, String phone_number, String type, String start_date,
			String end_date,String shipping_order_state) {
		List<ShippingManual> list=sm_dao.getSignShipManual(rows, page, name,  phone_number,type,start_date,end_date,shipping_order_state);
		return list;
	}

	public int getSignShipManualcount(String name, String phone_number, String type,
			String start_date, String end_date,String shipping_order_state) {
		int count=sm_dao.getSignShipManualcount(name, phone_number, type,start_date,end_date,shipping_order_state);
		return count;
	}

	public List<ShippingManual> getSignShipManual1(int rows, int page,
			String name, String phone_number, String type, String start_date,
			String end_date,String did,String shipping_order_state) {
		List<ShippingManual> list=sm_dao.getSignShipManual1(rows, page, name,  phone_number,type,start_date,end_date,did,shipping_order_state);
		return list;
	}

	public int getSignShipManualcount1(String name, String phone_number, String type,
			String start_date, String end_date,String did,String shipping_order_state) {
		int count=sm_dao.getSignShipManualcount1(name, phone_number, type,start_date,end_date,did,shipping_order_state);
		return count;
	}
	
	public int saveSignShipManual(Sign_order sign_order) {
		int count=0;
		try {
			String sid=UUIDUtils.getUUID();
			count=sm_dao.saveSignShipManual(sign_order);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public int updatestate(String shiping_order_id) {
		int count=0;
		try {
			count=sm_dao.updatestate(shiping_order_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public int getShipManualCA(String id, String name,String phone_number, String type, String start_date, String end_date,String send_station,String end_address,String car_number) {
	int i=sm_dao.getShipManualCA(id, name, phone_number, type, start_date, end_date,send_station,end_address,car_number);
		return i;
	}

	public List<ShippingManual> getShipManualInfoCA(int rows, int page,
			String id,String name,String phone_number, String type, String start_date, String end_date,String send_station,String end_address,String car_number) {
		List<ShippingManual> list=sm_dao.getShipManualInfoCA(rows, page, id, name, phone_number, type, start_date, end_date,send_station,end_address,car_number);
		return list;
	}

	public ShippingManual getUpdateSignShipManual(String id) {
		ShippingManual sp=sm_dao.getUpdateSignShipManual(id);
		return sp;
	}
	/**
	 * 制作协议订单的查询
	 */
	public List<ShippingManual> getShipManualCAM(int rows, int page, String[] pid) {
		 List<ShippingManual>list=sm_dao.getShipManualCAM(rows,page,pid);
		return list;
	}
	/**
	 * 删除与需求相关的低订单需求
	 */
	public int deleteShipToDemand(String []del) {
		int i=sm_dao.deleteShipToDemand(del);
		return i;
	}
	/**
	 * 导入
	 * @param tlist
	 * @return
	 */
	public int saveimp(List<ShippingManual> tlist) {
		// TODO Auto-generated method stub
		
		int i=sm_dao.saveShipManuals(tlist);
		return i;
	}
	/**
	 * 图片路径上传
	 */
	public int saveSignImages(String uuid, String order_id, String paths) {
		// TODO Auto-generated method stub
		int i=sm_dao.saveSignImages(uuid,order_id,paths);
		return i;
	}
	/**
	 * 获取司机的订单
	 */
	public List<ShippingManual> getCarShipManual(String car_id) {
		// TODO Auto-generated method stub
		List<ShippingManual> der=sm_dao.getCarShipManual(car_id);
		return der;
	}

	public List<ShippingManual> getUpdateShipManualArray(String[] checkarray) {
		// TODO Auto-generated method stub
		List<ShippingManual> sp=sm_dao.getUpdateShipManualArray(checkarray);
		return sp;
	}
	/**
	 * 查询扫描信息
	 */
	public ShippingManual getAppShipManual(String string) {
		// TODO Auto-generated method stub
		ShippingManual sp=sm_dao.getAppShipManual(string);
		return sp;
	}

	public int getAorder(String number) {
		int i=sm_dao.getAorder(number);
		return i;
	}
	//到达
	public int isArrive(String[] del) {
		int i=sm_dao.isArrive(del);
		return i;
	}
	//取消到达
	public int isNotArrive(String[] del) {
		int i=sm_dao.isNotArrive(del);
		return i;
	}
	/**
	 * 修改历史订单表
	 * @param d
	 * @return
	 */
	public int updateShip(ShippingOrder d) {
		int i=sm_dao.updateShip(d);
		return i;
	}
	/**
	 * 删除订单及相关历史订单表
	 * @param del
	 * @return
	 */
	 public int deleteShip(@Param("array")String []del) {
		 int i=sm_dao.deleteShip(del);
		return i;
	}

	public List<ShippingOrder> getShipCheckInfo(int rows, int page,String check_shping_time,String shiping_order_id,String send_type,String custom_name,String shipping_order_state,String receipt ,String goods_name,String userid) {
	
		return sm_dao.getShipCheckInfo(rows, page, check_shping_time, shiping_order_id, send_type, custom_name, shipping_order_state, receipt, goods_name,userid);
	}

	public int getShipCheckInfoConun(String check_shping_time,String shiping_order_id,String send_type,String custom_name,String shipping_order_state,String receipt ,String goods_name,String userid) {
		// TODO Auto-generated method stub
		return sm_dao.getShipCheckInfoConun(check_shping_time, shiping_order_id, send_type, custom_name, shipping_order_state, receipt, goods_name,userid);
	}

	public int updateCheck(ShippingOrder d) {
		// TODO Auto-generated method stub
		return sm_dao.updateCheck(d);
	}

	public int InsertItoCusShouhuo(CustomerModel cm) {
		// TODO Auto-generated method stub
		return sm_dao.InsertItoCusShouhuo(cm);
	}

	public int InsertItoCusFahuo(CustomerModel cm) {
		// TODO Auto-generated method stub
		return sm_dao.InsertItoCusFahuo(cm);
	}

	public List<CustomerModel> getCustomerFahuo(int rows, int page, String name) {
		// TODO Auto-generated method stub
		return sm_dao.getCustomerFahuo(rows, page, name);
	}

	public int getCustomerFahuoCount(String name) {
		// TODO Auto-generated method stub
		return sm_dao.getCustomerFahuoCount(name);
	}

	public List<CustomerModel> getCustomerShouHuo(int rows, int page,
			String name) {
		// TODO Auto-generated method stub
		return sm_dao.getCustomerShouHuo(rows, page, name);
	}

	public int getCustomerShouHuoCount(String name) {
		// TODO Auto-generated method stub
		return sm_dao.getCustomerShouHuoCount(name);
	}

	public int updateprinttype(String[] pid) {
		// TODO Auto-generated method stub
		
		return sm_dao.updateprinttype(pid);
	}

	public List<ShippingOrder> editgetShipManualInfo(int rows, Integer page,
			String start_time, String end_time, String send_station,
			String end_address, String num, String receipt, String custom_name,
			String order_state, String pay_type, String send_type,
			String goods_name, String userid, String weitoudanhao) {
		// TODO Auto-generated method stub
		 List<ShippingOrder> list=sm_dao.editgetShipManualInfo(rows, page,   start_time, end_time, send_station, end_address, num, receipt, custom_name, order_state, pay_type , send_type, goods_name,userid,weitoudanhao);
		return list;

	}

	public int editgetShipManual(String start_time, String end_time,
			String send_station, String end_address, String num,
			String receipt, String custom_name, String order_state,
			String pay_type, String send_type, String goods_name, String userid,
			String weitoudanhao) {
		// TODO Auto-generated method stub
		int count=sm_dao.editgetShipManual(start_time, end_time, send_station, end_address, num, receipt, custom_name, order_state, pay_type , send_type, goods_name ,userid,weitoudanhao);
		return count;

	}

			
	
}
