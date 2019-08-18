<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML>
<html>
<head>
<title>添加收支信息</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
body{
	font-size: 12px;
}
ul {
	list-style: none;
	padding: 0px;
	margin: 0px;
}
table {
	width: 600px;
	margin-top:10px;
	border:1px solid #000;
}
th,tr,td  {
	border:1px solid #000;
	padding:5px;
}
#container{
	margin: auto;
	width: 600px;
}
</style>
<!--   </head> -->
<body>
	<div id="container">
	<form id="form1"
		action="<c:url value="/budget/addBudget.action" />" method="post" enctype="multipart/form-data"></form>
	<ul>
		<li>类型：<input form="form1" type="text" name="incomeOrExpenditure" required /></li>
		<li>总金额：<input form="form1" type="number" min="0.00" step="0.01" name="amount" required /></li>
		<li>数目：<input form="form1" type="number" name="quantity" required /></li>
		<li>商品id：<input form="form1" type="text" name="itemsId" /></li>
		<li>备注：<input form="form1" type="text" name="remarks" /></li>
		<li><input form="form1" type="submit" value="添加" /></li>
	</ul>
	</div>
</body>
</html>