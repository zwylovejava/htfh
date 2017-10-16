package com.boot.mapper;

import org.apache.ibatis.annotations.Select;

import com.boot.pojo.User;

public interface UserInfoMapper {

	public void updateUserInfo(User user);

	@Select("select credit from user_info where user_info_id = #{userId}")
	public String findCreditByUserInfoId(String userId);

}
