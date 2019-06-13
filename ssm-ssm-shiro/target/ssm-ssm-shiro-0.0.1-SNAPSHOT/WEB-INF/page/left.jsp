<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="../../css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/jquery.js"></script>

<script type="text/javascript">
$(function(){	
	//导航切换
	$(".menuson li").click(function(){
		$(".menuson li.active").removeClass("active")
		$(this).addClass("active");
	});
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('ul').slideUp();
		if($ul.is(':visible')){
			$(this).next('ul').slideUp();
		}else{
			$(this).next('ul').slideDown();
		}
	});
	
	
})	
</script>
</head>

<body style="background:#f0f9fd;">
	<div class="lefttop"><span></span>物料管理系统</div>
    <dl class="leftmenu">  
    <dd>
    <div class="title">
    <span><img src="../../images/leftico01.png" /></span>管理信息
    </div>
    	<ul class="menuson">
	        <li class="active"><cite></cite><a href="/page/index" target="rightFrame">首页</a><i></i></li>
	        <li><cite></cite><a href="/item/kucun_list" target="rightFrame">库存列表</a><i></i></li>
	        <li><cite></cite><a href="/item/input_list" target="rightFrame">入库记录</a><i></i></li>
	       	<li><cite></cite><a href="/item/output_list" target="rightFrame">出库记录</a><i></i></li>
	        <li><cite></cite><a href="/item/show/products_add" target="rightFrame">新建物料</a><i></i></li>
	        <li><cite></cite><a href="/provider_add" target="rightFrame">新增供应商</a><i></i></li>
	    	
	    	<%--只有具备了该对应的权限，该菜单才能显示 --%>
	    	<shiro:hasPermission name="admin:all">
	    		<li><cite></cite><a href="/item/admin_list" target="rightFrame">管理员列表</a><i></i></li>	
	    	</shiro:hasPermission>
	    	
	    </ul>    
    </dd>
    </dl>
</body>
</html>
