package com.njwangbo.service;

import com.njwangbo.po.User;

public interface UserService
{
    public boolean addUser(User user);
    
    public User showByname(String name);
    
    public void updateUser(User user);
    
    public User showByUid(int uid);
}
