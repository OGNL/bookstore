package com.njwangbo.mapper;

import java.util.List;

import com.njwangbo.po.User;

public interface UserMapper
{
    public int save(User user);
    
    public User findStudentbyname(String name);
    
    public void updateUser(User user);
    
    public User findByUid(int uid);
    
}
