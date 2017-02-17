<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>管理员登录页面</title>
    
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
		height: 730px;
	}
	
	.top{
		width: 260px;
		height: 45px;
		margin-left: 1px;
		float: left;
	}
	
	.middle{
		width: 1300px;
		height: 2px;
		float: left;
	}
	
	.bottom{
		width: 350px;
		height: 100px;
		margin-left: 5px;
		float: left;
	
	}
	</style>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
	<script type="text/javascript">
		function checkNameAndPwd() {
			if(!$("#adminname").val()) {
				alert("管理员名称不能为空！");
				return false;
			}
			if(!$("#adminpwd").val()) {
				alert("管理员密码不能为空！");
				return false;
			}
			return true ;
		}
		
		function check(){
			if(checkNameAndPwd()){
				var name = $("#adminname").val();
				var pwd = $("#adminpwd").val();
					$.ajax(
					{
						type:"post",
						url:"${pageContext.request.contextPath}/admin/dologin.action",
						data:"name="+name+"&pwd="+pwd,
						dataType:"text",
						success:proName
					}	
				)
			}
		}
		
		
		function proName(msg){
				if(msg == "error"){
					alert("用户名或密码错误！");
				}else{
					$("#form1").submit();
				}
		
		}
		
	
	</script>
  </head>
  
  <body>
  <center>
 	 <div class="container">
		<div class="top">
			<h1>管理员登录页面</h1>
		</div>
		<div class="middle"><hr/></div>
		<div class="bottom">
			<form id="form1" action="${pageContext.request.contextPath}/admin/enter.action" method="post" >
				<input type="hidden" name="method" value="login"/>
				<br/>管理员账户：<input type="text" name="adminname" id="adminname"/><br/>
				密　　　码：<input type="password" name="adminpwd" id="adminpwd"/><br/>
				<input type="button" value="进入后台" onclick="check()"/>
			</form>
		</div>
	</div>
	</center>
  </body>
</html>
