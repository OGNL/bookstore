<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'turnorder.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <script type="text/javascript">
  	function sum(){
  		var prices = document.getElementsByName("subtotal");
  		var sums = 0;
  		for(var i in prices){
  			if(!isNaN(prices[i].value)){
  				sums  = sums + parseInt(prices[i].value);
  			}
  			
  		}
  		document.getElementById("totals").innerHTML = "总计&yen;"+sums;	
  		document.getElementById("total").value = sums;
  	}
  	
  	function checkAddress(){
  		var address = document.getElementById("address").value;
  		if(address == ""){
  			alert("请输入收货地址！");
  			return false;
  		}
  		return true;
  	}
  
  
  </script>
  <body onload="sum()">
  <div class="container">
	<c:choose>
	 <c:when test="${not empty cars}">
	 <center>
	 <form id="myform" action="${pageContext.request.contextPath }/order/doaddorder.action" method="post" onsubmit="return checkAddress()"> 
	     <table width="95%" align="center" frame="box" style="border-collapse: collapse; border: 7px solid #EFEAE5" cellspacing="0" height="auto"  rules="rows">
	       <tr align="center" style="height: 40px; background-color: #EFEAE5;border-width: 0px;" >
		<td width="18%" align="left">
			<label id="alllabel">&nbsp;生成订单</label>
		</td>
			<td width="42%">图书名称</td>
			<td width="10%">单价</td>
			<td width="10%">数量</td>
			<td width="10%">小计</td>
			
	       </tr>
        <c:forEach var ="car" items="${cars}" varStatus="vs">
           
           <c:if test="${car.num eq  1}">
           
	<tr align="center" style=" border-top:none; height: 70px;">
		<td colspan="2">
		<a class="linkImage" href="${pageContext.request.contextPath}/desk/showbook.action?id=${car.book.bid}"><img border="0" width="54" style="margin-left: 100px;" src="/headimage/${car.book.image_b}"/></a>
		<a href="${pageContext.request.contextPath}/desk/showbook.action?id=${car.book.bid}">${car.book.bname }</a>	
		 <input type="hidden"  name="carlist[${vs.index}].cartitemId" value="${car.cartitemId}">
		<input type="hidden"  name="orderitemlist[${vs.index}].bname"	value="${car.book.bname }"/> 
		<input type="hidden"  name="orderitemlist[${vs.index}].bid"	value="${car.book.bid}"/> 
		<input type="hidden"  name="orderitemlist[${vs.index}].image_b"	value="${car.book.image_b }"/> 
		</td>
		<td > 
		<input type="hidden" name="orderitemlist[${vs.index}].currPrice" value="${car.book.currPrice }"/>&yen; 
		<span style="color: #c30; font-weight: bold;padding-right: 10px;font-family: Arial;">${car.book.currPrice }</span> 
		</td>
		<td > 
		${car.quantity }
		 <input type="hidden"  name="orderitemlist[${vs.index}].quantity" value="${car.quantity }">
		<input type="hidden"  name="loginname" value="${user.loginname}">
		<input type="hidden"  name="uid" value="${user.uid}">
		</td>
		<td>
			<input type="hidden" name="orderitemlist[${vs.index}].subtotal" value="${car.book.currPrice*car.quantity}">
			<input type="hidden" name="subtotal" value="${car.book.currPrice*car.quantity}">
			&yen;<span id="subtotal${car.book.bid}" class="subtotal" style="color: #c30; font-weight: bold;padding-right: 10px;font-family: Arial;"> 
			${car.book.currPrice*car.quantity} </span>
		</td>
		
	</tr>
	<hr/>
	</c:if>
        </c:forEach>
	<tr style="height:40px; border: 3px solid #E7C9E3;">
		<td  colspan="3">
		收货地址:<input type="text" name="address" id="address">
		</td>
		
		<td colspan="2" align="center" ><span class="price_t" id="totals" style="color: #c30; font-weight: bold;padding-right: 10px;font-family: Arial;">
		</span><input type="hidden" id="total" name="total" /></td>
	</tr>
	
	<tr>
		<td colspan="3"></td>
		
		<td colspan="2" align="center" >
		<input type="submit" value="提交订单">
		</td>
	</tr>
      </table>
      </form>
      
       </center>
	 </c:when>
	 <c:otherwise>
	<img src="/bookstore/images/icon_empty.png" /><span style="margin-top:50px;font-size: 24px;font-weight: 900;">您的购物车中暂时没有商品</span>
	
	</c:otherwise>
	</c:choose>     
     
  </div>
    </body>
</html>
