//加载页面信息
window.onload  = function() {
	$(".click_update").click(function(){
  		$(".tip").fadeIn(200);
  	});
	
  	$(".sure").click(function(){
  		$(".tip").fadeOut(100);
	});

 	$(".cancel").click(function(){
  		$(".tip").fadeOut(100);
	});
 	
 	
 	//根据点击入库查询按钮，进行查询全部入库信息
 	$("#searchInp").click(function() {
 		location.href="/item/input_list";
 	});
 	
 	//默认查询所有出库信息
 	$("#searchOut").click(function() {
 		location.herf="/item/output_list";
 	});
	
 	//跳转到新产品入库页面
 	$("#product_add").click(function() {
 		location.href="/item/bigtypt_list";
 	});
 	
 	
 	//检验入库产品的个数
	$("#input").click(function() {
		var itemList = $(".checkbox");
		var ids = [];
		for(var i=0;i<itemList.length;i++) {
			if(itemList[i].checked) {
				ids.push(itemList[i].value);
			}
		}
		if(ids.length<1) {
			//alert("当前无选择的产品")
			$("#mess_tip").html("必须选择一个产品再操作");
			$(".tip").fadeIn(200);
			return false;
		}else if(ids.length>1) {
			//alert("只能选择一个商品进行操作")
			$("#mess_tip").html("只能选择一个商品进行操作");
			$(".tip").fadeIn(200);
			return false;
		}else {
			//传递到具体的产品信息中(执行入库操作)
			location.href="/rest/input/toview/"+ids;
		}	
	});
	
	
	//用于检测出库产品的个数，以及产品是否已经是入库状态
	$("#output").click(function() {
		var itemList = $(".checkbox");
		var ids = [];
		for(var i=0;i<itemList.length;i++) {
			if(itemList[i].checked) {
				ids.push(itemList[i].value);
			}
		}
		if(ids.length<1) {
			$("#mess_tip").html("必须选择一个产品再操作");
			$(".tip").fadeIn(200);
			return false;
		}else if(ids.length>1) {
			$("#mess_tip").html("只能选择一个商品进行操作");
			$(".tip").fadeIn(200);
			return false;
		}else {
			//根据产品id查询对应的产品信息，跳转到对应的具体出库页面
			location.href="/rest/output/toview/"+ids;
		}	
		
	});
	
}
