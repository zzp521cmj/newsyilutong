package com.jy.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.Customer;
import com.jy.model.Receipt;
import com.jy.model.ShippingOrder;
import com.jy.model.invoice;

public interface ReceiptService {
	List<invoice> selectReceipt(Integer page,Integer rows,String receiptstartdate,String receiptendate,String shiping_order_num,String invoice_state,String whether,String pid);
	int selectReceiptlist(String receiptstartdate,String receiptendate,String shiping_order_num,String invoice_state,String whether,String pid);
	int disposereceipt(Receipt receipt);
	int selectreceipt(String  id);
	List<Customer> getRemarks(Integer page,Integer rows,String remark_name,String order_id,String kuhu_date,String kuhu_dates);
	int updatereceipt(String [] pid);//取消开票
	int getCount(String remark_name,String order_id,String kuhu_date,String kuhu_dates);
	int updatetype(String pid);//开票开票
	int offupdatetype(String[]  pid);//取消开票
	
	List<Customer> getRemarkdc(String remark_name,String order_id,String kuhu_date,String kuhu_dates,String [] pid);//客户导出
	List<invoice> selectinvoices(String receiptstartdate,String receiptendate,String shiping_order_num,String invoice_state,String whether,String pids,String [] pid);//开票信息导出
}
