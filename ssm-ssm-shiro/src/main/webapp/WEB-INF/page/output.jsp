<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="../../css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js" ></script>

<!-- 对出库产品进行校验的js文件 -->
<script type="text/javascript" src="../../js/output.js" ></script>
</head>

<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">产品出库</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>出库</span></div>
    
    <form action="/rest/output/add" method="post" id="form" onsubmit="return checkForm(this);">
        <ul class="forminfo">
		    <li><label>产品名称</label><input name="name" type="text" class="dfinput" value="${product.name}"/>
		    	<input type="hidden" id="pid" name="pid" value="${product.id}"/>
		    </li>
		    <li><label>单价</label><input name="price" type="text" class="dfinput" id="price" onblur="checkOutput(this);" onfocus="focusOutput(this);"  /><i id="dprice_tip" style="color: red;font-size: 14px;">精确到小数点后两位</i></li>
		    <li><label>数量</label><input name="pcount" type="text" class="dfinput" id="pcount" onblur="checkOutput(this);" onfocus="focusOutput(this);"/><i id="pcount_tip" style="color: red;font-size: 14px;"></i></li>
		    <li><label>经办人</label><input name="annt" type="text" class="dfinput" value="${product.annt}" id="annt" onblur="checkOutput(this);" onfocus="focusOutput(this);" /><i id="annt_tip" style="color: red;font-size: 14px;"></i></li>
		    <li><label>&nbsp;</label><input type="submit" class="btn" value="出库"/></li>
        </ul>
    </form>
    </div>
</body>
</html>
