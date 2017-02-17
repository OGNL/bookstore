package com.njwangbo.mapper;

import java.util.List;

import com.njwangbo.po.Orderitem;

public interface OrderitemMapper
{
    public List<Orderitem> findByOid(String oid);
    
    public List<Orderitem> findByBid(String bid);
    
    public void add(Orderitem orderitem);
}
