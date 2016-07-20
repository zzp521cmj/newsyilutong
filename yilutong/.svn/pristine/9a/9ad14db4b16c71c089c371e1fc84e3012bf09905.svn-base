package com.jy.common;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AppBaseFilter implements Filter{

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;  
        HttpServletResponse response = (HttpServletResponse) res;  
        HttpSession session = request.getSession();  
        // 如果session不为空，则可以浏览其他页面  
        String url = request.getRequestURI();
       String qs=request.getQueryString();


        
        //这里判断目录，后缀名，当然也可以写在web.xml中，用url-pattern进行拦截映射  
        if ((!url.equals("/yilutong/"))
        		&&!url.equals("/yilutong/login.do")&&!url.equals("/yilutong/login.do?method=login")&&!url.equals("/yilutong/showShippingOrder.jsp")
        		&&(!url.equals("/yilutong/login.jsp"))&&(!url.equals("/yilutong/tms.do"))&&(!url.equals("/yilutong/app.do")&&(!url.equals("/yilutong/dataHandling.do")))) {
            if (session.getAttribute(SessionInfo.SessionName) == null) {
                session.invalidate();
                RequestDispatcher requestDp = request
						.getRequestDispatcher("error/sessionOutTime.jsp");
				requestDp.forward(request, response);
            } else {
            	
                chain.doFilter(request, response);
            }
        } else {  
        	if(url.equals("/yilutong/login.do")&&qs==null){
        		if(session.getAttribute(SessionInfo.SessionName) != null){
        			RequestDispatcher requestDp = request
    						.getRequestDispatcher("/WEB-INF/views/layout/layout.jsp");
    				requestDp.forward(request, response);
        		}else{
        			chain.doFilter(request, response);
        		}
        	}else{
        		chain.doFilter(request, response);  
            }
        }  
	}

	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
