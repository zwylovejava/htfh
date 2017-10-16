<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>订单添加页面</title>
  	<link href="${ctx}/css/addOrder.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@include file="/home/head.jsp" %>
<div class="warp">
	<form name="form1" method="post" action="${ctx}/order/orderadd">
		<h3>增加订单 </h3>
		
		<!-- ==================================================== -->
		<!-- ==================================================== -->
		
		<table cellpadding="0" cellspacing="0" class="user_address" width="100%" style="font-size: 15px;">
    <thead>
     <tr bgcolor="#B3B3B3" class="label"  ><td width="80px;">收货人</td><td width="180px;">所在地</td>
     <td width="220px;">详细地址</td><td width="80px;">邮编</td><td width="120px;">电话手机</td><td width="180px;">固话</td>
     <!-- <td width="80px;">操作</td> --><td width="80px;">选择</td></tr>
     </thead>
     <tbody id="hahahaha">
     	<c:forEach items="${addressList}" var="add">
     		
     	 	<tr name="hhhhhhhhhhhh">
     	 	
	     	 	<td>${add.receiveP}</td><td>${add.area}</td><td>${add.street}</td><td>${add.zcode}</td>
	      		<td>${add.phone}</td><td>${add.tel}</td>
	      		<%-- <td><a href="#">修改</a> | <a href="/address/addressdel?receiveId=${add.receiveId}">删除</a></td> --%>
	      		<td>
	     	 	<input type="radio" name="receiveId" value="${add.receiveId}" checked="checked" <c:if test="${add.addr==1}">checked="checked"</c:if>>
	     	 	</td>
      		</tr>
     	</c:forEach>
     </tbody>
    </table>
     
      <a style="float:right;font-size: 18px;padding: 8px;color: white;background-color: #A52A2A;font-family: 微软雅黑 "
     	href="/address/toaddress?ordersend=yes"
      >使用新地址</a>

		
		<table width="1200" height="80" border="1" cellpadding="0" cellspacing="0" bordercolor="#d8d8d8">
			<tr style="font-size: 17px;text-align: center;">
				<th width="276" align="center">商品图片</th>
				<th width="247" align="center">商品名称</th>
				<th width="231" align="center">商品单价</th>
				<th width="214" align="center">购买数量</th>
				<th width="232" align="center">小计</th>
			</tr>
		<c:set var="money" value="0"/>
		<c:forEach items="${cart_1}" var="entry">
			<tr>
				<td><img src="${ctx}/${entry.key.imageUrl}" width="90" height="90" /></td>
				<td>${entry.key.proName}</td>
				<td>${entry.key.price}元</td>
				<td>${entry.value}件</td>
				<td>${entry.key.price*entry.value}元</td>
			</tr>
			
			<c:set var="money" value="${money+entry.key.price*entry.value}"/>
			<input type="text" name="productId" value="${entry.key.productId}"  hidden="hidden">
		</c:forEach>
		
		</table>
		<div class="Order_price">总价：${money }元</div>
		<div class="add_orderbox">
			<input name="" type="submit" value="增加订单" class="add_order_but" id="submit_me_34">
		</div>

	</form>
	<script type="text/javascript">
		var hhhhhh = document.getElementsByName("hhhhhhhhhhhh");
		if(hhhhhh.length==0){
			$("#submit_me_34").attr("disabled",true).css({"background-color":"#ADADAD"});
		}
	
		$("input[name='receiveId']").bind("click",function(){
		    
		    	$("#goto_order").attr("disabled",false).css({"background-color":"#EE7621"});
		
		});
	
	</script>
	
	
	
</div>
<%@include file="/home/foot.jsp" %>
</body>
</html>