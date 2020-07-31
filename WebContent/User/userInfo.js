	//真实姓名判断
		function mingzi() {
			var userName = document.getElementById("userName").value;
			if(userName==""){
				document.getElementById("name").innerHTML="<font size='1' color='red'>不可为空</font>"; 
			}else{
				A=1;
				document.getElementById("name").innerHTML="<font  color='green'> √</font>";
			}
		}
		
		
		//身份证验证
		function IdCard() {
			var userIdCard = document.getElementById("userIdCard").value;
			if(userIdCard==""){
				document.getElementById("idCard").innerHTML="<font size='1' color='red'>请写正确的身份证号</font>"; 
			}else if(userIdCard.length<7){
				document.getElementById("idCard").innerHTML="<font size='1' color='red'>请写正确的身份证号</font>";
				}else{
					D=1;
					document.getElementById("idCard").innerHTML="<font  color='green'> √</font>";
				}
		}
		//电话验证
		function dianhua() {
			var userTelephone = document.getElementById("userTelephone").value;
			if(userTelephone==""){
				document.getElementById("dianhua").innerHTML="<font size='1' color='red'>只可为数字</font>"; 
			}else{
				num=0;
				for( i=0;i<userTelephone.length;i++){
					var dh = userTelephone.charAt(i);
					if(dh<'0'||dh>'9'){
						if(dh!='-'){
							break;
						}else{
							num++;
						}
					}
				}
				if(i==userTelephone.length&&num<=1){
					E=1;
					document.getElementById("dianhua").innerHTML="<font  color='green'> √</font>";
				}else{
					document.getElementById("dianhua").innerHTML="<font size='1' color='red'>数字或包含'-'</font>";
				}
				
			}
		}
		//邮箱验证
		function youxiang() {
			var userEmail = document.getElementById("userEmail").value;
			if(userEmail==""){
				document.getElementById("youxiang").innerHTML="<font size='1' color='red'>格式为XXX.@XXX.com</font>"; 
			}else if(userEmail.indexOf('@') !=- 1 && userEmail.indexOf('.') > userEmail.indexOf('@')){
				F=1;
				document.getElementById("youxiang").innerHTML="<font  color='green'> √</font>";	
			}else{
				document.getElementById("youxiang").innerHTML="<font size='1' color='red'>格式为XXX.@XXX.com</font>"; 
			}
		}
		
		
		
		
		function mm(){
			
			var oldPwd=document.getElementById("oldPwd").value;
			if(oldPwd==""){
				document.getElementById("mi").innerHTML="<font size='2' color='red'>请输入密码</font>";
			}
		}
		//判断密码
		function mima(){
			
			var userPwd = document.getElementById("userPwd").value;
			var userPwd1=document.getElementById("userPwd1").value;
			if(userPwd==""){
				document.getElementById("mima").innerHTML="<font size='2' color='red'>gfg</font>";
			}else if(userPwd.length<6){
				document.getElementById("mima").innerHTML="<font size='2' color='red'>不能小于6位</font>";
			}else{
			//判断密码强度
			var a=0,b=0,c=0,d=0;
			for( i=0;i<userPwd1.length;i++){
				 ch=userPwd1.charAt(i);
				if(ch >='0'&&ch<='9'){
					a=1;
				}else if(ch>='a'&&ch<='z'){
					b=1;
				}else if(ch>='A'&&ch<='Z'){
					c=1;
				}else{
					d=1;
				}
			}
			
			if(a+b+c+d==1){
				document.getElementById("mima").innerHTML="<font size='2' color='red'>密码强度：弱</font>";
			}else if(a+b+c+d==2){
				document.getElementById("mima").innerHTML="<font size='2' color='blue'>密码强度：中</font>";
			}else{
				document.getElementById("mima").innerHTML="<font size='2' color='greed'>密码强度：强</font>";
			}
				}
				if(userPwd1!=""&&userPwd1!=userPwd){
					document.getElementById("mima1").innerHTML="<font size='2' color='red'>两次密码不一致</font>";					
				}				
			}
		//确认密码
		function mima1(){
			
			var userPwd = document.getElementById("userPwd").value;
			var userPwd1=document.getElementById("userPwd1").value;
			if(userPwd1==""){
				document.getElementById("mima1").innerHTML="<font size='2' color='red'>密码不能为空</font>";
			}else{
				
				document.getElementById("mima1").innerHTML="<font  color='green'> √</font>";	
			}
			if(userPwd1!=""&&userPwd1!=userPwd){
				document.getElementById("mima1").innerHTML="<font size='2' color='red'>两次密码不一致</font>";				
			}	
		}
		var xhr;
		function doAjax(){
			var oldPwd = document.getElementById("oldPwd");
			var userPwd = document.getElementById("userPwd");
			try {
				xhr=new ActiveXObject("Msxm12.XMLHTTP");
			} catch (e) {
				try {
					xhr=new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {
					try {
						xhr=new XMLHttpRequest();
						if(xhr.overrideMimeType){
						xhr.overideMimeType("text/xml");
						}
					} catch (e) {
						
					}
				}
			}
			xhr.open("POST","../UpdMiMa?oldPwd="+oldPwd+"&userPwd"+userPwd);
			xhr.onreadystatechange=function(){
				var st=xhr.readyState;
				if(st==4){
					var str=xhr.responseText;
					document.getElementById("div1").innerHTML=str;
				}
			}
			xhr.send(null);
		}
		
		
		
		function k(){
			
			var kahao=document.getElementById("kahao").value;
			if(kahao==""){
				document.getElementById("ka").innerHTML="<font size='2' color='red'>请输入卡号</font>";
			}else{
				
				document.getElementById("ka").innerHTML="<font  color='green'> √</font>";
			}
		}
		
		function mm(){
			
			var mima=document.getElementById("mima").value;
			if(mima==""){
				document.getElementById("mi").innerHTML="<font size='2' color='red'>请输入密码</font>";
			}else{
				
				document.getElementById("mi").innerHTML="<font  color='green'> √</font>";
			}
			
		}
		
		function Money(){
		
			var userMoney=document.getElementById("userMoney").value;
			if(userMoney==""){
				document.getElementById("qian").innerHTML="<font size='2' color='red'>请充值</font>";
			}else{
				
				document.getElementById("qian").innerHTML="<font  color='green'> √</font>";
			}
		
		}
		
		
		//var xhr;
		function doAjax1(num){
			//var oldPwd = document.getElementById("oldPwd");
			//var userPwd = document.getElementById("userPwd");
			try {
				xhr=new ActiveXObject("Msxm12.XMLHTTP");
			} catch (e) {
				try {
					xhr=new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {
					try {
						xhr=new XMLHttpRequest();
						if(xhr.overrideMimeType){
						xhr.overideMimeType("text/xml");
						}
					} catch (e) {
						
					}
				}
			}
			if(num==1){
				xhr.open("POST","ShowMe.jsp");
			}else if(num==2){
				xhr.open("POST","UpdMe.jsp");
			}else if(num==3){
				xhr.open("POST","MiMa.jsp");
			}else if(num==4){
				xhr.open("POST","PingJia.jsp");
			}else if(num==5){
				xhr.open("POST","AddMoney.jsp");
			}else if(num==6){
				xhr.open("POST","DelTicketMain.jsp");
			}else if(num==7){
				xhr.open("POST","MyOrder.jsp");
			}
			
			xhr.onreadystatechange=function(){
				var st=xhr.readyState;
				if(st==4){
					var str=xhr.responseText;
					document.getElementById("userInfoDiv").innerHTML=str;
				}
			}
			xhr.send(null);
		}
		
		function doAjax2(){
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
				var name = document.getElementById("orderId").value;
				var userId = document.getElementById("userId1").value;
				var userPwd = document.getElementById("userPwd1").value;
				xhr.open('POST','doDelTicket.jsp?orderId='+name+'&userId='+userId+'&userPwd='+userPwd);
				xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
				xhr.onreadystatechange=function(){
					var st = xhr.readyState;
					if(st==4){
						var str = xhr.responseText;
						document.getElementById("orderDiv").innerHTML=str;
					}
				}
				xhr.send(null);
		}
		
		function doAjax3(){
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
				var userId = document.getElementById("userId").value;
				var money = document.getElementById("userMoney").value;
				xhr.open('POST','../AddMoney?userId='+userId+'&userMoney='+money);
				xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
				xhr.onreadystatechange=function(){
					var st = xhr.readyState;
					if(st==4){
						var str = xhr.responseText;
						document.getElementById("addMoneyDiv").innerHTML=str;
					}
				}
				xhr.send(null);
		}
		
		function doAjax4(){
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
				//var sex1 = {"sex1","sex2"};
				var userId = document.getElementById("userId").value;
				var Sex = document.getElementsByName("userSex");
				var userSex = "";
				for(var i=0;i<Sex.length;i++){
					if(Sex[i].checked){
						userSex = Sex[i].value;
					}
				}
				var userName = document.getElementById("userName").value;
				var userIdCard = document.getElementById("userIdCard").value;
				var userTelephone = document.getElementById("userTelephone").value;
				var userEmail = document.getElementById("userEmail").value;
				xhr.open('POST','../UpdMe?userId='+userId+'&userSex='+userSex+'&userName='+userName+'&userIdCard='+userIdCard+'&userTelephone='+userTelephone+'&userEmail='+userEmail);
				xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
				xhr.onreadystatechange=function(){
					var st = xhr.readyState;
					if(st==4){
						var str = xhr.responseText;
						document.getElementById("UpdMeDiv").innerHTML=str;
					}
				}
				xhr.send(null);
		}