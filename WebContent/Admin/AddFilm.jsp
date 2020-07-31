<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.entity.Film"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'AddFilm.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script>
		function change(){
			var path1=document.getElementById("choseImage").value;
			if(path1.length>0){
				var path2=path1.split("\\");
				document.getElementById("showImage").src="../Image/"+path2[path2.length-1];
				document.getElementById("getImage").value="Image/"+path2[path2.length-1];
				var filmName1=document.getElementById("filmName").value;
				var filmLong1=document.getElementById("filmLong").value;
				var director1=document.getElementById("director").value;
				var actor1=document.getElementById("actor").value;				
				var JianJie1=document.getElementById("JianJie").value;
				if(filmName1.length>0&&filmLong1.length>0&&director1.length>0&&actor1.length>0&&JianJie1.length>0){
					return true;
				}else{
					return false;
				}
			}else{
				return false;
			}
		}
	</script>
	<style type="text/css">
		tr{
			height: 36px;
		}
		td{
			font-size: 14;
		}
	</style>
  </head>
  
  <body background="../Image/right_1.gif">
  	<% 
  	Object denglu=session.getAttribute("denglu");
  	if(denglu==null){
  		response.sendRedirect("faileLogin.jsp");
  	}else{
	  	Object biaoshi1=session.getAttribute("biaoshi1");
	  	Object biaoshi2=session.getAttribute("biaoshi2");
	  	if(biaoshi1!=null){
	  	%>
	  		<form action="../DoAdd" method="post">
		    	<% 
		    	session.removeAttribute("biaoshi1");
			    Film film = (Film)(session.getAttribute("film"));
			    int filmState=film.getFilmState();
			    String filmState1="";
			    if(filmState==0){
			    	filmState1="正在上映";
			    }else if(filmState==1){
			    	filmState1="即将上映";
			    }else if(filmState==2){
			    	filmState1="未上映";
			    }
			    %>
			    <table border="1" style="position: absolute;left:250px;top:20px;">
			    	<tr>
			    		<td><img src="../<%=film.getFilmImg() %>"></td>
			    		<td>
			    			<table>
			    				<tr>
			    					<td>电影名：</td>
			    					<td><%=film.getFilmName() %></td>
			    				</tr>
			    				<tr>
			    					<td>类型：</td>
			    					<td><%=film.getFilmType() %></td>
			    				</tr>
			    				<tr>
			    					<td>片长：</td>
			    					<td><%=film.getFilmLong() %></td>
			    				</tr>
			    				<tr>
			    					<td>导演：</td>
			    					<td><%=film.getDirector() %></td>
			    				</tr>
			    				<tr>
			    					<td>主演：</td>
			    					<td><%=film.getActor() %></td>
			    				</tr>
			    				<tr>
			    					<td>语言：</td>
			    					<td><%=film.getFilmLanguage() %></td>
			    				</tr>
			    				<tr>
			    					<td>状态：</td>
			    					<td><%=filmState1 %></td>
			    				</tr>
			    				<tr>
			    					<td>简介：</td>
			    					<td><%=film.getJianJie() %></td>
			    				</tr>
			    			</table>
			    		</td>
			    	</tr>
			    </table>
			     <input type="submit" value="确认添加" style="position: absolute;left:330px;top:370px;">
		    </form>
		    <form action="UpdFilm.jsp" method="post">
		    	<input type="submit" value="返回修改" style="position: absolute;left:420px;top:370px;">
		    </form>
	  	<%	
	  	}else{
	  	%>
	  		<form action="../AddSevlet" method="post" onsubmit="return change()">
	    	<table border="1" style="border-color: red;position: absolute;left:180px;top:20px;" cellpadding="0" cellspacing="0">
	    		<tr>
	    			<td width="200px" height="200px" align="center">
	    				<img src="../Image/filmbg.jpg" id="showImage" style="width: 200px;height: 250px;"><br>
	    				<input type="hidden" name="getImage" id="getImage">
	    				<input type="file" width="150px" name="choseImage" id="choseImage" onchange="change()">
	    			</td>
	    			<td>
	    				<table>
	    					<tr>
	    						<td>电影名：</td>
	    						<td><input type="text" name="filmName" id="fileName"></td>
	    					</tr>
	    					<tr>
	    						<td>类型：</td>
	    						<td>
	    							<select name="filmType" id="filmType">
	    								<option selected="selected">科幻片</option>
	    								<option>战争片</option>
	    								<option>爱情片</option>
	    								<option>喜剧片</option>
	    								<option>恐怖片</option>
	    								<option>动作片</option>
	    							</select>
	    						</td>
	    					</tr>
	    					<tr>
	    						<td>片长：</td>
	    						<td><input type="text" name="filmLong" id="filmLong"></td>
	    					</tr>
	    					<tr>
	    						<td>导演：</td>
	    						<td><input type="text" name="director" id="director"></td>
	    					</tr>
	    					<tr>
	    						<td>主演：</td>
	    						<td><input type="text" name="actor" id="actor"></td>
	    					</tr>
	    					<tr>
	    						<td>语言：</td>
	    						<td>
	    							<select name="filmLanguage" id="filmLanguage">
	    								<option selected="selected">英语</option>
	    								<option>国语</option>
	    								<option>俄语</option>
	    								<option>日韩</option>
	    								<option>其他</option>
	    							</select>
	    						</td>
	    					</tr>
	    					<tr>
	    						<td>状态：</td>
	    						<td>
	    							<select name="filmState" id="filmState">
	    								<option selected="selected">即将上映</option>
	    								<option>正在上映</option>
	    								<option>未上映</option>    								
	    							</select>
	    						</td>
	    					</tr>
	    					<tr>
	    						<td>简介：</td>
	    						<td><input type="text" name="JianJie" id="JianJie"></td>
	    					</tr>
	    				</table>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td colspan="2" align="center">
	    				<input type="submit" value="添加">
	    				<input type="reset" value="重置">
	    			</td>
	    		</tr>
	    	</table>
	    	
	 		<% 
			if(biaoshi2!=null){
			int bs2=Integer.parseInt(biaoshi2.toString());
				if(bs2==1){
					%>
					<div ><font color="red" style="position: absolute;left:380px;top: 380px;">添加成功</font></div>
					<%
				}else{
					%>
					<font color="red" style="position: absolute;left:380px;top: 360px;">添加失败</font>
					<%
				}
				session.removeAttribute("biaoshi2");
			}
			%>
	    </form>
	  	<%
	  	}
  	}
  	%>
  </body>
</html>
