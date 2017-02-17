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
    
    <title>My JSP 'orders.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/paper/pager.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/order/list.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/css.css" />
    <script type="text/javascript">
  		function cancelBtn(status,id){
  			if(status == 1){
  				location.href = "${pageContext.request.contextPath}/order/doupdate.action?status=5&id="+id;  	
  			}
  			else{
				alert("该状态下无法无法取消！");		
  			}
  		}
  		
  		function okBtn(status,id){
  			if(status == 3){
  				location.href = "${pageContext.request.contextPath}/order/doupdate.action?status=4&id="+id;  	
  				
  			}
  			else{
  				alert("该状态下无法无法收货！");
  			}
  				
  		}
  		
  		function payBtn(status,id){
  			if(status == 1){
  				location.href = "${pageContext.request.contextPath}/order/pay.action?id="+id;
  			}else{
  				alert("该状态下无法支付!");
  			}
  			
  		}
  </script>

  </head>
  
  <body>
<div class="divMain">
	<div class="title">
		<div style="margin-top:7px;">
			<span style="margin-left: 50px;">商品信息</span>
			<span style="margin-left: 405px;">金额</span>
			<span style="margin-left: 130px;">订单状态</span>
			<span style="margin-left: 120px;">操作</span>
		</div>
	</div>
	<br/>
	<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
		<c:choose>
		<c:when test="${not empty ord}">
			<c:forEach var="o" items="${ord }">
				<tr class="tt">
			<td width="320px">订单号：<a href="${pageContext.request.contextPath}/orderitem/showByOid.action?oid=${o.oid }">${o.oid }</a></td>
			<td width="200px">下单时间：${o.ordertime }</td>
			<td width="178px">&nbsp;</td>
			<td width="150px">&nbsp;</td>
			<td width="90px">&nbsp;</td>
		</tr>
		<tr  >
			<td colspan="2">
				<c:forEach var="oo" items="${o.orderitemlist }" >
				
						<img border="0" width="70" src="/headimage/${oo.image_b }"/>
				
				</c:forEach>
			</td>
			<td style="padding-left: 0">
				<span class="price_t">&yen;${o.total }</span>
			</td>
			<td>
				<c:if test="${o.status eq 1}">待付款</c:if>
				<c:if test="${o.status eq 2}">待发货</c:if>
				<c:if test="${o.status eq 3}">待收货</c:if>
				<c:if test="${o.status eq 4}">交易成功</c:if>
				<c:if test="${o.status eq 5}">已取消</c:if>
			</td>
			<td >
				<a href="${pageContext.request.contextPath}/orderitem/showByOid.action?oid=${o.oid }">查看</a><br/>
				<a href="javascript:;"  onclick="payBtn('${o.status }','${o.oid }')">支付</a><br/>
				<a href="javascript:;"  onclick="cancelBtn('${o.status }','${o.oid }')">取消</a><br/>
				<a href="javascript:;"  onclick="okBtn('${o.status }','${o.oid }')">确认收货</a><br/>
			</td>
		</tr>
			</c:forEach>
					<tr>
  			<td colspan="5" align="center" >
  				<a href="${pageContext.request.contextPath }/order/showByUid.action?&pageNum=1">首页</a>
  				<a href="${pageContext.request.contextPath }/order/showByUid.action?&pageNum=${curPage - 1}">上一页</a>
  				第${curPage }页
  				<a href="${pageContext.request.contextPath }/order/showByUid.action?&pageNum=${curPage + 1}">下一页</a>
  				<a href="${pageContext.request.contextPath }/order/showByUid.action?&pageNum=${maxPage}">末页</a>
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
