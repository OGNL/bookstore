<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
     
    <title>注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/css.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/user/regist.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
	<script src="${pageContext.request.contextPath}/js/common.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/user/regist.js"></script>
	
	<script type="text/javascript">
	var a=0;
	var b=0;
	var c=0;
	var d=0;
	var e=0;
	function checkname(){
		var name = $("#loginname").val();
		var re = /^[0-9 a-z A-Z]{3,17}$/;
		if(name==""){
			a=0;
			document.getElementById("nologinname").style.display="none";
			document.getElementById("loginnamehad").style.display="none";
			document.getElementById("loginnamelength").style.display="none";
			document.getElementById("loginnameError").style.display="block";
			
		}else{
			
			if(!re.test(name)){
			document.getElementById("nologinname").style.display="none";
			document.getElementById("loginnamehad").style.display="none";
			document.getElementById("loginnameError").style.display="none";
			document.getElementById("loginnamelength").style.display="block";
			}else{
				$.ajax( {
			type : "post",
			url : "${pageContext.request.contextPath}/user/docheckname.action",
			data : "name=" + name ,
			dataType : "text",
			success : function(resData) {
				 
				if(resData=="用户已存在"){
				a=0;
				document.getElementById("nologinname").style.display="none";
				document.getElementById("loginnameError").style.display="none";
				document.getElementById("loginnamelength").style.display="none";
				document.getElementById("loginnamehad").style.display="block";
				
			}else{
				a=1;
				document.getElementById("loginnamehad").style.display="none";
				document.getElementById("loginnameError").style.display="none";
				document.getElementById("loginnamelength").style.display="none";
				document.getElementById("nologinname").style.display="block";
				}
			}
		});

		}
			}
			
			
	}
	
	function checkpass(){
		
		var pass = document.getElementById("loginpass").value;	
		
		var re = /^[0-9 a-z A-Z]{3,17}$/;
		if(pass==""){
			b=0;
			document.getElementById("loginpassError").innerHTML="密码不能为空";
			document.getElementById("loginpassError").style.display="block";
		}else{
			if(!re.test(pass)){	
				b=0;
			document.getElementById("loginpassError").innerHTML="长度必须在2~15之间";
			document.getElementById("loginpassError").style.display="block";
			}else{
				b=1;
				document.getElementById("loginpassError").style.display="none";
			}
		}
	}
	
	function checkrepass(){
		
		var pass = document.getElementById("reloginpass").value;
		var repass = document.getElementById("loginpass").value;
		if(pass==""){		
			c=0;
			document.getElementById("reloginpassError").innerHTML="密码不能为空";
			document.getElementById("reloginpassError").style.display="block";
		}else{
			if(pass==repass){
				c=1;
				document.getElementById("reloginpassError").style.display="none";
			}else{
				c=0;
				document.getElementById("reloginpassError").innerHTML="请输入正确的重复密码";
				document.getElementById("reloginpassError").style.display="block";
				
			}
		}
	}
	
	
	function checkemail(){
		var re= /^[0-9 a-z A-Z]{3,17}@[0-9 a-z A-Z]{2,10}(.com)$/;
		var email = document.getElementById("email").value;
		if(email==""){
			d=0;
			document.getElementById("emailError").innerHTML="邮箱不能为空";
			document.getElementById("emailError").style.display="block";
		}else{
			if(!re.test(email)){
			d=0;
			document.getElementById("emailError").innerHTML="邮箱格式错误";
			document.getElementById("emailError").style.display="block";
			}else{
				d=1;
				document.getElementById("emailError").style.display="none";
			}
		}
	}
	
	function _hyz(){
		
		document.getElementById("vCode").src ="${pageContext.request.contextPath }/VerifyCodeServlet?a="+ new Date().getTime();
 		}
	
	function checkvcode(){
		var code = document.getElementById("checkcode").value;
		if(code==""){
			e=0;
			document.getElementById("verifyCodeError").style.display="block";
		}else{	
			e=1;
			document.getElementById("verifyCodeError").style.display="none";
		}
	}
	

	
$(function() {
		
	$("#sub").click(function() {
		var vcode = $("#checkcode").val();
		if(a==1&&b==1&&c==1&&d==1&&e==1){
			$.ajax( {
			type : "post",
			url : "${pageContext.request.contextPath}/user/docheckcode.action",
			data : "vcode="+vcode,
			dataType : "text",
			success : function(resData) {
				
				if(resData=="验证码正确"){
					alert("注册成功！");
					document.getElementById("mit").submit();
				}else{
					alert(resData);
				}
			}
		});
			
		}else{
			alert("请填写正确的信息");
		}
		
	});

})
	</script>
  </head>
  
  <body>
<div class="divBody">
  <div class="divTitle">
    <span class="spanTitle">新用户注册</span>
  </div>
  <div class="divCenter">
    <form action="${pageContext.request.contextPath}/user/doregist.action" id="mit" method="post">
    <input type="hidden" name="method" value=""/>
    <table>
      <tr>
        <td class="tdLabel">用户名：</td>
        <td class="tdInput">
          <input type="text" name="loginname" id="loginname" class="input" onblur="checkname()"/>
        </td>
        <td class="tdError">
          <label class="labelError" id="loginnameError" style="display: none;">用户名不能为空！</label>
          <label class="labelError" id="loginnamehad" style="display: none;">该用户已存在</label>
          <label class="labelError" id="loginnamelength" style="display: none;">长度必须在2~15之间</label>
          <label  id="nologinname" style="display: none;">该用户可用</label>
        </td>
      </tr>
      <tr>
        <td class="tdLabel">登录密码：</td>
        <td class="tdInput">
          <input type="password" name="loginpass" id="loginpass" class="input" onblur="checkpass()"/>
        </td>
        <td class="tdError">
          <label class="labelError" id="loginpassError" style="display: none">密码不能为空</label>
        </td>
      </tr>
      <tr>
        <td class="tdLabel">确认密码：</td>
        <td class="tdInput">
          <input type="password" name="reloginpass" id="reloginpass" class="input"  onblur="checkrepass()"/>
        </td>
        <td class="tdError">
          <label class="labelError" id="reloginpassError" style="display: none">密码不能为空</label>
        </td>
      </tr>
      <tr>
        <td class="tdLabel">Email：</td>
        <td class="tdInput">
          <input type="text" name="email" id="email" class="input" onblur="checkemail()"/>
        </td>
        <td class="tdError">
          <label class="labelError" id="emailError" style="display: none">邮箱不能为空</label>
        </td>
      </tr>
      <tr>
        <td class="tdLabel">图形验证码：</td>
        <td class="tdInput">
          <input required="required" name="checkcode" id="checkcode" type="text"  onblur="checkvcode()"  class="input" value=""/>
        </td>
        <td class="tdError">
          <label class="labelError" id="verifyCodeError" style="display: none">验证码不能为空</label>
        </td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>
          <span class="verifyCodeImg"><img id="vCode" width="100" src="${pageContext.request.contextPath }/VerifyCodeServlet" /></span>
        </td>
        <td><a id="verifyCode" href="javascript:_hyz()">换一张</a></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>
          <img src="${pageContext.request.contextPath}/images/regist1.jpg" id="sub" />
        </td>
        <td>&nbsp;</td>
      </tr>
    </table>
    </form>
  </div>
</div>
  </body>
</html>
	