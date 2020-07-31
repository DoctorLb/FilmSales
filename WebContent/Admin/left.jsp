<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>后台</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		a{
			text-decoration: none;
			color: blue;
			
		}
		.bian1{
			text-decoration:underline;
			color: red;
		}
		.bian2{
			text-decoration: none;
			color: blue;
		}
		td{
			border: solid 1px green; height: 30px;
		}
		a:hover {
			text-decoration: none;
		}
	</style>
	<script language="javascript">
		function bian1(name){
			name.className="bian1";
		}
		function bian2(name){
			name.className="bian2";
		}
	</script>
  </head>
  
  <body bgcolor="lightblue">
  	<table  style="border: solid 0px green;position: absolute;left:20px;" cellspacing="4" cellpadding="0" width="182">
  		<tr>
  			<td background="../Image/left_2.gif"><a href="AdminLogin.jsp" target="right" onmousemove="bian1(this)" onmouseout="bian2(this)">&nbsp;&nbsp;登录系统</a><br></td>
  		</tr>
  		<tr>
  			<td background="../Image/left_2.gif"><a href="UpdAdminPwd.jsp" target="right" onmousemove="bian1(this)" onmouseout="bian2(this)">&nbsp;&nbsp;修改密码</a><br></td>
  		</tr>
  		<tr>
  			<td background="../Image/left_2.gif"><a href="AddFilm.jsp" target="right" onmousemove="bian1(this)" onmouseout="bian2(this)">&nbsp;&nbsp;添加电影</a><br></td>
  		</tr>
  		<tr>
  			<td background="../Image/left_2.gif"><a href="SelFilm.jsp" target="right" onmousemove="bian1(this)" onmouseout="bian2(this)">&nbsp;&nbsp;修改电影状态</a><br></td>
  		</tr>
  		<tr>
  			<td background="../Image/left_2.gif"><a href="SelUser.jsp" target="right" onmousemove="bian1(this)" onmouseout="bian2(this)">&nbsp;&nbsp;查看用户信息</a><br></td>
  		</tr>
  		<tr>
  			<td background="../Image/left_2.gif"><a href="UpdHotFilm.jsp" target="right" onmousemove="bian1(this)" onmouseout="bian2(this)">&nbsp;&nbsp;添加热映电影</a><br></td>
  		</tr>
  		<tr>
  			<td background="../Image/left_2.gif"><a href="ShowAll.jsp" target="right" onmousemove="bian1(this)" onmouseout="bian2(this)">&nbsp;&nbsp;查看电影详细信息</a><br></td>
  		</tr>
  		<tr>
  			<td background="../Image/left_2.gif"><a href="SelUnShow.jsp" target="right" onmousemove="bian1(this)" onmouseout="bian2(this)">&nbsp;&nbsp;安排放映</a><br></td>
  		</tr>
  		<tr>
  			<td background="../Image/left_2.gif"><a href="SelTotalMoney.jsp" target="right" onmousemove="bian1(this)" onmouseout="bian2(this)">&nbsp;&nbsp;查询销售额</a><br></td>
  		</tr>
  		<tr>
  			<td background="../Image/left_2.gif"><a href="ZhuXiao.jsp" target="right" onmousemove="bian1(this)" onmouseout="bian2(this)">&nbsp;&nbsp;退出系统</a><br></td>
  		</tr>
  	</table>
  </body>
</html>
