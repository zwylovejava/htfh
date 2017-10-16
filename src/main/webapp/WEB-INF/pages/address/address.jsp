<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/user_style.css" rel="stylesheet" type="text/css" />
<link href="/skins/all.css" rel="stylesheet" type="text/css" />
<script src="/js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="/js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
<script src="/js/common_js.js" type="text/javascript"></script>
<script src="/js/footer.js" type="text/javascript"></script>
<script src="/layer/layer.js" type="text/javascript"></script>
<script src="/js/iCheck.js" type="text/javascript"></script>
<script src="/js/custom.js" type="text/javascript"></script>
<script src="/js/address.js" type="text/javascript"></script>
<title>用户中心-收货地址</title>
</head>

<body>
<%@include file="/home/head.jsp" %>

<!--用户中心样式-->
<div class="user_style clearfix">
 <div class="user_center clearfix">
 
 
 
   <!--左侧样式-->
		<div class="left_style">
			<div class="menu_style">
				<div class="user_title">用户中心</div>
				<div class="user_Head">
					<div class="user_portrait">
						<a href="#" title="修改头像" class="btn_link"></a> <img
							src="${ctx}/images/people.png">
						<div class="background_img"></div>
					</div>
					<div class="user_name">
						<p>
							<span class="name">${sessionScope.LoginUser.username}</span><a
								href="${ctx}/reset?phoneNum=${sessionScope.LoginUser.phoneNum}">[修改密码]</a>
						</p>
					</div>
				</div>
				<div class="sideMen">
					<!--菜单列表图层-->
					<dl class="accountSideOption1">
						<dt class="transaction_manage">
							<em class="icon_1"></em>订单管理
						</dt>
						<dd>
							<ul>
								<li><a href="${ctx}/toOrder.action">我的订单</a></li>
								<li><a href="${ctx}/address/toaddress">收货地址</a></li>
							</ul>
						</dd>
					</dl>
					<dl class="accountSideOption1">
						<dt class="transaction_manage">
							<em class="icon_2"></em>会员管理
						</dt>
						<dd>
							<ul>
								<li><a href="${ctx}/user/userhome"> 用户信息</a></li>
								<li><a href="${ctx}/user/userCollect"> 我的收藏</a></li>
							</ul>
						</dd>
					</dl>
					<dl class="accountSideOption1">
						<dt class="transaction_manage">
							<em class="icon_3"></em>账户管理
						</dt>
						<dd>
							<ul>
								<li><a href="${ctx}/user/userCredit">诚信度</a></li>
								<li><a href="${ctx}/user/userSpending">消费记录</a></li>
							</ul>
						</dd>
					</dl>
					<dl class="accountSideOption1">
						<dt class="transaction_manage">
							<em class="icon_4"></em>分销管理
						</dt>
					</dl>
				</div>
				<script>
					jQuery(".sideMen").slide({
						titCell : "dt",
						targetCell : "dd",
						trigger : "click",
						defaultIndex : 0,
						effect : "slideDown",
						delayTime : 300,
						returnDefault : true
					});
				</script>
			</div>

		</div>
 <!--右侧样式属性-->
 <div class="right_style">
 <!--地址管理-->
  <div class="user_address_style">
    <div class="title_style"><em></em>地址管理</div> 
   <div class="add_address">
    <span class="name">添加送货地址</span>
    
    
    <!--======================================地址管理=====================-->
    
    <form action="/address/addressadd" method="post" onsubmit="return checkform();">
     <script type="text/javascript">
    function checkform(){
  	  return check1&&check2&&check3;
    }
    </script>
    <table cellpadding="0" cellspacing="0" width="100%">        
     <tr><td class="label_name">收&nbsp;货&nbsp;&nbsp;人：</td><td><input id="receiveP" name="receiveP" type="text"  class="add_text" style=" width:100px"/><i>*</i></td></tr>
     <tr><td class="label_name">所在地区：</td><td>
     			<select size="1">
     					<option value="1" selected="selected">中国</option>
           	 	</select>   
	            <select size="1" id="cmbProvince" name="cmbProvince"></select>  
	            <select size="1" id="cmbCity" name="cmbCity"></select>  
	            <select size="1" id="cmbArea" name="cmbArea"></select>   
               <script type="text/javascript">  
                    addressInit('cmbProvince', 'cmbCity', 'cmbArea');  
               </script>  
            
            
            
            <i>*</i></td></tr>
     <tr><td class="label_name">街道地址：</td><td><textarea id="street" name="street" cols="" rows="" style=" width:500px; height:100px; margin:5px 0px"></textarea><i>*</i></td></tr>
     <tr><td class="label_name">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;编：</td><td><input name="zcode" type="text" class="add_text" style=" width:100px"/>&nbsp;&nbsp;(选填)</td></tr>
     <tr><td class="label_name">手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机：</td><td><input id="phone" name="phone" type="text" class="add_text" style=" width:200px"/><i>*</i></td></tr>
     <tr><td class="label_name">固定电话：</td>
     <td><input name="tel_1" type="text" class="add_text" style="width:60px" placeholder="区号"/>-<input name="tel_2" type="text" class="add_text" style="width:100px" placeholder="电话号码"/>-<input name="tel_3" type="text" class="add_text" style="width:60px" placeholder="分机号"/>&nbsp;&nbsp;(选填)</td></tr>
     <tr class="moren_dz" style="color: #999"><td class="label_name"></td><td><label>  <input name="addr" type="checkbox" value="1" checked="checked" />设置为默认地址</label>
     	<input name="ordersend" value="${ordersend}" hidden="hidden"/>
     
     </td></tr>
     
      	<tr><td colspan="2" class="center"><input  name="" type="submit" value="保存"  class="add_dzbtn"/><input name="" type="reset" value="清空"  class="reset_btn"/></td></tr>
      	
    </table>
    </form>
       
   </div>
   <!--用户地址-->
   <div class="address_content">
   
   <!--======================================地址管理=====================-->
    <div class="address_prompt">以添加了${addressNum}条地址，最多保存添加15条地址</div>
    <table cellpadding="0" cellspacing="0" class="user_address" width="100%">
    <thead>
     <tr class="label"><td width="80px;">收货人</td><td width="180px;">所在地</td><td width="220px;">详细地址</td><td width="80px;">邮编</td><td width="120px;">电话手机</td><td width="180px;">固话</td><td width="80px;">操作</td></tr>
     </thead>
     <tbody>
     	<c:forEach items="${addressList}" var="add">
     	 	<tr><td>${add.receiveP}</td><td>${add.area}</td><td>${add.street}</td><td>${add.zcode}</td>
      		<td>${add.phone}</td><td>${add.tel}</td><td><!-- <a href="#">修改</a> |  --><a href="/address/addressdel?receiveId=${add.receiveId}">删除</a></td></tr>
     	</c:forEach>
     </tbody>
    </table>
    <!--======================================地址管理=====================-->
    
    
    
   </div>  
  </div>
 </div>
 </div>
 </div>
     <script>
            $(document).ready(function(){
              $("#receiveP").bind("blur",function(){
            	  var value = $(this).val().trim();
            	  if(value==""){
            		  $(this).next().text("不能为空");
            		  check1 = false;
            	  }else{
            		  $(this).next().text("*")
            		  check1 = true;
            	  }
              });
              $("#street").bind("blur",function(){
            	  var value = $(this).val().trim();
            	  if(value==""){
            		  $(this).next().text("不能为空");
            		  check2 = false;
            	  }else{
            		  $(this).next().text("*")
            		  check2 = true;
            	  }
              });
              $("#phone").bind("blur",function(){
            	  var value = $(this).val().trim();
            	  var reg = /^\d{11}$/;
            	  if(reg.test(value)){
            		  $(this).next().text("*");
            		  check3 = true;
            	  }else{
            		  $(this).next().text("格式不正确");
            		  check3 = false;
            	  }
              });
              
            });
          </script>
 <!--网站地图-->
<!--网站地图END-->
<!--网站页脚-->
<%@include file="/home/foot.jsp" %>
</body>
</html>
