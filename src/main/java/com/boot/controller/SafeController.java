package com.boot.controller;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.pojo.User;
import com.boot.service.UserService;
import com.boot.tool.QQSendEmail;
import com.boot.tool.SendMailUtil;

@Controller
public class SafeController {
	@Autowired
	private UserService userService;
	@RequestMapping("/resetPassword")
	public String resetPassword(String phoneNum,String code,HttpSession session,Model model){
		
		if(session.getAttribute("message")==null){
			model.addAttribute("error", "请获取验证码");
			return "login/findPassword";
		}
		String msg =(String)session.getAttribute("message");
		if(!code.equals(msg)){
			model.addAttribute("error", "验证码错误,请重新获取");
			return "login/findPassword";
		}
		model.addAttribute("phoneNum", phoneNum);
		
		return "login/resetPassword";
	}
	@RequestMapping("/updatePassword")
	public String updatePassword(String password,String phoneNum){
		//查询当前用户信息
		User user = userService.ajaxPhoneNum(phoneNum);		
		userService.updatePasswordByphone(password,phoneNum);
		//SendMailUtil.send(user.getEmail(),"<p>你的密码修改成功,请牢记密码哟亲!</p><a href='localhost:8090'>进入网站</a>","易通市场");
		try {
			QQSendEmail.sendMessage("易通市场", "你的密码修改成功,请牢记密码哟亲!", user.getEmail());
		} catch (MessagingException e) {
			
			e.printStackTrace();
		}
		return "/login/login";
	}
	
	@RequestMapping("/reset")
	public String reset(String phoneNum,Model model){
		
		
		model.addAttribute("phoneNum", phoneNum);
		
		return "login/resetPassword";
	}
	
	
}
