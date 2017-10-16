<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="keywords" content="百度地图,百度地图API，百度地图自定义工具，百度地图所见即所得工具" />
<meta name="description" content="百度地图API自定义地图，帮助用户在可视化操作下生成百度地图" />
<title>百度地图API自定义地图</title>
<!--引用百度地图API-->
<style type="text/css">
    html,body{margin:0;padding:0;}
    .iw_poi_title {color:#CC5522;font-size:14px;font-weight:bold;overflow:hidden;padding-right:13px;white-space:nowrap}
    .iw_poi_content {font:12px arial,sans-serif;overflow:visible;padding-top:4px;white-space:-moz-pre-wrap;word-wrap:break-word}
</style>
<style type="text/css">
		#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
		#map_container {width: 40%;height: 40%;overflow: hidden;margin:0;font-family:"微软雅黑";}
</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?key=&v=1.1&services=true"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=Yl98mP2bBGwwnntTkP9aZ5Cwfw9qLi0B"></script>
<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
</head>
<body>
  
  <div id="maptab11">
		<div id="map_container" style="float: center"> 
			<div id="allmap"></div> 
		</div>
		<strong>
		<div id="mapDiv" align="left" style="width: 40%;height: 40%;float: center;font-size:18px;">
			</br></br>
			你当前的位置为：
			<input readonly="readonly" style="border:none;" type="text" id="location"/>
			</br></br>
			起点：<input name="origin" id="origin" type="text" style="width:130px; margin-right:10px;"/>
			终点：<input name="destination" id="destination" type="text" style="width:230px; " value="天河区天寿路105号天寿大厦" ></input>
			</br></br>			
				<input type="button" value="查询" id="result" style="margin-right:50px;"/>
			</br></br>						
			乘车距离：
			<input readonly="readonly" style="border:none;" type="text" name="distance" id="distance"/>
			</br></br>
			乘车时间：
			<input readonly="readonly" style="border:none;" type="text" name="time" id="time"/>
			</br></br>
			
		</div>
		</strong>
	</div>
	<!--百度地图容器-->
  <div style="width:897px;height:450px;border:#ccc solid 1px;" id="dituContent"></div>
</body>
<script type="text/javascript">
    //创建和初始化地图函数：
    function initMap(){
        createMap();//创建地图
        setMapEvent();//设置地图事件
        addMapControl();//向地图添加控件
        addMarker();//向地图中添加marker
    }
    
    //创建地图函数：
    function createMap(){
        var map = new BMap.Map("dituContent");//在百度地图容器中创建一个地图
        var point = new BMap.Point(113.338215,23.15391);//定义一个中心点坐标
        map.centerAndZoom(point,17);//设定地图的中心点和坐标并将地图显示在地图容器中
        window.map = map;//将map变量存储在全局
    }
    
    //地图事件设置函数：
    function setMapEvent(){
        map.enableDragging();//启用地图拖拽事件，默认启用(可不写)
        map.enableScrollWheelZoom();//启用地图滚轮放大缩小
        map.enableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)
        map.enableKeyboard();//启用键盘上下左右键移动地图
    }
    
    //地图控件添加函数：
    function addMapControl(){
        //向地图中添加缩放控件
	var ctrl_nav = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
	map.addControl(ctrl_nav);
        //向地图中添加缩略图控件
	var ctrl_ove = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:1});
	map.addControl(ctrl_ove);
        //向地图中添加比例尺控件
	var ctrl_sca = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
	map.addControl(ctrl_sca);
    }
    
    //标注点数组
    var markerArr = [{title:"天寿大厦",content:"联系地址：天寿大厦三楼",point:"113.338979|23.153462",isOpen:1,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ];
    //创建marker
    function addMarker(){
        for(var i=0;i<markerArr.length;i++){
            var json = markerArr[i];
            var p0 = json.point.split("|")[0];
            var p1 = json.point.split("|")[1];
            var point = new BMap.Point(p0,p1);
			var iconImg = createIcon(json.icon);
            var marker = new BMap.Marker(point,{icon:iconImg});
			var iw = createInfoWindow(i);
			var label = new BMap.Label(json.title,{"offset":new BMap.Size(json.icon.lb-json.icon.x+10,-20)});
			marker.setLabel(label);
            map.addOverlay(marker);
            label.setStyle({
                        borderColor:"#808080",
                        color:"#333",
                        cursor:"pointer"
            });
			
			(function(){
				var index = i;
				var _iw = createInfoWindow(i);
				var _marker = marker;
				_marker.addEventListener("click",function(){
				    this.openInfoWindow(_iw);
			    });
			    _iw.addEventListener("open",function(){
				    _marker.getLabel().hide();
			    })
			    _iw.addEventListener("close",function(){
				    _marker.getLabel().show();
			    })
				label.addEventListener("click",function(){
				    _marker.openInfoWindow(_iw);
			    })
				if(!!json.isOpen){
					label.hide();
					_marker.openInfoWindow(_iw);
				}
			})()
        }
    }
    //创建InfoWindow
    function createInfoWindow(i){
        var json = markerArr[i];
        var iw = new BMap.InfoWindow("<b class='iw_poi_title' title='" + json.title + "'>" + json.title + "</b><div class='iw_poi_content'>"+json.content+"</div>");
        return iw;
    }
    //创建一个Icon
    function createIcon(json){
        var icon = new BMap.Icon("http://app.baidu.com/map/images/us_mk_icon.png", new BMap.Size(json.w,json.h),{imageOffset: new BMap.Size(-json.l,-json.t),infoWindowOffset:new BMap.Size(json.lb+5,1),offset:new BMap.Size(json.x,json.h)})
        return icon;
    }
    
    initMap();//创建和初始化地图
    
    
    //根据输入的起点和终点计算信息
		$("#result").click(function(){
			transit.search($("#origin").val(), $("#destination").val());//驾车查询 
		});
		//计算驾车时间和距离
		var searchComplete = function (results){
			if (transit.getStatus() != BMAP_STATUS_SUCCESS){
				return ;
			}
			var plan = results.getPlan(0);            
			$("#time").val(plan.getDuration(true)); //获取时间            
			$("#distance").val(plan.getDistance(true)); //获取距离
			$("#price").val(results.taxiFare.day.totalFare+"元");		
		}
		
		var transit = new BMap.DrivingRoute(map, {renderOptions: {map: map},
			onSearchComplete: searchComplete,
			onPolylinesSet: function(){        		
		}});
</script>
</html>