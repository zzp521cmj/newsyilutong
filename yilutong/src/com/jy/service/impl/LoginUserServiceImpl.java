package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.jy.common.MD5;
import com.jy.dao.LoginDao;
import com.jy.model.User;
import com.jy.service.LoginUserService;

@Component
public class LoginUserServiceImpl implements LoginUserService {
	@Resource
	private LoginDao loginDao;

	public boolean checkUser(User u) {
		String userPassWord = u.getPassword();
		MD5 md5 = new MD5();
		u.setPassword(md5.getMD5ofStr(userPassWord));
		int userflag = loginDao.checkUser(u);

		if (userflag > 0) {
			return true;
		} else {
			return false;
		}
	}
	//查询所有用户信息
	public User getUserInfo(User user){
		User userinfo=loginDao.getUserInfo(user);
		return userinfo;
	}
	//查询用户权限
	public Integer[] getUserRote(String id){
		Integer[] roteId=loginDao.getUserRote(id);
		
			return roteId;
		
	}
	//查询密码是否正确
	public int checkPas(String id,String password){
		int roteId=loginDao.checkPas(id,password);
		return roteId;
	}
	
	//修改密码
	public int updatePas(int id,String password){
		int roteId=loginDao.updatePas(id,password);
		return roteId;
	}
	
	/*public int addUser(User user) {
		// MD5加密密码
		String userPassWord = user.getUser_password();
		MD5 md5 = new MD5();
		user.setUser_password(md5.getMD5ofStr(userPassWord));
		int flag = loginDao.addUser(user);
		return flag;
	}*/
	//更新登录时间
	public void updateUserTime(String id){
		loginDao.updateUserTime(id);
	}
	public List<String> getRoles(String id) {
		List<String> roles = loginDao.getRoles(id);
		return roles;
	}
	public String getCarCount(String id) {
		// TODO Auto-generated method stub
		String carflag = loginDao.getCarCount(id);
		return carflag;
	}
	/**
	 * 更新app标识
	 */
	public boolean updatechannelId(String cannelId,String device_type,String id) {
		// TODO Auto-generated method stub
		
		int flag=loginDao.updatechannelId(cannelId,device_type,id);
		if(flag>0)
			return true;
		else
		return false;
	}
	public User appGetUserInfo(User user) {
		// TODO Auto-generated method stub
		return loginDao.appGetUserInfo(user);
	}
	public boolean appCheckUser(User u) {
		String userPassWord = u.getPassword();
		MD5 md5 = new MD5();
		u.setPassword(md5.getMD5ofStr(userPassWord));
		boolean b = false;
		int i=loginDao.appCheckUser(u);
		
		if(i>0){
			b=true;
		}
		return b;
	}

}
