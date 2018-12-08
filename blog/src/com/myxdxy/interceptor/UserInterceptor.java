package com.myxdxy.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * 拦截器
 * @author 赖林松
 *
 */
public class UserInterceptor implements HandlerInterceptor {
	
	/**
	 * 控制器执行前执行
	 */
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object arg2) throws Exception {
		HttpSession session = req.getSession();
		if(session.getAttribute("user") == null) {
			resp.sendRedirect("/blog/admin");
			return false;
		}else {
			return true;
		}
	}
	
	/**
	 * 控制器执行后执行
	 */
	@Override
	public void postHandle(HttpServletRequest req, HttpServletResponse resp, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	/**
	 * jsp 执行后执行
	 */
	@Override
	public void afterCompletion(HttpServletRequest req, HttpServletResponse resp, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
}
