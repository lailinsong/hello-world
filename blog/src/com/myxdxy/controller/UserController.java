package com.myxdxy.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.myxdxy.pojo.GetIpAddress;
import com.myxdxy.pojo.LoginLog;
import com.myxdxy.pojo.PageInfo;
import com.myxdxy.pojo.User;
import com.myxdxy.service.UserService;

/**
 * 用户控制器类
 * @author 赖林松
 *
 */
@Controller
public class UserController {
	
	//获取用户业务类对象
	@Resource
	private UserService userService;
	//获取实体类对象
	@Resource
	private GetIpAddress getIpAddress;
	//获取登陆日志实体类
	@Resource
	private LoginLog loginLog;
	
	/**
	 * 用户后台登陆控制
	 * @param req
	 * @param resp
	 * @param userName
	 * @param password
	 * @throws IOException 
	 */
	@RequestMapping("/login")
	public void login(HttpServletRequest req,HttpServletResponse resp,@RequestParam(value="username")String userName,String password,String loginTime) throws IOException {
		PrintWriter pw = resp.getWriter();
		HttpSession session = req.getSession();
		User user = userService.login(userName, password);
		if(user != null) {
			if(user.getIsAble() == 1) {
				userService.updLoginTime(user.getId(), loginTime, getIpAddress.getIpAddr(req));
				loginLog.setLoginIp(getIpAddress.getIpAddr(req));
				loginLog.setLoginTime(loginTime);
				loginLog.setUserName(user.getUserName());
				loginLog.setUid(user.getId());
				userService.insLoginLog(loginLog);
				session.setAttribute("user", user);
				pw.write("1");
			}else {
				pw.write("-1");
			}
		}else {
			pw.write("0");
		}
		pw.flush();
		pw.close();
	}
	/**
	 * 退出登陆
	 * @param req
	 * @return
	 */
	@RequestMapping("/loginOut")
	public String loginOut(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		return "pages/admin/login.jsp";
	}
	/**
	 * 加载后台登陆页面
	 * @return
	 */
	@RequestMapping("/admin")
	public String loadAdmin() {
		return "/pages/admin/login.jsp";
	}
	/**
	 * 加载个人信息页面
	 * @return
	 */
	@RequestMapping("/userinfo")
	public String loadUserInfo() {
		return "pages/admin/userinfo.jsp";
	}
	@RequestMapping("/adduser")
	public String loadAddUser() {
		return "/pages/admin/add-user.jsp";
	}
	/**
	 * 添加用户
	 * @param req
	 * @param resp
	 * @param user
	 * @throws IOException
	 */
	@RequestMapping("/addUser")
	public void insUser(HttpServletRequest req,HttpServletResponse resp,User user) throws IOException {
		user.setIsAble(1);
		PrintWriter pw = resp.getWriter();
		HttpSession session = req.getSession();
		User u = (User)session.getAttribute("user");
		int index = 0;
		if(u.getGrade() == 1) {
			index = userService.insUser(user);
			if(index == 1) {
				pw.write("1");
			}else {
				pw.write("0");
			}
		}else {
			pw.write("-1");
		}
		pw.flush();
		pw.close();
	}
	/**
	 * 修改用户信息
	 * @param req
	 * @param resp
	 * @param user
	 * @throws IOException
	 */
	@RequestMapping("/updUser")
	public void updUser(HttpServletRequest req,HttpServletResponse resp,User user) throws IOException {
		HttpSession session = req.getSession();
		PrintWriter pw = resp.getWriter();
		User u = (User) session.getAttribute("user");
		int index = 0;
		if(u.getGrade() == 1 || u.getId() == user.getId()) {
			index = userService.updUser(user);
			if(index == 1) {
				if((!u.getPassword().equals(user.getPassword())) && (u.getId() == user.getId())) {
					session.invalidate();
					pw.write("2");
				}else if(u.getId() == user.getId()) {
					session.setAttribute("user", userService.login(user.getUserName(), user.getPassword()));
					pw.write("1");
				}else {
					pw.write("1");
				}
			}else {
				pw.write("0");
			}
		}else {
			pw.write("-1");
		}
		pw.flush();
		pw.close();
	}
	/**
	 * 查询用户列表
	 * @param req
	 * @return
	 */
	@RequestMapping("/listUser")
	public String insAll(HttpServletRequest req) {
		req.setAttribute("listUser", userService.selAll());
		return "pages/admin/manage-user.jsp";
	}
	/**
	 * 用 id 查询用户
	 * @param req
	 * @param id
	 * @return
	 */
	@RequestMapping("/selUserById")
	public String selById(HttpServletRequest req,int id) {
		User user = userService.selById(id);
		req.setAttribute("user", user);
		return "pages/admin/update-user.jsp";
	}
	/**
	 * 删除用户
	 * @param req
	 * @param resp
	 * @param id
	 * @throws IOException
	 */
	@RequestMapping("/delUser")
	public void delUser(HttpServletRequest req,HttpServletResponse resp,int id) throws IOException {
		PrintWriter pw = resp.getWriter();
		HttpSession session = req.getSession();
		User u = (User)session.getAttribute("user");
		int index = 0;
		if((u.getGrade() == 1) && (u.getId() != id)) {
			index = userService.delUser(id);
			if(index == 1) {
				pw.write("1");
			}else {
				pw.write("0");
			}
		}else {
			pw.write("-1");
		}
		pw.flush();
		pw.close();
	}
	/**
	 * 修改用户状态
	 * @param resp
	 * @param id
	 * @param able
	 * @throws IOException
	 */
	@RequestMapping("/updAble")
	public void updAble(HttpServletRequest req,HttpServletResponse resp,int id,int able) throws IOException {
		PrintWriter pw = resp.getWriter();
		HttpSession session = req.getSession();
		User u = (User)session.getAttribute("user");
		int index = 0;
		if((u.getGrade() == 1) && (u.getId() != id)) {
			index = userService.updAble(id, able);
			if(index == 1) {
				pw.write("1");
			}else {
				pw.write("0");
			}
		}else {
			pw.write("-1");
		}
		pw.flush();
		pw.close();
	}
	/**
	 * 查询登陆日志列表
	 * @param req
	 * @return
	 */
	@RequestMapping("/loginLog")
	public String selLoginLog(HttpServletRequest req) {
		List<LoginLog> list = userService.selLoginLog();
		req.setAttribute("loginLog", list);
		return "pages/admin/loginlog.jsp";
	}
	/**
	 * 删除登陆日志
	 * @param req
	 * @param resp
	 * @param id
	 * @throws IOException
	 */
	@RequestMapping("/delLoginLog")
	public void delLoginLog(HttpServletRequest req,HttpServletResponse resp,int id) throws IOException {
		PrintWriter pw = resp.getWriter();
		HttpSession session = req.getSession();
		User u = (User)session.getAttribute("user");
		int index = 0;
		if(u.getGrade() == 1) {
			index = userService.delLoginLog(id);
			if(index == 1) {
				pw.write("1");
			}else {
				pw.write("0");
			}
		}else {
			pw.write("-1");
		}
		pw.flush();
		pw.close();
	}
	/**
	 * 分页查询登陆日志
	 * @param req
	 * @param pageSize
	 * @param pageNumber
	 * @return
	 */
	@RequestMapping("/selLogByPage")
	public String showPage(HttpServletRequest req,@RequestParam(defaultValue="15")String pageSize,@RequestParam(defaultValue="1")String pageNumber) {
		PageInfo pageInfo = userService.showPage(Integer.parseInt(pageSize), Integer.parseInt(pageNumber));
		req.setAttribute("showPage", pageInfo);
		return "/pages/admin/loginlog.jsp";
	}
}
