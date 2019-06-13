<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="../../css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js" ></script>
<script type="text/javascript">
$(function() {
	$(".sure").click(function(){
  		$(".tip").fadeOut(100);
	});

 	$(".cancel").click(function(){
  		$(".tip").fadeOut(100);
	});
	
	//再次获取焦点时，清除原先的错误样式信息
	$("#pname").focus(function() {
		$("#pname_tip").html("");
		$("#msg").html("");
	});
	
	//给供应商名称的输入框绑定一个离焦事件，为空校验，以及发送ajax请求校验输入的供应商是否在数据库中已经存在
	$("#pname").blur(function() {
		var pro_name = $(this).val();
		var reg_pname = /^[a-zA-Z\u4e00-\u9fa5]+$/;
		if(pro_name=="") {
			$("#pname_tip").html("供应商名称不允许为空，请填写！");
			return false;
		}else if(!reg_pname.test(pro_name)) {
			$("#pname_tip").html("请输入中文字符,或英文字符的名称");
			return false;
		}else {
			//发送ajax请求去判断供应商是否已经存在
			$.post("/rest/providers/query/name",{pname:pro_name},function(data) {
				if(data.status==200) {
					//代表供应商名称符合规范
					return true;
				}else {
					$("#pname_tip").html("供应商名称已存在，请重新填写！");
					return false;
				}
				
			});
		}
		
	});
	
	//对表单中的供应商名称进行校验
	$("#sub").click(function() {
		var texts = $(":text")[0].value;
		if(texts=="") {
			$("#mess_tip").html("供应商名称不允许为空，请重新操作");
			$(".tip").fadeIn(200);
			return false;
		}else {
			//接着判断表单中是否存在错误信息
			if($("#pname_tip").html()=="") {
				//无错误信息
				//发送请求新增供应商
				$("#form").submit();
			}else {
				$(".tip").fadeIn(200);
				return false;
			}
	
		}
	});

	
})

</script>
</head>

<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">新添供应商</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>新添供应商</span></div>
    
    <form action="/rest/provider/add" method="post" id="form">
        <ul class="forminfo">
		   <li><label>供应商名称：</label>
		   		<input name="pname" id="pname" type="text" class="dfinput" /><i id="pname_tip" style="color: red;font-size: 14px;"></i>
		   </li>
		   <li><label>供应商介绍</label>
		   		<textarea name="intro" style="width:345px;height: 200px;border:0.5px solid #3186C8"></textarea>
		  </li>
		  <li><label>&nbsp;</label><input id="sub" type="submit" class="btn" value="新增供应商"/><i id="msg" style="color: red; font-size: 16px; margin-left: 10px;">${msg}</i> </li>
		</ul>
    </form>
    
    <div class="tip" id="error_tip">
      <div class="tiptop"><span>提示信息</span><a></a></div>
        
      <div class="tipinfo">
        <span><img src="../../images/ticon.png" /></span>
        <div class="tipright">
        <p id="mess_tip">请确认页面中的错误信息，并进行修改</p>
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
