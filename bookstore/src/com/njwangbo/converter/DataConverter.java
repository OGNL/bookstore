package com.njwangbo.converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

public class DataConverter implements Converter<String, Date>
{

    public Date convert(String s)
    {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try
        {
            Date date = sdf.parse(s);
            return date;
        }
        catch (ParseException e)
        {
            e.printStackTrace();
        }
        return null;
    }
    
}
