package com.boot.tool;

import java.security.GeneralSecurityException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMailUtil{	
	 public static final String HOST = "smtp.163.com";  
	 public static final String PROTOCOL = "smtp";  
	 public static final int PORT = 25;  
	 public static final String SENDER = "zwylovejava@163.com";//  
	 public static final String SENDERPWD = "zwy1989";  
	      
	    /** 
	     * 获取用于发送邮件的Session 
	     * @return 
	     * @throws GeneralSecurityException 
	     */  
	    public static Session getSession(){  
	        Properties props = new Properties();
	        props.put("mail.smtp.starttls.enable", "true");
	        props.put("mail.smtp.host",  HOST);//设置服务器地址  
	        props.put("mail.store.protocol" , PROTOCOL);//设置协议  
	        props.put("mail.smtp.port", PORT);//设置端口  
	        props.put("mail.smtp.auth" , true);  
	        Authenticator authenticator = new Authenticator() {  
	            @Override  
	            protected PasswordAuthentication getPasswordAuthentication() {  
	                return new PasswordAuthentication(SENDER, SENDERPWD);  
	            }  
	        };  
	        Session session = Session.getDefaultInstance(props,authenticator);  
	        return session;  
	    }	    
	    public static void send(String receiver, String content,String subject) {  
	        Session session = getSession(); 
	        //session.setDebug(true);
	        try {  
	            System.out.println("-------开始发送-------");  
	            Message msg = new MimeMessage(session);
	/*            msg.addHeader("X-Priority", "3");
	            msg.addHeader("X-MSMail-Priority", "Normal");
	            msg.addHeader("X-Mailer", "Microsoft Outlook Express 6.00.2900.2869");
	            msg.addHeader("X-MimeOLE", "Produced By Microsoft MimeOLE V6.00.2900.2869");
	            msg.addHeader("ReturnReceipt", "1");*/
	            //设置message属性  
	            msg.setFrom(new InternetAddress(SENDER));  
	            InternetAddress[] addrs = {new InternetAddress(receiver)};  
	        
	            msg.setRecipients(Message.RecipientType.TO, addrs);  
	          
	            msg.setSubject(subject);  
	            msg.setSentDate(new Date());  
	            msg.setContent(content,"text/html;charset=utf-8");  
	            //开始发送  
	            Transport.send(msg);  
	                        System.out.println("-------发送完成-------");  
	        } catch (AddressException e) {  
	            e.printStackTrace();  
	        } catch (MessagingException e) {  
	            e.printStackTrace();  
	        }  
	    } 
	    public static void main(String[] args) {
	    	send("daohaosi105@163","我的一个朋友","朋友你好");
		}
	    
	    

}
