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

<%--对库存查询后的界面校验的js文件 --%>
<script type="text/javascript" src="../../js/kucun.js" ></script>

<script type="text/javascript">
	function loadSmall(obj) {
		var bid = obj.value;
		//当没有选择大分类时，不请求
		if(bid=="") {
			return ;
		}else {
			$.post("/rest/smallType/search",{bid:bid},function(data) {
				//直接返回一个list集合。集合存放对应的小分类对象
	 			var options = "";
	 			options += " <option value='0'>---请选择---</option> ";
	 			
	 			//返回的json数据是一个list集合数组形式
	 			for(var i=0;i<data.length;i++) {
	 				//拼接数据
	 				options += "<option value="+data[i].id +">"+data[i].name+"</option>"
				}
	 			$("#smallType").html(options);
 			
 			});
		}	
	}
	
	//全选
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
    <li><a href="#">库存查询结果列表</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
 	<div class="tools">
    	<ul class="toolbar">
        <li class="click_input"><span><img src="../../images/t01.png"/></span><a href="javascript:;" id="input">入库</a></li>
        <li class="click_update"><span><img src="../../images/t02.png" /></span>修改</li>
        <li><span><img src="../../images/t04.png"/></span><a href="javascript:;" id="output">出库</a></li>
       	<li><span><img src="../../images/t03.png"/></span><a href="javascript:;" id="delete">删除产品</a></li>
       </ul>
        <ul class="toolbar1">
        <li><span><img src="../../images/t05.png" /></span>设置</li>
        </ul>
    </div>
   
   
    <form action="/item/kucun/search" method="post">
    <table class="tablelist">
    	<thead>
    	<tr>
   		  <td>
   			大  类：
   			<select name="bid"  id="bitType"  onchange="loadSmall(this);"  style="float: right;margin-top: 6px;border:0.5px solid #3186C8">
   				<option value="0">---请选择---</option>
   				<c:forEach items="${data.bigTypeList}" var="bigType">
   					<option value="${bigType.id}">${bigType.name}</option>
   				</c:forEach>
   			</select>
   			</td> 		
   			<td>
   			小  类：
   			<select name="sid" id="smallType" style="float: right;margin-top: 6px;border:0.5px solid #3186C8">
   				<option value="0">---请选择---</option>
   				<c:forEach items="${data.smallTypeList}" var="smallType">
   					<option value="${smallType.id}">${smallType.name}</option>
   				</c:forEach>
   			</select>
   			</td> 		
   			<td>
   				产品名称：
   				<input type="text" name="name" id="proName"  value=""  style="height: 20px; border:0.5px solid #3186C8"/>
   			</td> 
   			<td colspan="3">
   				<input type="submit" value="查询" />
   			</td>
   			
    	</tr>
    	<tr>
        <th><input name="" type="checkbox" value="" id="check_all" onclick="checkAll(this);"/>&nbsp;&nbsp;产品名称  </th>
        <th>单位</th>
        <th>数量</th>
        <th>预警值</th>
        <th>经办人</th>
        </tr>
        </thead>
        
        <tbody>
        <c:if test="${not empty data.pageInfo.results}">
         <c:forEach items="${data.pageInfo.results}" var="product">
	    	 <tr>
		        <td><input name="checkbox" class="checkbox" type="checkbox" value="${product.id}" /><b style="margin-left: 20px;">${product.name}</b></td>
		        <td>${product.units}</td>
		       	<td>${product.count}</td>
		        <td>${product.wvalue}</td>
		        <td>${product.annt}</td>
	        </tr> 
	    </c:forEach>
        </c:if>
      
        </tbody>
    </table>
    </form>
        
   
 	<div class="pagin">
    	<div class="message">共<i class="blue">${data.pageInfo.totalRecord} </i>条记录，当前显示第&nbsp;<i class="blue">${data.pageInfo.pageNo}&nbsp;</i>页</div>
        <ul class="paginList">
        <li class="paginItem"><a href="javascript:;"><span class="pagepre"></span></a></li>
        <li class="paginItem"><a href="/item/kucun/search?page=1">首页</a></li>
        <li class="paginItem"><a href="/item/kucun/search?page=${data.pageInfo.pageNo-1}"   <c:if test="${data.pageInfo.pageNo<=1}">  onclick="javascript:return false;" </c:if> >上一页</a></li>
        <li class="paginItem"><a href="/item/kucun/search?page=${data.pageInfo.pageNo+1}"   <c:if test="${data.pageInfo.pageNo>=data.pageInfo.totalPage}">  onclick="javascript:return false;" </c:if> >下一页</a></li>
        <li class="paginItem"><a href="/item/kucun/search?page=${data.pageInfo.totalPage}" >末页</a></li>
        <li class="paginItem"><a href="javascript:;"><span class="pagenxt"></span></a></li>
        </ul>
    </div>

	<div class="tip">
      <div class="tiptop"><span>提示信息</span><a></a></div>
     
      <div class="tipinfo">
        <span><img src="../../images/ticon.png" /></span>
        <div class="tipright">
        <p id="mess_tip">该功能尚未实现，敬请期待！</p>
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
