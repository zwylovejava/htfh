<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>后台管理系统</title>
<meta name="author" content="DeathGhost" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/backstyle.css">
<script src="${ctx}/js/jquery-1.8.3.min.js"></script>
<script src="${ctx}/js/jquery.js"></script>
<script src="${ctx}/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script>

	(function($){
		$(window).load(function(){
			
			$("a[rel='load-content']").click(function(e){
				e.preventDefault();
				var url=$(this).attr("href");
				$.get(url,function(data){
					$(".content .mCSB_container").append(data); //load new content inside .mCSB_container
					//scroll-to appended content 
					$(".content").mCustomScrollbar("scrollTo","h2:last");
				});
			});
			
			$(".content").delegate("a[href='top']","click",function(e){
				e.preventDefault();
				$(".content").mCustomScrollbar("scrollTo",$(this).attr("href"));
			});
			
		});
	})(jQuery);
</script>
</head>
<body>
<%-- <%@ include file="head.jsp"%> --%>

<section class="#">
 <div class="rt_content">
      <div class="page_title">
       <h2 class="fl">订单详情</h2>
      </div>
      <table class="table">
       <tr>
       	<td>下单用户：${user.username}</td>
        <td>收件人：${address.receiveP }</td>
        <td>联系电话：${address.phone }</td>
        <td>收件地址：${address.area },${address.street }</td>
       </tr>
       <tr>
       	<td>订单ID：${order.orderId }</td>
        <td>下单时间：<fmt:formatDate value="${order.orderTime }" pattern="yyyy-MM-dd"/> </td>
        <td id="orderState">
        	<c:if test="${order.state == 0 && order.delivery == 0 && order.confirm == 0 }">订单状态：待付款</c:if>
        	<c:if test="${order.state == 1 && order.delivery == 0 && order.confirm == 0 }">订单状态：已付款，待发货</c:if>
        	<c:if test="${order.state == 1 && order.delivery == 1 && order.confirm == 0 }">订单状态：已发货，待收货</c:if>
        	<c:if test="${order.state == 1 && order.delivery == 1 && order.confirm == 1 }">订单状态：已收货，交易成功</c:if>
        </td>
       	<td>订单金额：${order.money}元</td>
       </tr>
      </table>
      <table class="table">
       <tr>
       	<td class="center"> 商品ID </td>
       	<td class="center"> 商品图片 </td>
       	<td class="center"> 商品名称 </td>
       	<td class="center"> 商品描述 </td>
       	<td class="center"> 商品单价 </td>
       	<td class="center"> 购买数量 </td>
       	<td class="center"> 商品总价 </td>
       	<td class="center"> 库存及店铺 </td>
       </tr>
      </table>
      <table class="table">
      <c:forEach items="${oItemsList }" var="oi" >
       <tr>
       	<td class="center">${oi.product.productId}</td>
        <td class="center"><img src="/${oi.product.imageUrl}" width="50" height="50"/></td>
        <td>${oi.product.proName}</td>
        <td class="center">${oi.product.description}</td>
        <td class="center"><strong class="rmb_icon">${oi.product.price}</strong></td>
        <td class="center"><strong>${oi.buyNum}</strong></td>
        <td class="center"><strong class="rmb_icon">${oi.product.price * oi.buyNum}</strong></td>
        <td class="center">
         <p>库存：${oi.product.pnum}</p>
         <p>店铺：${oi.product.shop}</p>
        </td>
       </tr>
      </c:forEach>
      </table>
      
      <aside class="mtb" style="text-align:right;">
       <input id="toDelive" type="button" value="发货" class="group_btn" onclick="toDelivery();"/>
      </aside>
       <script type="text/javascript">
	       $(document).ready(function(){
		       	var state = $("#orderState").text().trim();
		       	if(state != "订单状态：已付款，待发货") {
		       		$("#toDelive").removeAttr("onclick");
		       	}
	       });
       		function toDelivery(){
	       		window.location.href="/toDelivery/${order.orderId}.action"
       		}
       </script>
 </div>
</section>
</body>
</html>
