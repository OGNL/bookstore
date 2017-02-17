<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>订单列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/paper/pager.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/order/list.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/css.css" />

  </head>
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
  
  <body>
<p class="pLink">
  <a href="${pageContext.request.contextPath}/order/show.action?status=1">未付款</a>  | 
  <a href="${pageContext.request.contextPath}/order/show.action?status=2">已付款</a>  |  
  <a href="${pageContext.request.contextPath}/order/show.action?status=3">已发货</a>  | 
  <a href="${pageContext.request.contextPath}/order/show.action?status=4">交易成功</a>  | 
  <a href="${pageContext.request.contextPath}/order/show.action?status=5">已取消</a>
</p>
<div class="divMain">
	<div class="title">
		<div style="margin-top:7px; width: 120% " >
			<span style="margin-left: 0px;">商品信息</span>
			<span style="margin-left: 550px;">金额</span>
			<span style="margin-left: 140px;">订单状态</span>
			<span style="margin-left: 180px;">操作</span>
		</div>
	</div>
	<br/>
	<table align="center" border="0" width="120%" cellpadding="0" cellspacing="0">
	<c:choose>
		<c:when test="${not empty orders}">
			<c:forEach var="o" items="${orders }">
				<tr class="tt">
					<td width="320px">订单号：<a href="${pageContext.request.contextPath}/orderitem/showByoid.action?oid=${o.oid }">${o.oid }</a></td>
					<td width="200px">下单时间：${o.ordertime }</td>
					<td width="178px">&nbsp;</td>
					<td width="205px">&nbsp;</td>
					<td width="50px">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2">
						<c:forEach var="oi" items="${o.orderitemlist }">
							<img border="0" width="70" src="/headimage/${oi.image_b }"/>
						</c:forEach>
					</td>
				<td style="padding-left: 0">
					<span class="price_t">&yen;${o.total }</span>
				</td>
				<td>
					<c:if test="${o.status eq 1}">(未付款)</c:if>
					<c:if test="${o.status eq 2}">(已付款)</c:if>
					<c:if test="${o.status eq 3}">(已发货)</c:if>
					<c:if test="${o.status eq 4}">(交易成功)</c:if>
					<c:if test="${o.status eq 5}">(已取消)</c:if>
				</td>
				<td>
					<a href="${pageContext.request.contextPath}/orderitem/showByoid.action?oid=${o.oid }">查看</a><br/>
					<a href="javascript:;" title="取消订单" onclick="cancelBtn('${o.status}','${o.oid}')">取消</a><br/>
					<a href="javascript:;" title="发货" onclick="deliverBtn('${o.status}','${o.oid}')">发货</a>
				</td>
			</tr>
			</c:forEach>
				<tr>
  				<td colspan="4" align="center" style="padding-left: 400px;">
	  				<a href="${pageContext.request.contextPath }/order/show.action?status=${status}&pageNum=1">首页</a>
	  				<a href="${pageContext.request.contextPath }/order/show.action?status=${status}&pageNum=${curPage - 1}">上一页</a>
	  				第${curPage }页
	  				<a href="${pageContext.request.contextPath }/order/show.action?status=${status}&pageNum=${curPage + 1}">下一页</a>
	  				<a href="${pageContext.request.contextPath }/order/show.action?status=${status}&pageNum=${maxPage}">末页</a>
	  				共${maxPage}页
  				</td>
  			</tr>
	</table>
		</c:when>
		<c:otherwise>
			当前没有订单信息！
		</c:otherwise>
	</c:choose>
	<br/>
</div>
  </body>
</html>
