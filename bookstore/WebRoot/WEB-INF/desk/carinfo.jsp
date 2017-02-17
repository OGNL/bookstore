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
    
    <title>My JSP 'carinfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script type="text/javascript" src="./js/jquery-1.8.3.js"></script>
	
	<style type="text/css">
	.price_t{
	  color: #c30;
       font-weight: bold;
         padding-right: 10px;
          font-family: Arial;
          font-size: 15pt;
	}
	.subtotal{
	color: #c30;
    font-weight: bold;
    padding-right: 10px;
    font-family: Arial;
	}
	</style>
	
	
	<script type="text/javascript">
	function sum () {
		var total = 0;
		$(".subtotal").each(function() {
			total += Number($(this).text());
		});
		$("#total").text((total).toFixed(1));
	}
	function checkNum(id,uid){
		var num= $("#"+id).val();
		var reg=/^[0-9]{1,}$/;
		if(!reg.test(num)){
			alert("只能是数字！");	
			 $("#"+id).val("1");
			var price=$("#A"+id).val();
		    
			$("#subtotal"+id).text((price*1).toFixed(1));
			sum ();
		}
		
		$.ajax(
			{
				type:"post",
				url:"${pageContext.request.contextPath}/car/checkjia.action",
				data:"bid="+id+"&num="+num+"&uid="+uid,
				async:false,
				dataType:"text",
				success:function (resData)
				{
					if(resData!=""){
						alert("库存不足！");
						$("#pluse"+id).attr("disabled",true);
						$("#"+id).val(resData);
					}
					
				}
			}
		);
		
		if(num=="0"){
			if(window.confirm("确定删除该图书？")){
				location.href="${pageContext.request.contextPath}/car/dodeletecar.action?cartitemID="+carid+"&loginname="+'${loginuser.loginname}';
			}else{
				var price=$("#A"+id).val();
				$("#"+id).val("1");
				$("#subtotal"+id).text((price*1).toFixed(1));
			sum ();
			}
		}
		
		else{
			var price=$("#A"+id).val();
		    var numnew=$("#"+id).val();
			$("#subtotal"+id).text((price*numnew).toFixed(1));
			sum ();
		}
		
	}
	
	function jian(id,carid){
		
		if($("#pluse"+id).attr("disabled",true)){
			$("#pluse"+id).attr("disabled",false);
		}
		
		var checkone=document.getElementById(carid+"check");
		var num= $("#"+id).val();
		document.getElementById(id).value=num-1;
		var price=$("#A"+id).val();
	    var numnew=$("#"+id).val();
	     if(numnew=="0"){
	    	numnew="1";
	    }
	    
	    if(checkone.checked){
	    $("#subtotal"+id).text((price*numnew).toFixed(1));
		sum ();
	    }if(checkone.checked==false){
	    $("#subtotal"+id).text((price*numnew).toFixed(1));
	    }
	    
		
		
		
		if(num==1){
			if(window.confirm("确定删除该图书？")){
				location.href="${pageContext.request.contextPath}/car/dodeletecar.action?cartitemID="+carid+"&loginname="+'${user.loginname}';
			}else{
				$("#"+id).val("1");
			}
		}
	}
	function jia(id,carid){
		var num= $("#"+id).val();
		var checkone=document.getElementById(carid+"check");
		var a=0;
		$.ajax(
			{
				type:"post",
				url:"${pageContext.request.contextPath}/car/checkjia.action",
				data:"bid="+id+"&num="+num,
				async:false,
				dataType:"text",
				success:function (resData)
				{
					if(resData!=""){
						alert("库存不足！");
						$("#pluse"+id).attr("disabled",true);
						a=resData;
					}
					
				}
				
			}
		);
		if(a!=0){
			$("#"+id).val(a);
			var price=$("#A"+id).val();
		    var numnew=$("#"+id).val();
			$("#subtotal"+id).text((price*numnew).toFixed(1));
			sum ();
			return false;
		}
		else{
			$("#"+id).val(num-1+2);
			var price=$("#A"+id).val();
		    var numnew=$("#"+id).val();
		    
		     if(checkone.checked){
	    $("#subtotal"+id).text((price*numnew).toFixed(1));
		sum ();
	    }if(checkone.checked==false){
	    $("#subtotal"+id).text((price*numnew).toFixed(1));
	    }
		}
		
	}
	
	function selectall() {
	var all= document.getElementById("selectAll");
	var one=document.getElementsByName("checkbox");
	var subtotals= document.getElementsByName("subtotal");
	 var nums= $(".nums");
	
	
	var total=0;
		if(all.checked==true){
		  for(var i=0;i<one.length;i++){
			  one[i].checked=true;
		  }
		  $("#alllabel").text("全不选");
		  
		  for(var i=0;i<nums.length;i++){
		  nums[i].value=1;
		  }
		  for(var i=0;i<subtotals.length;i++){
		 total+=parseFloat(subtotals[i].innerHTML);
		  }
		  $("#total").text((total).toFixed(1));
		  
		}else{
			$("#alllabel").text("全选");
			 for(var i=0;i<nums.length;i++){
		  nums[i].value=0;
		  }
			for(var i=0;i<one.length;i++){
				  one[i].checked=false;
			  }
				$("#total").text("0.0");
		  }
	}
	function changetotal(id,bid){
  var checkone=document.getElementById(id+"check");
  var subtotalone=document.getElementById("subtotal"+bid);
   var total= $("#total").text();
   var num=document.getElementById(id+"num");
	if(checkone.checked){
	
	num.value=1;
	  $("#total").text((parseFloat(total)+parseFloat(subtotalone.innerHTML)).toFixed(1));
	  
	  }else{
	num.value=0;
	   $("#total").text((total-subtotalone.innerHTML).toFixed(1));
	  }
	}	
		/*
		var arr=new Array();
		var idsEle=document.getElementsByName("checkbox");
		for(var i=0;i<idsEle.length;i++)
		{
			var idsEle=idsEle[i];
			if(idEle.checked){
			}
		}*/
	function deletebatch() {
			var arr=new Array();
			var idsEle=document.getElementsByName("checkbox");
			for(var i=0;i<idsEle.length;i++)
			{
				var idEle=idsEle[i];
				if(idEle.checked){
					arr.push(idEle.value);
				}
				
			}if(arr.length==0){
				alert("请选择要删除的图书！");
			}else{
				location.href="${pageContext.request.contextPath}/car/deletebatch.action?ids="+arr+"&loginname="+'${user.loginname}';
			}
	}
		function updatebatch(){
		var checks= document.getElementsByName("checkbox");
		var a=0;
		for(var i=0;i<checks.length;i++){
			if(checks[i].checked){
				a=1;
		   }
		}
		   
		if(a==0){
			alert("请至少选一项");
		}
		else{
		   document.getElementById("myform").submit();
		   }
		}
		
		

	
	</script>


  </head>
  
  <body onload="sum()">
  <div class="container">
	<c:choose >
	 <c:when test="${not empty cars}">
	 <center>
	 <form id="myform" action="${pageContext.request.contextPath }/car/updatebatch.action" method="post"> 
	     <table width="95%" align="center" frame="box" style="border-collapse: collapse; border: 7px solid #EFEAE5" cellspacing="0" height="auto"  rules="rows">
	       <tr align="center" style="height: 40px; background-color: #EFEAE5;border-width: 0px;" >
		<td width="18%" align="left">
			<input id="selectAll" checked="checked"  style="margin-left: 5px;" onclick="selectall()" type="checkbox">
			<label id="alllabel">全选</label>
		</td>
		<td width="42%">图书名称</td>
		<td width="10%">单价</td>
		<td width="10%">数量</td>
		<td width="10%">小计</td>
		<td width="10%">操作</td>
	       </tr>
        <c:forEach var ="car" items="${cars}" varStatus="vs">
           
	<tr align="center" style=" border-top:none; height: 70px;">
	<td align="left">
	   <input name="checkbox" checked="checked"  id="${car.cartitemId }check" onclick="changetotal('${car.cartitemId }','${car.book.bid}')" value="${car.cartitemId }" type="checkbox">
	   <input  type="hidden" class="nums" name="carlist[${vs.index}].num"  id="${car.cartitemId }num"  value="1" >
	</td>
	<td align="left">
		<a class="linkImage" href="${pageContext.request.contextPath}/desk/showbook.action?id=${car.book.bid}"><img border="0" width="54" style="margin-left: 100px;" align="top"  src="/headimage/${car.book.image_b}"/></a>
		<a href="${pageContext.request.contextPath}/desk/showbook.action?id=${car.book.bid}">	<input type="hidden"  name="bname"/> ${car.book.bname }</a>
	</td>
		
		<td > 
		<input type="hidden" name="${car.book.currPrice }" id="A${car.book.bid }" value="${car.book.currPrice }"/>&yen; <span style="color: #c30; font-weight: bold;padding-right: 10px;font-family: Arial;">${car.book.currPrice }</span> 
		</td>
		<td > 
		 <input type="button" id="cut${car.book.bid}" style="float:none; width: 25px;height: 25px;" value="-"  onclick="jian('${car.book.bid}','${car.cartitemId}')" >
		 <input type="text"  style="float:none; width: 40px;height: 20px;" value="${car.quantity }" id="${car.book.bid}" name="carlist[${vs.index }].quantity" onchange="checkNum('${car.book.bid}','${user.uid}')"/> 
		 <input type="button" id="pluse${car.book.bid}" style="float:none; width: 25px;height: 25px;" value="+" onclick="jia('${car.book.bid}','${car.cartitemId}')" >
		 <input type="hidden"  name="carlist[${vs.index}].cartitemId" value="${car.cartitemId}">
		<input type="hidden"  name="loginname" value="${user.loginname}">
		<input type="hidden" name="uid" value="${user.uid}">
		</td>
		<td>
			&yen;<span id="subtotal${car.book.bid}" class="subtotal"  name="subtotal"  > ${car.book.currPrice*car.quantity} </span>
		</td>
		<td>
		<a href="${pageContext.request.contextPath}/car/dodeletecar.action?cartitemId=${car.cartitemId}&loginname=${user.loginname}">删除</a>
		</td>
	</tr>
	<hr/>
        </c:forEach>
	<tr style="height:40px; border: 3px solid #E7C9E3;">
		<td >&nbsp;&nbsp;<a  style="cursor:default;" href="javascript:;" onclick="deletebatch()">批量删除</a></td>
		<td  colspan="3"></td>
		<td colspan="2" align="center" >总计：&yen;<span class="price_t" id="total"></span></td>
	</tr>
	
	<tr>
		<td colspan="4"></td>
		
		<td colspan="2" align="center" >
		  <input type="button" onclick="updatebatch()" value="结算"/> 
		</td>
	</tr>
      </table>
      </form>
      
       </center>
	 </c:when>
	 <c:otherwise>
	<img src="${pageContext.request.contextPath}/images/icon_empty.png" /><span style="margin-top:50px;font-size: 24px;font-weight: 900;">您的购物车中暂时没有商品</span>
	
	</c:otherwise>
	</c:choose>     
     
  </div>
  
  
  
  </body>
</html>
