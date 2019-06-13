<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="../../css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js" ></script>


<!-- 对管理员用户新增的校验js文件 -->
<script type="text/javascript" src="../../js/admin.js" ></script>

<script type="text/javascript">
$(document).ready(function() {
	$(".sure").click(function(){
  		$(".tip").fadeOut(100);
	});

 	$(".cancel").click(function(){
  		$(".tip").fadeOut(100);
	});
	
});
</script>
</head>

<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">新增管理员</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    <div class="formtitle"><span>新增管理员</span></div>
    
    <form action="/rest/admin/add" method="post" id="form" onsubmit="return checkForm(this);">
		<ul class="forminfo">
		    <li><label>管理员姓名：</label><input name="username"  id="adminName" type="text" class="dfinput" value="" onblur="checkInput(this);" onfocus="focusInput(this);"/><i id="name_tip" style="color: red;font-size: 14px;"></i></li>
		    <li><label>登录密码：</label><input name="password" id="pwd" type="text" class="dfinput" value="" onblur="checkInput(this);" onfocus="focusInput(this);" /><i id="pwd_tip" style="font-size: 14px;">密码不能含有非法字符,由英文字母和数字组成,长度在4-20之间</i></li>
		    <li><label>状态：</label><input name="state" id="state"  type="text" class="dfinput" value="" onblur="checkInput(this);" onfocus="focusInput(this);"/><i id="state_tip" style="font-size: 14px;">用户状态只能填写1或0</i></li>
		    <li><label>&nbsp;</label><input  type="submit" class="btn" value="用户新增"/><b style="color: red;font-size: 14px;">${msg}</b></li>
        </ul>
    </form>
  
  
    <div class="tip">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        
      <div class="tipinfo">
        <span><img src="../../images/ticon.png" /></span>
        <div class="tipright">
        <p id="mess_tip"></p>
        </div>
        </div>
        
        <div class="tipbtn">
        <input name="" type="button"  class="sure" value="确定"/>&nbsp;
        <input name="" type="button"  class="cancel" value="取消"/>
        </div>
    </div>

    </div>
</body>
</html>
