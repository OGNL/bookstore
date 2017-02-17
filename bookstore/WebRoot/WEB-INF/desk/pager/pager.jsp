<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
	function _go() {
		var pc = document.getElementById("pageCode").value;//获取文本框中的当前页码
		if(!/^[1-9]\d*$/.test(pc)) {//对当前页码进行整数校验
			alert('请输入正确的页码！');
		}else{
			if(pc > '${maxpage}') {//判断当前页码是否大于最大页
			alert('最大${maxpage}页！');
			}else{
				document.getElementById("form").action = "${pageContext.request.contextPath}/desk/showbysome.action?page="+pc;
				document.getElementById("form").submit();
			}
		}
	}
	function gopage(page){
		document.getElementById("form").action = "${pageContext.request.contextPath}/desk/showbysome.action?page="+page;
		document.getElementById("form").submit();
	}
</script>


<div class="divBody">
  <div class="divContent">
    <%--上一页 --%>
		<form id="form" method="post">
			<input type="hidden" name="id" value="${id}"/>
			<input type="hidden" name="bname" value="${bname}"/>
			<input type="hidden" name="author" value="${author}"/>
			<input type="hidden" name="press" value="${press}"/>
			<input type="hidden" name="name" value="${sname}"/>
		</form>
        <a href="javascript:gopage(1);" class="aBtn bold">首页</a>
        <a href="javascript:gopage(${page-1});" class="aBtn bold">上一页</a>

    
    <%-- 计算begin和end --%>
      <%-- 如果总页数<=6，那么显示所有页码，即begin=1 end=${pb.tp} --%>
        <%-- 设置begin=当前页码-2，end=当前页码+3 --%>
          <%-- 如果begin<1，那么让begin=1 end=6 --%>
          <%-- 如果end>最大页，那么begin=最大页-5 end=最大页 --%>

    
    <%-- 显示页码列表 --%>
  <c:choose>
    <c:when test="${maxpage<=6}">
    <c:forEach var="pag" begin="1" end="${maxpage}" >
	<a href="javascript:gopage(${pag});" class="aBtn">${pag}</a>	
    </c:forEach>
    </c:when>
    
   <c:when test="${page<=3}">
   	<c:if test="${maxpage>7}">
  		 <c:forEach var="pag" begin="1" end="6">
			<a href="javascript:gopage(${pag});" class="aBtn">${pag}</a>
  		 </c:forEach>
   		<span class="spanApostrophe">...</span>
   	</c:if>
   </c:when>
   
   <c:when test="${page>3}">
   	<c:if test="${page+3>=maxpage}">
   		<span class="spanApostrophe">...</span>
   		<c:forEach var="pag" begin="${page-2}" end="${maxpage}">
   			<a href="javascript:gopage(${pag});" class="aBtn">${pag}</a>
  		</c:forEach>
  	</c:if>
   </c:when>
   
   
   <c:when test="${page>3}">
   <c:if test="${page+3<maxpage}">
   		<span class="spanApostrophe">...</span>
   			<c:forEach var="pag" begin="${page-2}" end="${page+3}">
   				<a href="javascript:gopage(${pag});" class="aBtn">${pag}</a>
  			</c:forEach>
   		<span class="spanApostrophe">...</span>
   	</c:if>
   </c:when>
   </c:choose>
     <%--下一页 --%>
        <a href="javascript:gopage(${page+1});" class="aBtn bold">下一页</a> 
        <a href="javascript:gopage(${maxpage});" class="aBtn bold">末页</a> 
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
    <%-- 共N页 到M页 --%>
    <span>共${maxpage}页</span>
    <span>到</span>
    <input type="text" style=" width:30px;" class="inputPageCode" id="pageCode" value="1"/>
    <span>页</span>:
    <a href="javascript:_go();" class="aSubmit">确定</a>
  </div>
</div>