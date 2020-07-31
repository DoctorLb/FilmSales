<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.entity.PingJia"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
 
  <head>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=Gp4o5ABm8FEHGaYd92G6cViI"></script>
	<script type="text/javascript">
  		function hiddenPage(){
  		document.getElementById("attention").innerHTML = document.getElementById("guanzhu").value;
  			var pages=document.getElementById("hiddenPage").value;
  			var listSize=document.getElementById("nextSize").value;
  			var commentsize=document.getElementById("pingjiaSize").value;
 			if(pages==0){
  				document.getElementById("lastPage").style.display="none";
  			}
  			if(listSize==0){
  				document.getElementById("nextPage").style.display="none";
  			}
  			if(commentsize==0){
  				document.getElementById("selectCom").innerHTML="暂无评论";
  			}
  		
  		}
  		function hideGuanZhu(){
  			
  			document.getElementById("attention").style.display="none";
  		}
  		function showGuanZhu(){
  		
  			document.getElementById("attention").style.display="block";
  		}
  		function clearComment(){
  			document.getElementById("commentText").innerHTML="";
  		}
		var b = 1;
		var c = true;
		function fade(){
			if(document.all);
			if(c == true) {
			b++;
			}
			if(b==40) {
			b--;
			c = false
			}
			
			if(b==8) {
			b++;
			c = true;
			}
			
			if(c == false) {
			b--;
			}
			fuwu.width=100 + b;
			fuwu.height=120 - b;
			setTimeout("fade()",6);
		}
  		
  </script>
  	<link rel="stylesheet" type="text/css" href="a.css">
  </head>
 
  <style>
  .select{font-size:12px;font-family:verdana,arial;color:black;}
  </style>
  <%
  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");
  UserServer as = new UserServer();
  Film film1 = (Film)session.getAttribute("film");
  int filmId=film1.getFilmId();
  String pages="";
  int p=0;
  if(session.getAttribute("page")!=null){
  	 pages=session.getAttribute("page").toString();
 	 p=Integer.parseInt(pages);
  }
 session.setAttribute("pages",pages);
//设置sql语句
String sql ="select id,userId,pingJia,time,pingjia.filmId from pingjia inner join film on " +
				"film.filmId='"+filmId+"' and film.filmId=pingjia.filmId limit "+((p+1)*4)+",4";
//获得下一页评论集合
ArrayList<PingJia> nextList = as.getCommentByPage(filmId,p+1,sql);
session.setAttribute("filmId",filmId);
%>
  <body onload="hiddenPage()" onkeydown="" bgcolor="#EEE9E9" >
    	<table width="1000" border="1" bordercolor="green" align="center">
    		<tr><td colspan="3" width="1000" height="120" valign="top"><%@include file="Top.jsp"%></td></tr>
    		<tr>
    			<td width="200px" rowspan="2"><%@ include file="Left.jsp" %></td>
    			<td width="600px" >  
    				<table  width="600px" class="select">
    				<c:set var="movieList" value="${film}"></c:set>
    				<c:if test="${film.filmState==0}">
    					<tr>
    						<td rowspan="6"><img src="../${film.filmImg}"/></img></td>  
    						<td width="500px">名称:${film.filmName}</td>   		
    					</tr>
    					<tr>
    						<td>导演: ${film.director}</td>
    					</tr>
    					<tr>
    						<td>演员:${film.actor}</td>
    					</tr>
    					<tr>
    						<td>类型:${film.filmType}</td>
    					</tr>   																					
    					<tr>
    						<td>片长:${film.filmLong}</td>   						
    					</tr>
    					<tr><td height="30px"></td></tr>
    					<tr>
    						<td colspan="3"><font color="red">放映场次:</font></td>
    					</tr>
    						<tr>
    							<td colspan="3">
    								<table width="550px;" class="select" bgcolor="#EEE0E5" height="100">
    									<tr><td width="100">放映日期</td><td width="100">时间</td><td width="100">放影厅</td><td width="100">价格</td><td width="150">操作</td></tr>
    									<c:forEach var="shows" items="${filmShow}">
    									<tr>
    										<td>${shows.showDate}</td>
    										<td>${shows.showTime}</td>
    										<td>${shows.roomId.roomId.roomId}</td>
    										<td>${shows.filmPrice}</td>
    										<td>
    										<form action="../doBuyTicket" method="post">
    										<table>
    										<tr>
    										<td><input type="hidden" name="filmName" value="${film.filmName}"/></td>
    										<td><input type="hidden" name="filmTime" value="${shows.showDate}+' '+${shows.showTime}"/></td>
    										<td><input type="hidden" name="filmRoom" value="${shows.roomId.roomId.roomId}"/></td>
    										<td><input type="image" src="../Image/buyBtn.jpg"/></td>
    										</tr>
    										</table>
    										</form>
    										</td>
    									</tr>
    									</c:forEach>
    								</table>
    							</td>
    						</tr>
    				</c:if>
    				<c:if test="${film.filmState==1}">
    					<tr>
    						<td rowspan="6" width="125" ><img src="../${film.filmImg}" width="126"/></img></td>
    						<td width="475">名称:${film.filmName}</td> 
    					</tr>
    					<tr>
    						<td>导演: ${film.director}</td>
    					</tr>
    					<tr>
    						<td>演员:${film.actor}</td>
    					</tr>
    					<tr>
    						<td>类型:${film.filmType}</td>
    					</tr>   																					
    					<tr>
    						<td>片长:${film.filmLong}</td>   						
    					</tr>
    					<tr>
    						<td>即将放映,敬请关注</td>   						
    					</tr>
    				</c:if>
    					<tr><td colspan="2"><br><font color="red">剧情简介:</font></td></tr>
    					<tr>
    						<td colspan="2"><br><span style="width: 550px;background-color: #EEE0E5;height: 200px;">${film.jianJie}</span></td>
    					</tr>
    					<tr>
    						<td colspan="2">
    							<div style="width: 80px;" onmouseover="showComment()"><font color="red">网友评论:</font></div> 
    						</td>
    					</tr>
			    		<tr>
			    			<td height="200px" colspan="2" width="550px">
			    				<c:set var="list" value="${commentList}"></c:set>
			    				<table class="select" height="150px" width="550px" >
			    					<tr><td colspan="2"><div id="selectCom" style=" background-color: #EEE0E5;width: 550px;height: 150px;"><c:forEach var="comment" items="${list}">${comment.time}&nbsp;网友：${comment.userId.userId}说:&nbsp;${comment.pingJia}<br></c:forEach></div></td></tr>
			    					<tr>
			    						<td>
			    							<span id="lastPage" style="width:80px;"><a href="../SelectFilmById?biaoshi=shang">上一页</a></span>    						
			    							<span id="nextPage" style="width:100px;display: inline;"><a href="../SelectFilmById?biaoshi=xia" >下一页</a></span>	
			    						</td>		    		
			    					</tr>
			    				</table>
			    			</td>		
			    		</tr>
			    		<tr>
			    			<td colspan="2"><div style="display: inline;" onmouseover="submitComment()"><font color="red">我要评论:</font></div></td>
			    		</tr>
			    		<tr>
			    			<td height="200px" colspan="2">
				    			<form action="../CommentServlet?filmId=${film.filmId}" method="post">    				
				    				<div id="submitCom"><textarea style="height: 100px;width: 550px;" id="commentText" name="commentText" onfocus="clearComment()">此处输入评论内容</textarea><br/><input type="submit" value="发表"/></div>
				    			</form>
			    			</td>
			    		</tr>
    				</table>
    			</td>				   						
    			<td width="200" style="font-size: 14px;border:0px; font-family:宋体;" valign="top">
    				<span onmouseover="showGuanZhu()" onmouseout="hideGuanZhu()">喜欢这部电影？特别<a href="../GuanZhuServlet?filmId=${film.filmId}" >关注</a>一下！<br><br>已有<span id="ren"><font color="red">${film.filmScore}</font></span>人关注过该电影<br/></span><table><tr><td height="20"></td></tr></table>
    				<table><tr><td width="200" align="center"><img src="../Image/fuwu.jpg" name="fuwu"/></td></tr></table>
    				<table><tr><td width="190" height="30" bgcolor="#EE7921" align="center"><font color="white" size="2">在线客服</font></td></tr></table>
    				
    				<marquee  behavior="scroll" direction="up" onmouseover="this.stop()" onmouseout="this.start()">
    					<a href="#"><font color="red">在线客服&nbsp;</font>QQ:785976562</a><br/><br/>
    					<a href="#"><font color="red">在线客服&nbsp;</font>QQ:121212121</a><br/><br/>
    					<a href="#"><font color="red">在线客服&nbsp;</font>QQ:383838383</a><br/><br/>
    					<a href="#"><font color="red">在线客服&nbsp;</font>QQ:666666666</a><br/><br/>
    					<a href="#"><font color="red">在线客服&nbsp;</font>QQ:785976562</a><br/><br/>
    					<a href="#"><font color="red">在线客服&nbsp;</font>QQ:121212121</a><br/><br/>
    					<a href="#"><font color="red">在线客服&nbsp;</font>QQ:383838383</a><br/><br/>
    					<a href="#"><font color="red">在线客服&nbsp;</font>QQ:666666666</a><br/><br/>
    				</marquee>
    				<table><tr><td width="190" height="30" bgcolor="#EE7921" align="center"><font color="white" size="2">联系我们</font></td></tr></table>
    				<div style="width:191px;height:188px;border:#ccc solid 1px;font-size:12px" id="map"></div><br/><br/>
    				<font color="red">办公室：</font><font color="green">025-38383838</font><br/><br/>
    				<font color="red">传 &nbsp;真：</font><font color="green">025-88830300</font><br/><br/>
    				<font color="red">地 &nbsp;址：</font><font color="green">南京市XXXX<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;XXXX国际大厦</font><br/><br/>
    				
    				<br/>

    				<div style="position:absolute;left:770;top:220; display: block;height: 30px;background-color:#EEB4B4;" id="attention" ></div>
    			</td>						
    		</tr>
    	</table>
    	<input type="hidden" value=<%=pages %> id="hiddenPage"/>
    	<input type="hidden" value=<%=nextList.size()%> id="nextSize"/>
    	<input type="hidden" value="${guanzhu}" id="guanzhu"/>
    	<%ArrayList<PingJia> pingjiaList=(ArrayList<PingJia>)session.getAttribute("commentList"); %>
    	<input type="hidden" value=<%=pingjiaList.size()%> id="pingjiaSize"/>
    	
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
