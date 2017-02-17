package com.njwangbo.service;

import java.util.List;

import com.njwangbo.po.Category;
import com.njwangbo.vo.CategoryVo;

public interface CategoryService {
	
	public void addI(Category category);
	
	public void addII(Category category);
	
	public void delete(int cid);
	
	public void update(Category category);
	
	public Category showById(int cid);
	
	public List<Category> showByPId(int pid);
	
	public List<CategoryVo> showAll();
	
	public CategoryVo showVoById(int cid);
	
	public List<Category> showCategoryI();
	
	public Category showByCname(String cname);

}
