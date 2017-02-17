package com.njwangbo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njwangbo.mapper.CategoryMapper;
import com.njwangbo.po.Category;
import com.njwangbo.service.CategoryService;
import com.njwangbo.vo.CategoryVo;

@Service
public class CategoryServiceImpl implements CategoryService {
	
	@Autowired
	private CategoryMapper catMapper;
	
	public void addI(Category category) {
		catMapper.addI(category);
	}

	public void delete(int cid) {
		catMapper.delete(cid);
	}

	public List<CategoryVo> showAll() {
		return catMapper.findAll();
	}

	public Category showById(int cid) {
		return catMapper.findById(cid);
	}

	public List<Category> showByPId(int pid) {
		return catMapper.findByPId(pid);
	}

	public void update(Category category) {
		catMapper.update(category);
	}

	public void addII(Category category) {
		catMapper.addII(category);
	}

	public CategoryVo showVoById(int cid) {
		return catMapper.findVoById(cid);
	}

	public List<Category> showCategoryI() {
		return catMapper.findCategoryI();
	}

	public Category showByCname(String cname) {
		return catMapper.findByCname(cname);
	}

}
