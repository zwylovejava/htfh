<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../base.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>注册</title>
<link href="${ctx}/css/base.css" rel="stylesheet" type="text/css">
<link href="${ctx}/css/css.css" rel="stylesheet" type="text/css">
<link href="${ctx}/css/regist.css" rel="stylesheet" type="text/css">
<script src="${ctx}/js/jquery-2.1.1.min.js"></script>
<script src="${ctx}/js/jquery.js"></script>
<script src="${ctx}/js/jquery.validate.min.js"></script>
<script src="${ctx}/js/messages_zh.min.js"></script>
<script src="${ctx}/js/additional-methods.js"></script>
<script src="${ctx}/js/jquery.validate.extend.js"></script>
<script src="${ctx}/layer/layer.js"></script>
<style>
.tab {
	overflow: hidden;
	margin-top: 20px; margin-bottom:-1px;
}
.tab li {
	display: block;
	float: left;
	width: 100px;padding:10px 20px; cursor:pointer; border:1px solid #ccc; 
}
.tab li.on {
	background: #90B831; color:#FFF;padding:10px 20px;
}
.conlist {padding:30px; border:1px solid #ccc; width:300px;}
.conbox {
	display: none;
}
</style>
<script>
var wait=60;
$(function(){			
	$("#yzm").click(function(){
		
		var url="${ctx}/ajaxSendMessage";
		var val=$("#phoneNum").val();
		if(val!=""){
		time(this);
		var param={"phoneNum":val};
		$.post(url,param);
		}else{
	        layer.msg('手机号码不能为空', {
	            time: 800, //0.8s后自动关闭
	            
	        }); 
		
	       
		}
		
	});
	
	
	var demo=$("#regForm").validate({
		//验证通过提交参数
        submitHandler:function(){
        	ajaxSubmit()
        },
		rules: {			
            username: {
                required: true,
                minlength: 2,
                remote:{
                    url:"ajaxCheckname",
                    type:"post"
                }
            },
            password:{
                required: true,
                minlength: 6,
                maxlength: 16
            	
            },
            repassword:{
                required: true,
                equalTo: "#password"
                
            },
            phoneNum:{
            	required: true,
            	isphone:true,
                remote:{
                    url:"ajaxPhoneNum",
                    type:"post"
                }
            },
            email:{
            	required: true,
            	email:true,
                remote:{
                    url:"ajaxCheckEmai",
                    type:"post"
                }
            },
            code:{
            	required: true,
                remote:{
                    url:"ajaxCheckCode",
                    type:"post"
                }
            }
			
		},
        messages:{
            username:{
                required: "用户名不能为空",
                minlength: "用户名的最小长度为2",
                remote:"该用户名已存在！"
            },
            password:{
                required: "密码不能为空",
                minlength: "密码长度不能少于6个字符",
                maxlength: "密码长度不能超过16个字符"
            },
            repassword:{
                required: "确认密码不能为空",
                equalTo: "确认密码和密码不一致"
            },
            phoneNum:{
            	required: "手机号不能为空",
            	isphone:"手机格式不正确",
            	remote:"该手机号码已被注册！"
            },            
            email:{
            	required: "请填写邮件",
            	email:"邮箱格式不正确",
            	remote:"请输入有效邮箱"
            },           		
            code:{
            	required: "请填写手机验证码",        
            	remote:"验证码不正确请重试"
            },           		
        }		
	});											
	});	

	function ajaxSubmit(){
		var url="${ctx}/toregist";
	    document.forms[0].action = url;
	    document.forms[0].submit();	
	}
	function time(o) { 
        if (wait == 0) { 
            o.removeAttribute("disabled");           
            o.value="获取验证码"; 
            wait = 60; 
        } else { 
            o.setAttribute("disabled", true); 
            o.value=wait+"秒后可以重新获取"; 
            wait--; 
            setTimeout(function() { 
                time(o) 
            }, 
            1000) 
        } 
    } 
	
	

</script>
</head>

<body class="l-bg">
<div class="login-top">
    <div class="wrapper">
        <div class="fl font30"><img src="${ctx}/images/login.png" height="60px"/></div>
        <div class="fr">您好，欢迎使用易通市场！</div>
    </div>
</div>
<div class="l_main2" >
    <div class="l_bttitle"> 
        <h2>注册<a href="${ctx}/home" style="font-size: 18px;margin-left: 420px">< 返回首页</a></h2>
    	
    </div>
    <div class="loginbox">
        <form  style="" id="regForm" method="post">
		<fieldset> 
		 <span id="sp1"></span>       
            <div class="item">
                <label for="username" class="item-label">用户名:</label>
                <input type="text" id="username" name="username" class="item-text" placeholder="设置用户名"
                autocomplete="off" tip="请输入用户名">
            </div>
            <div class="item">
                <label for="password" class="item-label">密码:</label>
                <input type="password" id="password" name="password" class="item-text" 
                placeholder="设置密码" tip="长度为6-16个字符">
            </div>
            <div class="item">
                <label for="password" class="item-label">确认密码:</label>
                <input type="password" name="repassword" class="item-text" placeholder="设置确认密码">
            </div>
            <div class="item">
                <label for="phone" class="item-label">手机号码:</label>
                <input type="text" id="phoneNum" name="phoneNum" class="item-text" placeholder="输入手机号码" tip="请输入手机号码">
            </div>
             <div class="item">
                <label for="code" class="item-label">验证码:</label>
                <input type="button" id="yzm" name="yzm" class="fl same-code" value="获取验证码"/>
        		<input type="text" class="loginuser2" id="code" name="code" placeholder="输入验证码">
            </div>


            <div class="item">
                <label for="semail" class="item-label">邮箱:</label>
                <input type="text" id="email" name="email" class="item-text" placeholder="设置邮箱" 
                autocomplete="off" tip="请输入邮箱">
            </div>
  
            <div class="item">
                <input type="submit" id="subtj" value="注册" class="loginbtn">
            </div>
        </fieldset>

     </form>
  </div>
</div>
</body>
</html>
