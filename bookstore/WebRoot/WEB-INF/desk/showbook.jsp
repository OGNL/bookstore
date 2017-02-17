<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showbook.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/pager/pager.css'/>" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/book/desc.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/desk/desc.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/book/jquery.datepick.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.datepick.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.datepick-zh-CN.js'/>"></script>
	<script src="${pageContext.request.contextPath}/js/desk/desc.js"></script>
	<script type="text/javascript">
	function checknum(){
	  var num=$("#quantity").val();
	  var reg=/^[0-9]{1,}$/;
	  if(!reg.test(num)){
				alert("数量只能是数字！");	
				return false; 
			}
	  if(num==""||num==0){
		  alert("数量不能为空或“0”");
		  return false;
	 		}
	  if(eval(num)> eval('${book.stock}')){
	    alert("数量不能大于库存！");	
	    return false;
  		}
	  return true;
	 }
	
function doaddcar(){
	if(checknum()){
		if('${user.loginname}' == null ||'${user.loginname}' == ""){
			alert("您还没有登录，请先登录！");
		}else{
			document.getElementById("form1").action="${pageContext.request.contextPath}/car/doaddcar.action";
	   		 document.getElementById("form1").submit();
		
		}
		
	}
	
	
}


	
	</script>
	<style type="text/css">
		#buybtn {
		background: url("./images/all.png") no-repeat;
		display: inline-block;
		background-position: 0 -70px;
		height: 36px;width: 146px;
		}
		#buybtn:HOVER {
		background: url("./images/all.png") no-repeat;
		display: inline-block;
		background-position: 0 -104px;
		height: 36px;
		width: 146px;
		}
		#cartbtn {
		background: url("./images/all.png") no-repeat;
		display: inline-block;
		background-position: 0 -830px;
		height: 36px;width: 155px;
		}
		#cartbtn:HOVER {
		background: url("./images/all.png") no-repeat;
		display: inline-block;
		background-position: 0 -865px;
		height: 36px;
		width: 155px;
		}
		
	</style>
  </head>
  
  <body>
   <div class="divBookName">${book.bname}</div>
  <div>
    <img align="top" src="/headimage/${book.image_w}" class="img_image_w"/>
    <div class="divBookDesc">
	    <ul>
	    	<li>商品编号：${book.bid}</li>
	    	<li>当前价：<span class="price_n">&yen;${book.currPrice}</span></li>
	    	<li>定价：<span class="spanPrice">&yen;${book.price}</span>　折扣：<span style="color: #c30;">${book.discount}</span>折</li>
	    </ul>
		<hr class="hr1"/>
		<table>
			<tr>
				<td colspan="3">
					作者：${book.author} 著
				</td>
			</tr>
			<tr>
				<td colspan="3">
					出版社：${book.press}
				</td>
			</tr>
			<tr>
				<td colspan="2">出版时间：${book.printtime}</td>
				<td>库存：${book.stock}</td>
			</tr>
			<tr>
				<td>版次：${book.edition}</td>
				<td>页数：${book.pageNum}</td>
				<td>字数：${book.wordNum}</td>
			</tr>
			<tr>
				<td width="180">印刷时间：${book.publishtime}</td>
				<td>开本：${book.edition} 开</td>
				<td>纸张：${book.paper}</td>
			</tr>
		</table>
		<div class="divForm">
			<form id="form1"  method="post" >
				<input type="hidden" name="uid" value="${user.uid }">
				<input type="hidden" name="loginname" value="${user.loginname }">
				<input type="hidden" name="bid" value="${book.bid}"/>
  				我要买：<input id="quantity" style="width: 40px;text-align: center;" type="text" name="quantity" value="1"/>件
  			</form>
  			<a id="cartbtn" href="javascript:doaddcar();" ></a>
  		</div>	
	</div>
  </div>
</html>
