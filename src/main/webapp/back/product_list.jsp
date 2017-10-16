<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="base.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8"/>
<title>后台管理系统</title>
<meta name="author" content="DeathGhost" />
<link rel="stylesheet" type="text/css" href="${ctx}/back/css/style.css">
<!--[if lt IE 9]>
<script src="js/html5.js"></script>
<![endif]-->
<script src="${ctx}/back/js/jquery.js"></script>
<script src="${ctx}/back/js/jquery.mCustomScrollbar.concat.min.js"></script>
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
<!--header-->
<header>
 <h1><img src="${ctx}/back/images/admin_logo.png"/></h1>
 <ul class="rt_nav">
  <li><a href="http://www.mycodes.net" target="_blank" class="website_icon">站点首页</a></li>
  <li><a href="#" class="clear_icon">清除缓存</a></li>
  <li><a href="#" class="admin_icon">DeathGhost</a></li>
  <li><a href="#" class="set_icon">账号设置</a></li>
  <li><a href="#" class="quit_icon">安全退出</a></li>
 </ul>
</header>
<aside class="lt_aside_nav content mCustomScrollbar">
 <h2><a href="index.html">起始页</a></h2>
 <ul>
  <li>
   <dl>
    <dt>商品管理</dt>
    <!--当前链接则添加class:active-->
    <dd><a href="${ctx}/back/findAll" class="active">商品列表</a></dd>
    <dd><a href="product_detail.html">商品添加</a></dd>
   </dl>
  </li>
  <li>
   <dl>
    <dt>订单信息</dt>
    <dd><a href="order_list.html">订单列表</a></dd>
    <dd><a href="order_detail.html">订单详情</a></dd>
   </dl>
  </li>
  <li>
  </li>
  <li>
   <dl>
    <dt>在线统计</dt>
    <dd><a href="sales_volume.html">销售额统计</a></dd>
   </dl>
  </li>
  <li>
   <p class="btm_infor">© DeathGhost.cn 版权所有</p>
  </li>
 </ul>
</aside>

<section class="rt_wrap content mCustomScrollbar">
 <div class="rt_content">
      <div class="page_title">
       <h2 class="fl">商品列表</h2>
       <a href="product_detail.html" class="fr top_rt_btn add_icon">添加商品</a>
      </div>
      <form action="" method="POST">
      	商品名:<input type="text" name="proName" value="${proName}" class="textbox textbox_225" placeholder="输入产品关键词...">
      	品牌名:<input type="text" name="classificName" value="${classificName}" class="textbox textbox_225" placeholder="输入产品类别...">
      	商品价格区间：<input type="text" name="minprice" value="${minprice}" class="textbox textbox_225" placeholder="输入产品最低价格..."/> - 
				<input type="text" name="maxprice" value="${maxprice}" class="textbox textbox_225" placeholder="输入产品关最高价格..."/>
		<input type="submit" value="查询" class="group_btn">
        
       
      <table class="table">
       <tr>
        <th>缩略图</th>
        <th>产品产品ID</th>
        <th>产品名称</th>
        <th>产品分类</th>
        <th>单价</th>
        <th>库存</th>
        <th>销量</th>
        <th>操作</th>
       </tr>
       <c:forEach items="${productList}" var="p">
	       <tr>
	        <td class="center"><img src="${ctx}/${p.imageUrl}" width="50" height="50"/></td>
	        <td>${p.productId}</td>
	        <td class="center">${p.proName}</td>
	        <td class="center">${p.classific.classificName}</td>
	        <td class="center">${p.price}</td>
	        <td class="center">${p.pnum}</td>
	        <td class="center">${p.salenum }</td>
	        <td class="center">
	         <a href="#" title="查看" class="link_icon" target="_blank">&#118;</a>
	         <a href="#" title="编辑" class="link_icon">&#101;</a>
	         <a href="#" title="删除" class="link_icon">&#100;</a>
	        </td>
	       </tr>
       </c:forEach>
      </table>
      <aside class="paging">
       <a>第一页</a>
       <a>1</a>
       <a>2</a>
       <a>3</a>
       <a>…</a>
       <a>1004</a>
       <a>最后一页</a>
      </aside>
 </div>
</section>
</body>
</html>