package com.petpet.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@SuppressWarnings("deprecation")
public class OldLoginInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		System.out.println("\n-------- OldLoginInterceptor.preHandle --- ");
		System.out.println("Request URL: " + request.getRequestURL());
		System.out.println("Sorry! This URL is no longer used, Redirect to /PleaseLogin");
		
		if(request.getSession().getAttribute("memberid") != null) {
			return true;
		}else {
			response.sendRedirect(request.getContextPath() + "/PleaseLogin");
			return false;
		}

	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		System.out.println("\n-------- OldLoginInterceptor.postHandle --- ");
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
		System.out.println("\n-------- OldLoginInterceptor.afterCompletion --- ");
	}
	
}
