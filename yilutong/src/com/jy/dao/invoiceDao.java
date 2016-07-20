package com.jy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.invoice;

public interface invoiceDao {
	List<invoice> selectinvoice(Integer page,Integer rows,String receiptstartdate,String receiptendate,String shiping_order_num,String invoice_state,String whether);//查询
	int selectinvoicelist(String receiptstartdate,String receiptendate,String shiping_order_num,String invoice_state,String whether);//查询条数
	List<invoice> selectinvoices(String receiptstartdate,String receiptendate,String shiping_order_num,String invoice_state,String whether,@Param("array") String [] invoiceid);//导出
	List<invoice> outShi(String[] invoiceid);//勾选导出
}
