package com.njwangbo.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.njwangbo.po.Book;
import com.njwangbo.po.Cartitem;
import com.njwangbo.po.Category;
import com.njwangbo.po.Orderitem;
import com.njwangbo.service.BookService;
import com.njwangbo.service.CartitemService;
import com.njwangbo.service.CategoryService;
import com.njwangbo.service.OrderitemService;
import com.njwangbo.vo.CategoryVo;

@Controller
@RequestMapping("/book")
public class BookController
{
    @Autowired
    private BookService bookService;
    @Autowired
    private CategoryService catService;
    @Autowired
    private CartitemService carService;
    @Autowired
    private OrderitemService ordService;
    
    @RequestMapping("/show")
    public ModelAndView show(HttpServletRequest request,HttpSession session)
    {
        List<CategoryVo> list=catService.showAll();
        ModelAndView mv = new ModelAndView();
        session.setAttribute("catslists", list);
        mv.setViewName("admin/book/main");
        return mv;
    }
    
    @RequestMapping("/showbysome")
    public ModelAndView showBySome(HttpSession session,String page,String id,String bname,String author,String press)
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
            session.setAttribute("id", id);
            session.setAttribute("bname", bname);
            session.setAttribute("author", author);
            session.setAttribute("press", press);
            ModelAndView mv=new ModelAndView();
            mv.addObject("books",list);
            mv.setViewName("admin/book/showbooks"); 
            return mv;
       
    }
    
    @RequestMapping("/delete")
    public ModelAndView deleteBook(HttpServletRequest request)
    {
        String id=request.getParameter("id");
        bookService.delete(id);
        ModelAndView mv=new ModelAndView();
        mv.setViewName("admin/book/bookmanage");
        return mv;
    }
    
    @RequestMapping("/update")
    public ModelAndView update(Book b,MultipartFile wfile,MultipartFile bfile) throws IllegalStateException, IOException
    {
        File deletefile =new File("/home/soft01/images/"+b.getImage_w());
        deletefile.delete();
        deletefile=new File("/home/soft01/images/"+b.getImage_b());
        deletefile.delete();
        
        ModelAndView mv=new ModelAndView();
        String fileName=UUID.randomUUID()+wfile.getOriginalFilename().substring(wfile.getOriginalFilename().lastIndexOf("."));
        String path="/home/soft01/images/"+fileName;
        File file=new File(path);
        wfile.transferTo(file);
        String fileNamesmall=UUID.randomUUID()+bfile.getOriginalFilename().substring(bfile.getOriginalFilename().lastIndexOf("."));
        String pathsmall="/home/soft01/images/"+fileNamesmall;
        File filesamll=new File(pathsmall);
        bfile.transferTo(filesamll);
        b.setImage_w(fileName);
        b.setImage_b(fileNamesmall);
        bookService.update(b);
        mv.setViewName("admin/book/bookmanage");
        return mv;
    }
    @RequestMapping("/add")
    public ModelAndView add(Book b,MultipartFile wfile,MultipartFile bfile) throws Exception
    {
        String fileName=UUID.randomUUID()+wfile.getOriginalFilename().substring(wfile.getOriginalFilename().lastIndexOf("."));
        String path="/home/soft01/images/"+fileName;
        File file=new File(path);
        wfile.transferTo(file);
        String fileNamesmall=UUID.randomUUID()+bfile.getOriginalFilename().substring(bfile.getOriginalFilename().lastIndexOf("."));
        String pathsmall="/home/soft01/images/"+fileNamesmall;
        File filesamll=new File(pathsmall);
        bfile.transferTo(filesamll);
        String s=UUID.randomUUID().toString();
        s=s.replaceAll("-", "");
        b.setImage_w(fileName);
        b.setImage_b(fileNamesmall);
        b.setBid(s.toUpperCase());
        bookService.add(b);
        ModelAndView mv=new ModelAndView();
        mv.setViewName("admin/book/bookmanage");
        return mv;
    }
    
    @RequestMapping("/testname")
    public void testbook(HttpServletRequest request,HttpServletResponse response) throws IOException{
        String name=request.getParameter("name");
        Book book=bookService.showBookByName(name);
        PrintWriter out=response.getWriter();
        if(book!=null)
        {
            out.print("111");
        }else{
            out.print("222");
        }
        out.flush();
        out.close();
    }
    @RequestMapping("/doaddbook")
    public ModelAndView doadd(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/book/add");
        return mv;
    }
    @ResponseBody 
    @RequestMapping("/findByPid")
    public  List<Category> findById(HttpServletRequest request){
        String bookid=request.getParameter("bookid");
        List<Category>list=catService.showByPId(Integer.parseInt(bookid));
        return list;
    }
    @RequestMapping("/addbookmanage")
    public ModelAndView addbookmanage(){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("admin/book/bookmanage");
        return mv;
    }
    
    @RequestMapping("/doupdateordelete")
    public ModelAndView doUpdateOrDelete(String id){
        ModelAndView mv = new ModelAndView();
        Book book=bookService.showBookById(id);
        mv.addObject("book",book);
        mv.setViewName("admin/book/showbook");
        return mv;
    }
    @RequestMapping("showOneByBid")
    public ModelAndView showOneByBid(HttpServletRequest request)
    {
    	ModelAndView mv = new ModelAndView();
    	String bid = request.getParameter("id");
    	Book book = bookService.showBookById(bid);
    	mv.addObject("book",book);
    	mv.setViewName("admin/book/showbook");
    	return mv;
    }
    @RequestMapping("/dosearch")
    public ModelAndView doSearch(){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("admin/book/search");
        return mv;
    }
    
    @RequestMapping("/checkbook")
    public void checkBook(HttpServletRequest request, HttpServletResponse response) throws IOException{
    	String id = request.getParameter("id");
    	List<Cartitem> cars = carService.showByBid(id);
    	List<Orderitem> orderitems = ordService.showByBid(id);
    	PrintWriter out = response.getWriter();
    	if((cars != null && !cars.isEmpty()) ||( orderitems != null && !orderitems.isEmpty())){
    		out.print("error");
    	}else{
    		out.print("success");
    	}
    	out.flush();
    	out.close();
    }
    
    @RequestMapping("/showByBid")
    public ModelAndView showByBid(HttpServletRequest request){
    	String id = request.getParameter("id");
        ModelAndView mv = new ModelAndView();
        Book book=bookService.showBookById(id);
        mv.addObject("book",book);
        mv.setViewName("desk/showbook");
        return mv;
    }
    
    @RequestMapping("/findbookbycid")
    public void showBookByCid(HttpServletRequest request, HttpServletResponse response) throws IOException{
    	int id = Integer.parseInt(request.getParameter("id"));
    	List<Book> list = bookService.showBookByCid(id);
    	String msg = "";
		if(list != null && !list.isEmpty()){
			msg = "error";
		}else{
			msg = "success";
		}
		PrintWriter out = response.getWriter();
		out.print(msg);
		out.flush();
		out.close();
    	
    }
}
