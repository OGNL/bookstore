package com.njwangbo.mapper;

import com.njwangbo.po.Admin;

public interface AdminMapper {
	
	public Admin findAdminByNameAndPwd(String name, String pwd);

}
