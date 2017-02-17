<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>修改分类</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
	<script type="text/javascript">
		function checkForm() {
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
		
		function showName(){
			$.ajax(
						{
							type:"post",
							url:"${pageContext.request.contextPath}/category/findCategoryI.action",
							dataType:"json",
							success:function(cats){
												for(var i in cats){
														$("#pid").append("<option value="+cats[i].cid+">"+cats[i].cname+"</option>");
												}
												
													/* 	$("#pid option[text='${catVo.pname}]'").attr("selected", "selected"); */
															$("#pid option").each(
																	function(){
																		if($(this).text() == '${catVo.pname}'){
																			$(this).attr("selected", true);
																		}
																	}
															)
											}
							}
						)
		}
		
	
			
				
				
						
	
	
	</script>
<style type="text/css">
	body {background: rgb(254,238,189);}
</style>
  </head>
  
  <body onload="showName()">
    <h3>修改2级分类</h3>
    <h1></h1>
    <form action="${pageContext.request.contextPath}/category/doupdateII.action" method="post" onsubmit="return checkForm()">
    	<input type="hidden" name="cid" value="${catVo.id}">
    	<%-- <input type="text"  readonly="readonly" value="${catVo.pname }"><br/> --%>
    	一级分类：<select id="pid" name="pid" ></select><br/>
    	分类名称：<input type="text" name="cname" id="cname" value="${catVo.cname}"  readonly="readonly"/><br/>
    	分类描述：<textarea rows="5" cols="50" name="description" id="desc">${catVo.cdes}</textarea><br/>
    	<input type="submit" value="修改二级分类"/>
    	<input type="button" value="返回" onclick="history.go(-1)"/>
    </form>
  </body>
</html>
