package com.njwangbo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.njwangbo.po.Category;
import com.njwangbo.service.CategoryService;
import com.njwangbo.vo.CategoryVo;

@Controller
@RequestMapping("/category")
public class CategoryController {
	
	@Autowired
	private CategoryService catService;
	
	@RequestMapping("/show")
	public ModelAndView showAll(){
		List<CategoryVo> list = catService.showAll();
		ModelAndView mv = new ModelAndView();
		mv.addObject("cats", list);
		mv.setViewName("/admin/category/category");
		return mv;
	}
	
	@RequestMapping("/addI")
	public ModelAndView addI(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/category/add");
		return mv;
	}
	
	@RequestMapping("/doaddI")
	public String doAddI(Category cat){
		catService.addI(cat);
		return "redirect:show.action";
	}
	
	@RequestMapping("/updateI")
	public ModelAndView updateI(int id){
		Category cat = catService.showById(id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("category", cat);
		mv.setViewName("/admin/category/edit");
		return mv;
	}
	
	@RequestMapping("/doupdateI")
	public String doUpdateI(Category cat){
		catService.update(cat);
		return "redirect:show.action";
	}
	
	@RequestMapping("/findByPId")
	public void findByPId(HttpServletRequest request,HttpServletResponse response) throws IOException{
		int id = Integer.parseInt(request.getParameter("id").toString());
		List<Category> list = catService.showByPId(id);
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
	
	@RequestMapping("/dodeleteI")
	public String doDeleteI(int id){
		catService.delete(id);
		return "redirect:show.action";
	}
	
	@RequestMapping("/addII")
	public ModelAndView addII(int id){
		Category cat = catService.showById(id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("category", cat);
		mv.setViewName("/admin/category/add2");
		return mv;
	}
	
	@RequestMapping("/doaddII")
	public String doAddII(Category cat){
		catService.addII(cat);
		return "redirect:show.action";
	}
	
	@RequestMapping("/updateII")
	public ModelAndView updateII(int id){
		CategoryVo catVo = catService.showVoById(id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("catVo", catVo);
		mv.setViewName("/admin/category/edit2");
		return mv;
	}
	
	@RequestMapping("/findCategoryI")
	public @ResponseBody List<Category> findCategoryI(){
		List<Category> list = catService.showCategoryI();
		return list;
	}
	
	@RequestMapping("/doupdateII")
	public String doUpdateII(Category cat){
		catService.update(cat);
		return "redirect:show.action";
	}
	
	@RequestMapping("/dodeleteII")
	public String doDeleteII(int id){
		catService.delete(id);
		return "redirect:show.action";
	}
	
	@RequestMapping("/findByCname")
	public void findByCname(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String name = request.getParameter("name");
		Category cat = catService.showByCname(name);
		String msg = "";
		if(cat != null){
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
