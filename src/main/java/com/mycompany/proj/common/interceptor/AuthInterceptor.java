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
        	String uri = request.getRequestURI();
        	if(uri.equals("/")||uri.equals("/login")||uri.equals("/loginProcess")) {
        	} else {
          		String isLogin = (String) request.getSession().getAttribute("isLogin");
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
        } catch (Exception e) {
        	e.getStackTrace();
        }
    }
    
}