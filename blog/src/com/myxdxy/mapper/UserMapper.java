package com.myxdxy.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.myxdxy.pojo.LoginLog;
import com.myxdxy.pojo.ManageUser;
import com.myxdxy.pojo.User;

/**
 * 用户事务接口类
 * @author 赖林松
 *
 */
public interface UserMapper {
	/**
	 * 用户登陆
	 * @param userName
	 * @param password
	 * @return User
	 */
	@Select("select * from admin where username=#{0} and password=#{1}")
	User login(String userName,String password);
	/**
	 * 添加用户
	 * @param user
	 * @return
	 */
	@Insert("insert into admin values(default,#{name},#{userName},#{phone},#{password},#{grade},#{loginTime},#{loginIp},#{isAble})")
	int insUser(User user);
	/**
	 * 修改用户信息
	 * @param user
	 * @return
	 */
	@Update("update admin set name=#{name},username=#{userName},phone=#{phone},password=#{password},grade=#{grade} where id=#{id}")
	int updUser(User user);
	/**
	 * 查询各用户文章数
	 * @param id
	 * @return
	 */
	@Select("select count(*) from article where uid=#{0}")
	int selArticleCount(int id);
	/**
	 * 查询用户列表
	 * @return
	 */
	@Select("select * from admin")
	List<ManageUser> selAll();
	/**
	 * 查询用户个数
	 * @return
	 */
	@Select("select count(*) from admin")
	int selUserCount();
	/**
	 * 更新最后一次登陆的时间和 ip
	 * @param id
	 * @param loginTime
	 * @param ip
	 * @return
	 */
	@Update("update admin set logintime=#{1},loginip=#{2} where id=#{0}")
	int updLoginTime(int id,String loginTime,String ip);
	/**
	 * 用 id 查询用户
	 * @param id
	 * @return
	 */
	@Select("select * from admin where id=#{0}")
	User selById(int id);
	/**
	 * 删除用户
	 * @param id
	 * @return
	 */
	@Delete("delete from admin where id=#{0}")
	int delUser(int id);
	/**
	 * 修改用户状态
	 * @param id
	 * @param able
	 * @return
	 */
	@Update("update admin set isable=#{1} where id=#{0}")
	int updAble(int id,int able);
	/**
	 * 添加登陆日志
	 * @param loginLog
	 * @return
	 */
	@Insert("insert into loginlog values(default,#{userName},#{loginTime},#{loginIp},#{uid})")
	int insLoginLog(LoginLog loginLog);
	/**
	 * 删除登陆日志
	 * @param id
	 * @return
	 */
	@Delete("delete from loginlog where id=#{0}")
	int delLoginLog(int id);
	/**
	 * 查询登陆日志列表
	 * @return
	 */
	@Select("select * from loginlog")
	List<LoginLog> selLoginLog();
	/**
	 * 查询登陆日志总条数
	 * @return
	 */
	@Select("select count(*) from loginlog")
	int selLoginLogCount();
	/**
	 * 用ID查询登陆日志总条数
	 * @param id
	 * @return
	 */
	@Select("select count(*) from loginlog where uid=#{0}")
	int selLoginLogCountById(int id);
	/**
	 * 分页查询登陆日志
	 * @param map
	 * @return
	 */
	@Select("select * from loginlog limit #{pageStart},#{pageSize}")
	List<LoginLog> selByPage(Map<String, Object> map);
}
