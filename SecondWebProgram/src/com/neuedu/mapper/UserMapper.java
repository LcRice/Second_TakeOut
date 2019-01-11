package com.neuedu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.neuedu.entity.Orderdetail;
import com.neuedu.entity.User;

public interface UserMapper {
	// 用户注册
	int insertUser(User user);
	
	// 根据用户名，密码来查找用户---登录
	List<User> findUser(User user);

	
	/*// 根据usernumber查找用户---注册
	User checkUsernumber(String usernumber);*/

	// 根据Userid查找用户
	User findUser(int userid);


	/*// 更新用户信息
	boolean updateUser(@Param("olduser")User olduser, User newuser);

	// 付款成功后更新
	boolean updateUser(User user, int price);

	// 分页查看所有用户
	List<User> findUserList(int currentPage, int pageSize);

	int findTotalCount();

	// 分页查看用户所有订单
	List<Orderdetail> findOrderList(int currentPage, int pageSize, int userid);

	int findTotalCount(int userid);*/
}
