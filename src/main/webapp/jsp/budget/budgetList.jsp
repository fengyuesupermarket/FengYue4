<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% 
//就是http://127.0.0.1:8080/pic/
/* String basePath = request.getScheme()+"://"+request.getServerName()+":"
                +"8080/pic/"; */
String basePath = request.getScheme()+"://"+"192.168.200.129"+":"
                +"80/";
%>
<!DOCTYPE HTML>
<html>
<head>
<title>收支列表</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="content-type" content="text/html;charset=utf-8">

<link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/loginmoban/css/style.css" type="text/css" media="all" />
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
table#tab1{
	width:600px;
	margin-top:10px;
	background-color:#2196f3;
}
#tab2{
	width:600px;
	margin-top:5px;
}
table#tab1 th,table#tab1 tr, table#tab1 td{
	padding:5px;
	text-align:center;
	background-color:#fff;
}
#container{
	margin: auto;
	width: 600px;
}
#search{
	background-color:transparent;
	border:1px solid #2196f3;
	position:relative;
	top:1px;
}
#key{
	border:1px solid #2196f3;
	padding:2px;
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js" ></script>
<script type="text/javascript">
$(document).ready(function(){

	//批量删除
	$("#delform").click(function(){
		
		//批量删除
		var $itemsidArr = $("[name=items_id]:checked");
		if($itemsidArr.size()>0){
			//点击批量删除链接时，复选框的form的值变成delAllForm
			$("[name=items_id]:checkbox").attr("form","delAllForm");
		
		
			$("#delAllForm").submit();
		}else{
			alert("您尚未选中任何的商品记录~~~");
		}		
	});
	
	$("#toupdateform").click(function(){
		
		//判断至少删除一条
		var $itemsidArr = $("[name=items_id]:checked");
		if($itemsidArr.size()>0){
		
			//点击批量删除链接时，复选框的form的值变成toUpdateAllForm
			$("[name=items_id]:checkbox").attr("form","toUpdateAllForm");
		
			//$("#toUpdateAllForm").submit();
			console.log($itemsidArr);
			console.log($itemsidArr.size());
			$("#toUpdateAllForm").submit();
		}else{
			alert("您尚未选中任何的商品记录~~~");
		}
	});
	
	//批量修改
	$("#editform").click(function(){
		
		var $itemsidArr = $("[name=items_id]:checked");
		if($itemsidArr.size()>0){
			//点击批量修改链接时，复选框的form的值变成editAllForm
			$("[name=items_id]:checkbox").attr("form","editAllForm");
			
			$("#editAllForm").submit();
		}else{
			alert("请选择要修改的商品记录~~~");
		}		
	});
	
})
</script>








</head>
<body>

	<c:if test="${sessionScope!=null }">
		哈喽，${sessionScope.user.username }，欢迎回来！！！
	</c:if>



	<!-- bg effect -->
	<div id="bg">
		<canvas></canvas>
		<canvas></canvas>
		<canvas></canvas>
	</div>
	<!-- //bg effect -->




	<div id="container">
	
	<div>
		欢迎<a href="#">${user.username }</a>回来
	</div>
	
	
	
	
	<%-- <form id="form2" action="<c:url value="/items/deleteItems.action" />" method="post"></form>
	<input id="delname" form="form2" type="text" name="id" hidden />
	<input id="delsubmit" form="form2" type="submit" value="删除" hidden /> --%>
	
	
	<form id="form1" action="<c:url value="/items/findItems.action" />" method="post"></form>
	<!-- 批量删除 -->
	<form id="delAllForm" action="<c:url value="/items/deleteItems.action" />" method="post"></form>
	<!-- 批量更新 -->
	<form id="toUpdateAllForm" action="<c:url value="/items/toEditItemsAllSubmit.action" />" method="post"></form>
	<!-- 批量修改 -->
	<form id="editAllForm" action="<c:url value="/items/toEditItems.action" />" method="post"></form>
	<ul>
		<li>搜索：
		<select form="form1" id="sel" name="itemsCustom.typeid">
			<option value="">--请选择--</option>
			<c:forEach items="${itemstypeList }" var="itemstype" >
				<option value="${itemstype.id }">
					<c:if test="${itemstype.classid eq 1 }">
						&nbsp;&nbsp;--
					</c:if>
					${itemstype.name }
				</option>
			</c:forEach>
		</select>
		<input id="key" form="form1" type="text" name="itemsCustom.name" />
		<input id="search" form="form1" type="submit" value="查询" /></li>
	</ul>

	<table id="tab1">
		<tr>
			<th><input type="checkbox" name="all" /></th>
			<th>日期</th>
			<th>类别</th>
			<th>总金额</th>
			<th>数目</th>
			<th>商品id</th>
			<th>备注</th>
		</tr>
		
		    <c:forEach items="${budgetList }" var="budget">
			<tr>
				<td><input form="delAllForm toUpdateAllForm" type="checkbox" name="items_id" value="${budget.date }" /><input hidden type="text" name="idd" value="${budget.date }" /></td>
				<td><fmt:formatDate value="${budget.date }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				<td>${budget.incomeOrExpenditure }</td>
				<td>&yen;${budget.amount }</td>
				<td>${budget.quantity }</td>

				<td>
					${budget.itemsId }
				</td>
				
				<td>${budget.remarks }</td>
				<td>
					<a href="<c:url value="/items/toUpdateItems.action" />?items_id=${item.id }">编辑</a>
					<a href="<c:url value="/items/deleteItems.action" />?items_id=${item.id }">删除</a>
					<a href="<c:url value="/items/deleteLogicItems.action" />?id=${item.id }">logic删除</a>
					<%-- <a href="#" onclick="aaa(${item.id })">删除</a> --%>
				</td>
			</tr>
			</c:forEach>
	</table>
	<table id="tab2">
		<tr>
			<td>
				<a href="#" id="delform">批量删除</a>
				<a href="#" id="editform">批量修改</a>
				<a href="<c:url value="/budget/toAddBudget.action" />">新增信息</a>
				<a href="<c:url value="/items/toAddMoreItems.action" />">批量新增</a>
				<a href="#" id="toupdateform">批量更新</a>
			</td>

		</tr>
	</table>
	</div>
	<%-- <jsp:include page="pager.jsp"></jsp:include> --%>



<!-- <script type="text/javascript">


	function aaa(iid){
		//console.log(iid);
		var delname = document.getElementById("delname");
		delname.value=iid;
		alert(delname.value);
		console.log(document.getElementById("delsubmit").click());
	}
	//addLoadEvent(aaa);
	
</script> -->

<script type="text/javascript">
	function manydel(){
		var checkBoxes = document.getElementsByName("id");
		var idlist=new Array();
		for(var i=0;i<checkBoxes.length;i++){
			//alert(checkBoxes[i].checked);
			//alert(idd);
			if(checkBoxes[i].checked==true){
				//把需要删除的组成list
				var idd = checkBoxes[i].nextElementSibling.value;
				idlist[i] = idd;
				//window.location.href="<c:url value="/  items/deleteLogicItems.action" />?id="+idd;
			}
		}
		//批量逻辑删除
		window.location.href="<c:url value="/items/manyDeleteLogicItems.action" />?idlist="+idlist;
	}
	
	
	
	
	
	
</script>
	
	<!-- effect js -->
	<script src="${pageContext.request.contextPath}/jsp/loginmoban/js/canva_moving_effect.js"></script>
	<!-- //effect js -->

</body>
</html>