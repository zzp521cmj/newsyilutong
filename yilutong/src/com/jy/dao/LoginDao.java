package com.jy.dao;

import java.util.List;

import com.jy.model.User;

public interface LoginDao {
	int checkUser(User u);

	// 注册用户
	int addUser(User user);

	// 查询用户所有信息
	User getUserInfo(User user);

	// 获取用户权限
	Integer[] getUserRote(String id);

	// 查询用户密码是否正确
	int checkPas(String id, String password);

	int updatePas(int id, String password);

	// 更新登录时间
	void updateUserTime(String id);

	List<String> getRoles(String id);

	String getCarCount(String id);

	/**
	 * 更新app标识
	 * 
	 * @param id
	 * @param id2
	 * @return
	 */
	int updatechannelId(String cannelId, String device_type, String id);
	
	// 查询用户所有信息
	User appGetUserInfo(User user);
	
	//app登陆
	int appCheckUser(User u);
	

}
