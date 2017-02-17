package com.njwangbo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njwangbo.mapper.CartitemMapper;
import com.njwangbo.po.Book;
import com.njwangbo.po.Cartitem;
import com.njwangbo.po.User;
import com.njwangbo.service.CartitemService;
import com.njwangbo.vo.Cartitemvo;

@Service
public class CartitemServiceImpl implements CartitemService
{
    @Autowired
    private CartitemMapper carMapper; 
    
    public void addCartitem(Cartitem car)
    {

        carMapper.addCartitem(car);
    }
    
    public void deleteCartitem(Cartitem car)
    {

        carMapper.deleteCartitem(car);
    }
    
    public List<Cartitem> showall(User user)
    {
        return carMapper.findall(user);
    }
    
    public Cartitem showonebook(Cartitem car)
    {
        return carMapper.findonebook(car);
    }
    
    public void updateCartitem(Cartitem car)
    {

        carMapper.updateCartitem(car);
    }

	public void deleteBatch(Cartitemvo vo) {
			carMapper.deleteBatch(vo);
	}

	public void updatebatch(Cartitemvo carvo) {

		List<Cartitem>list=carvo.getCarlist();
		if(null!=list&&!list.isEmpty()){
			for(Cartitem car:list){
				
					carMapper.updateCartitem(car);
			}
		}
	}

	public List<Cartitem> showByBid(String bid) {
		return carMapper.findByBid(bid);
	}
    
	
	public List<Cartitem> showall2(User user)
    {
        return carMapper.findall2(user);
    }

	public void deleteBatchByNum(Cartitemvo vo) {
		carMapper.deleteBatchByNum(vo);
	}
}
