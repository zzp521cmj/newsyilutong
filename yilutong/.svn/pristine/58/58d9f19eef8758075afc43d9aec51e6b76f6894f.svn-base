package com.jy.common;

import java.util.HashSet;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.jy.model.User;

public class MySessionListener implements HttpSessionListener{

	 public void sessionCreated(HttpSessionEvent event) {
     
  }

  public void sessionDestroyed(HttpSessionEvent event) {
         HttpSession session = event.getSession();
         User user=(User)session.getAttribute(SessionInfo.SessionName);
         ServletContext application = session.getServletContext();
         List UserList = (List) application.getAttribute("onlineUserList");
         if(user!=null){
        	 if(UserList.contains(user.getUsername())){
        		 UserList.remove(user.getUsername());
        	 }
         }
  }
}
