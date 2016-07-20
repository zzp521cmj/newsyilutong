package com.jy.webservice.impl;

import javax.jws.WebService;

import org.springframework.stereotype.Component;

import com.jy.webservice.CarPointService;
@Component  
@WebService(serviceName="CarPointService",  
        endpointInterface = "com.jy.webservice.CarPointService")
public class CarPointServiceImpl implements CarPointService {

	public String getpoint() {
		// TODO Auto-generated method stub
		System.out.println("走啦！！！");
		return "hello!";
	}

}
