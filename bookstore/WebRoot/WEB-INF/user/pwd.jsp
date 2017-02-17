<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>pwd.jsp</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login&register.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
	<script type="text/javascript">

function checkoldpassword(){
	var password= $("#oldpassword").val();
	var re=/^[0-9 a-z A-Z]{6,17}$/;
	if(password.trim()==""){
		$("#oldpasswordError").text("密码不能为空");
		showError($ ("#oldpasswordError"));
		return false;
	}$.ajax(
		{
			type:"post",
			url:"${pageContext.request.contextPath}/user/checkpassword.action",
		    data:"loginpass="+password+"&oldpass="+'${user.loginpass}',
			dataType:"text",
			success:function(resData)
			{
				if(resData.trim()!=""){
					text="原密码错误";
					$("#oldpasswordError").text(text);
					showError($ ("#oldpasswordError"));
					return false;
				}
			}
		}
			
	);
	$("#oldpasswordError").text("");
		showError($ ("#oldpasswordError"));
		return true;
	
}

function checkpassword(){
	var password= $("#newpassword").val();
	var re=/^[0-9 a-z A-Z]{6,17}$/;
	if(password.trim()==""){
		$("#newpasswordError").text("密码不能为空");
		showError($ ("#newpasswordError"));
		return false;
	}else if(!re.test(password)){
		$("#newpasswordError").text("密码只能是6-17位数字、大小写字母");
		showError($ ("#newpasswordError"));
		return false;
	}else{
		$("#newpasswordError").text("");
		showError($ ("#newpasswordError"));
		return true;
	}
	
}

function checkconfirmpwd(){
	var password= $("#confirmpwd").val();
	var password2= $("#newpassword").val();
	
	if(password.trim()==""){
		$("#confirmpwdError").text("确认密码不能为空");
		showError($ ("#confirmpwdError"));
		return false;
	}else if(password!=password2){
		$("#confirmpwdError").text("两次密码不一致！");
		showError($ ("#confirmpwdError"));
		return false;
	}else{
		$("#confirmpwdError").text("");
		showError($ ("#confirmpwdError"));
		return true;
	}
	
}

function checkcode(){
	var code=$("#code").val();
		if(code.trim()==""){
		$("#codeError").text("验证码不能为空");
		showError($ ("#codeError"));
		return false;
	}else{
				$.ajax(
    		{
    			type:"post",
    			url:"${pageContext.request.contextPath}/user/docheckcode.action",
    		    data:"vcode="+code ,
    			dataType:"text",
    			success:function(resData)
    			{
    				if(resData.trim()!="验证码正确"){
    					$("#codeError").text("验证码错误！");
    					showError($ ("#codeError"));
    					return false;
    				}
    			}
    		}
    	);
	
	}
    
		$("#codeError").text("");
	    showError($ ("#codeError"));
		return true;
}



function showError(ele){
    var text=ele.text();
	if(text!=""){
		ele.css("display","block");
	} else{
		ele.css("display","none");
	}
    
}

function checkform(){
		
	if(checkoldpassword()&checkpassword()&checkconfirmpwd()&checkcode()){
		
	var pass=$("#newpassword").val();
		document.getElementById("registerform").action="${pageContext.request.contextPath }/user/dochangepwd.action";
	    if( window.confirm("请重新登录")){
	    	document.getElementById("registerform").submit();
	    }
		
	}
}

function _hyz() {
	$("#imgverifyCode").attr("src", "/bookstore/VerifyCodeServlet?a=" + new Date().getTime());
}

</script>

  </head>
  
  <body>
   <div class="container">
      <div  class="divTitle">
       <center><span class="spanTitle" >修改密码</span></center>
      </div>
      <div style="width: 880px;height: 500px; border-top-width:0px; padding-top:70px; margin-left: 250px;">
      	<div class="lefttags">
  		  原密码：<br/><br/>
  		  新密码：<br/><br/>
  		  确认密码：<br/><br/>
  		  验证码：<br/><br/>
  		</div>
      
      <div class="rightinputs">
      <form id="registerform" method="post" target="_top">
           <input name="loginname" value="${user.loginname}" style="display: none;">
      
          <input type="password" id="oldpassword"  placeHolder="请输入原密码" onblur="checkoldpassword()" >
                      <label class="ErrorClass" id="oldpasswordError">  </label><br/><br/>
          <input type="password" id="newpassword" name="loginpass" placeHolder="请输入新密码" onblur="checkpassword()">
                      <label class="ErrorClass" id="newpasswordError">  </label><br/><br/>
    	<input type="password" id="confirmpwd"  placeHolder="请输入确认密码" onblur="checkconfirmpwd()">
                        <label class="ErrorClass" id="confirmpwdError">  </label><br/><br/>
    	<input type="text" id="code" name="registercode"  placeHolder="请输入验证码" onblur="checkcode()">
                            <label class="ErrorClass"   id="codeError">  </label><br/><br/>
               <div id="divverifyCode"><img id="imgverifyCode" src="/bookstore/VerifyCodeServlet">
						&nbsp&nbsp<a href="javascript:_hyz()">看不清,换一张</a>
          </div><br/><br/>
      <input type="button" onclick="checkform()" value="修改密码" >
      </form>
      </div>
   </div>
    </div>
       
    
  </body>
</html>
