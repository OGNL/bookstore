<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'orderinfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/order/desc.css">

  </head>
  
  <body>
   	<div class="divOrder">
		<span>订单号：${order.oid }
					<c:if test="${order.status eq 1}">（待付款）</c:if>
				<c:if test="${order.status eq 2}">（待发货）</c:if>
				<c:if test="${order.status eq 3}">（待收货）</c:if>
				<c:if test="${order.status eq 4}">（交易成功）</c:if>
				<c:if test="${order.status eq 5}">（已取消）</c:if>
		　　　下单时间：${order.ordertime }</span>
	</div>
	<div class="divContent">
		<div class="div2">
			<dl>
				<dt>收货人信息</dt>
				<dd>${order.address} ${user.loginname}收</dd>
			</dl>
		</div>
		<div class="div2">
			<dl>
				<dt>商品清单</dt>
				<dd>
					<table cellpadding="0" cellspacing="0">
						<tr>
							<th class="tt">商品名称</th>
							<th class="tt" align="left">单价</th>
							<th class="tt" align="left">数量</th>
							<th class="tt" align="left">小计</th>
						</tr>

						<c:choose>
						<c:when test="${not empty orderitems}">
							<c:forEach var="oitem" items="${orderitems}">
						<tr style="padding-top: 20px; padding-bottom: 20px;">
							<td class="td" width="400px">
								<div class="bookname">
								  <img align="middle" width="70" src="/headimage/${oitem.image_b}"/>
								  <a href="${pageContext.request.contextPath}/book/showByBid.action?id=${oitem.bid}">${oitem.bname}</a>
								</div>
							</td>
							<td class="td" >
								<span>&yen;${oitem.currPrice}</span>
							</td>
							<td class="td">
								<span>${oitem.quantity}</span>
							</td>
							<td class="td">
								<span>&yen;${oitem.subtotal}</span>
							</td>			
						</tr>
						</c:forEach>
						</c:when>
						</c:choose>
					</table>
				</dd>
			</dl>
		</div>
		<div style="margin: 10px 10px 10px 550px;">
			<span style="font-weight: 900; font-size: 15px;">合计金额：</span>
			<span class="price_t">&yen;${order.total }</span><br/>

	<%--<a href="<c:url value='/jsps/order/pay.jsp'/>" class="pay"></a><br/>
    <a id="cancel" href="javascript:alert('订单已取消！');">取消订单</a><br/>--%>
	<a id="confirm" href="javascript:history.go(-1);"><font style="color: aqua;">返回</font></a><br/>	
		</div>
	</div>
  </body>
</html>
