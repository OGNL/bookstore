package com.njwangbo.service;

import java.util.List;

import com.njwangbo.po.Book;
import com.njwangbo.po.Cartitem;
import com.njwangbo.po.User;
import com.njwangbo.vo.Cartitemvo;

public interface CartitemService
{
    public void addCartitem(Cartitem car);
    
    public List<Cartitem> showall(User user);
    
    public Cartitem showonebook(Cartitem car);
    
    public void deleteCartitem(Cartitem car); 
    
    public void updateCartitem(Cartitem car);
    
    public void updatebatch(Cartitemvo carvo);

    public void deleteBatch(Cartitemvo vo);
    
    public List<Cartitem> showByBid(String bid);
    
    public List<Cartitem> showall2(User user);
    
    public void deleteBatchByNum(Cartitemvo vo);
}
