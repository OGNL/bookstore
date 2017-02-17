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
    
    <title>My JSP 'category.jsp' starting page</title>
    
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
	}
	.container{
		width: 1300px;
		height: 650px;
		background-color: rgb(254,238,189);
	}
	
	a{
		text-decoration: none;
		color: #009FCC;
	}
	
	</style>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
	<script type="text/javascript">
		$(
			function(){
				$("#addI").click(
					function(){
						location.href = "${pageContext.request.contextPath}/category/addI.action";
					}
				);
				
			}
		)
		
		function deleteI(id){
			if(confirm("确定要删除吗？")){
				$.ajax(
					{
						type:"post",
						url:"${pageContext.request.contextPath}/category/findByPId.action",
						data:"id="+id,
						dataType:"text",
						success:function(msg){
							if(msg == "error"){
								alert("该分类下还有二级分类，无法删除！");
							}else{
								location.href = "${pageContext.request.contextPath}/category/dodeleteI.action?id="+id;
							}
						}
						
					}	
				)
			}
		}
		function deleteII(id){
				if(confirm("确定要删除吗？")){
					$.ajax(
					{
						type:"post",
						url:"${pageContext.request.contextPath}/book/findbookbycid.action",
						data:"id="+id,
						dataType:"text",
						success:function(msg){
							if(msg == "error"){
								alert("该二级分类下还有图书，无法删除！");
							}else{
								location.href = "${pageContext.request.contextPath}/category/dodeleteII.action?id="+id;
							}
						}
						
					}	
				)
					
				}
		
		}
		
	
	
	</script>

  </head>
  
  <body>
  	<center>
  	<div class="container">
  		<h2>分类列表</h2><br/><br/>
  		<a href="javascript:;" id="addI" style="font-size: 20">添加一级分类</a>
  		<c:choose>
  			<c:when test="${not empty cats}">
  			<table border="1px" width="80%">
  				<tr style="background: gray; color: white ; font-size: 18" align="center">
  					<td width="250px">分类名称</td>
  					<td width="250px">描述</td>
  					<td width="300px">操作</td>
  				</tr>
  				<c:forEach var="pcat" items="${cats}">
  					<c:if test="${pcat.pid eq 0}">
	  					<tr style="background-color: white;font-size: 18" >
	  					
		  						<td>${pcat.pname }</td>
		  						<td>${pcat.pdes }</td>
		  						<td>
		  							<a href="${pageContext.request.contextPath}/category/addII.action?id=${pcat.id}">添加二级分类</a>
		  							<a href="${pageContext.request.contextPath}/category/updateI.action?id=${pcat.id}">修改</a>
		  							<a href="javascript:;" onclick="deleteI('${pcat.id}')"">删除</a>
		  						</td>
	  					</tr>
	  					
	  				</c:if>
  					<c:set var="cat" value="${pcat.cats}"></c:set>
  					<c:if test="${not empty cat}">
  						
  						<c:forEach var="c" items="${cat}">
  							<tr align="right" style="font-size: 16">
  								<td>${c.cname }</td>
  								<td>${c.description }</td>
  								<td>
  									<a href="${pageContext.request.contextPath}/category/updateII.action?id=${c.cid}">修改</a>
  									<a href="javascript:;" onclick="deleteII('${c.cid}')">删除</a>
  								</td>
  							</tr>
  						</c:forEach>
  					</c:if>
  				</c:forEach>
  			</table>
  			</c:when>
  			<c:otherwise>
  			<br/>没有数据！
  			</c:otherwise>
  		</c:choose>
  	</div>
  	</center>
  </body>
</html>
