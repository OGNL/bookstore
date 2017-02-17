package com.njwangbo.mapper;

import java.util.List;

import com.njwangbo.po.Book;

public interface BookMapper
{
    public List<Book> findBy(String cid,String bname,String author,String press,int page);
    
    public void add(Book book);
    
    public void update(Book book);
    
    public void delete(String id);
    
    public Book findBookById(String id);
    
    public Book findByName(String name);
    
    public List<Book> findSearch(String name);
    
    public int maxPage(String cid,String bname,String author,String press);
    
    public List<Book> findBookByCid(int cid);
    
    
}
