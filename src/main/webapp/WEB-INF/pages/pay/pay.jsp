<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../base.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
<link href="${ctx}/css/pay.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
<title>订单支付</title>
</head>
<body>
<!-- 引入页头 -->
<%@ include file="/home/head.jsp" %>
<div>
	<form action="/paymentAction.action" method="post">
		<dl class="payment_page">
			<dt>
				<strong>订单号：</strong> 
				<input class="idinp" name="orderId" readonly="readonly" type="text" value="${orderId}">
				<strong>支付金额：</strong>
				<input class="moneyinp" name="money" type="text" readonly="readonly" type="text" value="${money }">元
			</dt>
			<dd class="payment_page_name">
				<strong>请您选择在线支付银行 :</strong>
			</dd>
			<dd class="banks">
				<ul>
					<li>
						<input name="pd_FrpId" type="radio" value="ICBC-NET"> 
						<img src="${ctx}/images/pay/01gs.jpg" width="130" height="52">
					</li>
					<li>
						<input name="pd_FrpId" type="radio" value="CMBCHINA-NET-B2C">
						<img src="${ctx}/images/pay/02zs.jpg" width="130" height="52">
					</li>
					<li>
						<input name="pd_FrpId" type="radio" value="CCB-NET">
						<img src="${ctx}/images/pay/03js.jpg" width="130" height="52">
					</li>
					<li>
						<input name="pd_FrpId" type="radio" value="ABC-NET-B2C">
						<img src="${ctx}/images/pay/04ny.jpg" width="130" height="52">
					</li>
					<li>
						<input name="pd_FrpId" type="radio" value="BOC-NET-B2C ">
						<img src="${ctx}/images/pay/05zg.jpg" width="130" height="52">
					</li>
					<li>
						<input name="pd_FrpId" type="radio" value="BOCO-NET-B2C ">
						<img src="${ctx}/images/pay/06jt.jpg" width="130" height="52">
					</li>
					<li>
						<input name="pd_FrpId" type="radio" value="CIB-NET-B2C ">
						<img src="${ctx}/images/pay/08xy.jpg" width="130" height="52">
					</li>
	
					<li>
						<input name="pd_FrpId" type="radio" value="GDB-NET-B2C ">
						<img src="${ctx}/images/pay/09gd.jpg" width="130" height="52">
					</li>
	
					<li>
						<input name="pd_FrpId" type="radio" value="SDB-NET-B2C">
						<img src="${ctx}/images/pay/10sz.jpg" width="130" height="52">
					</li>
	
					<li>
						<input name="pd_FrpId" type="radio" value="CMBC-NET-B2C">
						<img src="${ctx}/images/pay/11ms.jpg" width="130" height="52">
					</li>
	
					<li>
						<input name="pd_FrpId" type="radio" value="SPDB-NET-B2C ">
						<img src="${ctx}/images/pay/12sh.jpg" width="130" height="52">
					</li>
	
					<li>
						<input name="pd_FrpId" type="radio" value="ECITIC-NET-B2C">
						<img src="${ctx}/images/pay/13zx.jpg" width="130" height="52">
					</li>
	
					<li>
						<input name="pd_FrpId" type="radio" value="CEB-NET-B2C">
						<img src="${ctx}/images/pay/14gd.jpg" width="130" height="52">
					</li>
	
					<li>
						<input name="pd_FrpId" type="radio" value="CBHB-NET-B2C">
						<img src="${ctx}/images/pay/16bh.jpg" width="130" height="52">
					</li>
				</ul>
			</dd>
			<div style="clear: both">
			<dd class="ok_dd">
				<input  type="submit" class="ok_pay" value="确认支付">
			</dd>
			</div>
		</dl>
	</form>
</div>
<!--引入页脚-->
<%@ include file="/home/foot.jsp" %>
</body>
</html>
