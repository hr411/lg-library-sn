package com.mycompany.proj.login.service;

import com.mycompany.proj.login.model.LoginVO;

public interface LoginService {
	public LoginVO selectLoginInfo(LoginVO loginVO) throws Exception;
}
