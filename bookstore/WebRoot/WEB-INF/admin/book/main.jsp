<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>main</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
	<style type="text/css">
		*{
			padding:0px;
			margin:0px;
		}
		.first{
			width:1400px;
			height:800px;
		}
		.second{
			margin:3px;
			text-align:center;
			line-height:40px;
			width:200px;
			height:100px;
			color:white;
			float:left;
			background-color:rgb(78,78,78);
			}
			.third{
				border-top:1px solid white;
				width: 50px;
				height:40px;
				float:left;
				background-color:rgb(78,78,78);
			}
			.third01{
				width:150px;
				float: left;
				border-top:1px solid white;
				text-align: left;
				text-indent: 10px;
				color:white;
				background-color:rgb(78,78,78);
			}
			.fourth{
				height:40px;
				width:200px;
				float:left;
				font-size: 10px;
				border-top: 1px solid white;
				background-color:gray;
			}
			
			.fifth{
				border:0px;
				height:640px;
				width: 1200px;
				float: left;
				text-align: center;
				line-height: 60px;
				letter-spacing: 3px;
				font-size: 20px;
				position:absolute;
				border-left: 1px solid black;
			}
	</style>
	<script type="text/javascript">
		function showdiv(id){
				var a=document.getElementsByName(id);
				for(var i=0;i<a.length;i++)
					{
						if(a[i].style.display=="none")
							{
								a[i].style.display="block";
								document.getElementById(id).src="${pageContext.request.contextPath}/images/book/jian.png";
							}else{
								a[i].style.display="none";
								document.getElementById(id).src="${pageContext.request.contextPath}/images/book/jia.png";
							}
					}
			}
		window.onload=function (){
			document.getElementById("iframe").src="${pageContext.request.contextPath}/book/addbookmanage.action";
		}
		function showsecondbooks(id){
			document.getElementById("iframe").src="${pageContext.request.contextPath}/book/showbysome.action?id="+id;
		}
	</script>
 </head>

  <body>
  	<div class="first">	
		<iframe id="iframe" class="fifth">
		</iframe>
		<div class="second">
		<h3>图书分类</h3>
		<c:forEach var="list" items="${catslists}">
		<c:if test="${list.pid == 0}">
		<a href="javascript:showdiv('${list.id}');">
			<div class="third">
			<img id="${list.id}" src="${pageContext.request.contextPath}/images/book/jia.png" style="margin-top: 10px;"/>
			</div>
			<div class="third01">${list.pname}</div>
		</a>
		</c:if>	
		<div class="twodiv">
		<c:forEach var="p" items="${list.cats}">
		<a href="javascript:showsecondbooks(${p.cid});"><div class="fourth" name="${list.id}" style="display: none">${p.cname}</div></a>
		</c:forEach>
		</div>
		</c:forEach>
	</div>
  </body>
</html>
