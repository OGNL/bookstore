<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'bookmanage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<style type="text/css">
			.first{
						height:600px;
						width: 1100px;
						text-align: center;
						line-height: 60px;
						letter-spacing: 3px;
						font-size: 20px;
					}
		</style>
		<script type="text/javascript">
			function addbook(){
				location.href="${pageContext.request.contextPath}/book/doaddbook.action";
			}
			function searchbook()
			{
				location.href="${pageContext.request.contextPath}/book/dosearch.action";
			}
		</script>
  </head>
  
  <body>
    			<div id="first" class="first">
				<h1>图书管理</h1>
				<a href="javascript:addbook();">添加图书</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="javascript:searchbook();">高级搜索</a>
				</div>
  </body>
</html>
