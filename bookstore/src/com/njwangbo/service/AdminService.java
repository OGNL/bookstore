package com.njwangbo.service;

import com.njwangbo.po.Admin;

public interface AdminService {
	
	public Admin showAdminByNameAndPwd(String name, String pwd);
}
