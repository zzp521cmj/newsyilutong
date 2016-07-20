package com.jy.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.Detailed;
import com.jy.model.ShippingOrder;

public interface DetailedService {
	//全部查询
		List<Detailed> getDetailed(int rows,int page,String shiping_order_num,  String change_fee,String land_total);
		//分页查询
		 int getDetailedInfo( String change_fee,String shiping_order_num,String land_total);
		 int deleteDetailed(@Param("array") String[] del);//删除
		 int addDetailed(Detailed d);//添加
		 List<ShippingOrder> getShippingOrder(int rows,int page, String shiping_order_num);
		 int getShippingOrderInfo(String shiping_order_num);
		 ShippingOrder getUpdateShipOrder(String id);
		 //修改状态
		 int updateShipOrder(String id);
		 int updateStateship(@Param("array") String[] che);
			//修改查询
			public ShippingOrder getUpdateDetailed(String id);
			//用户修改
			 int updateDetailed(Detailed d);
			 
			 int searchOrder(String ids );
			  
			  
}
