package com.njwangbo.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.njwangbo.po.Book;
import com.njwangbo.po.Cartitem;
import com.njwangbo.po.Order;
import com.njwangbo.po.Orderitem;
import com.njwangbo.po.User;
import com.njwangbo.service.BookService;
import com.njwangbo.service.CartitemService;
import com.njwangbo.service.OrderService;
import com.njwangbo.service.OrderitemService;
import com.njwangbo.vo.Cartitemvo;

@Controller
@RequestMapping("/order")
public class OrderController
{
    @Autowired
    private OrderService orderService;
    @Autowired
    private OrderitemService oitemService;
    @Autowired
    private CartitemService carService;
    @Autowired
    private BookService bookService;
    
    @RequestMapping("/show")
    public ModelAndView showBySome(HttpServletRequest request)
    {   
    		int status = 0;
    		String sta = request.getParameter("status");
    		if(sta != null){
    			status = Integer.parseInt(sta);
    		}
    		int pageNum = 0;
    		String page = request.getParameter("pageNum"); 
    		if(page != null){
    			pageNum = Integer.parseInt(page);
    		}
    		Order order = new Order();
            order.setStatus(status);
            int MaxPageNum = orderService.showgetMaxNum(order)%5 == 0 ?
            		orderService.showgetMaxNum(order)/5 : orderService.showgetMaxNum(order)/5+1; 
            int curPage;
            if(pageNum == 0)
            {
                curPage = 1;   
            }
            else
            {
                curPage = pageNum;
                if(curPage < 1)
                {
                    curPage = 1;
                }
                if(curPage > MaxPageNum)
                {
                    curPage = MaxPageNum;
                }
            }
            System.out.println(MaxPageNum);
            List<Order> list = orderService.showBySome(status, (curPage-1)*5);
            List<Orderitem> orderitemlist = new ArrayList<Orderitem>();
            for(Order o : list){
            	orderitemlist = oitemService.showByOid(o.getOid());
            	o.setOrderitemlist(orderitemlist);
            }
            ModelAndView mv = new ModelAndView();
            mv.addObject("orders",list);
            mv.addObject("status",status);
            mv.addObject("curPage",curPage);
            mv.addObject("maxPage",MaxPageNum);
            mv.setViewName("admin/order/list");
            return mv;
    }
    
    @RequestMapping("update")
    public String update(HttpServletRequest request)
     {
            int status = Integer.parseInt(request.getParameter("status"));
            String oid = request.getParameter("oid");
            if(status == 5){
            	List<Orderitem> orderitemlist = oitemService.showByOid(oid);
            	for(Orderitem o : orderitemlist){
            		int quantity = o.getQuantity();
            		Book book = bookService.showBookById(o.getBid());
            		int stock = book.getStock();
            		book.setStock(stock+quantity);
            		bookService.update(book);
            	}
            }
            Order o = new Order();
            o.setStatus(status);
            o.setOid(oid);
            orderService.update(o);
            return "redirect:show.action";
    }
    
    @RequestMapping("/showByUid")
    public ModelAndView showByUid(HttpServletRequest request)
    {	
        User user = (User) request.getSession().getAttribute("user");
        int uid =  user.getUid();
        int pageNum = 0;
    	String page =  request.getParameter("pageNum");
    	if(page != null){
    		pageNum = Integer.parseInt(page);
    	}
         int MaxPageNum = orderService.getcountByUid(uid)%5==0?orderService.getcountByUid(uid)/5:
        	orderService.getcountByUid(uid)/5+1; 
         int curPage;
         if(pageNum == 0)
         {
             curPage = 1;   
         }
         else
         {
             curPage = pageNum;
             if(curPage <= 1)
             {
                 curPage = 1;
             }
             if(curPage >= MaxPageNum)
             {
                 curPage = MaxPageNum;
             }
         }
         System.out.println(curPage);
         List<Order> list = orderService.showByUid(uid, (curPage-1)*5);
         List<Orderitem> orderitemlist = new ArrayList<Orderitem>();
         for(Order o: list){
        	 orderitemlist = oitemService.showByOid(o.getOid());
         	 o.setOrderitemlist(orderitemlist);
         }
         ModelAndView mv = new ModelAndView();
         mv.addObject("ord",list);
         mv.addObject("curPage",curPage);
         mv.addObject("maxPage", MaxPageNum);
	     mv.setViewName("desk/orders");
	     return mv;
    }
    
    @RequestMapping("/doaddorder")
    public ModelAndView doAddOrder(Order o, Cartitemvo vo){
    	String oid = UUID.randomUUID().toString().replaceAll("-", "").toUpperCase();
    	Date date = new Date();
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	String ordertime = sdf.format(date);
    	o.setStatus(1);
    	o.setOid(oid);
    	o.setOrdertime(ordertime);
    	orderService.add(o);
    	oitemService.addbatch(o);
    	carService.deleteBatchByNum(vo);
    	List<Orderitem> orders = o.getOrderitemlist();
    	for(int i=0; i<orders.size(); i++){
    		Book book  = bookService.showBookById(orders.get(i).getBid());
    		int quantity = orders.get(i).getQuantity();
    		book.setStock(book.getStock()-quantity);
    		bookService.update(book);
    	}
    	ModelAndView mv = new ModelAndView();
    	mv.addObject("order",o);
        mv.setViewName("desk/neworder");
        return mv;
    }
    
    @RequestMapping("/pay")
    public ModelAndView pay(HttpServletRequest request){
    	String id = request.getParameter("id");
    	Order order = orderService.showByoid(id);
    	ModelAndView mv = new ModelAndView();
    	mv.addObject("order",order);
        mv.setViewName("desk/pay");
        return mv;
    }
    
    @RequestMapping("/doupdate")
    public String doUpdate(HttpServletRequest request){
    	   int status = Integer.parseInt(request.getParameter("status"));
           String oid = request.getParameter("id");
           if(status == 5){
        	   List<Orderitem> orderitemlist = oitemService.showByOid(oid);
        	   for(Orderitem o : orderitemlist){
        		   int quantity = o.getQuantity();
        		   Book book = bookService.showBookById(o.getBid());
        		   book.setStock(book.getStock()+quantity);
        		   bookService.update(book);
        	   }
           }
           Order o = new Order();
           o.setStatus(status);
           o.setOid(oid);
           orderService.update(o);
           return "redirect:showByUid.action";
    }
    

    
}
