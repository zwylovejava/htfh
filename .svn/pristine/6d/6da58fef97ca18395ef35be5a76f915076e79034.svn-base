<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>我的购物车</title>
  	<link href="${ctx}/css/cart.css" rel="stylesheet" type="text/css">
  	<%-- <script type="text/javascript" src="${ctx}/js/jquery-1.8.3.min.js"></script> --%>
  	
</head>
<body>
	<%@ include file="/home/head.jsp" %>
	<div class="warp">
	${msg}
		<!-- 标题信息 -->
	<div id="title">
		<input id="allC2" type="checkbox" value="" onclick=""/>
		<span id="title_checkall_text">全选</span>
		<span id="title_name">商品</span>
		<span id="title_price">单价（元）</span>
		<span id="title_buynum">数量</span>
		<span id="title_money">小计（元）</span>
		<span id="title_del">操作</span>
	</div>
	<!-- 购物信息 -->
	
<form action="/cart/orderadd" method="post" id="myform">
<c:choose>
<c:when test="${cart!=null}">
<c:set var="money" value="0"/>
<c:forEach items="${cart}" var="entry">
	<div id="prods">
		<input name="productId" type="checkbox" value="${entry.key.productId}"/>
		<img src="/${entry.key.imageUrl}" width="90" height="90" />
		<span id="prods_name">${entry.key.proName}</span>
		<span id="prods_price">${entry.key.price}</span>
		<span id="prods_buynum"> 
		
			<a href="${ctx}/cart/cartdecrease?productId=${entry.key.productId}" >-</a>
			<input style="width: 40px;" id="${entry.key.productId}" class="buyNumInp1" type="text" value="${entry.value}" >
			<a href="${ctx}/cart/cartadd?productId=${entry.key.productId}" >+</a>
		</span>
		<span id="prods_money">${entry.key.price*entry.value}</span>
		<c:set var="money" value="${money+entry.key.price*entry.value}"/>
		<span id="prods_del"><a class="prodDel" href="/cart/cartdelete?productId=${entry.key.productId}">删除</a></span>
	</div>
</c:forEach>
	
	<!-- 总计条 -->
		<div id="total">
			<div id="total_1">
				<input id="allC1" type="checkbox" value=""/> 
				<span>全选</span>
				<span id="del_a" onclick="submitfrom();"><a href="#">删除选中的商品</a></span>
				<span id="span_1">总价：</span>
				<span id="span_2">￥${money}</span>
			</div>
			<div id="total_2">	
				<input disabled="disabled" style="width: 100px;height:50px;background-color: #ADADAD;" type="submit" id="goto_order" value="去结算">
			</div>
		</div>

</c:when>
	<c:otherwise>
	<div align="center">
	<img  src="/images/cart_me.gif">
	</div>
	<div style="height: 10px"></div>
	<p style="text-align: center;"><a style="color: red;font-size: 25px;" href="/product/findAll.action">亲，你的购物车空空哟!去选购</a></p>
	</c:otherwise>	
</c:choose>
		</form>
	</div>
	<div style="height: 300px"></div>
	<%@ include file="/home/foot.jsp" %>
	<script type="text/javascript">
	
	function submitfrom(){
        var frm = document.getElementById("myform");
        frm.action = "/cart/cartdelete.action";
        frm.method = "post";
        frm.submit();                        
    }
		$("input[name='productId']").bind("click",function(){
			    var count = 0;
			    var checkArry = document.getElementsByName("productId");
			            for (var i = 0; i < checkArry.length; i++) { 
			                if(checkArry[i].checked == true){
			                    count++; 
			                }
			            }
			    if( count == 0 ){
			    	$("#goto_order").attr("disabled",true).css({"background-color":"#ADADAD"});
			    }else{
			    	$("#goto_order").attr("disabled",false).css({"background-color":"#EE7621"});
			    }
		});
		
		$("#allC1").bind("click",function(){           
			$("input[name='productId']").prop("checked",this.checked);
			$("#allC2").prop("checked",this.checked); 
			if(!this.checked){
				$("#goto_order").attr("disabled",true).css({"background-color":"#ADADAD"});
			}else{
				 var count = 0;
				    var checkArry = document.getElementsByName("productId");
				            for (var i = 0; i < checkArry.length; i++) { 
				                    count++; 
				            }
				    if( count == 0 ){
				    	$("#goto_order").attr("disabled",true).css({"background-color":"#ADADAD"});
				    }else{
				    	$("#goto_order").attr("disabled",false).css({"background-color":"#EE7621"});
				    }
			}
			
		});            
		$("#allC2").bind("click",function(){           
			$("input[name='productId']").prop("checked",this.checked);
			$("#allC1").prop("checked",this.checked);   
			if(!this.checked){
				$("#goto_order").attr("disabled",true).css({"background-color":"#ADADAD"});
			}else{
				 var count = 0;
				    var checkArry = document.getElementsByName("productId");
				            for (var i = 0; i < checkArry.length; i++) { 
				                    count++; 
				            }
				    if( count == 0 ){
				    	$("#goto_order").attr("disabled",true).css({"background-color":"#ADADAD"});
				    }else{
				    	$("#goto_order").attr("disabled",false).css({"background-color":"#EE7621"});
				    }
			}
			
		});            
	
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>