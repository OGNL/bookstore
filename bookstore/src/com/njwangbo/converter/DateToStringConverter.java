package com.njwangbo.converter;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

public class DateToStringConverter implements Converter<Date, String>
{

    public String convert(Date date)
    {
        String s = new SimpleDateFormat("yyyy-MM-dd").format(date);
        return s;
    }
    
}
