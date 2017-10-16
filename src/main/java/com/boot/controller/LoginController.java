package com.boot.controller;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aliyuncs.exceptions.ClientException;
import com.boot.pojo.User;
import com.boot.service.UserService;
import com.boot.tool.QQSendEmail;
import com.boot.tool.SendMailUtil;
import com.boot.tool.ValidateEmailWebService;
import com.boot.tool.ValidateMessage;

@Controller
public class LoginController {
	@Autowired
	private UserService userService;
	@RequestMapping("/regist")
	public String regist(){
		return "/login/regist";
	}
	@RequestMapping("/login")
	public String login(){
		return "/login/login";
	}
	@RequestMapping("/tologin")
	public String tologin( HttpServletResponse response,String username,String password,Model model,HttpSession session){
		if(StringUtils.isEmpty(username)||StringUtils.isEmpty(password)){
			model.addAttribute("errorInfo", "用户名或密码为空");
			return "/login/login";
		}
		//1.获取subject对象
		Subject subject = SecurityUtils.getSubject();
		
		//2.定义登陆的令牌/票  将用户名和密码包装为令牌
		UsernamePasswordToken token = new UsernamePasswordToken(username, password);
		
		
		//3.通过subject进行登陆操作
		try {
			subject.login(token);		
			
			//获取用户的真实信息
			User user = (User) subject.getPrincipal();			
			session.setAttribute("LoginUser", user);
			return "redirect:/home.action";  //如果登陆成功，shiro将会放行所有的请求		
			
		} catch (AuthenticationException a) {
			//表示登录失败
			model.addAttribute("errorInfo", "用户名或密码错误");
			a.printStackTrace();
			return "/login/login";
		} catch (Exception e){
			//表示一些未知错误
			e.printStackTrace();
			model.addAttribute("errorInfo", "发现未知错误，联系管理员！！");
			return "/login/login";
		}
		
		
		/*User user = userService.longinByUP(username,password);
		if(user==null){
			model.addAttribute("errorInfo", "用户名或密码错误");
			return "/login/login";
		}
		session.setAttribute("LoginUser", user);
		String jsessionid = session.getId();*/

	
	}
	@RequestMapping("logout")
	public String logout(HttpSession session){
		session.removeAttribute("LoginUser");
		return "redirect:/home.action";
	}	
	
	
	@RequestMapping("/findPassword")
	public String findPassword(){
		return "/login/findPassword";
	}
	@RequestMapping("/ajaxCheckname")
	public void check(String username,HttpServletResponse response) throws IOException {
		User user = userService.ajaxCheckName(username);
		response.getWriter().write(user==null?"true":"false");
	}
	@RequestMapping("/ajaxPhoneNum")
	public void ajaxPhoneNum(String phoneNum,HttpServletResponse response) throws IOException {
		User user = userService.ajaxPhoneNum(phoneNum);
		
		response.getWriter().write(user==null?"true":"false");
	}
	@RequestMapping("/ajaxPhone")
	public void ajaxPhone(String phoneNum,HttpServletResponse response) throws IOException {
		User user = userService.ajaxPhoneNum(phoneNum);
		response.getWriter().write(user==null?"false":"true");
	}
	@RequestMapping("/ajaxSendMessage")
	public void ajaxSendMessage(String phoneNum,HttpServletResponse response,HttpSession session) throws IOException {
		//产生随机4位数字	
		String code = (int)((Math.random()*9+1)*1000)+"";
		try {
			ValidateMessage.sendSms(phoneNum,code);
			session.setAttribute("message", code);			
		} catch (ClientException e) {
			response.getWriter().write("短信发送失败!");
			e.printStackTrace();
		}
		
	}	
	@RequestMapping("/ajaxCheckEmai")
	public void checkEmail(String email,HttpServletResponse response) throws IOException {
		ValidateEmailWebService vali = new ValidateEmailWebService();
		short num = vali.getValidateEmailWebServiceSoap().validateEmailAddress(email);
		
		response.getWriter().write(num==1||num==0?"true":"false");
	}
	@RequestMapping("/ajaxCheckCode")
	public void ajaxCheckCode(String code,HttpServletResponse response,HttpSession session) throws IOException {		
		if(session.getAttribute("message")==null){
			response.getWriter().write("false");
			return;
		}
		String msg = (String)session.getAttribute("message");
		if(!msg.equals(code)){
			response.getWriter().write("false");
			return;
		}		
		response.getWriter().write("true");
	}
	@RequestMapping("/toregist")
	public String toregist(User user,HttpServletResponse response) throws IOException{		
		userService.insertUser(user);
		//SendMailUtil.send(user.getEmail(),"<p>恭喜你注册本网站,祝你购物愉快</p><a href='localhost:8090'>进入网站</a>","易通市场");	
		try {
			QQSendEmail.sendMessage("易通市场", "恭喜你注册本网站,祝你购物愉快", user.getEmail());
		} catch (MessagingException e) {
			
			e.printStackTrace();
		}
		return "forward:/home";
	}
	
}
