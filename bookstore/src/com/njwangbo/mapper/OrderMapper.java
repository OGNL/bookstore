package com.njwangbo.mapper;

import java.util.List;

import com.njwangbo.po.Order;

public interface OrderMapper
{
	//后台
    public List<Order> findBySome(int status,int pageNum);
    
    public Order findByoid(String oid);
    
    public int showgetCount(Order order);
    //前后台
    public void update(Order o);
    //前台
    public void add(Order order);
    
    public List<Order> findByUid(int uid, int pageNum);
    
    public int getcountByUid(int uid);
}
