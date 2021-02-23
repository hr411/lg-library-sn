package com.mycompany.proj.login.dao;

import java.util.List;

import com.mycompany.proj.login.model.LoginVO;

public interface LoginDao {
	public String selectSampleData() throws Exception;
	public LoginVO selectLoginInfo(LoginVO loginVO) throws Exception;
}
