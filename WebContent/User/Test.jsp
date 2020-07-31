<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

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
	<script type="text/javascript">
		function show(){
			var	sex1 = document.getElementsByName("userSex");
			var sex = "";
			for(var i=0;i<sex1.length;i++){
				if(sex1[i].checked){
					sex = sex1[i].value;
				}
			}
			alert(sex);
			
		}
	</script>
  </head>
  
  <body>
    <input type="radio" id="sex1" name="userSex" value="男" checked="checked"><img src="../Image/M.gif">
  	<input type="radio" name="userSex" value="女"><img src="../Image/M.gif">
  	<input type="button" value="dainji" onclick="show()">
  </body>
</html>
