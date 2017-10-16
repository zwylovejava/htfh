package com.boot.service;

import java.util.List;

import com.boot.pojo.User;

public interface UserService {
	/**查询所有用户信息
	 * @return 返回所有用户信息组成的列表
	 */
    public List<User> findAll();

    /**更新用户信息
     * @param user 用户信息
     */
	public void updateUser(User user);

	/**根据用户名查询用户
	 * @param string 用户名
	 * @return 返回查询到的用户信息
	 */
	public User findUserByName(String username);
	
    public User ajaxCheckName(String username);

    /**根据电话号码查询用户
     * @param phoneNum
     * @return 
     */
	public User ajaxPhoneNum(String phoneNum);
	//验证用户名和密码登录
	public User longinByUP(String username, String password);
	/**
	 * 修改密码
	 * @param password
	 * @param phoneNum
	 */
	public void updatePasswordByphone(String password, String phoneNum);

	/**增加新用户
	 * @param user
	 */
	public void insertUser(User user);

	/**通过用户ID查询用户信誉度的方法
	 * @param userId 用户ID
	 * @return 返回用户信誉度
	 */
	public String findCreditByUserInfoId(String userId);

	/**通过用户ID查询用户消费信息
	 * @param userId 用户ID
	 * @return 返回用户消费信息数据集合
	 */
	public List<String> findSpendById(String userId);

	/**通过产品类别查询该类产品销量
	 * @param productStr 产品类别数组
	 * @return 返回查询到得产品销量
	 */
	public List<Integer> findSellNumList(String[] productStr);
}
