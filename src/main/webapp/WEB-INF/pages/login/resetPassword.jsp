<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../base.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>安全中心</title>
<link href="${ctx}/css/base.css" rel="stylesheet" type="text/css">
<link href="${ctx}/css/css.css" rel="stylesheet" type="text/css">
<link href="${ctx}/css/regist.css" rel="stylesheet" type="text/css">
<script src="${ctx}/js/jquery-2.1.1.min.js"></script>
<script src="${ctx}/js/jquery.js"></script>
<script src="${ctx}/js/jquery.validate.min.js"></script>
<script src="${ctx}/js/messages_zh.min.js"></script>
<script src="${ctx}/js/additional-methods.js"></script>
<script src="${ctx}/js/jquery.validate.extend.js"></script>
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
	
		
		var demo=$("#regForm").validate({
			//验证通过提交参数
	        submitHandler:function(){
	        	ajaxSubmit()
	        },

	        rules: {			

	            password:{
	                required: true,
	                minlength: 6,
	                maxlength: 16
	            	
	            },
	            repassword:{
	                required: true,
	                equalTo: "#password"	                
	            }	 	   				
			},
	        messages:{	  
	            password:{
	                required: "密码不能为空",
	                minlength: "密码长度不能少于6个字符",
	                maxlength: "密码长度不能超过16个字符"
	            },
	            repassword:{
	                required: "确认密码不能为空",
	                equalTo: "确认密码和密码不一致"
	            }        		
	        }		
	        	        	        	        	        	        	        
			});						
		});	
									
	function ajaxSubmit(){
		var url="${ctx}/updatePassword";
	    document.forms[0].action = url;
	    document.forms[0].submit();	
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
<div class="l_main2" style="height: 300px">
    <div class="l_bttitle"> 
        <h2>安全中心--密码重置</h2>
    </div>
    <div class="loginbox" style="width: 500px">    	
		<form  style="" id="regForm" method="post">
		<fieldset>
			 <input type="hidden"  name="phoneNum" value="${phoneNum}"/>       	  
            <div class="item">
                <label for="password" class="item-label">新密码:</label>
                <input type="password" id="password" name="password" class="item-text" 
                placeholder="设置密码" tip="长度为6-16个字符">
            </div>
            <div class="item">
                <label for="password" class="item-label">确认密码:</label>
                <input type="password" name="repassword" class="item-text" placeholder="设置确认密码">
            </div>
			 <div class="item" style="margin-left: 120px">
                <input type="submit" id="subtj" value="修改" class="loginbtn">
            </div>
  		</fieldset>
  		</form>

 
  </div>
</div>
</body>
</html>
