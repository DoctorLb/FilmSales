<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.userServer.UserServer"%>
<%@page import="com.entity.Film"%>
<%@page import="com.entity.UserInfo"%>

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
	<style type="text/css">
    	.tab1{
			position:absolute;
			width:200px; 
			top:140px;
			}
		.text1{
			width:120px;
			border:1px #333 solid;
			}
		.but1{
			width:60px;
			border:1px #333 solid;
			}
		.div1{
			width:180px;
			height:110px;
			background-color:#CCC;
			}
		.div2{
			width:180px;
			height:140px;
			background-color:#CCC;
			}
		.left{
			background-color:#CCC;		
			}			
    </style>
    <script type="text/javascript">
    	function show(){
    		document.getElementById("filmId").value = "";
    		document.getElementById("filmId").className="yz1";
    	}
    	function pd11(){
    		var name = document.getElementById("filmId").value;
    		if(name=="请输入电影名"||name==""){
    			document.getElementById("filmId").className="yz";
    			return false;
    		}else{
    			document.getElementById("filmId").className="yz1";
    			return true;
    		}
    		return false;
    	}
    	function yz11(){
    		if(pd11()){
    			return true;
    		}else{
    			return false;
    		}
    		return false;
    	}
    </script>
   	<style type="text/css">
		.yz{
			width:120px;
			border: 1px red solid;
		}
		.yz1{
			width:120px;
			border: 1px gray solid;
		}
</style>
  </head>
  
  <body>
       <table class="tab1">
           <tr>
               <td>
               	  <form action="../SelectFilmByName" onsubmit="return yz11()">
                   	<input type="text" id="filmId" class="text1" value="请输入电影名" name="filmName" onfocus="show()"/>
                   	<input type="submit"  id="but" name="but" value="查 询"/>
                   </form>
               </td>
           </tr>
           <tr><td height="10"></td></tr>
           <tr>
               <td>
               <% 
               	UserInfo user = (UserInfo)session.getAttribute("user"); //判断用户是否登录
               	if(user==null){ 	//如果用户没有登录则显示登录界面
               %>
               	<div id="div1" class="div1">
                    <form action="../UserLogin" method="post">
                        <table>
                            <tr>
                                <td colspan="2" align="center">用户登录</td>
                            </tr>
                            <tr>
                                <td>帐号:</td>
                                <td><input type="text" class="text1" id="userId" name="userId" /></td>
                            </tr>
                            <tr>
                                <td>密码:</td>
                                <td><input type="password" class="text1" id="userPwd" name="userPwd"/></td>
                            </tr>
                            <tr>
                                <td><a href="UserReg.jsp">注册</a></td>
                                <td>
                                    <input type="submit" value="登 录" />&nbsp;
                                    <input type="reset" value="重 置" />
                                </td>
                            </tr>
                            <% 
                            	if(request.getParameter("biaoji")!=null){
                            		if(request.getParameter("biaoji").equals("1")){
                            %>
                            <tr>
                            	<td colspan="2"><div id="UserLoginDiv" ><font color="red">登陆失败,账号或密码错误</font></div></td>
                            </tr>
                            <%		
                            		}
                            	}
                            %>
                        </table>
                    </form>    
                   </div>
               <%	
               	}else{ //如果用户登录了则显示登录的用户的信息
               %>
               	<div id="div2" class="div2">
               	<% 
               		UserServer us = new UserServer();
               		UserInfo users = us.selectMe(user.getUserId());
               	%>
                       <table>
                           <tr>
                               <td align="center">你好,<%=user.getUserName()%>,欢迎光临</td>
                           </tr>
                           <tr>
                               <td>帐号:<%=users.getUserId() %></td>
                           </tr>
                           <tr>
                               <td>姓名:<%=users.getUserName() %></td>
                           </tr>
                           <tr>
                               <td>性别:<%=users.getUserSex() %></td>
                           </tr>
                           <tr>
                               <td>积分:<%=users.getUserScore() %></td>
                           </tr>
                           <tr>
                               <td>余额:<%=users.getUserMoney() %></td>
                           </tr>
                       </table>  
                   </div>
               <%	
               	}
               %>
               </td>
           </tr>
           <tr><td height="10"></td></tr>
           <tr>
               <td>
                   <table width="180" height="400">
                       <tr>
                           <td height="50" align="center" bgcolor="#333333"><font color="#FFFFFF">用户关注排行榜</font></td>
                       </tr>
	                <% 
						UserServer us = new UserServer();
						ArrayList<Film> list = us.selFilmScore(); //查询用户关注度排行榜并循环显示
						if(list!=null){
							for(int i=0;i<list.size();i++){
								Film film = list.get(i);
					%>
						<tr>
							<td class="left" align="center" height="50">
								
								<a href="../SelectFilmById?filmId=<%= film.getFilmId() %>">
									<%=film.getFilmName()%>
								</a><br/>
								(<%=film.getFilmScore() %>人关注)
							</td>
						</tr>
					<%		
							}
						}                                 
	                %>       
                       
                   </table>
               </td>
           </tr>
       </table>
   </body>
</html>
