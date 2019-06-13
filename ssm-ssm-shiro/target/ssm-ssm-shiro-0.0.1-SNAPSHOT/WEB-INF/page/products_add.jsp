<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="../../css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js" ></script>

<!-- 对产品添加的js校验文件 -->
<script type="text/javascript" src="../../js/prod_add.js" ></script>

<script type="text/javascript">
	function loadSmall(obj) {
		var bid = obj.value;
		//当没有选择大分类时，不请求
		if(bid=="") {
			return ;
		}else {
			$.post("/rest/smallType/search",{bid:bid},function(data) {
 			var options = "";
 			options += " <option value=''>---请选择---</option> ";
 			
 			//返回的json数据是一个list集合数组形式
 			for(var i=0;i<data.length;i++) {
 				//拼接数据
 				options += "<option value="+data[i].id +">"+data[i].name+"</option>"
			}
 			$("#smallType").html(options);
 			
 			});
		}
		
	}
</script>
</head>

<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">新建物料</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>新品入库</span></div>
    
    <form action="/rest/products/add" method="post" id="form">
        <ul class="forminfo">
		    <li><label>选择大类</label>
		    	<select name="bid"  id="bigType" onchange="loadSmall(this);"  style="border:0.5px solid #3186C8;width: 245px;height: 20px;">
   					<option value="">---请选择---</option>
   					<c:forEach items="${bigTypeList}" var="bigType">
   						<option value="${bigType.id}">${bigType.name}</option>
   					</c:forEach>
   				</select>
		    </li>
		    
		    <li><label>选择小类</label>
		    	<select name="sid" id="smallType" style="border:0.5px solid #3186C8;width: 245px;height: 20px;">
   					<option value="">---请选择---</option>
   				</select>
		    </li>
		   
		   <li><label>产品名称：</label><input name="name"  id="pname" type="text" class="dfinput" />
		   		<i id="pname_tip" style="color: red;font-size: 14px;"></i>
		   </li>
		    <li><label>数量：</label><input name="count" id="count" type="text" class="dfinput" value="" />
		   		<i id="count_tip" style="color: red;font-size: 14px;"></i>
		   </li>
		   <li><label>单位：</label><input name="units" id="units" type="text" class="dfinput" value="" />
		   		<i id="units_tip" style="color: red;font-size: 14px;"></i>
		   </li>
		   <li><label>预警值：</label><input name="wvalue" id="wvalue" type="text" class="dfinput" value="" />
		   		<i id="wvalue_tip" style="color: red;font-size: 14px;"></i>
		   </li>
		   <li><label>经办人姓名：</label><input name="annt" id="annt" type="text" class="dfinput" value="" />
		   		<i id="annt_tip" style="color: red;font-size: 14px;"></i>
		   </li>
		   <li><label>&nbsp;</label><input  id="sub" type="submit" class="btn" value="新增物料入库"/><i id="msg" style="color: red; font-size: 16px; margin-left: 10px;">${msg}</i> </li>
        </ul>
    </form>
    
     <div class="tip">
      <div class="tiptop"><span>提示信息</span><a></a></div>
     
      <div class="tipinfo">
        <span><img src="../../images/ticon.png" /></span>
        <div class="tipright">
        <p id="mess_tip"></p>
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
