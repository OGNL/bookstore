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
    
    <title>My JSP 'showbooks.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/book/books.css">
	<style type="text/css">
	.inner{
	border: 1px solid aqua;
	
	}
	
	</style>
  </head>
  
  <body>
  <c:choose>
  <c:when test="${ not empty books}">
  <c:forEach items="${books}" var="book">
  	 <li>
  <div class="inner">
    <a class="pic" href="${pageContext.request.contextPath}/desk/showbook.action?id=${book.bid}"><img src="/headimage/${book.image_w}" style="width:200px;height:200px;"/></a>
    <p class="price">
		<span class="price_n">&yen;${book.currPrice}</span>
		<span class="price_r">&yen;${book.price}</span>
		(<span class="price_s">${book.discount}</span>)
	</p>
	<p><a href="${pageContext.request.contextPath}/desk/showbook.action?id=${book.bid}">${book.bname}</a></p>
	<p>${book.author}</p>
	<p class="publishing">
		<span>出版社：</span>${book.press}
	</p>
  </div>
 </li>
  </c:forEach>
  </c:when>
  	<c:otherwise>
  		暂时没有数据
  	</c:otherwise>
  </c:choose>
   <div style="margin-top:650px;width:700px;height:40px;position: absolute;">
  	<center>
  	<%@ include file="/WEB-INF/desk/pager/pager.jsp" %>
  	</center>
  </div>
  </body>
</html>
