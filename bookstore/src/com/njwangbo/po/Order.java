package com.njwangbo.po;

import java.io.Serializable;
import java.util.List;

public class Order implements Serializable
{
    private String oid;
    private String ordertime;
    private double total;
    private int status;
    private String address;
    private int uid;
    private List<Orderitem> orderitemlist;
    
    public List<Orderitem> getOrderitemlist()
    {
        return orderitemlist;
    }
    public void setOrderitemlist(List<Orderitem> orderitemlist)
    {
        this.orderitemlist = orderitemlist;
    }
    public String getOid()
    {
        return oid;
    }
    public void setOid(String oid)
    {
        this.oid = oid;
    }
    public String getOrdertime()
    {
        return ordertime;
    }
    public void setOrdertime(String ordertime)
    {
        this.ordertime = ordertime;
    }
    public double getTotal()
    {
        return total;
    }
    public void setTotal(double total)
    {
        this.total = total;
    }
    public int getStatus()
    {
        return status;
    }
    public void setStatus(int status)
    {
        this.status = status;
    }
    public String getAddress()
    {
        return address;
    }
    public void setAddress(String address)
    {
        this.address = address;
    }
    public int getUid()
    {
        return uid;
    }
    public void setUid(int uid)
    {
        this.uid = uid;
    }
}
