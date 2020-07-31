<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.adminServer.AdminServer"%>
<%@page import="com.entity.Film"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>My JSP 'DelFilm.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script language="javascript">
		function del(){
			window.location="../DoDelAll";
		}
		function del1(id){
			window.location="../DoDelOne?filmId="+id;
		}
	</script>
  </head>
  
  <body>
    <form action="../DelCheck" method="post">
	   <% 
	  	AdminServer as=new AdminServer();
	    ArrayList<Film> list=as.selDownFilm();
	    if(list.size()==0){
	    	out.print("没有找到相关内容 ");
	    }else{
	    	  %>
	    <table border="1">
	    	<tr>				
				<td>编号</td>
				<td>电影名</td>
				<td>类型</td>
				<td>导演</td>
				<td>主演</td>
				<td>语言</td>
				<td>片长</td>
				<td>状态</td>					
				<td>简介</td>	
				<td>操作</td>    	
	    	</tr>
	    	<% 
	    	String state="";
	    	for(int i=0;i<list.size();i++){
	    		if(list.get(i).getFilmState()==0){
	    			state="正在上映";
	    		}else if(list.get(i).getFilmState()==2){
	    			state="未上映";
	    		}else if(list.get(i).getFilmState()==1){
	    			state="即将上映";
	    		}
	    		%>
	    		<tr>
	    			<td><%=list.get(i).getFilmId() %></td>
	    			<td><%=list.get(i).getFilmName() %></td>
	    			<td><%=list.get(i).getFilmType()%></td>
	    			<td><%=list.get(i).getActor()%></td>
	    			<td><%=list.get(i).getFilmLanguage() %></td>
	    			<td><%=list.get(i).getFilmLong() %></td>
	    			<td><%=list.get(i).getFilmLong() %></td>
	    			<td><%=state %></td>
	    			<td><%=list.get(i).getJianJie() %></td>
	    			<td><input type="checkbox" name="check2" value="<%=list.get(i).getFilmId() %>">
	    			<input type="button" value="删除" onclick="del1('<%=list.get(i).getFilmId() %>')"></td>
	    		</tr>
	    		<%
	    	}
	    	%>
	    	<tr>
	    		<td colspan="10"><input type="button" onclick="del()" value="删除所有">
	    			<input type="submit" value="删除选中项">
	    		</td>
	    	</tr>
	    </table>
	    <%
	    }
	   %>
  	</form>
  </body>
</html>
