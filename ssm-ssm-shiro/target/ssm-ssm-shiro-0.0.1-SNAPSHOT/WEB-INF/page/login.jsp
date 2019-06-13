<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>欢迎登录物料管理系统</title>
<link href="../../css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script src="../../js/cloud.js" type="text/javascript"></script>

<script language="javascript">
$(function(){
	//js控制视图的位置
	$('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
	$(window).resize(function(){  
	    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
	}) ;
	    
	//登录表单校验
	var LOGIN = {
			checkInput:function() {
				if ($("#loginname").val() == "") {
					$("#error").html("请输入用户名");
					return false;
				}
				if ($("#nloginpwd").val() == "") {
					$("#error").html("请输入登录密码");
					return false;
				}
				return true;
			},
			doLogin:function() {
				$("#formlogin").submit();
			},
			login:function() {
				if (this.checkInput()) {
					this.doLogin();
				}
			}
		
	};
	
	//点击提交按钮，进行表单校验
	$("#loginsubmit").click(function(){
			LOGIN.login();
	});
	  
	
   //当再次聚焦的时候将错误的信息进行清除
   $("#loginname").focus(function() {
   	  $("#error").html("");
   });
   
   $("#nloginpwd").focus(function() {
   	 $("#error").html("");
   });
    
});  
</script> 
</head>

<body style="background-color:#1c77ac; background-image:url(../../images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">
    <div id="mainBody">
      <div id="cloud1" class="cloud"></div>
      <div id="cloud2" class="cloud"></div>
    </div>  

<div class="logintop">    
    <span>欢迎登录后台管理界面平台</span>    
    <ul>
    <li><a href="#">回首页</a></li>
    <li><a href="#">帮助</a></li>
    <li><a href="#">关于</a></li>
    </ul>    
    </div>
    
    <div class="loginbody">
    <!--控制中心位置 -->
    <span class="systemlogo"></span> 
       
    <div class="loginbox">
   
	<!--登录表单-->
    <form   action="${pageContext.request.contextPath}/user/login" method="post" id="formlogin">
	    <ul>
		    <li><input name="username" id="loginname" type="text" class="loginuser" value="" /></li>
		    <li><input name="password" id="nloginpwd" type="password" class="loginpwd" value="" /></li>
		    <li><input  id="loginsubmit" type="button" class="loginbtn" value="登录"  /><label id="error" style="color: red;font-size:14px ;">${error}</label></li>
	    </ul>
    </form>
  
    </div>
    
    </div>
    
</body>
</html>
