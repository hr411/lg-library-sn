package com.mycompany.proj.login.dao;

import com.mycompany.proj.login.model.LoginVO;

public interface LoginDao {
	public LoginVO selectLoginInfo(LoginVO loginVO) throws Exception;
}
