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

import com.njwangbo.po.Admin;
import com.njwangbo.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/login")
	public ModelAndView login(HttpSession session){
		ModelAndView mv = new ModelAndView();
		session.removeAttribute("admin");
		mv.setViewName("/admin/login");
		return mv;
	}
	
	@RequestMapping("/dologin")
	public void dologin(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String adminname = request.getParameter("name");
		String adminpwd = request.getParameter("pwd");
		Admin admin = adminService.showAdminByNameAndPwd(adminname, adminpwd);
		String msg = "";
		if(admin != null){
			request.getSession().setAttribute("admin", admin);
			msg = "success";
		}else{
			msg = "error";
		}
		PrintWriter out = response.getWriter();
		out.print(msg);
		out.flush();
		out.close();
	}
	
	@RequestMapping("/enter")
	public ModelAndView enter(String adminname){
		ModelAndView mv = new ModelAndView();
		mv.addObject("adminname", adminname);
		mv.setViewName("/admin/view");
		return mv;
		
	}
}
