<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="base.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8"/>
<title>后台管理系统</title>
<meta name="author" content="DeathGhost" />
<link rel="stylesheet" type="text/css" href="css/style.css">
<style>
#button{border: 1px solid #ccc; width: 100px; height: 40px; background-color: #70E3BD; color: red}
</style>
<!--[if lt IE 9]>
<script src="js/html5.js"></script>
<![endif]-->
<script src="js/jquery.js"></script>
<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript">  
    function export_data(){  
        window.location.href="${ctx}/back/reprotRecord";  
    }  
  
</script>
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
<style>
.dataStatistic{width:900px;height:650px;border:1px solid #ccc;margin-top:0px;overflow:hidden;}
#cylindrical{width:900px;height:600px;margin-top:0px}
</style>
</head>
<body>
<!--header-->
<%@ include file="head.jsp" %>
<section class="rt_wrap content mCustomScrollbar">
 <div class="rt_content">
      <div class="page_title">
       <h2 class="fl">数据信息统计</h2>
      </div>
    <div class="dataStatistic" align="center">
		<div align="right">
			<input type="button" id="button" onclick="export_data()"  value="销售表单下载"/>
		</div>
        <div id="cylindrical">
        </div>
    </div>
    
 </div>
</section>
<script src="js/amcharts.js" type="text/javascript"></script>
<script src="js/serial.js" type="text/javascript"></script>
<script src="js/pie.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function (e) {
        GetSerialChart();
        MakeChart(json);
    });
    var json = [
    	  { "name": '${classificStr[0]}', "value": '${saleList[0]}' },
    	  { "name": '${classificStr[1]}', "value": '${saleList[1]}' },
    	  { "name": '${classificStr[2]}', "value": '${saleList[2]}' },
    	  { "name": '${classificStr[3]}', "value": '${saleList[3]}' },
    	  { "name": '${classificStr[4]}', "value": '${saleList[4]}' },
    	  { "name": '${classificStr[5]}', "value": '${saleList[5]}' },
    	  { "name": '${classificStr[6]}', "value": '${saleList[6]}' },
    	  { "name": '${classificStr[7]}', "value": '${saleList[7]}' },
    	  { "name": '${classificStr[8]}', "value": '${saleList[8]}' },

    	  ] 
	      //柱状图  
	      function GetSerialChart() {
	        chart = new AmCharts.AmSerialChart();
	        chart.dataProvider = json;
	        //json数据的key  
	        chart.categoryField = "name";
	        //不选择      
	        chart.rotate = false;
	        //值越大柱状图面积越大  
	        chart.depth3D = 20;
	        //柱子旋转角度角度
	        chart.angle = 30;
	        var mCtCategoryAxis = chart.categoryAxis;
	        mCtCategoryAxis.axisColor = "#efefef";
	        //背景颜色透明度
	        mCtCategoryAxis.fillAlpha = 0.5;
	        //背景边框线透明度
	        mCtCategoryAxis.gridAlpha = 0;
	        mCtCategoryAxis.fillColor = "#efefef";
	        var valueAxis = new AmCharts.ValueAxis();
	        //左边刻度线颜色  
	        valueAxis.axisColor = "#ccc";
	        //标题
	        valueAxis.title = "商品销售额";
	        //刻度线透明度
	        valueAxis.gridAlpha = 0.2;
	        chart.addValueAxis(valueAxis);
	        var graph = new AmCharts.AmGraph();
	        graph.title = "value";
	        graph.valueField = "value";
	        graph.type = "column";
	        //鼠标移入提示信息
	        graph.balloonText = "[[category]] [[value]]";
	        //边框透明度
	        graph.lineAlpha = 0.3;
	        //填充颜色 
	        graph.fillColors = "#b9121b";
	        graph.fillAlphas = 1;

	        chart.addGraph(graph);

	        // CURSOR
	        var chartCursor = new AmCharts.ChartCursor();
	        chartCursor.cursorAlpha = 0;
	        chartCursor.zoomable = false;
	        chartCursor.categoryBalloonEnabled = false;
	        chart.addChartCursor(chartCursor);

	        chart.creditsPosition = "top-right";

	        //显示在Main div中
	        chart.write("cylindrical");
	    }  
</script>
</body>
</html>

