package com.njwangbo.service;

import java.util.List;

import com.njwangbo.po.Book;

public interface BookService
{
    
    public void add(Book book);
    
    public void update(Book book);
    
    public void delete(String id);
    
    public Book showBookById(String bid);
    
    public Book showBookByName(String name);
    
    public List<Book> showSearch(String name);
    
    public List<Book> showBy(String id,String bname,String author,String press,int page);
    
    public int maxPage(String id,String bname,String author,String press);
    
    public List<Book> showBookByCid(int cid);
}
