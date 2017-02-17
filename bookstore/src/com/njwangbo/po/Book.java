package com.njwangbo.po;

import java.io.Serializable;

public class Book implements Serializable
{
    private String bid;
    private String bname;
    private String author;
    private double price;
    private double currPrice;
    private double discount;
    private String press;
    private String publishtime;
    private int edition;
    private int pageNum;
    private int wordNum;
    private String printtime;
    private int booksize;
    private String paper;
    private int cid;
    private String image_w;
    private String image_b;
    private int stock;
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
    public String getAuthor()
    {
        return author;
    }
    public void setAuthor(String author)
    {
        this.author = author;
    }
    public double getPrice()
    {
        return price;
    }
    public void setPrice(double price)
    {
        this.price = price;
    }
    public double getCurrPrice()
    {
        return currPrice;
    }
    public void setCurrPrice(double currPrice)
    {
        this.currPrice = currPrice;
    }
    public double getDiscount()
    {
        return discount;
    }
    public void setDiscount(double discount)
    {
        this.discount = discount;
    }
    public String getPress()
    {
        return press;
    }
    public void setPress(String press)
    {
        this.press = press;
    }
    public String getPublishtime()
    {
        return publishtime;
    }
    public void setPublishtime(String publishtime)
    {
        this.publishtime = publishtime;
    }
    public int getEdition()
    {
        return edition;
    }
    public void setEdition(int edition)
    {
        this.edition = edition;
    }
    public int getPageNum()
    {
        return pageNum;
    }
    public void setPageNum(int pageNum)
    {
        this.pageNum = pageNum;
    }
    public int getWordNum()
    {
        return wordNum;
    }
    public void setWordNum(int wordNum)
    {
        this.wordNum = wordNum;
    }
    public String getPrinttime()
    {
        return printtime;
    }
    public void setPrinttime(String printtime)
    {
        this.printtime = printtime;
    }
   
    public int getBooksize()
    {
        return booksize;
    }
    public void setBooksize(int booksize)
    {
        this.booksize = booksize;
    }
    public String getPaper()
    {
        return paper;
    }
    public void setPaper(String paper)
    {
        this.paper = paper;
    }
    public int getCid()
    {
        return cid;
    }
    public void setCid(int cid)
    {
        this.cid = cid;
    }
    public String getImage_w()
    {
        return image_w;
    }
    public void setImage_w(String imageW)
    {
        image_w = imageW;
    }
    public String getImage_b()
    {
        return image_b;
    }
    public void setImage_b(String imageB)
    {
        image_b = imageB;
    }
    public int getStock()
    {
        return stock;
    }
    public void setStock(int stock)
    {
        this.stock = stock;
    }
    
    
}
