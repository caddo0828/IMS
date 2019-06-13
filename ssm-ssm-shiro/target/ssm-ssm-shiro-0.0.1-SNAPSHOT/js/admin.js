window.onload = function() {}

//清除错误提示信息
function focusInput(obj) {
	var msgBox = obj.parentNode.getElementsByTagName("i")[0];
	msgBox.innerHTML="";
}

//检验输入框输入的数据信息
function checkInput(obj) {
	//提示错误信息
	var name_msg = $("#name_tip")[0];
	var pwd_msg = $("#pwd_tip")[0];
	var state_msg = $("#state_tip")[0];
	
	switch(obj.name) {
		case "username":
			//用户名校验
			var reg_uname= /^[a-zA-Z\u4e00-\u9fa5]+$/;
			if(obj.value == "") {
				name_msg.innerHTML = "用户名不能为空";
				return false;
			}else if(!reg_uname.test(obj.value)) {
				name_msg.innerHTML = "请输入中文字符,或英文字符的名称";
				return false;
			}else {
				$.get("/rest/admin/query/name",{userName:obj.value},function(data) {
					if(data.status==200) {
						return true;
					}else {
						//表示管理员名称已经存在
						name_msg.innerHTML="用户名已经存在，请更换一个";
						return false;
					}
		 		},"json");
			}
			break;
		case "password":
			//密码校验
			var reg_pwd=/^[a-zA-Z0-9]{4,20}$/; 
			if(obj.value == "") {
				pwd_msg.innerHTML = "请输入用户密码";
				return false;
			}else if(!reg_pwd.test(obj.value)) {
				pwd_msg.innerHTML = "密码不能含有非法字符,由英文字母和数字组成,长度在4-20之间";
				return false;
			}
			break;
		case "state":
			var reg_status = /^(0|1){1}$/;
			if(obj.value == "") {
				state_msg.innerHTML = "用户状态不能为空";
				return false;
			}else if(!reg_status.test(obj.value)) {
				state_msg.innerHTML = "用户状态只能是1或者0";
				return false;
			}
			break;
	}
	
}


function checkForm(obj) {
	//获取到所有的文本框，判断文本框中的属性值是否存在为空的数据，以及下拉框数据是否为空
	var textArr = $(":text");
	var texts = 0;
	for(var i=0;i<textArr.length;i++) {
		if(textArr[i].value=="") {
			//代表存在数据为空
			texts+=1;
		}
	}
	
	if(texts==0) {
		//表单中无空项
		//获取到当前表单中的i标签，判断是否有错误提示信息显示
		var arr = $(":i");
		var infos = 0;
		for(var i=0;i<arr.length;i++) {
			if(arr[i].innerHTML!="") {
				infos+=1;
			}
		}	
	
		//无错误信息
		if(infos==0) {
			$("#form").submit();
		}else {
			$("#mess_tip").html("请确认页面中的错误信息，并进行修改");
			$(".tip").fadeIn(200);
			return false;	
		}
		
	}else {
		$("#mess_tip").html("不能出现为空的项，请重新填写数据");
		$(".tip").fadeIn(200);
		return false;
	}
}
