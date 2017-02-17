<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>添加分类</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.5.1.js"></script>
	<script type="text/javascript">
		function checkName() {
			if(!$("#cname").val()) {
				alert("分类名不能为空！");
				 return false;
			}
			if(!$("#desc").val()) {
				alert("分类描述不能为空！");
				return false;
			}
			return true;
			
		}
		
		function addBtn(){
			if(checkName()){
					var name = $("#cname").val();
			$.ajax(
					{
						type:"post",
						url:"${pageContext.request.contextPath}/category/findByCname.action",
						data:"name="+name,
						dataType:"text",
						success:proName
					}	
				)
				
			}
			
		}
		function proName(msg) {
			if(msg == "error"){
					alert("该分类名已存在！");
			}else{
					$("#form").submit();
			}
		}
		
		
		
	
	</script>
<style type="text/css">
	body {background: rgb(254,238,189);}
</style>
  </head>
  
  <body>
    <h3>添加1级分类</h3>
    <h1></h1>
    <form id="form" action="${pageContext.request.contextPath}/category/doaddI.action" method="post">
    	<input type="hidden" name="method" value="addOneLevel"/>
    	分类名称：<input type="text" name="cname" id="cname" /><br/>
    	分类描述：<textarea rows="5" cols="50" name="description" id="desc" ></textarea><br/>
    	<input type="button" value="添加一级分类" onclick="addBtn()"/>
    	<input type="button" value="返回" onclick="history.go(-1)"/>
    </form>
  </body>
</html>
