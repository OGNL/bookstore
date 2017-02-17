package com.njwangbo.po;

import java.io.Serializable;

public class Orderitem implements Serializable
{
    private String orderItemId;
    private int quantity;
    private double subtotal;
    private String bid;
    private String bname;
    private double currPrice;
    private String image_b;
    private String oid;
    
    public String getOrderItemId()
    {
        return orderItemId;
    }
    public void setOrderItemId(String orderItemId)
    {
        this.orderItemId = orderItemId;
    }
    public int getQuantity()
    {
        return quantity;
    }
    public void setQuantity(int quantity)
    {
        this.quantity = quantity;
    }
    public double getSubtotal()
    {
        return subtotal;
    }
    public void setSubtotal(double subtotal)
    {
        this.subtotal = subtotal;
    }
    public String getBid()
    {
        return bid;
    }
    public void setBid(String bid)
    {
        this.bid = bid;
    }
    public String getBname()
    {
        return bname;
    }
    public void setBname(String bname)
    {
        this.bname = bname;
    }
    public double getCurrPrice()
    {
        return currPrice;
    }
    public void setCurrPrice(double currPrice)
    {
        this.currPrice = currPrice;
    }
    public String getImage_b()
    {
        return image_b;
    }
    public void setImage_b(String imageB)
    {
        image_b = imageB;
    }
    public String getOid()
    {
        return oid;
    }
    public void setOid(String oid)
    {
        this.oid = oid;
    }
}
