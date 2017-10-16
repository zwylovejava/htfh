package com.boot.tool;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Message.RecipientType;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class QQSendEmail {
	public static void sendMessage(String subject,String context,String sendto)throws AddressException,MessagingException{		
	  Properties properties = new Properties();
	  properties.put("mail.transport.protocol", "smtp");// 连接协议        
	  properties.put("mail.smtp.host", "smtp.qq.com");// 主机名        
	  properties.put("mail.smtp.port", 465);// 端口号        
	  properties.put("mail.smtp.auth", "true");        
	  properties.put("mail.smtp.ssl.enable", "true");//设置是否使用ssl安全连接      
	  properties.put("mail.debug", "false");//设置是否显示debug信息  true 会在控制台显示相关信息        
	  Session session = Session.getInstance(properties);         
	  Message message = new MimeMessage(session);        
	 message.setFrom(new InternetAddress("19664738@qq.com"));       
	 message.setRecipients(RecipientType.TO,new InternetAddress[] { new InternetAddress(sendto) });       
	message.setSubject(subject);        
	message.setContent("<p>内容为:"+ context+"</p><a href='http://176.114.24.75:8090'>回到网站</a>","text/html;charset=utf-8");
	Transport transport = session.getTransport();         
	transport.connect("19664738@qq.com", "xdsnikbxjuphcbdf"); 
	 transport.sendMessage(message, message.getAllRecipients());    
	}
}
