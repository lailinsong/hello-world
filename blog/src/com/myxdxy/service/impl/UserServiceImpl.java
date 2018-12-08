package com.myxdxy.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.myxdxy.mapper.UserMapper;
import com.myxdxy.pojo.LoginLog;
import com.myxdxy.pojo.ManageUser;
import com.myxdxy.pojo.PageInfo;
import com.myxdxy.pojo.User;
import com.myxdxy.service.UserService;

/**
 * 用户业务实现类
 * @author 赖林松
 *
 */
@Service
public class UserServiceImpl implements UserService {
	
	//获取用户事务类对象
	@Resource
	private UserMapper userMapper;
	//获取分页实体类对象
	@Resource
	private PageInfo pageInfo;
	
	/**
	 * 用户登陆
	 */
	@Override
	public User login(String userName, String password) {
		return userMapper.login(userName, password);
	}
	/**
	 * 修改用户信息
	 */
	@Override
	public int updUser(User user) {
		return userMapper.updUser(user);
	}
	/**
	 * 添加用户
	 */
	@Override
	public int insUser(User user) {
		return userMapper.insUser(user);
	}
	/**
	 * 查询各用户文章数
	 */
	@Override
	public int selArticleCount(int id) {
		return userMapper.selArticleCount(id);
	}
	/**
	 * 查询用户列表
	 */
	@Override
	public List<ManageUser> selAll() {
		List<ManageUser> list = userMapper.selAll();
		for(ManageUser u : list) {
			u.setArticleCount(selArticleCount(u.getId()));
		}
		return list;
	}
	/**
	 * 更新最后一次登陆的时间和 ip
	 */
	@Override
	public int updLoginTime(int id, String loginTime, String ip) {
		return userMapper.updLoginTime(id, loginTime, ip);
	}
	@Override
	public User selById(int id) {
		return userMapper.selById(id);
	}
	/**
	 * 删除用户
	 */
	@Override
	public int delUser(int id) {
		return userMapper.delUser(id);
	}
	/**
	 * 修改用户状态
	 */
	@Override
	public int updAble(int id, int able) {
		return userMapper.updAble(id, able);
	}
	/**
	 * 添加登陆日志
	 */
	@Override
	public int insLoginLog(LoginLog loginLog) {
		return userMapper.insLoginLog(loginLog);
	}
	/**
	 * 删除登陆日志
	 */
	@Override
	public int delLoginLog(int id) {
		return userMapper.delLoginLog(id);
	}
	/**
	 * 查询登陆日志列表
	 */
	@Override
	public List<LoginLog> selLoginLog() {
		return userMapper.selLoginLog();
	}
	/**
	 * 分页查询用户登陆日志
	 */
	@Override
	public PageInfo showPage(int pageSize, int pageNumber) {
		pageInfo.setPageSize(pageSize);
		pageInfo.setPageNumber(pageNumber);
		long count = userMapper.selLoginLogCount();
		pageInfo.setTatol(count%pageSize==0?count/pageSize:count/pageSize+1);
		Map<String,Object> map = new HashMap<>();
		map.put("pageStart", pageSize*(pageNumber-1));
		map.put("pageSize", pageSize);
		pageInfo.setList(userMapper.selByPage(map));
		return pageInfo;
	}
}
