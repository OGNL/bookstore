<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>top</title>
    
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
	*{
		margin: 0px;
		padding: 0px;
	}
	a {
		text-transform:none;
		text-decoration:none;
		color: #ffffff;
		font-weight: 900;
	} 
	a:hover {
		text-decoration:underline;
	}
	.container{
		width: 1300px;
		height: 730px;
		background-color: white;
	}
	.top{
		width: 1300px;
		height: 90px;
		background-color: #15B69A;
	}
	.bottom{
		width: 1300px;
		height: 640px;
		background-color: white;
	}
	.top_1{
		width: 400px;
		height: 30px;
		color: white;
		font-size: 18px;
		float: left;
		margin-top: 10px;
	}
	
	.top_2{
		width: 500px;
		height: 30px;
		color: white;
		font-size: 18px;
		margin-left:50px;
		float: left;
		margin-top: 10px;	
		
		}
		.first{
			width:1297px;
			height:800px;
			float: left;
		}
		.second{
			margin:3px;
			text-align:center;
			line-height:40px;
			width:186px;
			height:100px;
			color:white;
			float:left;
			background-color: #15B69A;
			
		}
		.third{
				border-top:1px solid white;
				width: 50px;
				height:40px;
				float:left;
				background-color:#15B69A;
				
			}
			.third01{
				width:136px;
				float: left;
				border-top:1px solid white;
				text-align: left;
				text-indent: 10px;
				background-color:#15B69A;
				
			}
			.fourth{
				height:40px;
				width:186px;
				float:left;
				font-size: 10px;
				border-top: 1px solid white;
				background-color:#EAFFFA;
				color:black;
			}
			
			.fifth{
				border:0px;
				height:700px;
				width: 1110px;
				text-align: center;
				letter-spacing: 3px;
				font-size: 20px;
				position:absolute;
			}
	input {
		width: 300px;
		height: 30px;
		border-style:solid;
		margin:0px;
		border-color: #15B69A;
	}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
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
		function showsecondbooks(id){
			document.getElementById("iframe").src="${pageContext.request.contextPath}/desk/showbysome.action?id="+id;
		}
		function changecartpage(){
			document.getElementById("iframe").src="${pageContext.request.contextPath}/car/showcars.action?loginname=${user.loginname}";
		}
		function changepwd(){
			document.getElementById("iframe").src="${pageContext.request.contextPath}/user/pwd.action";
		}
		
		function changeOrder(){
			document.getElementById("iframe").src="${pageContext.request.contextPath}/order/showByUid.action";
		}
		
		function uppersearch(){
			var bname=document.getElementById("bname").value;
			document.getElementById("iframe").src="${pageContext.request.contextPath}/desk/showsearch.action?name="+bname;
		}
		function gosearch(){
			document.getElementById("iframe").src="${pageContext.request.contextPath}/desk/gosearch.action";
		}
		$(
				function(){
					$("#exit").click(
							function(){
								if(confirm("确定要退出吗？")){
									$("#exit").attr("href","${pageContext.request.contextPath }/user/login.action");
								}
							}
					)
					$("#login").click(
							function(){
								if('${user.loginname}' == null || '${user.loginname}' == ""){
									$("#login").attr("href","${pageContext.request.contextPath }/user/login.action");
								}else{
									alert("用户已登陆！");
								}
							}
					)
					$("#regist").click(
							function(){
								if('${user.loginname}' == null ||'${user.loginname}' == ""){
									$("#regist").attr("href","${pageContext.request.contextPath }/user/regist.action");
								}else{
									if(confirm("当前有用户登陆，需要注册新帐号吗？")){
									$("#regist").attr("href","${pageContext.request.contextPath }/user/regist.action");
									}
								}
							}
					)
				}
			)
			
			function showMenu(){
				if('${user.loginname}' == null ||	'${user.loginname}' == ""){
					$("#menu").hide();
				}else{
						$("#menu").show();
				}
			
			}
	</script>
  </head>
  
  <body onload="showMenu()">
	<center>
	  <div class="container">
			<div class="top" >
				<h1 style="color: white;">网博网上书城系统</h1>
				
					<div class="top_1">
						网博会员：${user.loginname}&nbsp;&nbsp;
						<a href="javascript:;" id="login"">登陆</a>|
						<a href="javascript:;" id="regist" >注册</a>
						
					</div>
					<div class="top_2" id="menu">
						<a href="javascript:;"  onclick="changecartpage()">我的购物车</a>&nbsp;|&nbsp;
						<a href="javascript:;" onclick="changeOrder()">我的网博订单</a>&nbsp;|&nbsp;
						<a href="javascript:;"  onclick="changepwd()">修改密码</a>&nbsp;|&nbsp;
						<a href="javascript:;" id="exit">退出</a>
					</div>
		</div>
		<div class="first">	
		
		<div class="second">
		<div style="position: absolute;margin-left: 500px;" >
		<input type="text" id="bname" name="bname"/></div>
		<a href="javascript:;" onclick="gosearch()"><font style="margin-left: 820px;color:black;position: absolute;font-size: 10">高级搜索</font></a>
		<div style="margin-left: 820px;"><a href="javascript:;" onclick="uppersearch()"><img  src="${pageContext.request.contextPath}/images/desk/btn.bmp"/></a></div>
		<h3>网博网上书城</h3>
		<c:forEach var="list" items="${cats}">
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
		
		<iframe id="iframe" class="fifth" scrolling="no">
		</iframe>
		
	</div>
			
		</div>
	</center>
  </body>
</html>
