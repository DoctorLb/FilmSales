<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.userServer.UserServer"%>
<%@page import="com.entity.HuoDong"%>
<%@page import="com.filmDao.DBHelp"%>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=Gp4o5ABm8FEHGaYd92G6cViI"></script>
	<script type="text/javascript">
		var xhr;
		function doAjax(num){
			try {
				 xhr = new ActiveXObject("Msxml2.XMLHTTP");
				} catch (e) {
					try {
						xhr = new ActiveXObject("Microsoft.XMLHTTP");
					} catch (e) {
							try {
									xhr = new XMLHttpRequest();
									if (xhr.overrideMimeType) {
									xhr.overrideMimeType("text/xml");
							}
						} catch (e) {
						}
					}
				}
				var name = document.getElementById("filmName1").value;
				if(num==1){
					xhr.open('POST','../RightAjaxServlet?filmName='+name);
				}else if(num==2){
					var time1 = document.getElementById("sel1").value;
					//alert(time1);
					xhr.open('POST','../RightAjaxServlet?filmTime='+time1+'&filmName='+name);
				}
				xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
				xhr.onreadystatechange=function(){
					var st = xhr.readyState;
					if(st==4){
						var str = xhr.responseText;
						if(num==1){
							var filmtime = str.split("/");
							var str1 = "<option value='请选择时间'>请选择时间</option>";
							for(i=0;i<filmtime.length;i++){
								str1 = str1 + "<option value='"+filmtime[i]+"'>"+filmtime[i]+"</option>";
							}
							document.getElementById("div21").innerHTML=
							"<select id='sel1' name='filmTime' style='width:160px;height:30px;' onchange='doAjax(2)'>"+str1+"</select>";
						}else if(num==2){
							var filmRoom = str.split("/");
							var str1 = "<option value='请选择场次'>请选择场次</option>";
							for(i=0;i<filmRoom.length;i++){
								str1 = str1 + "<option value='"+filmRoom[i]+"'>"+filmRoom[i]+"</option>";
							}
							document.getElementById("div22").innerHTML=
							"<select id='filmRoom' name='filmRoom' style='width:160px;height: 30px;'>"+str1+"</select>";
						}
					}
				}
				xhr.send(null);
		}
		
		function yz(){
			var name = document.getElementById("filmName1").value;
			var time = document.getElementById("sel1").value;
			var room = document.getElementById("filmRoom").value;
			//alert(name);
			if(name!="请选择影片"&&time!="请选择时间"&&room!="请选择场次"){
				return true;
			}else{
				return false;
			}
		}
	</script>
  </head>
  
  <body>
  <% 
  	UserServer us = new UserServer();
  	ArrayList<HuoDong> list = us.selHuoDong();
  	HuoDong hd = list.get(0);
  %>
    <table  cellspacing="0" style="position: absolute;top:135px;border: 1px gray solid;">
    	<tr>
    		<td width="180" height="30" bgcolor="black" align="center"><font color="#FFFFFF">活动公告</font></td>	
    	</tr>	
    	<tr>
    		<td width="190" align="center">
    			<a href="#">
    				<img width="180" height="130" src="../<%=hd.getImg() %>"/>
    			</a>
    		</td>		
    	</tr>
    	<tr>
    		<td width="190" height="20"><font size="2"><%=hd.getShow() %></font></td>
    	</tr>
    	<tr>
    		<td width="190" height="20">
    			<font color="red" size="2">开始时间:<%=hd.getStarttime() %></font><br/>
    			<font color="red" size="2">结束时间:<%=hd.getStoptime() %></font>
    		</td>
    	</tr>
    	<!--  
    	<tr>
    		<td width="190" height="20"><a href="#" style="text-decoration: none">
    		     <font size="3">查看详情</font></a></td>
    	</tr>
    	-->
    </table><br/>
    <form action="../doBuyTicket" method="post" onsubmit="return yz()">
	    <table style="position: absolute;width: 190px;top:400px;border: 1px gray solid;">
	    	<tr>
	    		<td bgcolor="black" height="30"><font color="white">快速购票</font><font size="2" color="red">只需3步轻松购票</font></td>
	    	</tr>
	    	<tr><td height="10"></td></tr>
	    	<tr>
	    		<td align="center">
	    			<select id="filmName1" name="filmName" style="width: 160px;height: 30px;" onchange="doAjax(1)">
	    				<option value="请选择影片">请选择影片</option>
	    			<% 
	    				ArrayList<String> Filmlist = us.selFilmName();
	    				for(int i=0;i<Filmlist.size();i++){
	    			%>
	    				<option value="<%=Filmlist.get(i) %>"><%=Filmlist.get(i) %></option>
	    			<%	
	    				}
	    			%>
	    			</select>
	    		</td>
	    	</tr>
	    	<tr><td height="10"></td></tr>
	    	<tr>
	    		<td align="center">
	    			<div id="div21" style="width: 160;height: 30px;">
	    				<select id="sel1" name="filmTime" style="width:160px;height:30px;" onchange="doAjax(2)">
		    				<option value="请选择时间">请选择时间</option>
		    			</select>
	    			</div>
	    		</td>
	    	</tr>
	    	<tr><td height="10"></td></tr>
	    	<tr>
	    		<td align="center">
	    			<div id="div22" style="width: 160;height: 30px;">
	    				<select name="filmRoom" style="width:160px;height:30px;">
		    				<option value="请选择场次">请选择场次</option>
		    			</select>
	    			</div>
	    		</td>
	    	</tr>
	    	<tr><td height="10"></td></tr>
	    	<tr>
	    		<td align="center"><input type="submit" width="120" height="30" value="立即购票" /></td>
	    	</tr>
	    	<tr>
	    		<td>
	    			<table>
	    			<tr><td bgcolor="black" height="30"><font color="#FFFFFF">我们的联系方式</font></td></tr>
	    			<tr><td><font color="red">办公室：</font><font color="green">025-38383838</font></td></tr>
    				<tr><td><font color="red">传 &nbsp;真：</font><font color="green">025-88830300</font></td></tr>
    				<tr><td><font color="red">地 &nbsp;址：</font><font color="green">南京市南京XXX<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;XXX国际大厦</font></td></tr>
    				<tr><td><div style="width:191px;height:188px;border:#ccc solid 1px;font-size:12px" id="map"></div></td></tr>
    				</table>
	    		</td>
	    	</tr>
	    </table>
    </form>
  </body>
  <script type="text/javascript">
    //创建和初始化地图函数：
    function initMap(){
      createMap();//创建地图
      setMapEvent();//设置地图事件
      addMapControl();//向地图添加控件
      addMapOverlay();//向地图添加覆盖物
    }
    function createMap(){ 
      map = new BMap.Map("map"); 
      map.centerAndZoom(new BMap.Point(118.895658,31.918162),15);
    }
    function setMapEvent(){
      map.enableScrollWheelZoom();
      map.enableKeyboard();
      map.enableDragging();
      map.enableDoubleClickZoom()
    }
    function addClickHandler(target,window){
      target.addEventListener("click",function(){
        target.openInfoWindow(window);
      });
    }
    function addMapOverlay(){
    }
    //向地图添加控件
    function addMapControl(){
      var scaleControl = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
      scaleControl.setUnit(BMAP_UNIT_IMPERIAL);
      map.addControl(scaleControl);
      var navControl = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
      map.addControl(navControl);
      var overviewControl = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:true});
      map.addControl(overviewControl);
    }
    var map;
      initMap();
  </script>
</html>
