<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="../../css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js" ></script>
<script type="text/javascript">
$(document).ready(function() {
	$(".sure").click(function() {
		$(".tip").fadeOut(200);
	});
	
	$(".cancel").click(function() {
		$(".tip").fadeOut(200);
	});
	
	$("#pwd").focus(function() {
		$("#pwd_tip").html("");
	});

	//密码校验
	$("#pwd").blur(function() {
		var reg_pwd = /^[a-zA-Z0-9]{4,20}$/; 
		var pwd = $("#pwd").val();
		if(pwd=="") {
			$("#pwd_tip").html("请输入用户密码");
			return false;
		}else if(!reg_pwd.test(pwd)) {
			$("#pwd_tip").html("请填写正确的密码格式")
			return false;
		}else {
			$("#pwd_tip").html("");
			return true;
		}
	});
	
	$("#state").focus(function() {
		$("#state_tip").html("");
	});

	//密码校验
	$("#state").blur(function() {
		var reg_state = /^(0|1){1}$/;
		var state = $("#state").val();
		if(state=="") {
			$("#state_tip").html("请输入用户状态");
			return false;
		}else if(!reg_state.test(state)) {
			$("#state_tip").html("用户状态1：启用，0：禁用")
			return false;
		}else {
			$("#state_tip").html("");
			return true;
		}
	});
	
	
	//表单校验，不能存储错误信息，也不能存在错误的信息
	$(".btn").click(function() {
		var textsArr = $(":text");
		var index = 0;
		for(var i=0;i<textsArr.length;i++) {
			if(textsArr[i].value=="") {
				index += 1;
			}			
		}
		
		if(index==0) {
			//表单中无数据为空项.检验对应的界面是否存在错误信息
			if($("#pwd_tip").html()!=""||$("#state").html()!="") {
				//存在错误信息,阻止表单校验
				$("#mess_tip").html("请确认页面中的错误信息，并进行修改");
				$(".tip").fadeIn(100);
				return false;
			}else {
				//表单数据提交
				$("#form").submit();
			}	
		}else {
			$("#mess_tip").html("请填写完整信息");
			$(".tip").fadeIn(100);
			return false;
		}
		
	});

	
});
</script>
</head>

<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">修改管理员信息</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>管理员信息修改</span></div>
    
    <form action="/rest/admin/update" method="post"  id="form">
        <ul class="forminfo">
		    <li><label>用户名：</label><input name="username" type="text" class="dfinput" value="${admin.username}" readonly="readonly"/>
		    	<input type="hidden" name="id" value="${admin.id}"/>
		    </li>
		    <li><label>密码</label><input name="password" type="text" class="dfinput" value="${admin.password}" id="pwd" style="font-size:14px;" /><i id="pwd_tip" style="color: red;font-size: 14px;">密码不能含有非法字符,由英文字母和数字组成,长度在4-20之间</i></li>
		    <li><label>状态</label><input name="state" id="state" type="text" class="dfinput" value="${admin.state}"/><i id="state_tip" style="font-size: 14px;">用户状态只能填写1或0</i> </li>
		    <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="提交修改"/></li>
        </ul>
    </form>
  
    <div class="tip">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        
      <div class="tipinfo">
        <span><img src="../../images/ticon.png" /></span>
        <div class="tipright">
        <p id="mess_tip">请确认页面中的错误信息，并进行修改</p>
        </div>
        </div>
        
        <div class="tipbtn">
        <input name="" type="button"  class="sure" value="确定" />&nbsp;
        <input name="" type="button"  class="cancel" value="取消" />
        </div>
    
    </div>
    
    </div>
</body>
</html>


