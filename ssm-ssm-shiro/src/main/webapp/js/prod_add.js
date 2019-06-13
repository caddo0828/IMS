window.onload = function() {
	$(".sure").click(function(){
  		$(".tip").fadeOut(100);
	});

 	$(".cancel").click(function(){
  		$(".tip").fadeOut(100);
	});
		

	$("#pname").focus(function() {
		$("#pname_tip").html("");
		$("#msg").html("");
	});
	
	//给产品名称的输入框绑定一个离焦事件，为空校验，以及发送ajax请求校验输入的产品是否在数据库中已经存在
	$("#pname").blur(function() {
		var pro_name = $(this).val();
		if(pro_name=="") {
			$("#pname_tip").html("产品名称不允许为空，请填写！");
			return false;
		}else {
			//发送ajax请求去判断产品名称是否已经存在
			$.post("/rest/products/query/name",{pname:pro_name},function(data) {
				if(data.status==200) {
					return true;
				}else {
					$("#pname_tip").html("不允许新增同名的产品！");
					return false;
				}
				
			});
		}
		
	});
	

	$("#wvalue").focus(function() {
		$("#wvalue_tip").html("");
		$("#msg").html("");
	});
	
	//对预警值进行判断
	$("#wvalue").blur(function() {
		var w_val = $(this).val();
		var reg_wavle = /^\d+$/;
		if(w_val=="") {
			$("#wvalue_tip").html("请输入预警值");
			return false;
		}else if(w_val<0||w_val>30||!reg_wavle.test(w_val)) {
			$("#wvalue_tip").html("预警值输入范围为0-30内的整数");
			return false;
		}
	});
	
	//对单位
	$("#units").focus(function() {
		$("#units_tip").html("");
		$("#msg").html("");
	});
	
	$("#units").blur(function() {
		var uni_val = $(this).val();
		var reg_units =  /^[a-zA-Z\u4e00-\u9fa5]+$/;
		if(uni_val=="") {
			$("#units_tip").html("请输入单位!");
			return false;
		}else if(!reg_units.test(uni_val)) {
			$("#units_tip").html("请输入中文字符,或英文字符的");
			return false;
		}
	})
	
	//对数量校验
	$("#count").focus(function() {
		$("#count_tip").html("");
		$("#msg").html("");
	});
	
	$("#count").blur(function() {
		var count_val = $(this).val();
		var reg_nums = /^(0|([1-9]\d*))$/;
		if(count_val=="") {
			$("#count_tip").html("请输入产品的数量");
			return false;
		}else if(!reg_nums.test(count_val)) {
			$("#count_tip").html("请输入正确的格式");
			return false;
		}
		
	});
	
	
	//对经办人进行校验
	$("#annt").focus(function() {
		$("#annt_tip").html("");
		$("#msg").html("");
	});
	
	
	$("#annt").blur(function() {
		var annt_val = $(this).val();
		var reg_annt = /^[a-zA-Z\u4e00-\u9fa5]+$/;
		if(annt_val=="") {
			$("#annt_tip").html("请输入进销的产品经办人名称");
			return false;
		}else if(!reg_annt.test(annt_val)) {
			$("#annt_tip").html("请输入中文字符,或英文字符的名称");
			return false;
		}
		
	});
	
	
	//表单校验
	$("#sub").click(function() {
		var textsArr = $(":text");
		var count = 0;
		for(var i=0;i<textsArr.length;i++) {
			if(textsArr[i].value=="") {
				count +=1;
			}
		}
		//判断表单中的所有text属性框值是否存在为空的
		if(count==0) {
			//无空数据，接着判断表单中是否存在错误信息
			var infoArr = $(":i");
			var index = 0;
			for(var j=0;j<infoArr.length;j++) {
				if(infoArr[i].innerHTML!="") {
					index += 1;
				}
			}
			
			if(index==0) {
				//无错误信息
				$("#form").submit();
			}else {
				$("#mess_tip").html("请确认页面中的错误信息，并进行修改");
				$(".tip").fadeIn(200);
				return false;
			}
			
		}else {
			//表单中存在为空的数据
			$("#mess_tip").html("产品名称,单位,预警值不允许为空,请重新输入！");
			$(".tip").fadeIn(200);
			return false;
		}

	});
	

}
