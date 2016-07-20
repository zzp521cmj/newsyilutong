package com.jy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.TransferBox;

public interface TransferBoxDao {
	List<TransferBox> getTransferBox(Integer page, Integer rows,String transferBox_name,String transferBox_outervolume);//所有箱
	int getTransferBoxCount(String transferBox_name,String transferBox_outervolume);//箱子数量
	int addBox(TransferBox box);//新增箱
	TransferBox getTransferBoxinfo(String tran_id);
	int editTransfer(TransferBox box);
	int deleteBoxs(@Param("array") String [] del);
}
