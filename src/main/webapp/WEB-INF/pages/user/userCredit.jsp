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
</head>

<body>
<!-- 引入页头 -->
<%@ include file="/home/head.jsp"%>
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
								href="#">[修改密码]</a>
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
			<!--消费记录样式-->
			<div class="user_address_style">
				<div class="title_style">
					<em></em>买家诚信
				</div>
				<br/>
				<!-- 为ECharts准备展示空间 -->
				<div id="main" style="width: 600px; height: 400px"></div>
				<!-- ECharts单文件引入 -->
				<script src="http://echarts.baidu.com/build/dist/echarts.js"></script>
				<script type="text/javascript">
					// 路径配置
					require.config({
						paths : {
							echarts : 'http://echarts.baidu.com/build/dist'
						}
					});

					// 使用
					require([ 'echarts', 'echarts/chart/gauge' // 使用柱状图就加载bar模块，按需加载
					], function(ec) {
						// 基于准备好的dom，初始化echarts图表
						var myChart = ec.init(document.getElementById('main'));
						
						var option = {
							    tooltip : {
							        formatter: "{a} <br/>{b} : {c}%"
							    },
							    toolbox: {
							        feature: {
							            restore: {},
							            saveAsImage: {}
							        }
							    },
							    series: [
							        {
							            name: '诚信度',
							            type: 'gauge',
							            detail: {formatter:'{value}%'},
							            data: [{value: '${sessionScope.LoginUser.userInfo.credit}', name: '诚信度'}]
							        }
							    ]
							};

						// 为echarts对象加载数据 
						myChart.setOption(option);
					});
				</script>
			</div>
		</div>
	</div>
</div>
<br />
<br />
<br />
<br />
<br />
<br />
<!--引入页脚-->
<%@ include file="/home/foot.jsp"%>

</body>
</html>