<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.entity.Film"%>
<%@page import="com.userServer.UserServer"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	 <script>
  		function hiddenPage(){
  			var pages=document.getElementById("hiddenPage").value;
  			var listSize=document.getElementById("nextSize").value;
 			if(pages==0){
  				document.getElementById("lastPage").style.display="none";
  			}
  			if(listSize==0){
  				document.getElementById("nextPage").style.display="none";
  			}	
  		}
  </script>
  </head>
  <link rel="stylesheet" type="text/css" href="a.css">
   <%
   	if(session.getAttribute("Pages")!=null){
    String pages=session.getAttribute("Pages").toString();
    session.setAttribute("Pages",pages);
    //转到查看详情页面时使用
    session.setAttribute("pages",0);
    UserServer as1 =new UserServer();
    String state="";
    int  p=Integer.parseInt(pages);
    //以下代码是为了得到下一页的sql语句
    String sql="";
			if (session.getAttribute("state")==null) {
				sql="select * from film where filmState=0 limit "+(9*(p+1))+",9";
			}else{
				if(state.equals("0")){
				
				sql="select * from film where filmState=0 limit "+(9*(p+1))+",9";
			}else {
				sql="select * from film where filmState=1 limit "+(9*(p+1))+",9";
			}
				
			}
    ArrayList<Film> nextList = as1.getAllCurrent((Integer.parseInt(pages)+1),sql);
    %>
  <body  onload="hiddenPage()" bgcolor="#EEE9E9">
  	<table align="center"><tr><td>
     <table>
     	<tr><td width="1000"><jsp:include page="Top.jsp"></jsp:include></td></tr>
     </table></td></tr>
     <tr><td>
     <table cellpadding="0" cellspacing="0" width="1000">
		 <tr >
		 	<td style="font-size:14px;border: 0px;" width="200">
			<jsp:include page="Left.jsp"></jsp:include>
			</td>			
			<td style="font-size:14px;border: 0px;" valign="top" width="800">						
    	 		<c:set var="currentlist" value="${currentList}"></c:set>
	        	<table width="800">
	        		<tr><td height="86px"></td></tr>
	        		
		        	<tr>
		        		<td valign="top" colspan="3" style="border-top-style:solid; border-top-color: green;">
		        			<a href="../CurrentServlet?state=0"><font size="2" face="宋体">正在热映</font></a>
							<a href="../CurrentServlet?state=1"><font size="2" face="宋体">即将上映</font></a>				
		        		</td>
		        	</tr>
		    			<% int i=0; %>
		    			<c:forEach begin="<%=i %>" end="2" step="1">
		    				<tr>
					    		<c:forEach var="curlist" items="${currentlist}"  begin="<%=3*i%>" end="<%=(3*(i++)+2)%>" step="1">
					    			<td height="170px;">
					    				<table style="font-size: 12px" width="250px" height="170" >
					    					<tr><td rowspan="6"><a href="../SelectFilmById?filmId=${curlist.filmId}"><img style="height: 162;width: 124px;" src="../${curlist.filmImg}"/></a></td></tr>
											<tr><td>${curlist.filmName}</td></tr>
											<tr><td>导演：${curlist.director}</td></tr>
											<tr><td>演员：${curlist.actor}</td></tr>
											<tr><td>类型：${curlist.filmType}</td></tr>
											<tr><td>片长：${curlist.filmLong}</td></tr>
											<tr align="center">
												<td>
													<c:if test="${curlist.filmState==0}">
														<a href="../SelectFilmById?filmId=${curlist.filmId}" >我要购买</a>
													</c:if>
													<c:if test="${curlist.filmState==1}">
														<a href="../SelectFilmById?filmId=${curlist.filmId}">查看详情</a>		
													</c:if>
												</td>
											</tr>
				    					</table>
					    			</td>
					    		</c:forEach>
				    		</tr>	
			    	    </c:forEach>
			    		<tr><td colspan="2" width="700px;"><span id="lastPage" style="width: 80px;"><a href="../CurrentServlet?biaoshi=shang"><font size="2">上一页</font></a></span><span id="nextPage" style="display: inline;width: 80px;"><a href="../CurrentServlet?biaoshi=xia"><font size="2">下一页</font></a></span></td></tr>
	    		</table>
    		</td>
    	</tr>
    	<tr>
    		<td>
    			<input type="hidden" value=<%=pages %> id="hiddenPage"/>
    			<input type="hidden" value=<%=nextList.size()%> id="nextSize"/>
    		</td>
    	</tr>
    </table></td></tr>
    </table>
    <%
    }else{
    	response.sendRedirect("../CurrentServlet");
    }
     %>					                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
  </body>
</html>
