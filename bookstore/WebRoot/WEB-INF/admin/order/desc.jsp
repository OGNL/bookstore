<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>订单详情</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/order/desc.css">
	<script type="text/javascript">
		function cancelBtn(status,oid){
  			if(status == "3" ){
  				alert("该订单已发货,无法取消！");
  			}
  			else if(status == "4"){
  				alert("该订单已交易成功，无法取消！");
  			}
  			else if(status == "5"){
  				alert("该订单已被取消！");
  			}
  			else{
  				alert("取消成功！")
				location.href = "${pageContext.request.contextPath}/order/update.action?status=5&oid="+oid;  				
  			}
  		}
  		
  		function deliverBtn(status,oid){
  			if(status == "1"){
  				alert("该订单未付款，无法发货！");
  			}
  			else if(status == "3"){
  				alert("该订单已发货！");
  			}
  			else if(status == "5"){
  				alert("该订单已被取消！");
  			}
  			else if(status == "4"){
  				alert("交易已成功!");
  			}
  			else{
  				alert("发货成功！");
  				location.href = "${pageContext.request.contextPath}/order/update.action?status=3&oid="+oid;  			
  			}
  				
  		}
	</script>
  </head>
  
<body>
	<div class="divOrder">
		<span>订单号：${order.oid }
			     订单状态：
			     <c:if test="${order.status eq 1}">(未付款)</c:if>
				 <c:if test="${order.status eq 2}">(已付款)</c:if>
				 <c:if test="${order.status eq 3}">(已发货)</c:if>
				 <c:if test="${order.status eq 4}">(交易成功)</c:if>
				 <c:if test="${order.status eq 5}">(已取消)</c:if>
		　　　    下单时间：${order.ordertime }
		</span>
	</div>
	<div class="divContent">
		<div class="div2">
			<dl>
				<dt>收货人信息</dt>
				<dd>${order.address }${user.loginname}收</dd>
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
					<c:if test="${not empty orderitems}">
						<c:forEach var="oi" items="${orderitems }">
						<tr style="padding-top: 20px; padding-bottom: 20px;">
							<td class="td" width="400px">
								<div class="bookname">
								  <img align="middle" width="70" src="/headimage/${oi.image_b }"/>
								  	${oi.bname }
								</div>
							</td>
							<td class="td" >
								<span>&yen;${oi.currPrice }</span>
							</td>
							<td class="td">
								<span>${oi.quantity }</span>
							</td>
							<td class="td">
								<span>&yen;${oi.subtotal }</span>
							</td>			
						</tr>
						</c:forEach>
					</c:if>
					</table>
				</dd>
			</dl>
		</div>
		<div style="margin: 10px 10px 10px 550px;">
			<span style="font-weight: 900; font-size: 15px;">合计金额：</span>
			<span class="price_t">&yen;${order.total }</span><br/>
			<a href="javascript:;" title="发货" onclick="deliverBtn('${order.status }','${order.oid}')">发&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;货</a><br/>
	  		<a href="javascript:;" title="取消订单" onclick="cancelBtn('${order.status }','${order.oid}')">取&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;消</a><br/>
	  		<a id="confirm" href="javascript:history.go(-1);"><font style="color: aqua;">返回</font></a>
		</div>
	</div>
</body>
</html>

