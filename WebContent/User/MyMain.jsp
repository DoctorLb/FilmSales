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

  </head>
  
  <body>
			  	Java如何判断密码强度
			本程序按以下的方式进行评估.
			  1.如果密码少于5位,那么就认为这是一个弱密码.
			  2.如果密码只由数字、小写字母、大写字母或其它特殊符号当中的一种组成,则认为这是一个弱密码.
			  3.如果密码由数字、小写字母、大写字母或其它特殊符号当中的两种组成,则认为这是一个中度安全的密码.
			  4.如果密码由数字、小写字母、大写字母或其它特殊符号当中的三种以上组成,则认为这是一个比较安全的密码.
			  本程序将根据用户输入的密码分别显示不同的颜色表示密码的强度,具体程序如下:
			以下是引用片段：
			<script language=javascript>
			//CharMode函数
			//测试某个字符是属于哪一类.
			function CharMode(iN){
			if (iN>=48 && iN <=57) //数字
			return 1;
			if (iN>=65 && iN <=90) //大写字母
			return 2;
			if (iN>=97 && iN <=122) //小写
			return 4;
			else
			return 8; //特殊字符
			}
			//bitTotal函数
			//计算出当前密码当中一共有多少种模式
			function bitTotal(num){
			modes=0;
			for (i=0;i<4;i++){
			if (num & 1) modes++;
			num>>>=1;
			}
			return modes;
			}
			//checkStrong函数
			//返回密码的强度级别
			function checkStrong(sPW){
			if (sPW.length<=4)
			return 0; //密码太短
			Modes=0;
			for (i=0;i<sPW.length;i++){
			//测试每一个字符的类别并统计一共有多少种模式.
			Modes|=CharMode(sPW.charCodeAt(i));
			}
			return bitTotal(Modes);
			}
			//pwStrength函数
			//当用户放开键盘或密码输入框失去焦点时,根据不同的级别显示不同的颜色
			function pwStrength(pwd){
			O_color="#eeeeee";
			L_color="#FF0000";
			M_color="#FF9900";
			H_color="#33CC00";
			if (pwd==null||pwd==''){
			Lcolor=Mcolor=Hcolor=O_color;
			}
			else{
			S_level=checkStrong(pwd);
			switch(S_level) {
			case 0:
			Lcolor=Mcolor=Hcolor=O_color;
			case 1:
			Lcolor=L_color;
			Mcolor=Hcolor=O_color;
			break;
			case 2:
			Lcolor=Mcolor=M_color;
			Hcolor=O_color;
			break;
			default:
			Lcolor=Mcolor=Hcolor=H_color;
			}
			}
			document.getElementById("strength_L").style.background=Lcolor;
			document.getElementById("strength_M").style.background=Mcolor;
			document.getElementById("strength_H").style.background=Hcolor;
			return;
			}
			</script>
			<form name=form1 action="" >
			输入密码:<input type=password size=10 onKeyUp=pwStrength(this.value) onBlur=pwStrength(this.value)>
			<br>密码强度:
			<table width="217" border="1" cellspacing="0" cellpadding="1" bordercolor="#cccccc" height="23" style='display:inline'>
					<tr align="center" bgcolor="#eeeeee">
					<td width="33%" id="strength_L">弱</td>
					<td width="33%" id="strength_M">中</td>
					<td width="33%" id="strength_H">强</td>
					</tr>
			</table>
			</form>
			  	
  </body>

