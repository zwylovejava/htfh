package com.boot.controller;

import com.boot.pojo.Order;
import com.boot.pojo.User;
import com.boot.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;
    
    @RequestMapping("/userhome")
    public String userHome(HttpSession session) {
    	//不允许跳过登陆，访问该页面
    	if(session.getAttribute("LoginUser") == null) {
    		return "login/login";
    	}
    	User user = userService.findUserByName(((User)session.getAttribute("LoginUser")).getUsername());
    	session.setAttribute("LoginUser", user);
    	return "user/userInfo";
    }
    
    @RequestMapping("/updateUser")
    public String updateUser(User user) {
    	userService.updateUser(user);
    	return "redirect:/user/userhome";
    }
    
    @RequestMapping("/userSpending")
    public String userSpending(HttpSession session) {
    	//不允许跳过登陆，访问该页面
    	if(session.getAttribute("LoginUser") == null) {
    		return "login/login";
    	}
    	String userId = ((User)session.getAttribute("LoginUser")).getUserId();
    	List spendInfo = userService.findSpendById(userId);
    	session.setAttribute("spendMonth", (String[])spendInfo.get(0));
    	session.setAttribute("spendMoney", (Integer[])spendInfo.get(1));
    	return "user/userSpending";
    }
    
    @RequestMapping("/userCollect")
    public String userCollect(HttpSession session) {
    	//不允许跳过登陆，访问该页面
    	if(session.getAttribute("LoginUser") == null) {
    		return "login/login";
    	}
    	String[] productStr = {"手机","电脑","电视","冰箱","洗衣机"}; 
    	List<Integer> sellNumList = userService.findSellNumList(productStr); 
    	session.setAttribute("productStr", productStr);
    	session.setAttribute("sellNumList", sellNumList);
    	return "user/userCollect";
    }
    
    @RequestMapping("/userCredit")
    public String userCredit(HttpSession session) {
    	//不允许跳过登陆，访问该页面
    	if(session.getAttribute("LoginUser") == null) {
    		return "login/login";
    	}
    	String userCredit = userService.findCreditByUserInfoId(((User)session.getAttribute("LoginUser")).getUserId());
    	session.setAttribute("userCredit", userCredit);
    	return "user/userCredit";
    }

}
