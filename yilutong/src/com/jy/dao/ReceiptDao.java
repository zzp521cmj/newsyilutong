package com.jy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.Customer;
import com.jy.model.Receipt;
import com.jy.model.invoice;

public interface ReceiptDao {
	//全部查询
	List<invoice> selectReceipt(Integer page,Integer rows,String receiptstartdate,String receiptendate,String shiping_order_num,String invoice_state,String whether,String pid);
	int selectReceiptlist(String receiptstartdate,String receiptendate,String shiping_order_num,String invoice_state,String whether,String pid);
	//开票处理
	int disposereceipt(Receipt receipt);
	//查询是否已做处理
	int selectreceipt(String id);
	int updatereceipt(@Param("array") String[]  pid);//取消开票
	List<Customer> getRemarks(Integer page,Integer rows,String remark_name,String order_id,String kuhu_date,String kuhu_dates);
	int getCount(String remark_name,String order_id,String kuhu_date,String kuhu_dates);
	
	int updatetype(String  pid);//开票开票
	
	int offupdatetype(@Param("array") String[]  pid);//取消开票
	
	List<Customer> getRemarkdc(String remark_name,String order_id,String kuhu_date,String kuhu_dates,@Param("array") String [] pid);
	List<invoice> selectinvoices(String receiptstartdate,String receiptendate,String shiping_order_num,String invoice_state,String whether,String pids,@Param("array")String [] pid);//导出
}
