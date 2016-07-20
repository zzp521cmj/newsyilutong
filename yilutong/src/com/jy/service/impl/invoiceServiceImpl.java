package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.jy.dao.invoiceDao;
import com.jy.model.invoice;
import com.jy.service.invoiceService;


@Controller
public class invoiceServiceImpl implements invoiceService{
	@Resource
	private invoiceDao invoiceDao;

	public List<invoice> selectinvoice(Integer page, Integer rows,
			String receiptstartdate, String receiptendate,
			String shiping_order_num, String invoice_state, String whether) {
		// TODO Auto-generated method stub
		return invoiceDao.selectinvoice(page, rows, receiptstartdate, receiptendate, shiping_order_num, invoice_state, whether);
	}

	public int selectinvoicelist(String receiptstartdate, String receiptendate,
			String shiping_order_num, String invoice_state, String whether) {
		// TODO Auto-generated method stub
		return invoiceDao.selectinvoicelist(receiptstartdate, receiptendate, shiping_order_num, invoice_state, whether);
	}

	public List<invoice> selectinvoices(String receiptstartdate,
			String receiptendate, String shiping_order_num,
			String invoice_state, String whether,String [] invoiceid) {
		// TODO Auto-generated method stub
		return invoiceDao.selectinvoices(receiptstartdate, receiptendate, shiping_order_num, invoice_state, whether,invoiceid);
	}

	public List<invoice> outShi(String[] invoiceid) {
		// TODO Auto-generated method stub
		return invoiceDao.outShi(invoiceid);
	}



}
