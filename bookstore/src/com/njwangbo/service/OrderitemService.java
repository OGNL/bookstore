package com.njwangbo.service;

import java.util.List;

import com.njwangbo.po.Order;
import com.njwangbo.po.Orderitem;

public interface OrderitemService
{
    public List<Orderitem> showByOid(String oid);
    
    public List<Orderitem> showByBid(String bid);
    
    public void addbatch(Order o);
}
