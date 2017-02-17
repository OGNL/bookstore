package com.njwangbo.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class UserInterceptor implements HandlerInterceptor{

	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub
		
	}

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object object) throws Exception {
		 
	        //通过硬编码的方式来判断当前的请求路径是否要被直接放行的路径
	        HttpSession session = request.getSession();
	        Object obj = session.getAttribute("user");
	        if(null == obj)
	        {
	            request.getRequestDispatcher("/WEB-INF/user/login.jsp").forward(request, response);
	            return false;
	        }
	        return true;
	}
}
