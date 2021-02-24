package com.mycompany.proj.login.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.proj.login.dao.LoginDao;
import com.mycompany.proj.login.model.LoginVO;
import com.mycompany.proj.login.service.LoginService;

@Service("LoginService")
public class LoginServiceImpl implements LoginService {
	@Autowired
	protected LoginDao loginDao;

	@Override
	public LoginVO selectLoginInfo(LoginVO loginVO) throws Exception {
		return loginDao.selectLoginInfo(loginVO);
	}

}