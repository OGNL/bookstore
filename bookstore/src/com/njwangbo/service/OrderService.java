package com.njwangbo.service;

import java.util.List;

import com.njwangbo.po.Order;

public interface OrderService
{
    public void update(Order o);
    
    public List<Order> showBySome(int status,int pageNum);
    
    public void add(Order o);
    
    public List<Order> showByUid(int uid, int pageNum);
    
    public int showgetMaxNum(Order o);
    
    public int getcountByUid(int uid);
    
    public Order showByoid(String oid);
}
