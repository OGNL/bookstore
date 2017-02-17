package com.njwangbo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njwangbo.mapper.UserMapper;
import com.njwangbo.po.User;
import com.njwangbo.service.UserService;

@Service
public class UserServiceImpl implements UserService
{
    @Autowired
    private UserMapper um;
    
    public boolean addUser(User user)
    {
        int num = um.save(user);
        if(num==0){
            return false;
        }else
            return true;
    }
    
    public User showByname(String name){
        
        return um.findStudentbyname(name);
        
    }

	public void updateUser(User user) {
			um.updateUser(user);
	}

	public User showByUid(int uid) {
		return um.findByUid(uid);
	}
    
}
