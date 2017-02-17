package com.njwangbo.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.njwangbo.po.Book;
import com.njwangbo.service.BookService;
import com.njwangbo.service.CategoryService;
import com.njwangbo.vo.CategoryVo;
@Controller
@RequestMapping("/desk")
public class DeskController
{
    @Autowired
    private CategoryService catService;
    @Autowired
    private BookService bookService;
    @RequestMapping("view")
    public ModelAndView showview(){
        ModelAndView mv=new ModelAndView();
        List<CategoryVo> lis=catService.showAll();
        mv.addObject("cats", lis);
        mv.setViewName("desk/view");
        return mv;
    }
    @RequestMapping("/showbysome")
    public ModelAndView showbysome(HttpSession session,String id,String bname,String author,String press,String page)
    {
        int maxnum=bookService.maxPage(id, bname, author, press);
        int maxPageNum = maxnum % 8 == 0 ? maxnum / 8 : maxnum / 8 + 1; 
        int pagenum = 0;
        if(page==null||page.trim().equals("")){
            pagenum=1;
        }else{
            pagenum=Integer.parseInt(page);
            System.out.println(pagenum);
            if(pagenum<1)
            {
                pagenum=1;
            }
            if(pagenum>maxPageNum)
            {
                pagenum=maxPageNum;
            }
        }
            List<Book>list=bookService.showBy(id, bname, author, press,(pagenum-1)*8);
            session.setAttribute("maxpage", maxPageNum);
            session.setAttribute("page", pagenum);
            session.setAttribute("bname", bname);
            session.setAttribute("author", author);
            session.setAttribute("press", press);
            Object sname=session.getAttribute("sname");
            session.setAttribute("sname", sname);
            session.setAttribute("id", id);
            ModelAndView mv=new ModelAndView();
            mv.addObject("books",list);
            mv.setViewName("desk/showbooks");
            return mv;
    }
    
    
    
    
    @RequestMapping("/showbook")
    public ModelAndView showbook(String id){
        ModelAndView mv = new ModelAndView();
        Book book=bookService.showBookById(id);
        mv.addObject("book",book);
        mv.setViewName("desk/showbook");
        return mv;
    }
    @RequestMapping("/showsearch")
    public ModelAndView showbyname(HttpSession session,HttpServletRequest request) throws UnsupportedEncodingException{
        String name=request.getParameter("name");
        name=new String(name.getBytes("ISO-8859-1"),"UTF-8");
        ModelAndView mv = new ModelAndView();
        List<Book>list=bookService.showSearch(name);
        session.setAttribute("sname", name);
        mv.addObject("books",list);
        mv.setViewName("/desk/showbooks");
        return mv;
    }
    @RequestMapping("/gosearch")
    public ModelAndView gosearch(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/desk/search");
        return mv;
    }
}
