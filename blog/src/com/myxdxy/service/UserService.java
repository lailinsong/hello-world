package com.myxdxy.service;

import java.util.List;

import com.myxdxy.pojo.LoginLog;
import com.myxdxy.pojo.ManageUser;
import com.myxdxy.pojo.PageInfo;
import com.myxdxy.pojo.User;

/**
 * 用户业务接口类
 * @author 赖林松
 *
 */
public interface UserService {
	/**
	 * 用户登陆
	 * @param userName
	 * @param password
	 * @return User
	 */
	User login(String userName,String password);
	/**
	 * 添加用户
	 * @param user
	 * @return
	 */
	int insUser(User user);
	/**
	 * 修改用户信息
	 * @param user
	 * @return
	 */
	int updUser(User user);
	/**
	 * 查询各用户文章数
	 * @param id
	 * @return
	 */
	int selArticleCount(int id);
	/**
	 * 查询用户列表
	 * @return
	 */
	List<ManageUser> selAll();
	/**
	 * 更新最后一次登陆的时间和 ip
	 * @param id
	 * @param loginTime
	 * @param ip
	 * @return
	 */
	int updLoginTime(int id,String loginTime,String ip);
	/**
	 * 用 id 查询用户
	 * @param id
	 * @return
	 */
	User selById(int id);
	/**
	 * 删除用户
	 * @param id
	 * @return
	 */
	int delUser(int id);
	/**
	 * 修改用户状态
	 * @param id
	 * @param able
	 * @return
	 */
	int updAble(int id,int able);
	/**
	 * 添加登陆日志
	 * @param loginLog
	 * @return
	 */
	int insLoginLog(LoginLog loginLog);
	/**
	 * 删除登陆日志
	 * @param id
	 * @return
	 */
	int delLoginLog(int id);
	/**
	 * 查询登陆日志列表
	 * @return
	 */
	List<LoginLog> selLoginLog();
	/**
	 * 分页查询登陆日志
	 * @param pageSize
	 * @param pageNumber
	 * @return
	 */
	PageInfo showPage(int pageSize,int pageNumber);
}
