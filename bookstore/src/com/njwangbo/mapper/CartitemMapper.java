package com.njwangbo.mapper;

import java.util.List;

import com.njwangbo.po.Book;
import com.njwangbo.po.Cartitem;
import com.njwangbo.po.User;
import com.njwangbo.vo.Cartitemvo;

public interface CartitemMapper
{
    public void addCartitem(Cartitem car);
    
    public List<Cartitem> findall(User user);
    
    public void deleteBatch(Cartitemvo vo);
    
    public Cartitem findonebook(Cartitem car);
    
    public void deleteCartitem(Cartitem car); 
    
    public void updateCartitem(Cartitem car);
    
    public List<Cartitem> findByBid(String bid);
    
    public List<Cartitem> findall2(User user);
    
    public void deleteBatchByNum(Cartitemvo vo);
}
