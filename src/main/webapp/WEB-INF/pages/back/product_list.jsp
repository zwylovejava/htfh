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
<script src="${ctx}/js/jquery-1.8.3.min.js"></script>
<script src="${ctx}/back/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="${ctx}/layer/layer.js"></script>
<script>
	function changePage(currentPage){
	//修改新的当前页
		document.getElementById("currentPage").value=currentPage;
		var url="${ctx}/back/findAll";
	    document.forms[0].action = url;
	//提交form表单
		document.getElementById("searchForm").submit();
	}
	function checkAllSel(obj){
		var curCheckBox = document.getElementsByName("productId");
		for(i = 0; i < curCheckBox.length; i++){
			curCheckBox.item(i).checked = obj.checked;
		}
	}

	 
 	 function show(thisObj){
		    layer.open({
		        type: 2,
		        title: '商品信息',
		        maxmin: true,
		        shadeClose: true, //点击遮罩关闭层
		        area : ['700px' , '650px'],
		        content:'${ctx}/back/toView?productId='+thisObj	    
		    });
	}
	 
 	function deleteProById(proId){
 		var count1=0;
		var url ="${ctx}/back/findStates"
		$.post(url,{"productId":proId},function(result){
				if(result=="true"){
					 layer.msg('你要删除的商品已经被付款购买不能删除', {
			            time: 1500, //1.5s后自动关闭
			       	 });
				 	count1++;
				 	return;
							}
						});
		if(count1==0){
				 		layer.open({
					 		 content: '你确认要删除?',
					 		 icon: 3
					 		 ,btn: ['确认', '取消']
						 	 ,yes: function(index, layero){
						 		window.location.href="${ctx}/back/deleteProduct?productId="+proId;
						 	 },btn2: function(index, layero){
						 	 layer.close();
			  				}
						});
				}
			}
 	
	 function deletePro(){
		 var count=0;
		 var curCheckBox = document.getElementsByName("productId");
			for(i = 0; i < curCheckBox.length; i++){
				if(curCheckBox.item(i).checked==true){
					count++;
				}
			}
			if(count==0){
				 layer.msg('请勾选要删除的内容', {
			            time: 800, //0.5s后自动关闭
			        }); 
			}else{
				var count1=0;
				for(i = 0; i < curCheckBox.length; i++){
					if(curCheckBox[i].checked==true){
						var productId=curCheckBox[i].value
						var url ="${ctx}/back/findStates"
						$.post(url,{"productId":productId},function(result){
								if(result=="true"){
									 layer.msg('你要删除的商品已经被付款购买不能删除', {
							            time: 1500, //1.5s后自动关闭
							       	 });
								 	count1++;
								 	return;
											}
										});
									}
								}
						if(count1==0){
						 		layer.open({
							 	 content: '你确认要删除?',
							 	 icon: 3
							 	 ,btn: ['确认', '取消']
								 	 ,yes: function(index, layero){
								 		var url="${ctx}/back/deleteProducts";
									    document.forms[0].action = url;
										document.getElementById("searchForm").submit();
								  },btn2: function(index, layero){
								 	 layer.close();
					  			}
							});
							
					}
				
			}

	 }
	
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
<%@ include file="head.jsp"%>

<section class="rt_wrap content mCustomScrollbar">
 <div class="rt_content">
      <div class="page_title">
       <h2 class="fl">商品列表</h2>
       <a href="${ctx}/back/toBackDetail" class="fr top_rt_btn add_icon">添加商品</a>
      </div>
      <form  method="POST" id="searchForm">
      		<input type="button" value="批量删除" id="deleteProducts"  onclick="deletePro()"  class="group_btn">&nbsp;&nbsp;&nbsp;&nbsp;
      		<input type="hidden" name="currentPage" id="currentPage" value="${page.currentPage }"/>
			<input type="hidden" name="perpage" value="${page.perpage}"/>
      	商品名:<input type="text" name="proName" value="${proName}" class="textbox textbox_225" placeholder="输入产品关键词...">
      	品牌名:<input type="text" name="classificName" value="${classificName}" class="textbox textbox_225" placeholder="输入产品类别...">
      	商品价格区间：<input type="text" name="minprice" value="${minprice}" class="textbox textbox_225" placeholder="输入产品最低价格..."/> - 
				<input type="text" name="maxprice" value="${maxprice}" class="textbox textbox_225" placeholder="输入产品关最高价格..."/>
		<input type="button" value="查询" onclick="changePage(1)" class="group_btn">
      <table class="table">
       <tr>
        <th>
        	全选<input type="checkbox"   id="checkAll"   onclick="checkAllSel(this)"/>
        </th>
        <th>缩略图</th>
        <th>产品名称</th>
        <th>产品分类</th>
        <th>单价</th>
        <th>库存</th>
        <th>销量</th>
        <th>操作</th>
       </tr>
       <c:forEach items="${productCurrentPageList}" var="p">
	       <tr>
	       	<td class="center"><input type="checkbox" name="productId" value="${p.productId}" ></td>
	        <td class="center"><img src="${ctx}/${p.imageUrl}" width="50" height="50"/></td>
	        <td class="center">${p.proName}</td>
	        <td class="center">${p.classific.classificName}</td>
	        <td class="center">${p.price}</td>
	        <td class="center">${p.pnum}</td>
	        <td class="center">${p.saleNum }</td>
	        <td class="center">
	         <a href="javascript:void(0)"  onclick="show(${p.productId})"  title="查看" class="link_icon" target="_parent">&#118;</a>
	         <a href="${ctx}/back/toupdateProduct?productId=${p.productId}" title="编辑" class="link_icon">&#101;</a>
	         <a href="javascript:void(0)" onclick="deleteProById(${p.productId})" title="删除" class="link_icon">&#100;</a>
	        </td>
	       </tr>
       </c:forEach>
      </table>
      </form>
      <aside class="paging">
      <div class="Paging">
        共${page.records }条记录 共${page.pages}页 
	<a href="javascript:void(0)" onclick="changePage(1)">首页</a>
	<a href="javascript:void(0)" <c:if test="${page.currentPage>1}">onclick="changePage(${page.currentPage-1})"</c:if> >上一页</a>
	<%-- 分页逻辑开始 --%>
	<c:set var="begin" value="0"/>
	<c:set var="end" value="0"/>
	<c:if test="${page.pages<=5 }">
		<c:set var="begin" value="1"/>
		<c:set var="end" value="${page.pages }"/>
	</c:if>
	<c:if test="${page.pages>5 }">
	   <c:choose>
	   	  <c:when test="${page.currentPage<=3 }">
	   	    <c:set var="begin" value="1"/>
			<c:set var="end" value="5"/>
	   	  </c:when>
	   	  <c:when test="${page.currentPage>=page.pages-2 }">
	   	  	  <c:set var="begin" value="${page.pages-4 }"/>
			  <c:set var="end" value="${page.pages }"/>
	   	  </c:when>
	   	  <c:otherwise>
	   	  	  <c:set var="begin" value="${page.currentPage-2 }"/>
			  <c:set var="end" value="${page.currentPage+2}"/>
	   	  </c:otherwise>
	   </c:choose>
	</c:if>
	<c:forEach begin="${begin }" end="${end}" step="1" var="i">
		<c:if test="${page.currentPage==i }">${i }</c:if>
		<c:if test="${page.currentPage!=i }">
			<a href="javascript:void(0)" onclick="changePage(${i})">${i }</a>
		</c:if>
	</c:forEach>
	<%-- 分页逻辑结束 --%>
	 
	<a href="javascript:void(0)" <c:if test="${page.currentPage<page.pages}">onclick="changePage(${page.currentPage+1})"</c:if>>下一页</a>
	<a href="javascript:void(0)" onclick="changePage(${page.pages})">尾页</a>
	
	跳转到<input type="text" value="${page.currentPage}" onblur="changePage(this.value)"/>页
	</div>
      </aside>
 </div>
</section>
</body>
</html>