<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
		<head>
				<title>登录</title>
				<meta http-equiv="pragma" content="no-cache">
				<meta http-equiv="cache-control" content="no-cache">
				<meta http-equiv="expires" content="0">
				<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
				<meta http-equiv="description" content="This is my page">
				<meta http-equiv="content-type" content="text/html;charset=utf-8">
				<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
				<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/user/login.css">
				
				<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js">
				</script>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
				<script src="${pageContext.request.contextPath}/js/common.js">
				</script>
				<script type="text/javascript">

$(function() {
		
	$("#sub").click(function() {
		var name = $("#loginname").val();
		var pass = $("#loginpass").val();
		var vcode = $("#checkcode").val();
		if(name==""||pass==""||vcode==""){
			alert("帐号，密码或者验证码不能为空");
		}else{
			$.ajax( {
			type : "post",
			url : "${pageContext.request.contextPath}/user/dologin.action",
			data : "name=" + name + "&pass=" + pass+"&vcode="+vcode,
			dataType : "text",
			success : function(resData) {
				if(resData.trim() == "success"){
					location.href = "${pageContext.request.contextPath}/desk/view.action";
				}else{
					alert(resData);
				}
				
			}
		});
		}
		
	});

})

function _hyz(){
		
		document.getElementById("vCode").src ="${pageContext.request.contextPath }/VerifyCodeServlet?a="+ new Date().getTime();
 		}

function checkname(){
	
	var name = document.getElementById("loginname").value;
	
	if(name==null||name==""){
		document.getElementById("loginnameError").style.display="block";
	}else{
		document.getElementById("loginnameError").style.display="none";
	}
}

function checkpass(){
	var pass = document.getElementById("loginpass").value;
	if(pass==null||pass==""){
		document.getElementById("loginpassError").style.display="block";
	}else{
		document.getElementById("loginpassError").style.display="none";
	}
}

function checkvcode(){
	var code = document.getElementById("checkcode").value;
	if(code==null||code==""){
		document.getElementById("verifyCodeError").style.display="block";	
	}else{
	document.getElementById("verifyCodeError").style.display="none";	
	}
}
			</script>
	</head>
	<body>
		<div class="main">
			<div>
				<div class="imageDiv">
					<img class="img" src="${pageContext.request.contextPath}/images/zj.png">
				</div>
					<div class="login1">
						<div class="login2">
							<div class="loginTopDiv">
								<span class="loginTop">会员登录</span>
									<span> <a href="${pageContext.request.contextPath }/user/regist.action" class="registBtn" style="color: aqua;">立即注册</a> </span>
							</div>
								<div>
									
										<input type="hidden" name="method" value="" />
											<table>
												<tr>
													<td width="50"></td>
													<td>
																						<%--<label class="error" id="msg">
																								用户名或密码错误
																						</label>--%>
													</td>
												</tr>
												<tr>
													<td width="50">
														用户名
												</td>
													<td>
														<input class="input" type="text" name="loginname" id="loginname" onblur="checkname()" />
													</td>
												</tr>
												<tr>
													<td height="20">
														&nbsp;
													</td>
													<td>
														<label id="loginnameError" class="error" style="display: none">
															用户名不能为空
														</label>
													</td>
												</tr>
												<tr>
													<td>
														密 码
													</td>
													<td>
														<input class="input" type="password" name="loginpass" id="loginpass" onblur="checkpass()" />
													</td>
												</tr>
												<tr>
													<td height="20">
														&nbsp;
													</td>
													<td>
														<label id="loginpassError" class="error" style="display: none">
															密码不能为空
														</label>
													</td>
												</tr>
												<tr>
													<td>
														验证码
													</td>
													<td>
														<input class="checkcode" required="required" name="checkcode" id="checkcode" type="text"  onblur="checkvcode()"  />
														<%--<img id="vCode" src="" />
														<a id="verifyCode">换张图</a>
														--%>
														<img id="vCode" src="${pageContext.request.contextPath }/VerifyCodeServlet" >
														<a id="verifyCode" href="javascript:_hyz()">换一张</a>
													</td>
												</tr>
												<tr>
													<td height="20px">
														&nbsp;
													</td>
													<td>
														<label id="verifyCodeError" id="vcode" class="error" style="display: none">
															验证码不能为空！
														</label>
													</td>
												</tr>
												<tr>
													<td>
														&nbsp;
													</td>
													<td align="left">
														<%--<input type="image" id="submit" src="<c:url value='/images/login1.jpg'/>" class="loginBtn" />
														--%>
														<input type="image" value="提交" src="${pageContext.request.contextPath}/images/login1.jpg" id="sub" >
													</td>
												</tr>
																</table>
														
												</div>
										</div>
								</div>
						</div>
				</div>
		</body>
</html>
