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
<title>联系我们</title>
</head>

<body>
<!-- 引入页头 -->
<%@ include file="/home/head.jsp" %>
<!--发布公告样式-->
<div class="Inside_pages clearfix">
<div class="left_style">
<!--发布公告--><h1>热销商品</h1>
</div>
<img src="${ctx}/images/celled01.jpg">
</div>
<dl>
<dt><img src="${ctx}/images/celled02.jpg"></dt>
</dl>
<%@ include file="/home/foot.jsp" %>
</body>
</html>
<script>
var start = {
    elem: '#start',
    format: 'YYYY/MM/DD hh:mm:ss',
    min: laydate.now(), //设定最小日期为当前日期
    max: '2099-06-16 23:59:59', //最大日期
    istime: true,
    istoday: false,
    choose: function(datas){
         end.min = datas; //开始日选好后，重置结束日的最小日期
         end.start = datas //将结束日的初始值设定为开始日
    }
};
var end = {
    elem: '#end',
    format: 'YYYY/MM/DD hh:mm:ss',
    min: laydate.now(),
    max: '2099-06-16 23:59:59',
    istime: true,
    istoday: false,
    choose: function(datas){
        start.max = datas; //结束日选好后，重置开始日的最大日期
    }
};
laydate(start);
laydate(end);
</script>
