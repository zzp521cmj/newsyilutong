package com.jy.service;

import java.util.List;

import com.jy.model.User;

public interface LoginUserService {
	// 判断用户是否存在
	public boolean checkUser(User u);

	// 注册用户信息
	// public int addUser(User user);
	// 获取用户详细信息
	public User getUserInfo(User user);

	// 获取用户权限
	public Integer[] getUserRote(String id);

	// 查询密码是否正确
	public int checkPas(String id, String password);

	// 更新密码
	public int updatePas(int id, String password);

	// 更新登录时间
	public void updateUserTime(String id);

	public List<String> getRoles(String id);

	public String getCarCount(String id);

	/**
	 * 更新app标识
	 * 
	 * @param id
	 * @param string
	 * @return
	 */
	public boolean updatechannelId(String cannelId, String device_type,
			String id);

	// app 查询用户所有信息
	User appGetUserInfo(User user);

	// app登陆
	boolean appCheckUser(User u);
}
