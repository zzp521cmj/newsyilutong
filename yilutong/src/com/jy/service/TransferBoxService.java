package com.jy.service;

import java.util.List;

import com.jy.model.TransferBox;

public interface TransferBoxService {
	public List<TransferBox> getTransferBox(Integer page,Integer rows,String transferBox_name,String transferBox_outervolume);
	public int getTransferBoxCount(String transferBox_name,String transferBox_outervolume);
	public int addBox(TransferBox box);
	public TransferBox getTransferInfo(String tran_id);
	public int editTransfer(TransferBox box);
	public int deleteBoxs(String [] del);
}
