package com.myxdxy.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myxdxy.pojo.GetIpAddress;
import com.myxdxy.pojo.User;
import com.myxdxy.service.SystemService;

/**
 * 系统控制器类
 * @author 赖林松
 *
 */
@Controller
public class SystemController {
	
	//获取系统业务类对象
	@Resource
	private SystemService systemService;
	//获取工具类对象
	@Resource
	private GetIpAddress getIpAddress;
	
	@RequestMapping("/main")
	public String systemInfo(HttpServletRequest req) {
		HttpSession session = req.getSession();
		User u = (User)session.getAttribute("user");
		Map<String,Object> map = systemService.systemInfo(u.getId());
		req.setAttribute("systemInfo", map);
		req.setAttribute("ip", getIpAddress.getIpAddr(req));
		return "pages/admin/main.jsp";
	}
}
