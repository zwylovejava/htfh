<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../base.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>产品-产品详情</title>
<link href="${ctx}/css/base.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/css.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/style1.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/jquery-1.8.3.min.js"></script>
<script src="${ctx}/js/jquery.simpleGal.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.imagezoom.min.js"></script>
<style>
img {
	max-width: none;
}
.tb-pic a {
	display: table-cell;
	text-align: center;
	vertical-align: middle;
}
.tb-pic a img {
	vertical-align: middle;
}
.tb-pic a {
*display:block;
*font-family:Arial;
*line-height:1;
}
.tb-thumb {
	margin: 10px 0 0;
	overflow: hidden;
}
.tb-thumb li {
	float: left;
	width: 86px;
	height: 86px;
	overflow: hidden;
	border: 1px solid #cdcdcd;
	margin-right: 5px;
}
.tb-thumb li:hover, .tb-thumb .tb-selected {
	width: 84px;
	height: 84px;
	border: 2px solid #799e0f;
}
.tb-s310, .tb-s310 a {
	height: 365px;
	width: 365px;
}
.tb-s310, .tb-s310 img {
	max-height: 365px;
	max-width: 365px;
}
.tb-booth {
	border: 1px solid #CDCDCD;
	position: relative;
	z-index: 1;
}
div.zoomDiv {
	z-index: 999;
	position: absolute;
	top: 0px;
	left: 0px;
	background: #ffffff;
	border: 1px solid #ccc;
	display: none;
	overflow: hidden;
}
div.zoomMask {
	position: absolute;
	background: url("images/mask.png") repeat;
	cursor: move;
	z-index: 1;
}
<!--弹出隐藏层-->
 .black_overlay {
	display: none;
	position: absolute;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 1200px;
	background-color: black;
	z-index: 9999;
	-moz-opacity: 0.4;
	opacity: 0.40;
	filter: alpha(opacity=40);
}
.white_content {
	display: none;
	position: absolute;
	top: 20%;
	left: 40%;
	width: 400px;
	height: 175px;
	border: none;
	background-color: white;
	z-index: 100200;
	overflow: auto;
}
.white_content_small {
	display: none;
	position: absolute;
	top: 20%;
	left: 30%;
	width: 40%;
	height: 50%;
	background-color: white;
	z-index: 1002;
	overflow: auto;
}
.dialogbox {
	padding: 20px;
	line-height: 40px;
}
.addbtn {
	width: 22px;
	height: 22px;
	background: url(images/close2.png) no-repeat;
	margin-right: 5px;
	margin-top: 3px;
	border: none;
	float: right;
}
</style>
<script type="text/javascript">
//弹出隐藏层
function ShowDiv(show_div,bg_div){
document.getElementById(show_div).style.display='block';
document.getElementById(bg_div).style.display='block' ;
var bgdiv = document.getElementById(bg_div);
bgdiv.style.width = document.body.scrollWidth;
// bgdiv.style.height = $(document).height();
$("#"+bg_div).height($(document).height());
};
//关闭弹出层
function CloseDiv(show_div,bg_div)
{
document.getElementById(show_div).style.display='none';
document.getElementById(bg_div).style.display='none';
};

</script>
</head>

<body>
<%@ include file="/home/head.jsp"%>
<!--头部导航-->

<!--头部导航END--> 

<!--头部快捷栏-->
<!--头部快捷栏END-->

<div class="clear">&nbsp;</div>

<!--网站头部-->
<div class="sup-wid">
	<div><img src="${ctx}/images/TB27.jpg" height="100px" width="100%"/></div>
    <div class="supplie-top">
        <div class=" clear bread"><a href="/home.action">首页</a> <span class="pipe">&gt;</span> 
        <a href="${ctx}/product/findAll?classificId=${product.classific.classificId}">${product.classific.classificName}</a></div>
    <div class="pro_detail" >
        <div class="pro_detail_img float-lt">
            <div class="gallery">
                <div class="tb-booth tb-pic tb-s310"> <a href="${ctx}/${product.imageUrl}"><img src="${ctx}/${product.imageUrl}"  alt="展品细节展示放大镜特效" rel="${ctx}/${product.imageUrl}" class="jqzoom" /></a> </div>
                <ul class="tb-thumb" id="thumblist">
                    <li class="tb-selected">
                        <div class="tb-pic tb-s40"><a href="#">
                        <img src="${ctx}/${product.imageUrl}" mid="${ctx}/${product.imageUrl}" 
                        width="80px" height="80px" big="${ctx}/${product.imageUrl}"></a></div>
                    </li>
                    <li>
                        <div class="tb-pic tb-s40"><a href="#">
                        <img  src="${ctx}/${product.imageUrl}"  mid="${ctx}/${product.imageUrl}" 
                        width="80px" height="80px" big="${ctx}/${product.imageUrl}"></a></div>
                    </li>
                    <li>
                        <div class="tb-pic tb-s40"><a href="#">
                        <img src="${ctx}/${product.imageUrl}"  mid="${ctx}/${product.imageUrl}" 
                        width="80px" height="80px" big="${ctx}/${product.imageUrl}"></a></div>
                    </li>
                    <li style="margin-right:0px;">
                        <div class="tb-pic tb-s40"><a href="#">
                        <img src="${ctx}/${product.imageUrl}"  mid="${ctx}/${product.imageUrl}" 
                        width="80px" height="80px" big="${ctx}/${product.imageUrl}"></a></div>
                    </li>
                </ul>
            </div>
            <script type="text/javascript">
        $(function(){
				$("#h1").toggle(function(){
					$("#h1").css("background-image","url('${ctx}/images/iconfont-xingxingman_add.png')");
				},function(){
					$("#h1").css("background-image","url('${ctx}/images/iconfont-xingxingman_add.png') ");
				})
			}) 
		function delNum(){
        	var num=$("#buyNum").val();
        	if(num>1){
        		num=num-1;
        		$("#buyNum").val(num);
        	}
        }
		function addNum(){
        	var num=$("#buyNum").val();
        		num=parseInt(num)+1;
        		$("#buyNum").val(num);
        }
		function addCartFormSubmit(){
			var url="${ctx}/cart/cartadd";
		    document.forms[0].action = url;
		//提交form表单
			document.getElementById("addCartForm").submit();
		}

</script>
            <input type="button" value="加入收藏" id="h1" class="addcart" onclick="ShowDiv('MyDiv2','fade2')" />
        </div>
        <div class="float-lt pro_detail_con">
            <div class="pro_detail_tit">${product.proName }</div>
            <div class="pro_detail_ad">${product.description }</div>
            <div class="pro_detail_score margin-t20">
                <ul>
                    <li class="margin-r20">评分</li>
                </ul>
                <ul>
                    <li style="width:16px; height:16px;"><img src="${ctx}/images/iconfont-xingxingman.png" width="16" height="16" /></li>
                    <li style="width:16px; height:16px;"><img src="${ctx}/images/iconfont-xingxingman.png" width="16" height="16" /></li>
                    <li style="width:16px; height:16px;"><img src="${ctx}/images/iconfont-xingxingman.png" width="16" height="16" /></li>
                    <li style="width:16px; height:16px;"><img src="${ctx}/images/iconfont-xingxingman.png" width="16" height="16" /></li>
                    <li style="width:16px; height:16px;"><img src="${ctx}/images/iconfont-xingxingkong.png" width="16" height="16" /></li>
                </ul>
            </div>
            <div class="clear"></div>
            <div class="pro_detail_price  margin-t20"><span class="margin-r20">市场价</span><span style=" font-size:16px"><s>￥${product.price*1.2}</s></span></div>
            <div class="clear"></div>
            <div class="pro_detail_act margin-t20 fl"><span class="margin-r20">售价
            </span><span style="font-size:26px; font-weight:bold; color:#dd514c;">￥${product.price}</span></div>
            <div class="clear"></div>
            <div class="pro_detail_number margin-t30">
                <div class="margin-r20 float-lt">数量</div>
                <div class=""> 
                <a class="jian" href="javascript:void(0)" onclick="delNum()"></a>
                <form  method="get" id="addCartForm">
                    <input type="text" value="1" id="buyNum" name="buyNum" class="float-lt choose_input"/>
                </form>
                    <a class="jia" href="javascript:void(0)" onclick="addNum()"></a> <span>&nbsp;盒</span> <span>（库存${product.pnum}）</span> </div>
                <div class="clear"></div>
            </div>
            <div class="guige">
                <div class="clear"></div>
            </div>
            <div class="pro_detail_number margin-t20">
             <div class="margin-r20 float-lt">月成交量：<span class="colorred"><strong>${product.saleNum}件</strong></span></div>
                <div class="clear"></div>
            </div>
            <div class="clear"></div>
            <div class="pro_detail_btn margin-t30">
                <ul>
                    <li class="pro_detail_shop"><a id="aaaaaaaaaaaaaaa" href="#">立即购买</a></li>
                    <li class="pro_detail_add"><a id="bbbbbbbbbbbbbbb" href="#" onclick="addCartFormSubmit()">加入我的货仓</a></li>

                </ul>
            </div>
        </div>
     	
    </div>
    <div class="clear"></div>
    <input hidden="hidden" id="product_me_id" value="${product.productId}"/>
    <script>
    	
		$(function(){
			
			$(".pro_tab li").each(function(i){
				$(this).click(function(){
					$(this).addClass("cur").siblings().removeClass("cur");
					$(".conlist .conbox").eq(i).show().siblings().hide();
				})
			})
			
			$("#aaaaaaaaaaaaaaa").click(function(){
				var buyNum_me = $("#buyNum").val();
				var proId_me = $("#product_me_id").val();
				window.location.href="/cart/cartadd?productId="+proId_me+"&proNum="+buyNum_me;
			});
			$("#bbbbbbbbbbbbbbb").click(function(){
				var buyNum_me = $("#buyNum").val();
				var proId_me = $("#product_me_id").val(); 
				window.location.href="/cart/cartadd?productId="+proId_me+"&proNum="+buyNum_me+"&source=123";
			})
		})
		
	</script>
   
    
    
</div>
</div>

<div class="clear">&nbsp;</div>


<!--网站地图-->

<!--网站页脚END-->
<%@ include file="/home/foot.jsp"%>




<!--弹出层时背景层DIV--> 

<!--商品添加成功DIV-->
<div id="fade" class="black_overlay"> </div>
<div id="MyDiv" class="white_content">
    <div  style="width:385px; height:30px; background:#1ba67f; padding-left:15px; color:#fff; line-height:30px; font-size:14px;"> <span onclick="CloseDiv('MyDiv','fade')">
        <input type="button" class="addbtn">
        </span>商品加入货仓 </div>
    <div class="dialogbox">
        <p>商品添加成功！</p>
    </div>
</div>
</div>

<!--商品收藏成功DIV-->
<div id="fade2" class="black_overlay"> </div>
<div id="MyDiv2" class="white_content">
    <div  style="width:385px; height:30px; background:#1ba67f; padding-left:15px; color:#fff; line-height:30px; font-size:14px;"> <span onclick="CloseDiv('MyDiv2','fade2')">
        <input type="button" class="addbtn">
        </span>商品收藏 </div>
    <div class="dialogbox">
        <p>商品收藏成功！</p>
    </div>
</div>
</div>
<script type="text/javascript">
$(document).ready(function(){

	$(".jqzoom").imagezoom();
	
	$("#thumblist li a").mousemove(function(){
		$(this).parents("li").addClass("tb-selected").siblings().removeClass("tb-selected");
		$(".jqzoom").attr('src',$(this).find("img").attr("mid"));
		$(".jqzoom").attr('rel',$(this).find("img").attr("big"));
	});

});
</script>
</body>
</html>

