package com.recruit.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor{

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2,
			org.springframework.web.servlet.ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object obj) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session =request.getSession();
		Object user=session.getAttribute("user");
		String DQurl=request.getContextPath();
		System.out.println(DQurl);
		System.out.println("interceptor:"+user);
		if(user==null){
			response.sendRedirect(""+DQurl+"/login.jsp");
			return false;
		}else{
			return true;
		}
	}
}
