package com.mycompany.proj.login.dao.impl;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.proj.login.dao.LoginDao;
import com.mycompany.proj.login.model.LoginVO;

@Repository("loginDao")
public class LoginDaoImpl implements LoginDao {

	@Autowired
	protected SqlSessionTemplate sqlSession;
	
	@Override
	public LoginVO selectLoginInfo(LoginVO loginVO) throws Exception {
		return sqlSession.selectOne("LoginMapper.selectUserList", loginVO);
	}

}
