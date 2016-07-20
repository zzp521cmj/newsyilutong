package com.jy.webservice;

import javax.jws.WebMethod;
import javax.jws.WebService;

@WebService
public interface CarPointService {
	@WebMethod
	public String getpoint();
}
