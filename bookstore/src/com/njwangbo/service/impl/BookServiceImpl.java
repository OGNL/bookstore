package com.njwangbo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njwangbo.mapper.BookMapper;
import com.njwangbo.po.Book;
import com.njwangbo.service.BookService;
@Service
public class BookServiceImpl implements BookService
{
    @Autowired
    private BookMapper bookMapper;
    
    public void add(Book book)
    {
        bookMapper.add(book);
    }

    public void delete(String id)
    {
        bookMapper.delete(id);
    }

    public Book showBookById(String id)
    {
        return bookMapper.findBookById(id);
    }


    public void update(Book book)
    {
        bookMapper.update(book);
    }

    public Book showBookByName(String name)
    {
        return bookMapper.findByName(name);
    }
    
    public int maxPage(String id, String bname, String author, String press)
    {
        return bookMapper.maxPage(id, bname, author, press);
    }
    
    public List<Book> showSearch(String name)
    {
        return bookMapper.findSearch(name);
    }

    public List<Book> showBy(String id, String bname, String author, String press, int page)
    {
        return bookMapper.findBy(id,bname, author, press,page);
    }

	public List<Book> showBookByCid(int cid) {
		return bookMapper.findBookByCid(cid);
	}

}
