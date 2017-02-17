package com.njwangbo.service.impl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njwangbo.mapper.OrderitemMapper;
import com.njwangbo.po.Order;
import com.njwangbo.po.Orderitem;
import com.njwangbo.service.OrderitemService;
@Service
public class OrderitemServiceImpl implements OrderitemService
{
    @Autowired
    private OrderitemMapper orderitemMapper;

    public List<Orderitem> showByOid(String oid)
    {
        List<Orderitem> list = orderitemMapper.findByOid(oid);
        return list;
    }

	public List<Orderitem> showByBid(String bid) {
		return orderitemMapper.findByBid(bid);
	}

	public void addbatch(Order o) {
		List<Orderitem> list = o.getOrderitemlist();
		for(int i=0; i<list.size(); i++){
			String oitemid = UUID.randomUUID().toString().replaceAll("-", "").toUpperCase();
			Orderitem oitem = list.get(i);
			oitem.setOrderItemId(oitemid);
			oitem.setOid(o.getOid());
			orderitemMapper.add(oitem);
		}
		
	}
}
