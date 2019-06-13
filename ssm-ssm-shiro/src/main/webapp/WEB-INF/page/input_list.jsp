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

 	
 	 //对删除入库记录按钮进行点击事件绑定，判断当前是否有选中的数据
	$("#delete").click(function() {
		var inputList = $(".checkbox");
		var ids = [];
		for (var i=0;i<inputList.length;i++) {
			if(inputList[i].checked) {
				ids.push(inputList[i].value);
			}
		}
		//以，分隔批量操作的入库id号1,2,3的形式传值，拼接字符串
		ids = ids.join(",");
		
		if(ids.length==0) {
			$("#mess_tip").html("请至少选中一件商品再进行操作！");
			$(".tip").fadeIn(200);
			return false;
		}else {
			//发送请求进行批量的删除入库记录，物理删除
			$.post("/rest/input/delete",{id:ids},function(data) {
				//判断是否删除成功
				if(data.status==200) {
					location.href="/item/input_list";
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
    <li><a href="#">入库记录列表</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
	<div class="tools">
	    <ul class="toolbar">	
        <li class="click_update"><span><img src="../../images/t02.png" /></span>修改</li>
        <li><span><img src="../../images/t03.png"/></span><a href="javascript:;" id="delete">删除入库信息</a></li>
	    ${msg}
	    </ul>
	    <ul class="toolbar1">
	        <li><span><img src="../../images/t05.png" /></span>设置</li>
	    </ul>
	</div>
	
   <form action="/item/input/search" method="post">
   	 <table class="tablelist">
    	<thead>
    	<tr>
   			<td>
   				产品名称：<input type="text" name="name" value="" id="query" style="height: 20px;border:0.5px solid #3186C8"/>
   			</td> 	
   			<td>
   				日期：<input type="text" name="inputtime" value="" id="query" style="height: 20px; border:0.5px solid #3186C8"/>
   			</td>
   			<td>
   				经办人：<input type="text" name="annt" value="" id="query" style="height: 20px; border:0.5px solid #3186C8"/>
   			</td>
   			<td>
   				供应商:
   				<select name="pname" style="width:100px;">
   					<option value="">---请选择---</option>
   					<!-- 查询出对应的供应商表中的数据信息 -->
   					<c:forEach items="${data.providerList}" var="provider">
   						<option  value="${provider.pname}">${provider.pname}</option>
   					</c:forEach>
   				</select>
   			</td>
   			<td colspan="3">
   				<input type="submit"  value="搜索" style="width: 50px;margin-top: 5px;height: 20px;"><br />	
   			</td>
    	</tr>
    	<tr>
	        <th><input name="" type="checkbox" id="check_all" onclick="checkAll(this);"  value="" /><b style="margin-left: 20px;">产品名称</b></th>
	        <th>数量</th>
	        <th>入库时间</th>
	        <th>供应商</th>
	        <th>经办人</th>
	        <th>单价</th>
	        <th>总价</th>
        </tr>
        </thead>
        
        <tbody>
        <c:forEach items="${data.pageInfo.results}" var="input">
        	<tr>
		        <td><input name=""  class="checkbox" type="checkbox" value="${input.id}" /><b style="margin-left: 20px;">${input.name}</b></td>
		        <td>${input.pcount }</td>
		        <td><fmt:formatDate value='${input.inputtime}' pattern='yyyy-MM-dd hh:mm:ss'/></td>
		        <td>${input.pname}</td>
		        <td>${input.annt}</td>
		        <td>${input.dprice}</td>
		        <td>${input.price }</td>
		     </tr>
        </c:forEach>
        </tbody>
    </table>
   </form>
   
    
   <!--进行分页跳转-->
   <div class="pagin">
    	<div class="message">共<i class="blue">${data.pageInfo.totalRecord} </i>条记录，当前显示第&nbsp;<i class="blue">${data.pageInfo.pageNo}&nbsp;</i>页</div>
        <ul class="paginList">
        <li class="paginItem"><a href="javascript:;"><span class="pagepre"></span></a></li>
        <li class="paginItem"><a href="/item/input_list?page=1">首页</a></li>
        <li class="paginItem"><a href="/item/input_list?page=${data.pageInfo.pageNo-1}"   <c:if test="${data.pageInfo.pageNo<=1}">  onclick="javascript:return false;" </c:if> >上一页</a></li>
        <li class="paginItem"><a href="/item/input_list?page=${data.pageInfo.pageNo+1}"   <c:if test="${data.pageInfo.pageNo>=data.pageInfo.totalPage}">  onclick="javascript:return false;" </c:if> >下一页</a></li>
        <li class="paginItem"><a href="/item/input_list?page=${data.pageInfo.totalPage}" >末页</a></li>
        <li class="paginItem"><a href="javascript:;"><span class="pagenxt"></span></a></li>
        </ul>
    </div>


	<div class="tip">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        
    <div class="tipinfo">
        <span><img src="../../images/ticon.png" /></span>
        <div class="tipright">
        <p id="mess_tip">该功能尚未实现，敬请期待！</p>
        <%-- <cite>如果是请点击确定按钮 ，否则请点取消。</cite> --%>
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
