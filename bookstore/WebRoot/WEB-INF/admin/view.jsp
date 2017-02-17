<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	* {
		margin: 0px;
		padding: 0px;
		border: 0px;
	}
	
	.container{
		width: 1300px;
		height: 730px;
		background-color: rgb(78,78,78);
	}
	.top{
		width: 1300px;
		height: 90px;
	}
	.bottom{
		width: 1300px;
		height: 640px;
		background-color: white;
	}
	.top_1{
		width: 200px;
		height: 30px;
		color: white;
		font-size: 20px;
		float: left;
		margin-top: 10px;
	}
	
	.top_2{
		width: 300px;
		height: 30px;
		color: white;
		font-size: 20px;
		margin-left:50px;
		float: left;
		margin-top: 10px;
	}
	
	a{
		color: gray;
	}
	
	</style>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
	<script type="text/javascript">
		function changePage(value){
			$("#page").attr("src","${pageContext.request.contextPath}/"+value+"/show.action");
		}
			$(
				function(){
					$("#exit").click(
							function(){
								if(confirm("确定要退出吗？")){
									$("#exit").attr("href","${pageContext.request.contextPath }/admin/login.action");
								}
							}
					)
				}
			)
	</script>
  </head>
  <body >
	<center>
	  <div class="container">
			<div class="top" >
				<h1 style="color: white;">网博网上书城系统后台管理</h1>
					<div class="top_1">
						管理员：${admin.adminname}&nbsp;&nbsp;<a id= "exit"  href="javascript:;"  target="_top">退出</a>
					</div>
					<div class="top_2">
						<a href="javascript:;"  onclick="changePage('category')">分类管理</a>&nbsp;
						<a href="javascript:;" onclick="changePage('book')">图书管理</a>&nbsp;
						<a href="javascript:;" onclick="changePage('order')">订单管理</a>&nbsp;
					</div>
			</div>
			<div class="bottom">
				<iframe id="page" width="100%" height="100%" scrolling="no"></iframe>
			</div>
		</div>
	</center>
  </body>
</html>
