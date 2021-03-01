package com.mycompany.proj.common.interceptor;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.WebContentInterceptor;

public class AuthInterceptor extends WebContentInterceptor {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws ServletException {
        try {
        	logger.info("AuthInterceptor::preHandle:"+request.getRequestURI());
        	String uri = request.getRequestURI();
        	boolean ttt = uri.equals("/");
        	logger.info(String.valueOf(ttt));
        	if(uri.equals("/")||uri.equals("/login")||uri.equals("/loginProcess")) {
        		logger.info("AuthInterceptor::preHandle:1");
        	} else {
        		logger.info("AuthInterceptor::preHandle:2");
        		String isLogin = (String) request.getSession().getAttribute("isLogin");
	        	logger.info("AuthInterceptor::preHandle:isLogin:"+String.valueOf(isLogin));
        		if(isLogin==null) {
        			request.getRequestDispatcher(request.getContextPath() + "/login").forward(request, response);
        			return false;
        		}
        	}
        } catch (Exception e) {
        	e.printStackTrace();
        	return false;
        }
		return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
    	try {
        	logger.info("AuthInterceptor::postHandle:"+request.getRequestURI());
        } catch (Exception e) {
        	e.getStackTrace();
        }
    }
    
}