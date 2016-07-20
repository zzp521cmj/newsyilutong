package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import com.jy.common.UUIDUtils;
import com.jy.dao.DeliveryDao;
import com.jy.model.CreateAgreement;
import com.jy.model.Delivery;
import com.jy.model.OrderCustom;
import com.jy.model.ShippingOrder;
import com.jy.model.Sign_order;
import com.jy.service.DeliveryInfoService;


@Service("DeliveryInfoService")

public class DeliveryInfoServiceImpl  implements DeliveryInfoService{
	@Resource
	private DeliveryDao d_dao;
	//查询分页

	public List<ShippingOrder> getDeliveryInfo(Integer rows, Integer page,String send_type,String num,String start_time,String end_time,String []checkarray,String types) {
		 List<ShippingOrder> list=d_dao.getDeliveryInfo(rows, page, send_type, num, start_time, end_time,checkarray,types);
		 return list;
	}
	public List<Delivery> outgetDeliveryInfo(String endaddress,String num,String carnum,String receipt,String pay_type,String send_type,String custom_name,String order_state,String customid) {
		// TODO Auto-generated method stub
		return d_dao.outgetDeliveryInfo(endaddress, num, carnum, receipt, pay_type, send_type, custom_name, order_state,customid);
	}
	
	public int getDelivery(String send_type,String num,String start_time,String end_time,String types) {
		int count=d_dao.getDelivery(send_type, num, start_time, end_time,types);
		return count;
	}
	
	/**
	 * 结算记录
	 */
		public  List<ShippingOrder> getDeliverySetle(Integer rows,Integer page,String num,String start_time,String end_time,String table_name,String table_type,String []checkarray,String free,String things) {
			 List<ShippingOrder> list=d_dao.getDeliverySetle(rows, page, num, start_time, end_time, table_name, table_type,checkarray,free,things);
					 return list;
		}
		public int getSetle(String num,String start_time,String end_time,String table_name,String table_type,String things,String free) {
			int count=d_dao.getSetle(num, start_time, end_time, table_name, table_type,things,free);
			return count;
		}
		//签收记录导出
		public List<Delivery> outgetSign(String num,String carnum,String receipt,String signperson,String goods_name,String goods_num,String pay_type,String send_time,String end_date,String customid) {
			 List<Delivery> list=d_dao.outgetSign( num, carnum, receipt, signperson, goods_name, goods_num, pay_type, send_time, end_date,customid);
				return list;
		}
	public int deleteDelivery(String[] del) {
		int i=d_dao.deleteDelivery(del);
		return i;
	}
	
	public int saveDelivery(Delivery d) {
		int i=d_dao.saveDelivery(d);
		return i;
	}

	public Delivery getUpdateDelivery(String id) {
		Delivery sp=d_dao.getUpdateDelivery(id);
		return sp;
	}

	public int updateDelivery(Delivery d) {
		int i=d_dao.updateDelivery(d);
		return i;
	}

	public List<Delivery> getPlateNumberLength(String number) {
		List<Delivery> list=d_dao.getPlateNumberLength(number);
		return list;
	}

	public List<Delivery> getDeliveryAll(String name,
			String phone_number, String type,String start_date,String end_date) {
		List<Delivery> list=d_dao.getDeliveryAll(name, phone_number, type,start_date,end_date);
		return list;
	}
		//重复订单号
	public Delivery getNumber(String number) {
		Delivery der=d_dao.getNumber(number);
		return der;
	}

	public List<Delivery> getSignDelivery(int rows, int page,
			String name, String phone_number, String type, String start_date,
			String end_date,String shipping_order_state) {
		List<Delivery> list=d_dao.getSignDelivery(rows, page, name,  phone_number,type,start_date,end_date,shipping_order_state);
		return list;
	}

	public int getSignDeliverycount(String name, String phone_number, String type,
			String start_date, String end_date,String shipping_order_state) {
		int count=d_dao.getSignDeliverycount(name, phone_number, type,start_date,end_date,shipping_order_state);
		return count;
	}

	public List<Delivery> getSignDelivery1(int rows, int page,
			String name, String phone_number, String type, String start_date,
			String end_date,String did,String shipping_order_state) {
		List<Delivery> list=d_dao.getSignDelivery1(rows, page, name,  phone_number,type,start_date,end_date,did,shipping_order_state);
		return list;
	}

	public int getSignDeliverycount1(String name, String phone_number, String type,
			String start_date, String end_date,String did,String shipping_order_state) {
		int count=d_dao.getSignDeliverycount1(name, phone_number, type,start_date,end_date,did,shipping_order_state);
		return count;
	}
	
	public int saveSignDelivery(Sign_order sign_order) {
		int count=0;
		try {
			String sid=UUIDUtils.getUUID();
			count=d_dao.saveSignDelivery(sign_order);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public int updatestate(String shiping_order_id) {
		int count=0;
		try {
			count=d_dao.updatestate(shiping_order_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public int getDeliveryCA(String id, String type, String start_date,
			String end_date,String send_station,String end_address,String car_number) {
	int i=d_dao.getDeliveryCA(id, type, start_date, end_date,send_station,end_address,car_number);
		return i;
	}

	public List<Delivery> getDeliveryInfoCA(int rows, int page,
			String id, String type, String start_date, String end_date,String send_station,String end_address,String car_number) {
		List<Delivery> list=d_dao.getDeliveryInfoCA(rows, page, id, type, start_date, end_date,send_station,end_address,car_number);
		return list;
	}

	public Delivery getUpdateSignDelivery(String id) {
		Delivery sp=d_dao.getUpdateSignDelivery(id);
		return sp;
	}
	/**
	 * 制作协议订单的查询
	 */
	public List<Delivery> getDeliveryCAM(int rows, int page, String[] pid) {
		 List<Delivery>list=d_dao.getDeliveryCAM(rows,page,pid);
		return list;
	}
	/**
	 * 删除与需求相关的低订单需求
	 */
	public int deleteShipToDemand(String []del) {
		int i=d_dao.deleteShipToDemand(del);
		return i;
	}
	/**
	 * 导入
	 * @param tlist
	 * @return
	 */
	public int saveimp(List<Delivery> tlist) {
		// TODO Auto-generated method stub
		
		int i=d_dao.saveDeliverys(tlist);
		return i;
	}
	/**
	 * 图片路径上传
	 */
	public int saveSignImages(String uuid, String order_id, String paths) {
		// TODO Auto-generated method stub
		int i=d_dao.saveSignImages(uuid,order_id,paths);
		return i;
	}
	/**
	 * 获取司机的订单
	 */
	public List<Delivery> getCarDelivery(String car_id) {
		// TODO Auto-generated method stub
		List<Delivery> der=d_dao.getCarDelivery(car_id);
		return der;
	}

	public List<Delivery> getUpdateDeliveryArray(String[] checkarray) {
		// TODO Auto-generated method stub
		List<Delivery> sp=d_dao.getUpdateDeliveryArray(checkarray);
		return sp;
	}
	/**
	 * 查询扫描信息
	 */
	public Delivery getAppDelivery(String string) {
		// TODO Auto-generated method stub
		Delivery sp=d_dao.getAppDelivery(string);
		return sp;
	}

	public int getAorder(String number) {
		int i=d_dao.getAorder(number);
		return i;
	}

	
/**
 * 查询中转
 */
	public List<Delivery> gettransferGoodsInfo(int rows,int page,String  endaddress,String num,String carnum,String receipt,String changecompany,String pay_type,String goods_name,String goods_num,String order_state,String send_time,String end_date,String customid) {
		 List<Delivery> list=d_dao.gettransferGoodsInfo(rows, page,    endaddress, num, carnum, receipt, changecompany, pay_type, goods_name, goods_num, order_state, send_time, end_date, customid);
			return list;
	}

	
	public int gettransferGoods(String  endaddress,String num,String carnum,String receipt,String changecompany,String pay_type,String goods_name,String goods_num,String order_state,String send_time,String end_date,String customid) {
		int count=d_dao.gettransferGoods( endaddress, num, carnum, receipt, changecompany, pay_type, goods_name, goods_num, order_state, send_time, end_date, customid);
		return count;
	}
	public List<Delivery> outgettransferGoods(String  endaddress,String num,String carnum,String receipt,String changecompany,String pay_type,String goods_name,String goods_num,String order_state,String send_time,String end_date,String customid) {
		 List<Delivery> list=d_dao.outgettransferGoods( endaddress, num, carnum, receipt, changecompany, pay_type, goods_name, goods_num, order_state, send_time, end_date, customid);
			return list;
	}
	

/**
 * 查询送货
 */
	public List<CreateAgreement> deliverGoodsInfo(Integer rows,Integer page,String num,String start_time,String end_time, String [] ids) {
		 List<CreateAgreement> list=d_dao.deliverGoodsInfo(rows, page, num, start_time, end_time,ids);
				 return list;
	}

	
	public int deliverGoods(String num,String start_time,String end_time) {
		int count=d_dao.deliverGoods(num, start_time, end_time);
				return count;
	}

	public List<Delivery> outdeliverGoodsInfo(String send_time,String send_timet,String num ,String carnum ,String signperson ,String goods_name,String goods_num ,String car_name,String receipt_address,String order_state,String customid) {
		// TODO Auto-generated method stub
		return d_dao.outdeliverGoodsInfo(send_time, send_timet, num , carnum , signperson , goods_name, goods_num , car_name, receipt_address, order_state, customid);
	}

	/**
	 * 提货记录表车牌号查询
	 * @param car_id
	 * @return
	 */
	public  List<Delivery>selectCarNumber(String  custom_id){
		List<Delivery>list=d_dao.selectCarNumber(custom_id);
		return list;
	}
	 /**
	  * 中转公司名查询
	  * @param company
	  * @return
	  */
	public	 List<Delivery>selectCompany(String  company){
	 		 
	 		List<Delivery>list=d_dao.selectCompany(company);
			return list;
	 	 }
	 	
	 		/**
	 	 	 * 送货记录表车牌号查询
	 	 	 * @param car_id
	 	 	 * @return
	 	 	 */
	public	 List<Delivery>selectSendCar(String  car_id){
	 	 			List<Delivery>list=d_dao.selectSendCar(car_id);
	 	 			return list;
	 	 		 }
	 	 		
	 		
	 		/**
	 		 * 转运（中转）记录表车牌号查询
	 		 * @param car_id
	 		 * @return
	 		 */
	public	 List<Delivery>selectChangeCar(String  car_id){
	 				 
	 				List<Delivery>list=d_dao.selectChangeCar(car_id);
	 				return list;
	 			 }
	 /**
	  * 总库从表车牌号查询
	  * @param car_id
	  * @return
	  */
	public List<Delivery>selectCar(String  car_id) {
	
		List<Delivery>list=d_dao.selectCar(car_id);
		return list;
}
	/**
	  * 总库存表客户名称查询
	  * @param custom_name
	  * @return
	  */
	public List<OrderCustom>selectCustom(String  custom_name) {
		List<OrderCustom>list=d_dao.selectCustom(custom_name);
		return list;
	}
	
}