package com.mycompany.proj.login.model;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LoginVO{
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
    private String user_id;
	private String user_name;
	private String password;
	private String created_at;
	
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	
	

}
