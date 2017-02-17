package com.njwangbo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.njwangbo.po.Book;
import com.njwangbo.po.Cartitem;
import com.njwangbo.po.User;
import com.njwangbo.service.BookService;
import com.njwangbo.service.CartitemService;
import com.njwangbo.service.UserService;
import com.njwangbo.vo.Cartitemvo;


@Controller
@RequestMapping("/car")
public class CartitemController
{
    @Autowired
    private CartitemService carService;
    @Autowired
    private UserService userService;
    @Autowired
    private BookService bookservice;
    
    
    @RequestMapping("/showcars")
    public ModelAndView showall(HttpServletRequest request){
         String xxx=request.getParameter("xxx");
         String loginname = request.getParameter("loginname");
         User u=userService.showByname(loginname);
         
         
         if(xxx!=null){
        	 List<Cartitem> car=carService.showall2(u);
             ModelAndView mv=new ModelAndView();
        	 mv.addObject("cars", car);
        	 mv.setViewName("desk/turnorder");
        	 return mv;
         }else{
        	 List<Cartitem> car=carService.showall(u);
             ModelAndView mv=new ModelAndView();
        	 mv.addObject("cars", car);
        	 mv.setViewName("desk/carinfo");
        	 return mv;
         }
         
    }
    
    @RequestMapping("/checknum")
    public void checknum(HttpServletRequest request,HttpServletResponse resopnse) throws IOException{
        
        String num=request.getParameter("num");
        String bid=request.getParameter("bid");
        String uid=request.getParameter("uid");
        
        
        //书的库存
        Book book=new Book();
        book=bookservice.showBookById(bid);
        int booknum=book.getStock();
        //购物车中是否已有该图书
        Cartitem car=new Cartitem();
        car.setBid(bid);
        car.setUid(Integer.parseInt(uid));
        car=carService.showonebook(car);
        
        PrintWriter out = resopnse.getWriter();
        
        if(car!=null){
            //购物车中该图书数量
            int carnum=car.getQuantity();
            int quantity=carnum+Integer.parseInt(num);
            
            if(booknum<quantity){
                out.println("booknum");
            }
            out.flush();
            out.close();
        }
    }
    
    @RequestMapping("/checkjia")
    public void checkjia(HttpServletRequest request,HttpServletResponse resopnse) throws IOException{
        String bid=request.getParameter("bid");
        String numstr=request.getParameter("num");
        Book book=bookservice.showBookById(bid);
        int booknum=book.getStock();
        int num=Integer.parseInt(numstr);
        
        PrintWriter out= resopnse.getWriter();
        if(num==(booknum-1)||num>booknum){
            out.print(booknum);
            out.flush();
            out.close();
        }else if(num==booknum){
        	out.print(booknum);
            out.flush();
            out.close();
        }
    }
    
    
    @RequestMapping("/doaddcar")
    public String doaddcar (Model model, Cartitem car,User user)
    {
        int inputnum=car.getQuantity();
        
        Cartitem getcar=carService.showonebook(car);
        if(getcar!=null){
            int carnum=getcar.getQuantity();

            Book book=bookservice.showBookById(car.getBid());
            int booknum=book.getStock();
            if((inputnum+carnum)>booknum){
                
                System.out.println("购买数量大于库存");
                
            }if((inputnum+carnum)<=booknum){
                getcar.setQuantity((inputnum+carnum));
                carService.updateCartitem(getcar);
            }
        }if(getcar==null){
            carService.addCartitem(car);
        }
       String loginname=user.getLoginname();
        return "redirect:showcars.action?loginname="+loginname;
    }
    
    @RequestMapping("/dodeletecar")
    public String dodeletecar(Cartitem car,HttpServletRequest request){
    	String loginname = request.getParameter("loginname");
        carService.deleteCartitem(car);
        return "redirect:showcars.action?loginname="+loginname;
    }
    
    @RequestMapping("/deletebatch")
    public String deletebatch(Cartitemvo vo,User user){
    	
    	carService.deleteBatch(vo);
    	String loginname=user.getLoginname();
    	return "redirect:showcars.action?loginname="+loginname;
    }
    
    @RequestMapping("updatebatch")
    public String updatebatch(Cartitemvo carvo,HttpServletRequest request){
    	String loginname=request.getParameter("loginname");
    	System.out.println(carvo.getCarlist().get(0).getNum());
    	carService.updatebatch(carvo);
    	return "redirect:showcars.action?xxx="+carvo+"&loginname="+loginname;
    	
    }
    
}
