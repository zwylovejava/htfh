<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../base.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${ctx}/css/common.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/style.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="${ctx}/js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
<script src="${ctx}/js/common_js.js" type="text/javascript"></script>
<script src="${ctx}/js/footer.js" type="text/javascript"></script>
<script src="${ctx}/js/accordion.js" type="text/javascript"></script>
<script src="${ctx}/js/lrtk.js" type="text/javascript"></script>
<title>产品列表页</title>
</head>
<script type="text/javascript" charset="UTF-8">
	function changePage(currentPage){
	//修改新的当前页
		document.getElementById("currentPage").value=currentPage;
		var url="${ctx}/product/findAll";
	    document.forms[0].action = url;
	//提交form表单
		document.getElementById("searchForm").submit();
	}
	function submitForm(classificId){
		//修改新的当前页
			$("input[name='classificId']").val(classificId)
			changePage(1);
		}
	function submitFormSort(sort){
		//修改新的当前页
			var url="${ctx}/product/findAll";
			$("input[name='sort']").val(sort)
		    document.forms[0].action = url;
		//提交form表单
			document.getElementById("searchForm").submit();
		}
<!--
 //点击效果start
 function infonav_more_down(index)
 {
  var inHeight = ($("div[class='p_f_name infonav_hidden']").eq(index).find('p').length)*30;//先设置了P的高度，然后计算所有P的高度
  if(inHeight > 60){
   $("div[class='p_f_name infonav_hidden']").eq(index).animate({height:inHeight});
   $(".infonav_more").eq(index).replaceWith('<p class="infonav_more"><a class="more"  onclick="infonav_more_up('+index+');return false;" href="javascript:">收起<em class="pulldown"></em></a></p>');
  }else{
   return false;
  }
 }
 function infonav_more_up(index)
 {
  var infonav_height = 85;
  $("div[class='p_f_name infonav_hidden']").eq(index).animate({height:infonav_height});
  $(".infonav_more").eq(index).replaceWith('<p class="infonav_more"> <a class="more" onclick="infonav_more_down('+index+');return false;" href="javascript:">更多<em class="pullup"></em></a></p>');
 }
   
 function onclick(event) {
  info_more_down();
 return false;
 }
 //点击效果end  
//-->
<!--实现手风琴下拉效果-->
$(function(){
   $(".nav").accordion({
        //accordion: true,
        speed: 500,
	    closedSign: '+',
		openedSign: '-'
	});
}); 
function ajaxSubmit(){
	var url="${ctx}/toregist";
	var param={"username":$("#username").val(),"password":$("#password").val(),"phoneNum":$("#phoneNum").val(),"email":$("#email").val(),"code":$("#code").val()};
	$.post(url,param,function(data){
		
	});		
}
$(function() { 
	$("#scrollsidebar").fix({
		float : 'left',
		//minStatue : true,
		skin : 'green',	
		durationTime : 600
	});
});
</script>
<body>
<%@ include file="/home/head.jsp"%>
<!--产品列表样式-->
<div class="Inside_pages">
<!--位置-->
<div id="Filter_style">
  <div class="Location_link">
  <em></em><a href="${ctx}/product/findAll.action">所有商品</a>   
 </div>
<!--条件筛选样式-->
 <div class="Filter" id="Filter">
  <div class="Filter_list clearfix">
   <div class="Filter_title"><span>品牌：</span></div>
   <div class="Filter_Entire"><a href="${ctx}/product/findAll" class="Complete">全部</a></div>
    <div class="p_f_name infonav_hidden" style="height: 85px;">
    <p>
    <c:forEach items="${classificList}" var="cl">
    <c:if test="${classificId!=null}">
    	<c:if test="${cl.classificId==classificId}">
    	    	<a href="javascript:void(0)" onclick="submitForm(${cl.classificId})"> ${cl.classificName} </a>
    	</c:if>
    </c:if>
    <c:if test="${classificId==null}">
    	<a href="javascript:void(0)" onclick="submitForm(${cl.classificId})"> ${cl.classificName} </a>
    </c:if>
    </c:forEach>
	  </p>
   </div>
   <p class="infonav_more"> <a class="more" onclick="infonav_more_down(0);return false;" href="${ctx}/product/findAll.action">更多<em class="pullup"></em></a></p>
  </div>
  <div class="Filter_list clearfix">
  <div class="Filter_title"><span>价格：</span></div>
  <div class="Filter_Entire"><a href="${ctx}/product/findAll.action" class="Complete">全部</a></div>
  <div class="p_f_name">
   <form method="POST" id="searchForm" >
   				<input type="hidden" name="currentPage" id="currentPage" value="${page.currentPage }"/>
				<input type="hidden" name="perpage" value="${page.perpage}"/>
				<input type="hidden" name="classificId" value="${classificId}"/>
				<input type="hidden" name="sort" value="${sort}"/>
				<span class="input_span">商品价格区间：<input type="text" name="minprice" value="${minprice}"/> - 
				<input type="text" name="maxprice" value="${maxprice}"/></span>
				<input type="button" onclick="changePage(1)"  value="查询" >
			</form>    
  </div>
  </div>
  <div class="Filter_list clearfix">
  <div class="Filter_list clearfix">
  <div class="Filter_Entire"><a href="${ctx}/product/findAll.action" class="Complete">不限</a></div>
  <div class="p_f_name">
  </div>
  </div>
  </div>
 </div>
 <!--产品列表样式-->
 <div  class="scrollsidebar side_green clearfix" id="scrollsidebar"> 
 <div class="page_right_style">
 <div class="Sorted">
  <div class="Sorted_style">
   <a href="#" class="on">综合<i class="iconfont icon-fold"></i></a>
   <a href="javascript:void(0)" onclick="submitFormSort(1)">价格由低到高<i class="iconfont icon-fold"></i></a>
   <a href="javascript:void(0)" onclick="submitFormSort(0)">价格由高到底<i class="iconfont icon-fold"></i></a>
   </div>
   <!--产品搜索-->
   <!-- <div class="products_search">
    <input name="" type="text" class="search_text" value="请输入你要搜索的产品" onfocus="this.value=''" onblur="if(!value){value=defaultValue;}"><input name="" type="submit" value="" class="search_btn">
   </div> -->
   <!--页数-->
   <div class="s_Paging">
   <span> ${page.currentPage }/${page.pages}</span>
   <a href="javascript:void(0)" <c:if test="${page.currentPage>1}">onclick="changePage(${page.currentPage-1})"</c:if> class="on">&lt;</a>
   <a href="javascript:void(0)" <c:if test="${page.currentPage<page.pages}">onclick="changePage(${page.currentPage+1})"</c:if> class="on">&gt;</a>
   </div>
   </div>
   <div class="p_list  clearfix">
   <ul>
   	<c:forEach items="${productCurrentPageList}" var="prod">
    <li class="gl-item" >
    <em class="icon_special tejia"></em>
	<div class="Borders">
	 <div class="img"><a href="${ctx}/product/findProdInfo?productId=${prod.productId}"><img src="${ctx}/${prod.imageUrl}" style="width:220px;height:220px"></a></div>
	 <div class="Price"><b>¥${prod.price}</b><span>[¥49.01/500g]</span></div>
	 <div class="name"><a href="${ctx}/product/findProdInfo?productId=${prod.productId}">${prod.proName }</a></div>
	 <div class="Shop_name"><a href="#">${prod.shop}</a></div>
	 </div>
	</li>
	</c:forEach>
   </ul>
	<%-- 分页逻辑开始 --%>
   <div class="Paging">
    <div class="Pagination">
    	 共${page.records}条记录 共${page.pages}页 
	<a href="javascript:void(0)" onclick="changePage(1)">首页</a>
	<a href="javascript:void(0)" 
	<c:if test="${page.currentPage>1}">onclick="changePage(${page.currentPage-1})"</c:if> >上一页</a>
	<c:set var="begin" value="0"/>
	<c:set var="end" value="0"/>
	<c:if test="${page.pages<=5 }">
		<c:set var="begin" value="1"/>
		<c:set var="end" value="${page.pages}"/>
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
    </div>
   </div>
</div>
</div>
</div>
</div>

<!--网站地图-->
<%@ include file="/home/foot.jsp"%>

</body>
</html>