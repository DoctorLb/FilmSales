<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.entity.Film"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'UpdFilm.jsp' starting page</title>
    
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
			var path2=path1.split("\\");
			document.getElementById("showImage").src="../Image/"+path2[path2.length-1];
			document.getElementById("getImage").value="Image/"+path2[path2.length-1];

		}
 </script>
 <style type="text/css">
 	tr{
 		height: 40px;
 	}
 </style>
  </head>  
  <body background="../Image/right_1.gif">
  	<% 
  	Film film=(Film)session.getAttribute("film");
  	%>
    <form action="../UpdFilm" method="post">
    	<table border="1" style="border-color: red;position: absolute;left:180px;top:20px;" cellpadding="0" cellspacing="0">
    		<tr>
    			<td width="200px" height="200px">
    				<img src="../Image/17.jpg" id="showImage"><br>
    				<input type="hidden" name="getImage" id="getImage">
    				<input type="file" width="150px" name="choseImage" id="choseImage" onchange="change()">
    			</td>
    			<td>
    				<table style="border-color: green">
    					<tr>
    						<td>电影名：</td>
    						<td><input type="text" name="filmName" id="fileName" value="<%=film.getFilmName() %>"></td>
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
    						<td><input type="text" name="filmLong" id="filmLong" value="<%=film.getFilmLong() %>"></td>
    					</tr>
    					<tr>
    						<td>导演：</td>
    						<td><input type="text" name="director" id="director" value="<%=film.getDirector() %>"></td>
    					</tr>
    					<tr>
    						<td>主演：</td>
    						<td><input type="text" name="actor" id="actor" value="<%=film.getActor() %>"></td>
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
    						<td><input type="text" name="JianJie" id="JianJie" value="<%=film.getJianJie() %>"></td>
    					</tr>
    				</table>
    			</td>
    		</tr>
    		<tr>
    			<td colspan="2" align="center">
    				<input type="submit" value="确认">
    				<input type="reset" value="重置">
    			</td>
    		</tr>
    	</table>
    </form>
  </body>
</html>
