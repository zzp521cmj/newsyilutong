package com.jy.service;

import com.jy.model.PersonInfo;


public interface PersonInfoService {
	//上传头像
	int inserpersonhead(String id, String filesname);
	
	PersonInfo getimages(String id);

	void deleteimages(String id);
}
