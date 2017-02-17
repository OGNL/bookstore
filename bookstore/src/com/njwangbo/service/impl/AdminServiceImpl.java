package com.njwangbo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njwangbo.mapper.AdminMapper;
import com.njwangbo.po.Admin;
import com.njwangbo.service.AdminService;


@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminMapper adminMapper;
	public Admin showAdminByNameAndPwd(String name, String pwd) {
		return adminMapper.findAdminByNameAndPwd(name, pwd);
	}

}
