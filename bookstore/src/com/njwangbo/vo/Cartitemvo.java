package com.njwangbo.vo;

import java.util.List;

import com.njwangbo.po.Cartitem;

public class Cartitemvo {

	private Cartitem car;
	private int[] ids;
	private List<Cartitem> carlist;
	
	
	public List<Cartitem> getCarlist() {
		return carlist;
	}
	public void setCarlist(List<Cartitem> carlist) {
		this.carlist = carlist;
	}
	public Cartitem getCar() {
		return car;
	}
	public void setCar(Cartitem car) {
		this.car = car;
	}
	public int[] getIds() {
		return ids;
	}
	public void setIds(int[] ids) {
		this.ids = ids;
	}
	
}
