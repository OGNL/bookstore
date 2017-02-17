package com.njwangbo.po;

import java.io.Serializable;
/*uid int primary key auto_increment,
loginname varchar(50) not null unique,
loginpass varchar(50) not null,
email varchar(50)*/
public class User implements Serializable
{
    private Integer uid;
    private String loginname;
    private String loginpass;
    private String email;
    public Integer getUid()
    {
        return uid;
    }
    public void setUid(Integer uid)
    {
        this.uid = uid;
    }
    public String getLoginname()
    {
        return loginname;
    }
    public void setLoginname(String loginname)
    {
        this.loginname = loginname;
    }
    public String getLoginpass()
    {
        return loginpass;
    }
    public void setLoginpass(String loginpass)
    {
        this.loginpass = loginpass;
    }
    public String getEmail()
    {
        return email;
    }
    @Override
    public String toString()
    {
        return "User [email=" + email + ", loginname=" + loginname + ", loginpass=" + loginpass + ", uid=" + uid + "]";
    }
    public void setEmail(String email)
    {
        this.email = email;
    }
    
}
