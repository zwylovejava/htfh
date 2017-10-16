<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${ctx}/css/common.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/style.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="${ctx}/js/jquery.SuperSlide.2.1.1.js"
	type="text/javascript"></script>
<script src="${ctx}/js/common_js.js" type="text/javascript"></script>
<script src="${ctx}/js/footer.js" type="text/javascript"></script>
<style type="text/css">
#allmap {
	width: 100%;
	height: 100%;
	overflow: hidden;
	margin: 0;
	font-family: "微软雅黑";
}

#map_container {
	width: 40%;
	height: 40%;
	overflow: hidden;
	margin: 0;
	font-family: "微软雅黑";
}
</style>
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=Yl98mP2bBGwwnntTkP9aZ5Cwfw9qLi0B"></script>
<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>



<title>联系我们</title>

</head>

<body>
	<!-- 引入页头 -->
	<%@ include file="/home/head.jsp"%>
	<!--购物车样式-->
	<!--菜单栏-->
	<script>
		$("#Navigation").slide({
			titCell : ".Navigation_name li",
			trigger : "click"
		});
	</script>

	<!--发布公告样式-->
	<div class="Inside_pages clearfix">
		<div class="left_style">
			<!--发布公告-->
		</div>
		<!--右侧内容样式-->
		<div class="right_style" style="height: 250px">
			<div style="height: 10px"></div>
			<!--内容详细-->
			<div class="title_style">
				<em></em>联系方式
			</div>
			<div class="content_style">
				<div class="add_Bulletin">
					<ul class="add_shops_style">
						<li><h1>客服：400-743235</h1>
							<div class="add_right_style">
								<ul class="inline date_inline">
								</ul>
							</div></li>
						<li><h1>邮箱：enquiries@positiveadvertising.com</h1>
							<div class="add_right_style">
								<ul class="inline date_inline">
								</ul>
							</div></li>
						<li><h1>地址:广州市天河区林和街道天寿路105号天寿大厦3楼</h1>
							<div class="add_Bulletin">
								<ul class="add_shops_style">
									<li><h1>百度地图</h1>
										<div class="add_right_style">
											<ul class="inline date_inline">
											</ul>
										</div></li>
										
									<br />
								</ul>
							</div>
				</div>
			</div>
		</div>
	</div>
	<!--网站地图-->
	<div align="center">
		<%@ include file="/home/map.jsp"%>
	</div>

	<!--网站地图END-->
	<br>
	<br>
	<!--引入页脚-->
	<%@ include file="/home/foot.jsp"%>
</body>
</html>

<script>
	var start = {
		elem : '#start',
		format : 'YYYY/MM/DD hh:mm:ss',
		min : laydate.now(), //设定最小日期为当前日期
		max : '2099-06-16 23:59:59', //最大日期
		istime : true,
		istoday : false,
		choose : function(datas) {
			end.min = datas; //开始日选好后，重置结束日的最小日期
			end.start = datas //将结束日的初始值设定为开始日
		}
	};
	var end = {
		elem : '#end',
		format : 'YYYY/MM/DD hh:mm:ss',
		min : laydate.now(),
		max : '2099-06-16 23:59:59',
		istime : true,
		istoday : false,
		choose : function(datas) {
			start.max = datas; //结束日选好后，重置开始日的最大日期
		}
	};
	laydate(start);
	laydate(end);
</script>
