<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8"/>
<title>后台管理系统</title>
<meta name="author" content="DeathGhost" />
<link rel="stylesheet" type="text/css" href="css/style.css">
<!--[if lt IE 9]>
<script src="js/html5.js"></script>
<![endif]-->
<script src="js/jquery.js"></script>
<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
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
</head>
<body>
<!--header-->
<%@ include file="head.jsp" %>


<style>
.dataStatistic{width:700px;height:500px;border:1px solid #ccc;margin:0 auto;margin:10px;overflow:hidden}
#cylindrical{width:700px;height:500px;margin-top:-15px}
#line{width:700px;height:500px;margin-top:-15px}  
#pie{width:700px;height:500px;margin-top:-15px;}
</style>
<section class="rt_wrap content mCustomScrollbar">

 <div class="rt_content">
     <!--开始：以下内容则可删除，仅为素材引用参考-->
     <h1 style="color:red;font-size:80px;font-weight:bold;text-align:center;">欢迎登陆易通市场</h1>
     <p style="color:red;font-size:16px;font-weight:bold;text-align:center;margin:8px 0;background:#FFC;
     padding:8px;"></p>
<!--统计图-->
<section style="overflow:hidden"  >
	<!--柱状图-->
    <div class="dataStatistic fl">
     <div id="cylindrical">
     </div>
    </div> 
    <!--饼状图-->
    <div class="dataStatistic fl">
     <div id="pie" >
     </div>
    </div>
</section>
     <!--点击加载-->
     <script>
     $(document).ready(function(){
		$("#loading").click(function(){
			$(".loading_area").fadeIn();
             $(".loading_area").fadeOut(1500);
			});
		 });
     </script>
     <section class="loading_area">
      <div class="loading_cont">
       <div class="loading_icon"><i></i><i></i><i></i><i></i><i></i></div>
       <div class="loading_txt"><mark>数据正在加载，请稍后！</mark></div>
      </div>
     </section>
     <!--结束加载-->
     <!--弹出框效果-->
     <script>
     $(document).ready(function(){
		 //弹出文本性提示框
		 $("#showPopTxt").click(function(){
			 $(".pop_bg").fadeIn();
			 });
		 //弹出：确认按钮
		 $(".trueBtn").click(function(){
			 alert("你点击了确认！");//测试
			 $(".pop_bg").fadeOut();
			 });
		 //弹出：取消或关闭按钮
		 $(".falseBtn").click(function(){
			 alert("你点击了取消/关闭！");//测试
			 $(".pop_bg").fadeOut();
			 });
		 });
     </script>
     <section class="pop_bg">
      
     </section>
     <!--结束：弹出框效果-->

     <section>
      
       <!--左右分栏：右侧栏-->
      </div>
      <div class="admin_tab_cont">tabContent02，内容根据具体数据二次单独定义，公共样式单独调用</div>
      <div class="admin_tab_cont">可追加</div>
     </section>
    <!--结束：以下内容则可删除，仅为素材引用参考-->

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
  { "name": '${classificStr[0]}', "value": '${sellNum[0]}' },
  { "name": '${classificStr[1]}', "value": '${sellNum[1]}' },
  { "name": '${classificStr[2]}', "value": '${sellNum[2]}' },
  { "name": '${classificStr[3]}', "value": '${sellNum[3]}' },
  { "name": '${classificStr[4]}', "value": '${sellNum[4]}' },
  { "name": '${classificStr[5]}', "value": '${sellNum[5]}' },
  { "name": '${classificStr[6]}', "value": '${sellNum[6]}' },
  { "name": '${classificStr[7]}', "value": '${sellNum[7]}' },
  { "name": '${classificStr[8]}', "value": '${sellNum[8]}' },

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
        valueAxis.title = "商品销量图";
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
   //根据json数据生成饼状图，并将饼状图显示到div中
     function MakeChart(value) {  	 
         chartData = eval(value);
         //饼状图
         chart = new AmCharts.AmPieChart();
         chart.dataProvider = chartData;
         //标题数据
         chart.titleField = "name";
         //值数据
         chart.valueField = "value";
         //边框线颜色
         chart.outlineColor = "#fff";
         //边框线的透明度
         chart.outlineAlpha = .8;
         //边框线的狂宽度
         chart.outlineThickness = 1;
         chart.depth3D = 20;
         chart.angle = 30;
         chart.write("pie");
     }       
</script>
</body>
</html>