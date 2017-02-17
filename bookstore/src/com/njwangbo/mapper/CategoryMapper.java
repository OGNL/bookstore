package com.njwangbo.mapper;

import java.util.List;

import com.njwangbo.po.Category;
import com.njwangbo.vo.CategoryVo;

public interface CategoryMapper {
	
	public void addI(Category category);
	
	public void addII(Category category);
	
	public void delete(int cid);
	
	public void update(Category category);
	
	public Category findById(int cid);
	
	public List<Category> findByPId(int pid);
	
	public List<CategoryVo> findAll();
	
	public CategoryVo findVoById(int cid);
	
	public List<Category> findCategoryI();
	
	public Category findByCname(String cname);
 }
