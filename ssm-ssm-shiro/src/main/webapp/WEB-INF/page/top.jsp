<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="../../css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/jquery.js"></script>
<script type="text/javascript">
$(function(){	
	//顶部导航切换，根据点击事件给对应的标签添加样式
	$(".nav li a").click(function(){
		$(".nav li a.selected").removeClass("selected")
		$(this).addClass("selected");
	})	
})	
</script>
</head>

<body style="background:url(../../images/topbg.gif) repeat-x;">
   <div class="topleft">
   		 <img src="../../images/loginlogo.png" title="系统首页" />
    </div>
      
    <ul class="nav">
    <li><a href="/item/kucun_list" target="rightFrame"  class="selected"><img src="../../images/icon01.png" title="库存列表" /><h2>库存列表</h2></a></li>
    <li><a href="/item/input_list" target="rightFrame"><img src="../../images/icon02.png" title="入库记录" /><h2>入库记录</h2></a></li>
    <li><a href="/item/output_list"  target="rightFrame"><img src="../../images/ico03.png" style="margin-top: 22px;" title="出库记录" /><h2>出库记录</h2></a></li>
    <li><a href="/item/show/products_add"  target="rightFrame"><img src="../../images/icon03.png" title="新建物料" /><h2>新建物料</h2></a></li>
    </ul>
    
    <div class="topright">    
    <ul>
    <li><span><img src="../../images/help.png" title="帮助"  class="helpimg"/></span><a href="#">帮助</a></li>
    <li><a href="#">关于</a></li>
    <li><a href="${pageContext.request.contextPath}/rest/admin/logout" target="_parent">退出</a></li>
    </ul>
     
    <div class="user">
    <span>
    	<%--  欢迎<shiro:principal></shiro:principal>使用物理管理系统  --%>
    	
    	欢迎<shiro:principal property="username"></shiro:principal>使用物理管理系统
    </span>
    </div>        
    
    </div>
</body>
</html>
