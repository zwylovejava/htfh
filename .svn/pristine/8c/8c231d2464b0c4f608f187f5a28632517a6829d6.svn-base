<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../base.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${ctx}/css/common.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/style.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/user_style.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/skins/all.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="${ctx}/js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
<script src="${ctx}/js/common_js.js" type="text/javascript"></script>
<script src="${ctx}/js/footer.js" type="text/javascript"></script>
<script src="${ctx}/layer/layer.js" type="text/javascript"></script>
<script src="${ctx}/js/iCheck.js" type="text/javascript"></script>
<script src="${ctx}/js/custom.js" type="text/javascript"></script>
<title>订单管理</title>
</head>

<body>
<!-- 引入页头 -->
<%@ include file="/home/head.jsp" %>
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
 <!--右侧样式-->
  <div class="right_style">
  <div class="title_style"><em></em>订单管理</div> 
   <div class="Order_form_style">
      <div class="Order_form_filter">
       <a href="/toOrder.action" class="">全部订单</a>
       <a href="/obligationOrder.action" class="">待付款</a>
       <a href="/deliverOrder.action" class="">待发货</a>
       <a href="/receiveOrder.action" class="">待收货</a>
       <a href="/successOrder.action" class="">交易成功</a>
      </div>
<!--       <div class="Order_Operation">
     <div class="left"> <label><input name="" type="checkbox" value=""  class="checkbox"/>全选</label> <input name="" type="submit" value="批量确认收货"  class="confirm_Order"/></div>
     <div class="right_search"><input name="" type="text"  class="add_Ordertext" placeholder="请输入产品标题或订单号进行搜索"/><input name="" type="submit" value="搜索订单"  class="search_order"/></div>
     </div>--> 
      <div class="Order_form_list">
         <table>
         <thead>
          <tr><td class="list_name_title0">商品</td>
          <td class="list_name_title1">单价(元)</td>
          <td class="list_name_title2">数量</td>
          <td class="list_name_title4">实付款(元)</td>
          <td class="list_name_title5">订单状态</td>
          <td class="list_name_title6">操作</td>
         </tr>
         </thead> 
           <c:forEach items="${orderList }" var="o">
         <tbody>       
           <tr class="Order_info"><td colspan="6" class="Order_form_time">
           	下单时间： <fmt:formatDate value="${o.orderTime}" pattern="yyyy-MM-dd"/> | 订单号：${o.orderId }<em></em></td></tr>
           <tr class="Order_Details">
           <td colspan="3">
           <table class="Order_product_style">
           <tbody>
           <c:forEach items="${oItemsList }" var="oi">
           <c:if test="${o.orderId == oi.orderId }">
           <tr>
           <!-- 商品 -->
           <td>
            <div class="product_name clearfix">
            <a href="#" class="product_img"><img src="/${oi.product.imageUrl }" width="80px" height="80px"></a>
            <a href="3" class="p_name">${oi.product.proName }</a>
            <p class="specification">${oi.product.description }</p>
            </div>
            </td>
            
            <!-- 单价 -->
            <td>${oi.product.price }</td>
            
            <!-- 数量 -->
            <td>${oi.buyNum }</td>
            </tr>
           </c:if>
           </c:forEach>
            </tbody>
            </table>
           </td> 
           
           <!-- 实付款 -->
           <td class="split_line">${o.money }</td>
           
           <!-- 订单状态 -->
           <c:if test="${(o.state == 0) && (o.delivery == 0) && (o.confirm == 0) }">
           <td class="split_line">等待买家付款</td>
           <td class="operating">
             <a href="/payOrder/${o.orderId }.action">查看订单</a>
             <a href="/deleteOrder/${o.orderId }.action">取消订单</a>
             <a href="/payOrder/${o.orderId }.action" class="Delivery_btn">付款</a>
           </td>
           </c:if>
           <c:if test="${(o.state == 1) && (o.delivery == 0) && (o.confirm == 0) }">
           <td class="split_line"><p style="color:#F33">买家已付款，待发货</p></td>
           <td class="operating">
             <a href="/payOrder/${o.orderId }.action">查看订单</a>
             <a href="${ctx}/home/brands.jsp">联系客服</a>
             <a href="/deleteOrder/${o.orderId }.action">删除订单</a>
           </td>
           </c:if>
           <c:if test="${(o.state == 1) && (o.delivery == 1) && (o.confirm == 0) }">
           <td class="split_line"><p style="color:#F30">已发货，待收货</p></td>
           <td class="operating">
             <a href="/payOrder/${o.orderId }.action">查看订单</a>
             <a href="${ctx}/home/brands.jsp">联系客服</a>
             <a href="/takeOrder/${o.orderId }.action" class="Delivery_btn">确认收货</a>            
           </td>
           </c:if>
           <c:if test="${(o.state == 1) && (o.delivery == 1) && (o.confirm == 1) }">
           <td class="split_line"><p style="color:#F30">交易已成功</p></td>
           <td class="operating">
             <a href="/payOrder/${o.orderId }.action">查看订单</a>
             <a href="${ctx}/home/brands.jsp">申请售后</a>
             <a href="/deleteOrder/${o.orderId }.action">删除订单</a>            
           </td>
           </td>
           </c:if>
           </tr>
           </tbody>
           </c:forEach>
           
         </table>
    </div>
     </div>
   </div>
   <script>
            $(document).ready(function(){
              $('.Order_form_style input').iCheck({
                checkboxClass: 'icheckbox_flat-green',
                radioClass: 'iradio_flat-green'
              });
            });
            </script>
  </div>
 </div>
</div>
<!--网站地图END-->
<!--引入页脚-->
	<%@ include file="/home/foot.jsp" %>
</body>
</html>
