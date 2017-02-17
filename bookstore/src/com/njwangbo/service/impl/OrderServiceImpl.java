package com.njwangbo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njwangbo.mapper.OrderMapper;
import com.njwangbo.po.Order;
import com.njwangbo.service.OrderService;
@Service
public class OrderServiceImpl implements OrderService
{
    @Autowired
    private OrderMapper orderMapper;
    

    
    public void update(Order o)
    {
        orderMapper.update(o);
    }

    public void add(Order o)
    {
        orderMapper.add(o);
    }

    public List<Order> showByUid(int uid, int pageNum)
    {
        List<Order> list = orderMapper.findByUid(uid, pageNum);
        return list;
    }

	public List<Order> showBySome(int status, int pageNum) {
	
		return orderMapper.findBySome(status, pageNum);
	}

	public int showgetMaxNum(Order o) {
		
		return orderMapper.showgetCount(o);
	}

	public int getcountByUid(int uid) {
		
		return orderMapper.getcountByUid(uid);
	}

	public Order showByoid(String oid) {
		return orderMapper.findByoid(oid);
	}
    
}
