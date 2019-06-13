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

<%--对新增入库页面进行js校验的js文件 --%>
<script type="text/javascript" src="../../js/input.js" ></script>
</head>

<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">产品入库</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>新增入库</span></div>
    
    <form action="/rest/input/add" method="post"  id="form" onsubmit="return checkForm(this);">
        <ul class="forminfo">
		    <li><label>产品名称</label><input name="name"  type="text" class="dfinput" value="${product.name}" readonly="readonly"/>
		    	<input type="hidden" id="pid" name="pid" value="${product.id}"/>
		    </li>
		    <li><label>数量</label><input name="pcount" type="text" class="dfinput" value="" id="pcount" onblur="checkInput(this);" onfocus="focusInput(this);" /><i id="pcount_tip" style="color: red;font-size: 14px;"></i></li>
		    <li><label>单价</label><input name="dprice" type="text" class="dfinput" value="" id="dprice" onblur="checkInput(this);" onfocus="focusInput(this);"/><i id="dprice_tip" style="color: red;font-size: 14px;">精确到小数点后两位</i></li>
		    <li><label>总价格</label><input name="price" type="text" class="dfinput" value="" id="total_price" readonly="readonly"/></li>
		    <li><label>经办人</label><input name="annt" type="text" class="dfinput" value="${product.annt}" onblur="checkInput(this);" onfocus="focusInput(this);" /><i id="annt_tip" style="color: red;font-size: 14px;"></i></li>
		    <li><label>选择供应商</label>
		    	<select name="pname" style="width: 150px;" id="sels">
		    		<option value="">---请选择---</option>
		    		<!-- 查询出对应的供应商表中的数据信息 -->
   					<c:forEach items="${providerList}" var="provider">
   						<option  value="${provider.pname}">${provider.pname}</option>
   					</c:forEach>
		    	</select>
		    	<a href="/provider_add">添加供应商</a>
		    </li>
		    <li><label>&nbsp;</label><input type="submit" class="btn" value="入库新增"/></li>
        </ul>
    </form>
    
    <div class="tip">
      <div class="tiptop"><span>提示信息</span><a></a></div>
        
      <div class="tipinfo">
        <span><img src="../../images/ticon.png" /></span>
        <div class="tipright">
        <p id="mess_tip">请确认页面中的错误信息，并进行修改</p>
        </div>
     </div>
        
     <div class="tipbtn">
        <input name="" type="button"  class="sure" value="确定" onclick="checkSure();"/>&nbsp;
        <input name="" type="button"  class="cancel" value="取消" onclick="checkCancel();"/>
     </div>
    
    </div>
    
    </div>
</body>
</html>
