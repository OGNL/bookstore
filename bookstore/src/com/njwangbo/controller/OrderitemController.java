package com.njwangbo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.njwangbo.po.Order;
import com.njwangbo.po.Orderitem;
import com.njwangbo.po.User;
import com.njwangbo.service.OrderService;
import com.njwangbo.service.OrderitemService;
import com.njwangbo.service.UserService;

@Controller
@RequestMapping("/orderitem")
public class OrderitemController
{
    @Autowired
    private OrderitemService orderitemService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private UserService userService;
    
  //前台
    @RequestMapping("/showByOid")
    public ModelAndView showByOid(String oid)
    {
        List<Orderitem> list = orderitemService.showByOid(oid);
        Order order = orderService.showByoid(oid);
        ModelAndView mv = new ModelAndView();
        mv.addObject("orderitems",list);
        mv.addObject("order", order);
        mv.setViewName("desk/orderinfo");
        return mv;
    }
    
    //后台
    @RequestMapping("/showByoid")
    public ModelAndView showByoid(String oid)
    {
        List<Orderitem> list = orderitemService.showByOid(oid);
        Order order = orderService.showByoid(oid);
        User user = userService.showByUid(order.getUid());
        ModelAndView mv = new ModelAndView();
        mv.addObject("orderitems",list);
        mv.addObject("order", order);
        mv.addObject("user",user);
        mv.setViewName("/admin/order/desc");
        return mv;
    }
}
