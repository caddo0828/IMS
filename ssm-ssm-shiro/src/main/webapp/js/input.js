window.onload = function() {}

//移除当前的错误信息提示
function focusInput(obj)
{
	var msgBox = obj.parentNode.getElementsByTagName("i")[0];
	msgBox.innerHTML="";
}

//检验当前的数量输入框和单价输入框是否满足当前的要求
function checkInput(obj) {
	//提示数量和单价错误信息
	var pcount_msg = $("#pcount_tip")[0];
	var dprice_msg = $("#dprice_tip")[0];
	var annt_msg = $("#annt_tip")[0];
	switch(obj.name) {
		case "pcount":
			//数量校验
			var reg_nums = /^[1-9]\d*$/;
			if(obj.value=="") {
				pcount_msg.innerHTML="数量不能为空";
				return false;
			}else if(!reg_nums.test(obj.value)) {
				pcount_msg.innerHTML="请输入正确的数量";
				return false;
			}else {				
				var id = $("#pid").val();
				//进行入库数量和产品数量的比较，发送ajax请求
				$.post("/rest/products/query/num",{num:obj.value,id:id},function(data){
					if(data.status==200) {
						//代表数量符合条件，则允许入库操作
						pcount_msg.innerHTML="";
					}else {
						pcount_msg.innerHTML="当前产品数量为"+data.msg+"，输入数量超出，请修改入库数量";
						return false;
					}
				});
			}
			break;
		case "dprice":
			//单价校验
			var reg_price = /^(([1-9]\d*)|([0]{1}))(\.(\d){2})?$/;
			if(obj.value=="") {
				dprice_msg.innerHTML="单价不能为空";
				return false;
			}else if(!reg_price.test(obj.value)) {
				dprice_msg.innerHTML="请输入正确的格式，精确到小数点后两位";
				return false;
			}else {
				dprice_msg.innerHTML="";
			}
			break;
		case "annt":
			var reg_annt = /^[a-zA-Z\u4e00-\u9fa5]+$/;
			if(obj.value=="") {
				annt_msg.innerHTML = "请输入进销的产品经办人名称";
				return false;
			}else if(!reg_annt.test(obj.value)) {
				annt_msg.innerHTML = "请输入中文字符,或英文字符的名称";
				return false;
			}
			break;
	}
	
}



//表单校验
function checkForm(obj) {
	//获取到当前表单中的i标签，判断是否有错误提示信息显示
	var arr = obj.getElementsByTagName("i");
	var infos = 0;
	for(var i=0;i<arr.length;i++) {
		if(arr[i].innerHTML!="") {
			infos+=1;
		}
	}
	//页面中无出错信息
	if(infos==0) {
		var pcount = $("#pcount").val();
		var dprice = $("#dprice").val();
		//获取当前的输入数量和单价,给当前的总价格进行赋值
		var totalPrice = pcount * dprice;
		$("#total_price").attr("value",totalPrice);
		
		
		//获取到所有的文本框，判断文本框中的属性值是否存在为空的数据，以及下拉框数据是否为空
		var textArr = $(":text");
		var texts = 0;
		for(var i=0;i<textArr.length;i++) {
			if(textArr[i].value=="") {
				//代表存在数据为空
				texts+=1;
			}
		}

		var check_sel = $("#sels").val();
		if(texts==0&&check_sel!="") {
			//代表表单数据不存在为空的数据
			$("#form").submit();
		}else {
			//表单中存在为空的数据
			$("#mess_tip").html("表单数据不能为空，请填写完整信息！");
			$(".tip").fadeIn(200);
			return false;
		}
		
	}else {
		$("#mess_tip").html("请检查当前界面的错误提示，重新执行操作！");
		$(".tip").fadeIn(200);
		return false;
	}
	
	
}


//错误提示点击确认按钮
function checkSure() {
	$(".tip").fadeOut(100);
}

function checkCancel() {
	$(".tip").fadeOut(100);
}
