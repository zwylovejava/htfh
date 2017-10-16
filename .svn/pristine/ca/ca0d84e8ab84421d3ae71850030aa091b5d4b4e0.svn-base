<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../base.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${ctx}/css/orderPay.css" rel="stylesheet" type="text/css">
<title>订单管理</title>
</head>

<body>
<!-- 引入页头 -->
<%@ include file="/home/head.jsp" %>
	<div align="center">
	<dl class="Order_information">
		<dt>
			<h3>订单信息</h3>
		</dt>
		<dd>
			订单编号：${order.orderId}<br />
			下单时间：<fmt:formatDate value="${order.orderTime}" pattern="yyyy-MM-dd"/><br /> 
			订单金额：${order.money}元<br /> 
			支付状态：
			 <c:if test="${order.state==0 }">
					<font color="red">未支付</font>&nbsp;&nbsp;&nbsp;
					<a href="${ctx}/deleteOrder/${order.orderId }.action"><img src="${ctx}/images/orderPay/sc.jpg" width="69" height="19"></a> 
			 		<a href="${ctx}/pay/${order.orderId}/${order.money}.action"> <img src="${ctx}/images/orderPay/zx.jpg" width="69" height="19"></a><br /> 
			 </c:if>
			 <c:if test="${order.state==1 }">
					<font color="blue">已支付</font><br/><br/><br/>
			 </c:if>
			 收货人：${address.receiveP}<br/> 
			 收货地址：${address.area},${address.street}<br/> 
			 收货邮编：${address.zcode}<br/> 
			 手机号码：${address.phone}<br/> 
			 支付方式：在线支付
		</dd>
	</dl>

	<table width="1200" border="0" cellpadding="0"
		cellspacing="1" style="background:#d8d8d8;color:#333333">
		<tr>
			<th width="276" height="30" align="center" valign="middle" bgcolor="#f3f3f3">商品图片</th>
			<th width="247" align="center" valign="middle" bgcolor="#f3f3f3">商品名称</th>
			<th width="231" align="center" valign="middle" bgcolor="#f3f3f3">商品单价</th>
			<th width="214" align="center" valign="middle" bgcolor="#f3f3f3">购买数量</th>
			<th width="232" align="center" valign="middle" bgcolor="#f3f3f3">小计</th>
		</tr>
		<c:forEach items="${oItemsList }" var="oi">
		<tr>
			<td align="center" valign="middle" bgcolor="#FFFFFF">
				<img src="/${oi.product.imageUrl}" width="90" height="105">
			</td>
			<td align="center" valign="middle" bgcolor="#FFFFFF">${oi.product.proName }</td>
			<td align="center" valign="middle" bgcolor="#FFFFFF">${oi.product.price}元</td>
			<td align="center" valign="middle" bgcolor="#FFFFFF">${oi.buyNum }件</td>
			<td align="center" valign="middle" bgcolor="#FFFFFF">${oi.product.price * oi.buyNum}元</td>
		</tr>
		</c:forEach>
	</table>
	<div class="Order_price">${order.money }元</div>
	</div>
<!--引入页脚-->
	<%@ include file="/home/foot.jsp" %>
</body>
</html>
