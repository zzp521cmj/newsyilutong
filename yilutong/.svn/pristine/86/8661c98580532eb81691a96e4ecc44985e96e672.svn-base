package com.jy.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.jy.dao.ReceiptDao;
import com.jy.model.Customer;
import com.jy.model.Receipt;
import com.jy.model.ShippingOrder;
import com.jy.model.invoice;
import com.jy.service.ReceiptService;
@Controller
public class ReceiptServiceImpl implements ReceiptService{
	@Resource
	private ReceiptDao rd;
	public List<invoice> selectReceipt(Integer page,Integer rows,String receiptstartdate,String receiptendate,String shiping_order_num,String invoice_state,String whether,String pid) {
		// TODO Auto-generated method stub
		return rd.selectReceipt(page, rows, receiptstartdate, receiptendate, shiping_order_num, invoice_state, whether,pid);
	}

	public int selectReceiptlist(String receiptstartdate,String receiptendate,String shiping_order_num,String invoice_state,String whether,String pid) {
		// TODO Auto-generated method stub
		return rd.selectReceiptlist(receiptstartdate, receiptendate, shiping_order_num, invoice_state, whether,pid);
	}

	public int disposereceipt(Receipt receipt) {
		// TODO Auto-generated method stub
		return rd.disposereceipt(receipt);
	}

	public int selectreceipt(String  id) {
		// TODO Auto-generated method stub
		return rd.selectreceipt(id);
	}

	public List<Customer> getRemarks(Integer page, Integer rows,
			String remark_name, String order_id,String kuhu_date,String kuhu_dates) {
		// TODO Auto-generated method stub
		return rd.getRemarks(page, rows, remark_name, order_id,kuhu_date,kuhu_dates);
	}

	public int getCount(String remark_name, String order_id,String kuhu_date,String kuhu_dates) {
		// TODO Auto-generated method stub
		return rd.getCount(remark_name, order_id,kuhu_date,kuhu_dates);
	}

	public int updatereceipt(String [] pid) {
		// TODO Auto-generated method stub
		return rd.updatereceipt(pid);
	}

	public int updatetype(String pid) {
		// TODO Auto-generated method stub
		return rd.updatetype(pid);
	}

	public int offupdatetype(String[] pid) {
		// TODO Auto-generated method stub
		return rd.offupdatetype(pid);
	}

	public List<Customer> getRemarkdc(String remark_name, String order_id,
			String kuhu_date, String kuhu_dates, String[] pid) {
		// TODO Auto-generated method stub
		return rd.getRemarkdc(remark_name, order_id, kuhu_date, kuhu_dates, pid);
	}

	public List<invoice> selectinvoices(String receiptstartdate,
			String receiptendate, String shiping_order_num,
			String invoice_state, String whether, String pids,String[] pid) {
		// TODO Auto-generated method stub
		return rd.selectinvoices(receiptstartdate, receiptendate, shiping_order_num, invoice_state, whether,pids, pid);
		}
}
