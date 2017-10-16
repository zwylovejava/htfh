<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../base.jsp" %>
<!DOCTYPE HTML>
<html>
  <head>
    <title>确认支付页面</title>
    <link href="${ctx}/css/confirm.css" rel="stylesheet" type="text/css">
</head>
<body>
<!-- 引入页头 -->
<%@ include file="/home/head.jsp" %>
<!-- 确认支付form -->
<div id="warp">
	<div>
		<h2>
			订单号：${p2_Order}
			<br />
			<br />
			<br />
			付款金额 ：${p3_Amt } 元
		</h2>
		<form action="https://www.yeepay.com/app-merchant-proxy/node" method="post">
			<input type="hidden" name="pd_FrpId" value="${pd_FrpId }" />
			<input type="hidden" name="p0_Cmd" value="${p0_Cmd }" />
			<input type="hidden" name="p1_MerId" value="${p1_MerId }" />
			<input type="hidden" name="p2_Order" value="${p2_Order }" />
			<input type="hidden" name="p3_Amt" value="${p3_Amt }" />
			<input type="hidden" name="p4_Cur" value="${p4_Cur }" />
			<input type="hidden" name="p5_Pid" value="${p5_Pid }" />
			<input type="hidden" name="p6_Pcat" value="${p6_Pcat }" />
			<input type="hidden" name="p7_Pdesc" value="${p7_Pdesc }" />
			<input type="hidden" name="p8_Url" value="${p8_Url }" />
			<input type="hidden" name="p9_SAF" value="${p9_SAF }" />
			<input type="hidden" name="pa_MP" value="${pa_MP }" />
			<input type="hidden" name="pr_NeedResponse" value="${pr_NeedResponse }" />
			<input type="hidden" name="hmac" value="${hmac }" />
			<input style=" height: 40px;width: 100px;background-color: #f3f3f3;" type="submit" value="确认支付" />
		</form>
	</div>
</div>
<!--引入页脚-->
<%@ include file="/home/foot.jsp" %>
</body>
</html>