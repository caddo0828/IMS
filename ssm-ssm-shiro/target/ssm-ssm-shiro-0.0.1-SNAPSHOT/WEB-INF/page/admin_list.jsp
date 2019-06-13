<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="../../css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js" ></script>
<script type="text/javascript" src="../../js/cloud.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$(".sure").click(function(){
  		$(".tip").fadeOut(100);
	});

 	$(".cancel").click(function(){
  		$(".tip").fadeOut(100);
	});
 	
	//修改时只能修改一个用户,并且只能修改用户的密码
	$("#update").click(function() {
		var adminList = $(".checkbox");
		var ids = [];
		for(var i=0;i<adminList.length;i++) {
			if(adminList[i].checked) {
				ids.push(adminList[i].value);
			}
		}
		if(ids.length<1) {
			$("#mess_tip").html("请选中一个用户再进行操作！");
			$(".tip").fadeIn(200);
			return false;
		}else if(ids.length>1) {
			$("#mess_tip").html("只能选择一个用户进行操作");
			$(".tip").fadeIn(200);
			return false;
		}else {
			//跳转到详细的管理员信息页面中
			location.href="/admin/toview/"+ids;
		}	
	});
	
	
	//批量删除管理员（物理删除，只修改对应的管理员状态）
	$("#delete").click(function() {
		var adminList = $(".checkbox");
		var ids = [];
		for (var i=0;i<adminList.length;i++) {
			if(adminList[i].checked) {
				ids.push(adminList[i].value);
			}
		}
		//以，分隔批量操作的id号1,2,3的形式传值，拼接字符串
		ids = ids.join(",");
		
		if(ids.length==0) {
			$("#mess_tip").html("请至少选中一个用户再进行操作！");
			$(".tip").fadeIn(200);
			return false;
		}else {
			//发送请求进行批量的删除管理员数据，物理删除
			$.post("/rest/admin/delete",{id:ids},function(data) {
				//判断是否删除成功
				if(data.status==200) {
					location.href="/item/admin_list";
				}else {
					$("#mess_tip").html("删除失败数据回滚，请重新操作");
					$(".tip").fadeIn(200);
					return false;
				}
 			},"json");	
			
			
		}
				
	});

	
});

</script>
<script type="text/javascript">
	//全选操作
	function checkAll(obj) {
		if(obj.checked) {
			$(".checkbox").attr("checked",true);
		}else {
			$(".checkbox").attr("checked",false);
		}
	}
</script>
</head>
<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">管理员列表界面</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
 	<div class="tools">
    	<ul class="toolbar">
        <li><span><img src="../../images/t01.png"/></span><a href="/admin_add" id="add">添加</a></li>
        <li><span><img src="../../images/t02.png" /></span><a href="javascript:;" id="update">修改</a></li>
        <li><span><img src="../../images/t03.png"/></span><a href="javascript:;" id="delete">删除</a></li>
      	<b style="color: red;font-size: 14px;margin-top: 5px;">${msg}</b>
      </ul>
    </div>
   
    
    <table class="tablelist">
    	<thead>
    	<tr>
    	<th><input name="" type="checkbox" id="check_all" onclick="checkAll(this);"  value="" /><b style="margin-left: 20px;">编号</b></th>
        <th>名称</th>
        <th>状态</th>
       <!--  <th>等级</th> -->
        </tr>
        </thead>
        
        <tbody>
        <c:if test="${not empty data.results}">
        <c:forEach items="${data.results}" var="admin">
        <tr>
	        <td><input name=""  class="checkbox" type="checkbox" value="${admin.id}" /><b style="margin-left: 20px;">${admin.id}</b></td>
	        <td>${admin.username}</td>
	        <td>${admin.state}</td>
        </tr> 
        </c:forEach>
        </c:if>
        </tbody>
    </table>	
   
  
    <!--进行分页跳转-->
    <div class="pagin">
    	<div class="message">共<i class="blue">${data.totalRecord} </i>条记录，当前显示第&nbsp;<i class="blue">${data.pageNo}&nbsp;</i>页</div>
        <ul class="paginList">
        <li class="paginItem"><a href="javascript:;"><span class="pagepre"></span></a></li>
        <li class="paginItem"><a href="/item/admin_list?page=1">首页</a></li>
        <li class="paginItem"><a href="/item/admin_list?page=${data.pageNo-1}"   <c:if test="${data.pageNo<=1}">  onclick="javascript:return false;" </c:if> >上一页</a></li>
        <li class="paginItem"><a href="/item/admin_list?page=${data.pageNo+1}"   <c:if test="${data.pageNo>=data.totalPage}">  onclick="javascript:return false;" </c:if> >下一页</a></li>
        <li class="paginItem"><a href="/item/admin_list?page=${data.totalPage}" >末页</a></li>
        <li class="paginItem"><a href="javascript:;"><span class="pagenxt"></span></a></li>
        </ul>
    </div>


	 <div class="tip">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        
      <div class="tipinfo">
        <span><img src="../../images/ticon.png" /></span>
        <div class="tipright">
        <p id="mess_tip">是否确认对信息的修改 ？</p>
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
