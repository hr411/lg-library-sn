package com.mycompany.proj.login.controller;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.proj.login.model.LoginVO;
import com.mycompany.proj.login.service.LoginService;

@Controller
public class LoginController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource(name="LoginService")
	private LoginService loginService;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(HttpServletRequest req, LoginVO loginVO,  Model model) {		
		return "login/login";
	}
	
	@RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> loginProcess(HttpServletRequest req, LoginVO loginVO,  Model model, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String,Object>();
		try {
			LoginVO resultLoginVO = loginService.selectLoginInfo(loginVO);
			if(resultLoginVO!=null) {
				map.put("success", true);
				map.put("user_id", resultLoginVO.getUser_id());
				map.put("password", resultLoginVO.getPassword());
				map.put("user_name", resultLoginVO.getUser_name());
				session.setAttribute("isLogin", resultLoginVO.getUser_id());
			} 
			else {
				map.put("success", false);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest req, LoginVO loginVO,  Model model) {
		req.getSession().invalidate();
		return "forward:/";
	}
}
