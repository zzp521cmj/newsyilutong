package com.jy.service;

import java.util.List;

import com.jy.model.invoice;

public interface invoiceService {
	List<invoice> selectinvoice(Integer page,Integer rows,String receiptstartdate,String receiptendate,String shiping_order_num,String invoice_state,String whether);//查询
	int selectinvoicelist(String receiptstartdate,String receiptendate,String shiping_order_num,String invoice_state,String whether);//查询条数
	List<invoice> selectinvoices(String receiptstartdate,String receiptendate,String shiping_order_num,String invoice_state,String whether,String [] invoiceid);//导出
	 List<invoice> outShi(String[] invoiceid);//勾选导出
}
