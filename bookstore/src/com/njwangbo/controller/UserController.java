package com.njwangbo.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.njwangbo.po.User;
import com.njwangbo.service.UserService;


@Controller 
@RequestMapping("/user")
public class UserController
{
    
    
    @Autowired
    private UserService userservice;
       
    @RequestMapping("/dologin")
    public void dologin(HttpServletRequest request,HttpServletResponse resopnse) throws IOException{
        resopnse.setCharacterEncoding("UTF-8");       
        resopnse.setContentType("text/html;charset=utf-8");  
        HttpSession session =request.getSession();
        String name = request.getParameter("name");
        String pass = request.getParameter("pass");
        String vcode = request.getParameter("vcode");
        String code = (String)session.getAttribute("vCode");
        User user = userservice.showByname(name);
        PrintWriter out = resopnse.getWriter();
        
        if(code.trim().equalsIgnoreCase(vcode.trim())){
            if(user==null){
                out.println("账户不存在");
            }else if(user.getLoginpass().equals(pass)){
                out.println("success");
            }else{
                out.println("密码错误");
            }
        }else{
            out.println("验证码错误");
        }
        session.setAttribute("user", user);
        out.flush();
        out.close();
    }
    @RequestMapping("/docheckcode")
    public void docheckcode(HttpServletRequest request,HttpServletResponse resopnse) throws IOException{
        resopnse.setCharacterEncoding("UTF-8");       
        resopnse.setContentType("text/html;charset=utf-8");  
        HttpSession session =request.getSession();
        String vcode = request.getParameter("vcode");
        String code = (String)session.getAttribute("vCode");
        PrintWriter out = resopnse.getWriter();
        if(code.trim().equalsIgnoreCase(vcode.trim())){
            out.print("验证码正确");
        }else{
            out.print("验证码错误");
        }
        out.flush();
        out.close();
    }
    
    @RequestMapping("/docheckname")
    public void docheckname(HttpServletRequest request,HttpServletResponse resopnse) throws IOException{
        resopnse.setCharacterEncoding("UTF-8");       
        resopnse.setContentType("text/html;charset=utf-8");
        String name=request.getParameter("name");
        User user = userservice.showByname(name);
        PrintWriter out = resopnse.getWriter();
        if(user==null){
            out.print("用户名可用");
        }else{
            out.print("用户已存在");
        }
        out.flush();
        out.close();
        
    }
    
    @RequestMapping("/doregist")
    public String doregist(User user) throws IOException{
        boolean flag= userservice.addUser(user);
        if(flag==true){
            return "redirect:login.action";
        }
        return null;
        
    }
    
    
    
    @RequestMapping("/login")
    public ModelAndView login(HttpSession session){
        
        ModelAndView mv = new ModelAndView();
        session.removeAttribute("user");
        mv.setViewName("user/login");
        return mv;
    }
    
    @RequestMapping("/regist")
    public ModelAndView regist(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/regist");
        return mv;
    }
    
    @RequestMapping("/pwd")
    public ModelAndView pwd(){
    	ModelAndView mv = new ModelAndView();
        mv.setViewName("user/pwd");
        return mv;
    }
    
    @RequestMapping("/dochangepwd")
    public String dochangepwd(HttpServletRequest request,HttpServletResponse resopnse){
        String loginname=request.getParameter("loginname");
        String loginpass=request.getParameter("loginpass");
        User user=new User();
        user.setLoginname(loginname);
        user.setLoginpass(loginpass);
        User u=userservice.showByname(loginname);
        String email=u.getEmail();
        user.setEmail(email);
        userservice.updateUser(user);
        
        return "user/login";
    }
    
    @RequestMapping("/checkpassword")
    public void checkpassword(HttpServletRequest request,HttpServletResponse resopnse) throws IOException{
        String loginpass=request.getParameter("loginpass");
        String oldpass=request.getParameter("oldpass");
        PrintWriter out = resopnse.getWriter();
         if(!loginpass.equals(oldpass)){
             out.print("原密码错误！！");
         }else{
             out.print("");
         }
         out.flush();
         out.close();
    }
    
    
}
