package com.boot.mapper;

import com.boot.pojo.Order;
import com.boot.pojo.User;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface UserMapper { 
	
	public List<User> findAll();

	@Select("select * from user_p where username=#{username}")
	public User ajaxCheckName(String username);
    
	public void updateUser(User user);
	
	public User findUserByName(String username);
	
	@Select("select * from user_p where phone_num=#{phoneNum}")
	public User ajaxPhoneNum(String phoneNum);
	@Select("select * from user_p where username=#{username} and password=#{password}")
	public User longinByUP(@Param("username")String username, @Param("password")String password);
	@Update("update user_p set password=#{password} where phone_num=#{phoneNum}")
	public void updatePasswordByphone(@Param("password")String password, @Param("phoneNum")String phoneNum);

	public void insertUser(User user);

}
