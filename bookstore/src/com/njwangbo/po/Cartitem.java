package com.njwangbo.po;

import java.io.Serializable;

public class Cartitem implements Serializable
{
    /**
     * serialVersionUID
     */
    private static final long serialVersionUID = 3114329474183605153L;
    
    
    private int cartitemId;
    private  int quantity;
    private String bid;
    private int uid;
    private int orderBy;
    private int num;
    
    public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	private Book book;
    
    
    
    public Book getBook()
    {
        return book;
    }
    public void setBook(Book book)
    {
        this.book = book;
    }
    
    public int getCartitemId() {
		return cartitemId;
	}
	public void setCartitemId(int cartitemId) {
		this.cartitemId = cartitemId;
	}
	public int getQuantity()
    {
        return quantity;
    }
    public void setQuantity(int quantity)
    {
        this.quantity = quantity;
    }

    public int getUid()
    {
        return uid;
    }
    public void setUid(int uid)
    {
        this.uid = uid;
    }
    public int getOrderBy()
    {
        return orderBy;
    }
    public void setOrderBy(int orderBy)
    {
        this.orderBy = orderBy;
    }
	public String getBid() {
		return bid;
	}
	public void setBid(String bid) {
		this.bid = bid;
	}
    
    
    
    
}
