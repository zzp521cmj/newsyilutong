package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.jy.dao.TransferBoxDao;
import com.jy.model.TransferBox;
import com.jy.service.TransferBoxService;

@Component
@Transactional
public class TransferBoxServiceImpl implements TransferBoxService {
	@Resource
	private TransferBoxDao transferBoxDao;

	public List<TransferBox> getTransferBox(Integer page, Integer rows,String transferBox_name,String transferBox_outervolume) {
		// TODO Auto-generated method stub
		return transferBoxDao.getTransferBox(page, rows, transferBox_name, transferBox_outervolume);
	}

	public int getTransferBoxCount(String transferBox_name,String transferBox_outervolume) {
		// TODO Auto-generated method stub
		return transferBoxDao.getTransferBoxCount(transferBox_name, transferBox_outervolume);
	}

	public int addBox(TransferBox box) {
		// TODO Auto-generated method stub
		return transferBoxDao.addBox(box);
	}

	public TransferBox getTransferInfo(String tran_id) {
		// TODO Auto-generated method stub
		return transferBoxDao.getTransferBoxinfo(tran_id);
	}

	public int editTransfer(TransferBox box) {
		// TODO Auto-generated method stub
		return transferBoxDao.editTransfer(box);
	}

	public int deleteBoxs(String[] del) {
		// TODO Auto-generated method stub
		return transferBoxDao.deleteBoxs(del);
	}

}
