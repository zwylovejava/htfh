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
			if(val==""){
		        layer.msg('手机号码不能为空', {
		            time: 800, //0.5s后自动关闭
		            
		        }); 
	
			}else if(!/^1[3-9]\d{9}$/.test(val)){
		        layer.msg('手机号码格式不正确', {
		            time: 800, //0.5s后自动关闭
		            
		        }); 
			}else{				
				time(this);
				var param={"phoneNum":val};
				$.post(url,param);
			}			
		});		
		var demo=$("#regForm").validate({
			//验证通过提交参数
	        submitHandler:function(){
	        	ajaxSubmit()
	        },
			rules: {				          
	            phoneNum:{
	            	required: true,
	            	isphone:true,
	                remote:{
	                    url:"ajaxPhone",
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
	            phoneNum:{
	            	required: "手机号不能为空",
	            	isphone:"手机格式不正确",
	            	remote:"该手机号码未注册不能使用!"
	            },            
	            code:{
	            	required: "请填写手机验证码",        
	            	remote:"验证码不正确请重试"
	            }           		
	        }		
		});						
		});	
										
	function ajaxSubmit(){
		var url="${ctx}/resetPassword";
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
<div class="l_main2" style="height: 300px">
    <div class="l_bttitle"> 
        <h2>安全中心--找回密码</h2>
    </div>
    <div class="loginbox" style="width: 500px">    	
		<form  style="" id="regForm" method="post">
		    <span style="color: RED;font-size: 18PX">
        	<c:if test="${!empty error}">
					${error}
		    </c:if>
		    </span>
		<fieldset>        	  
            <div class="item">
                <label for="phone" class="item-label">手机号码:</label>
                <input type="text" id="phoneNum" name="phoneNum" class="item-text" placeholder="输入手机号码" tip="请输入手机号码"/>
            </div>
            <div class="item">
                <label for="code" class="item-label">验证码:</label>
                <input type="button" id="yzm" name="yzm" class="fl same-code" value="获取验证码"/>
        		<input type="text" class="loginuser2" id="code" name="code" placeholder="输入验证码"/>
            </div>
			 <div class="item" style="margin-left: 120px">
                <input type="submit" id="subtj" value="下一步" class="loginbtn">
            </div>
  		</fieldset>
  		</form> 
  </div>
</div>
</body>
</html>
