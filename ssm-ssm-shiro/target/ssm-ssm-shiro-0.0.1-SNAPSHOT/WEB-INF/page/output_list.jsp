<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="../../css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	//根据点击给出提示
	$(".click_update").click(function(){
  		$(".tip").fadeIn(200);
  	});

  	$(".sure").click(function(){
  		$(".tip").fadeOut(100);
	});

 	$(".cancel").click(function(){
  		$(".tip").fadeOut(100);
	});
 	
 	//对删除出库记录按钮进行点击事件绑定，判断当前是否有选中的数据
	$("#delete").click(function() {
		var outputList = $(".checkbox");
		var ids = [];
		for (var i=0;i<outputList.length;i++) {
			if(outputList[i].checked) {
				ids.push(outputList[i].value);
			}
		}
		ids = ids.join(",");
		
		if(ids.length==0) {
			$("#mess_tip").html("请至少选中一件商品再进行操作！");
			$(".tip").fadeIn(200);
			return false;
		}else {			
			//发送请求进行批量的删除入库记录，物理删除
			$.post("/rest/output/delete",{id:ids},function(data) {
				//判断是否删除成功
				if(data.status==200) {
					location.href="/item/output_list";
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

</head>
<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">出库记录列表</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
	<div class="tools">
	    <ul class="toolbar">
	    <li class="click_update"><span><img src="../../images/t02.png" /></span>修改</li>
        <li><span><img src="../../images/t03.png"/></span><a href="javascript:;" id="delete">删除出库信息</a></li>
	   	${msg}
	    </ul>
	    <ul class="toolbar1">
	        <li><span><img src="../../images/t05.png" /></span>设置</li>
	    </ul>
	</div>
	
   <form action="/item/output/search" method="post">
   	 <table class="tablelist">
    	<thead>
    	<tr>
   			<td>
   				产品名称：<input type="text" name="name" value="" id="query" style="height: 20px;border:0.5px solid #3186C8"/>
   			</td> 	
   			<td>
   				出库日期：<input type="text" name="outputtime" value="" id="query" style="height: 20px; border:0.5px solid #3186C8"/>
   			</td>
   			<td>
   				经办人：<input type="text" name="annt" value="" id="query" style="height: 20px; border:0.5px solid #3186C8"/>
   			</td>
   			<td colspan="2">
   				<input type="submit" value="搜索" style="width: 50px;margin-top: 5px;height: 20px;">
   			</td>
    	</tr>
    	
    	<tr>
	        <th><input name="" type="checkbox" id="check_all" onclick="checkAll(this);"  value="" /><b style="margin-left: 20px;">产品名称</b></th>
	        <th>数量</th>
	        <th>出库时间</th>
	        <th>经办人</th>
	        <th>单价</th>
        </tr>
        </thead>
        
        <tbody>
        <c:forEach items="${data.results}" var="output">
        <tr>
	        <td><input name="" class="checkbox" type="checkbox" value="${output.oid}" /><b style="margin-left: 20px;">${output.name}</b></td>
	        <td>${output.pcount}</td>
	        <td><fmt:formatDate value='${output.outputtime}' pattern='yyyy-MM-dd hh:mm:ss'/></td>
	        <td>${output.annt}</td>
	        <td>${output.price}</td>
        </tr>
        </c:forEach>
        </tbody>
        
    </table>
   </form>
   
    
   <!--进行分页跳转-->
    <div class="pagin">
    	<div class="message">共<i class="blue">${data.totalRecord} </i>条记录，当前显示第&nbsp;<i class="blue">${data.pageNo}&nbsp;</i>页</div>
        <ul class="paginList">
        <li class="paginItem"><a href="javascript:;"><span class="pagepre"></span></a></li>
        <li class="paginItem"><a href="/item/output_list?page=1">首页</a></li>
        <li class="paginItem"><a href="/item/output_list?page=${data.pageNo-1}"   <c:if test="${data.pageNo<=1}">  onclick="javascript:return false;" </c:if> >上一页</a></li>
        <li class="paginItem"><a href="/item/output_list?page=${data.pageNo+1}"   <c:if test="${data.pageNo>=data.totalPage}">  onclick="javascript:return false;" </c:if> >下一页</a></li>
        <li class="paginItem"><a href="/item/output_list?page=${data.totalPage}" >末页</a></li>
        <li class="paginItem"><a href="javascript:;"><span class="pagenxt"></span></a></li>
        </ul>
    </div>

	<div class="tip">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        
    <div class="tipinfo">
        <span><img src="../../images/ticon.png" /></span>
        <div class="tipright">
        <p id="mess_tip">该功能尚未实现,敬请期待！</p>
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
