package com.njwangbo.vo;

import java.io.Serializable;
import java.util.List;

import com.njwangbo.po.Category;

public class CategoryVo implements Serializable
{
	
	private int id;
	private int pid;
	private String pname;
	private String pdes;
	private String cname;
	private String cdes;
	
	private List<Category> cats;

	
	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getCdes() {
		return cdes;
	}

	public void setCdes(String cdes) {
		this.cdes = cdes;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public int getId() {
		return id;
	}

	public void setId(int pid) {
		this.id = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPdes() {
		return pdes;
	}

	public void setPdes(String pdes) {
		this.pdes = pdes;
	}

	public List<Category> getCats() {
		return cats;
	}

	public void setCats(List<Category> cats) {
		this.cats = cats;
	}
	
	

}
