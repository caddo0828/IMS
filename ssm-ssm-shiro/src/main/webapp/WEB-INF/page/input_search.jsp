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
</head>

<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">入库查询结果列表</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">  
  
   	 <table class="tablelist">
    	<thead>
    	<tr>
	        <th>产品名称</th>
	        <th>入库时间</th>
	        <th>数量</th>
	        <th>单价</th>
	        <th>总价</th>
	        <th>经办人</th>
	        <th>供应商</th>
       </tr>
        </thead>
        
        <tbody>
        	<c:if test="${not empty data.inputList}">
        	<c:forEach items="${data.inputList}" var="input" varStatus="vs">
        	<tr>
		        <td>${input.name}</td>
		        <td><fmt:formatDate value='${input.inputtime}' pattern='yyyy-MM-dd hh:mm:ss'/></td>
		        <td>${input.pcount}</td>
		        <td>${input.dprice}</td>
		        <td>${input.price}</td>
		        <td>${input.annt}</td>
		        <td>${input.pname}</td>
		    </tr> 
        	</c:forEach>
        	</c:if>
		    <tr>
		        <td colspan="7" style="font-size: 16px; color: #2A3E93;">总数量:  ${data.totalCount} &nbsp;&nbsp;&nbsp;总价格: ${data.totalPrice}￥</td>
		    </tr> 
        </tbody>
    </table>

    </div>

</body>
</html>
