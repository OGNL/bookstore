<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'bookdesc.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="../css/book/jquery.datepick.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/book/addbook.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.datepick.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.datepick-zh-CN.js"></script>
<script type="text/javascript">
$(function () {
	$("#publishtime").datepick({dateFormat:"yy-mm-dd"});
	$("#printtime").datepick({dateFormat:"yy-mm-dd"});
	
	
		$("#btn").addClass("btn1");
		$("#btn").hover(
		function() {
			$("#btn").removeClass("btn1");
			$("#btn").addClass("btn2");
		},
		function() {
			$("#btn").removeClass("btn2");
			$("#btn").addClass("btn1");
		}
	);
		$("#form").submit(
				function (){
				var count = $("#discount").val();
				var price =$("#price").val();
				var publishtime=$("#publishtime").val();
				var printtime=$("#printtime").val();
				var imagew=$("#image_w").val();
				var imageb=$("#image_b").val();
				var picReg=/^[0-9a-zA-Z-_]{1,}((.jpg)|(png))$/;
				if(imagew=="")
					{
						$("#imagewdiv").html("<font color='red' size='2'>大图不能为空！</font>");
						$("#imagewdiv font").fadeOut("slow");
						return false;
				}else if(!picReg.test(imagew)){
						$("#imagewdiv").html("<font color='red' size='2'>大图格式错误！</font>");
						$("#imagewdiv font").fadeOut("slow");
						return false;
				}if(imageb=="")
					{
						$("#imagebdiv").html("<font color='red' size='2'>小图不能为空！</font>");
						$("#imagebdiv font").fadeOut("slow");
						return false;
					}else if(!picReg.test(imageb)){
						$("#imagebdiv").html("<font color='red' size='2'>小图格式错误！</font>");
						$("#imagebdiv font").fadeOut("slow");
						return false;
				}else if(publishtime=="")
				{
					$("#publishtimediv").html("<font color='red' size='2'>出版时间不能为空！</font>");
					$("#publishtimediv font").fadeOut("slow");
					return false;
				}else if(printtime==""){
					$("#printtimediv").html("<font color='red'  size=2>印刷时间不能为空！</font>");
					$("#printtimediv font").fadeOut("slow");
					return false;
				}else if(publishtime<printtime)
					{
						alert("印刷时间必须小于等于出版时间！")
					
						return false;
				
					}else if(pid==""){
						alert("请选择1级分类！");
						return false;
					}else if(flag&&checkprice()&&checkdiscount()&&checkauthor()&&checkpress()&&checkedition()&&checkpagenum()&&checkwordnum()&&checkbooksize()&&checkpaper()&&checkstock()){
						
						var c=price*(count/10);
						$("#currPrice").val(c);
						return true;
					}else{
						return false;
					}
				}	
			);
		
	});
	function loadChildren(id){
		var val=document.getElementById("pid").value;
		if(val=="")
			{
				document.form.cid.length=0;
				var option=new Option("==请选择2级分类==","");
				document.form.cid.options.add(option);
			}
		$.getJSON(
			"${pageContext.request.contextPath}/book/findByPid.action",
			"bookid="+val,
			pro
		);
	}
	function pro(data){
		document.form.cid.length=0;
		for(var i=0;i<data.length;i++)
			{
				var option=new Option(data[i].cname,data[i].cid);
				document.form.cid.options.add(option);
			}
	}
var numReg=/^[1-9][0-9]{0,}([.][1-9][0-9]{0,})?$/;
	var proReg=/^[1-9]([0-9]{1,})?$/;
	
	var flag;
	function checkname(){
				var bname=$("#bname").val();
				
				$.ajax({
								type:"post",
								url:"${pageContext.request.contextPath}/book/testname.action",
								data:"name="+bname,
								dataType:"text",
								success:prodata
							});
				
				
				if(bname.trim()=="")
						{
							$("#bnamediv").html("<font color='red' size='2'>书名不能为空！</font>");
							flag=false;
						}
					}
	
	
	function prodata(data){
		if(data=="111"){
			$("#bnamediv").html("<font color='red'  size=2>书名已经存在！</font>");
			$("#bnamediv font").fadeOut("slow");
			flag=false;
		}else{
			$("#bnamediv").html("<font color='green'  size=2>输入正确！</font>");
			$("#bnamediv font").fadeOut("slow");
			flag=true;
		}
		
	}
	var price;
	function checkprice(){
		 price= $("#price").val();
		if(price.trim()=="")
			{
				$("#pricediv").html("<font color='red' size='2'>定价不能为空！</font>");
				return false;
			}
		if(!numReg.test(price))
			{
				$("#pricediv").html("<font color='red' size='2'>输入的定价为整数！</font>");
				return false;
			}else{
				
				$("#pricediv").html("<font color='green'  size=2>输入正确！</font>");
				$("#pricediv font").fadeOut("slow");
				return true;
			}
	}	
	var count;
	function checkdiscount(){
		var discount=/^([0-9]{1}([.][0-9]{1})?||[1][0])$/;
		count = $("#discount").val();
		if(count.trim()=="")
			{
				$("#discountdiv").html("<font color='red' size='2'>折扣不能为空！</font>");
				return false;
			}
		if(!discount.test(count))
			{
				$("#discountdiv").html("<font color='red' size='2'>输入的折扣为[0-10]之间的整数！</font>");
				return false;
			}else{
				$("#discountdiv").html("<font color='green'  size=2>输入正确！</font>");
				$("#discountdiv font").fadeOut("slow");
				return true;
			}
	}
	function checkauthor(){
		var author = $("#author").val();
		if(author.trim()=="")
			{
				$("#authordiv").html("<font color='red' size='2'>作者不能为空！</font>");
				return false;
			}else{
				$("#authordiv").html("<font color='green'  size=2>输入正确！</font>");
				$("#authordiv font").fadeOut("slow");
				return true;
			}
	}
	function checkpress(){
		var press = $("#press").val();
		if(press.trim()=="")
		{
			$("#pressdiv").html("<font color='red' size='2'>作者不能为空！</font>");
			return false;
		}else{
				$("#pressdiv").html("<font color='green'  size=2>输入正确！</font>");
				$("#pressdiv font").fadeOut("slow");
				return true;
			}
	}
	function checkedition(){
		var edition=$("#edition").val();
		var editionReg=/^[1-9][0-9]?$/;
		if(edition.trim()=="")
		{
			$("#editiondiv").html("<font color='red' size='2'>为空！</font>");
			return false;
		}else if(!editionReg.test(edition))
			{
				$("#editiondiv").html("<font color='red' size='2'>不符！</font>");
				return false;
			}else{
				$("#editiondiv").html("<font color='green'  size=2>正确！</font>");
				$("#editiondiv font").fadeOut("slow");
				return true;
			}
	}
	function checkpagenum(){
		var pageNum=$("#pageNum").val();
		if(pageNum.trim()=="")
		{
			$("#pagenumdiv").html("<font color='red' size='2'>页数不能为空！</font>");
			return false;
		}else if(!proReg.test(pageNum))
			{
				$("#pagenumdiv").html("<font color='red' size='2'>页数必须为数字！</font>");
				return false;
			}else{
				$("#pagenumdiv").html("<font color='green'  size=2>输入正确！</font>");
				$("#pagenumdiv font").fadeOut("slow");
				return true;
			}
	}
	function checkwordnum(){
		var wordNum=$("#wordNum").val();
		if(wordNum.trim()=="")
		{
			$("#wordnumdiv").html("<font color='red' size='2'>字数不能为空！</font>");
			return false;
		}else if(!proReg.test(wordNum))
			{
				$("#wordnumdiv").html("<font color='red' size='2'>字数必须为数字！</font>");
				return false;
			}else{
				$("#wordnumdiv").html("<font color='green'  size=2>输入正确！</font>");
				$("#wordnumdiv font").fadeOut("slow");
				return true;
			}
	}
	function checkbooksize(){
		var booksize=$("#booksize").val();
		if(booksize.trim()=="")
		{
			$("#booksizediv").html("<font color='red' size='2'>开本不能为空！</font>");
			return false;
		}else if(!proReg.test(booksize))
			{
				$("#booksizediv").html("<font color='red' size='2'>开本必须为数字！</font>");
				return false;
			}else{
				$("#booksizediv").html("<font color='green'  size=2>输入正确！</font>");
				$("#booksizediv font").fadeOut("slow");
				return true;
			}
	}
	function checkpaper(){
		var paper=$("#paper").val();
		if(paper.trim()=="")
		{
			$("#paperdiv").html("<font color='red' size='2'>纸张不能为空！</font>");
			return false;
		}else{
				$("#paperdiv").html("<font color='green'  size=2>输入正确！</font>");
				$("#paperdiv font").fadeOut("slow");
				return true;
			}
	}
	function checkstock(){
		var stock=$("#stock").val();
		if(stock=="")
			{
				$("#stockdiv").html("<font color='red' size='2'>库存不能为空！</font>");
				return false;
			}else if(!proReg.test(stock))
				{
					$("#stockdiv").html("<font color='red' size='2'>库存必须为数字！</font>");
					return false;
				}else{
					$("#stockdiv").html("<font color='green'  size=2>输入正确！</font>");
					$("#stockdiv font").fadeOut("slow");
					return true;
				}
	}
/* 	function checkbigpic(){
		var wfile=$("#image_w").val();
		var  ss=wfile.split(".");
		if(ss[1]!='png')
			{
				alert("请输入正确的图片")
			}
		
	}  */
</script>


<style type="text/css">
.btn1 {
	background: url("${pageContext.request.contextPath}/images/book/hong_1_btn.jpg") left top
		no-repeat;
}

.btn2 {
	background: url("${pageContext.request.contextPath}/images/book/hong_2_btn.jpg") left top
		no-repeat;
}


</style>
  </head>
  
  <body>
  <div style="margin-left: 50px;">
   <p style="font-weight: 900; color: red;">${msg }</p>
   <form name="form" id="form" action="${pageContext.request.contextPath}/book/add.action" enctype="multipart/form-data" method="post" >
    <div>
	    <ul>
	    	<li>书名：　<input id="bname" type="text" name="bname" placeholder="例如：Spring实战(第3版)（In Action系列中最畅销的Spring图书）" style="width:500px;" onblur="checkname()"/><div id="bnamediv" style="display: inline;"></div></li>
	    	<li>大图：　<input id="image_w" type="file" name="wfile" onblur="checkbigpic()"/><div id="imagewdiv" style="display: inline;"></div></li>
	    	<li>小图：　<input id="image_b" type="file" name="bfile" onblur="checksmallpic()"/><div id="imagebdiv" style="display: inline;"></div></li>
	    	<li>当前价：<input id="currPrice" type="text" name="currPrice" style="width:80px;"  readonly placeholder="自动生成！"/><div id="currPricediv" style="display: inline;"></div></li>
	    	<li>定价：　<input id="price" type="text" name="price"  style="width:50px;" onblur="checkprice()"/><div id="pricediv" style="display: inline;"></div></li>
	    	<li>折扣：  &nbsp;&nbsp;<input id="discount" type="text" name="discount"  style="width:50px;" placeholder="9.5" onblur="checkdiscount()"/>折<div id="discountdiv" style="display: inline;"></div></li>
	    </ul>
		<hr style="margin-left: 50px; height: 1px; color: #dcdcdc"/>
		<table style="margin-left: 50px;" >
			<tr>
				<td colspan="3">
					作者：　　<input type="text" id="author" name="author" style="width:150px;" onblur="checkauthor()"/><div id="authordiv" style="display: inline;"></div>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					出版社：　<input type="text" name="press" id="press" style="width:200px;" onblur="checkpress()"/><div id="pressdiv" style="display: inline;"></div>
				</td>
			</tr>
			<tr>
				<td colspan="2">出版时间：<input type="text" id="publishtime" name="publishtime" readonly style="width:100px;"/><div id="publishtimediv" style="display: inline;"></div></td>
			<td>库存：　　<input type="text" name="stock" id="stock"  style="width:80px;" onblur="checkstock()"/><div id="stockdiv" style="display: inline;"></div></td>
			</tr>
			
			<tr>
				<td width="170px;">版次：　　<input type="text" name="edition" id="edition"  style="width:40px;" onblur="checkedition()"/><div id="editiondiv" style="display: inline;"></div></td>
				<td width="225px;">页数：　　<input type="text" name="pageNum" id="pageNum"  style="width:50px;" onblur="checkpagenum()"/><div id="pagenumdiv" style="display: inline;"></div></td>
				<td width="250px;">字数：　　<input type="text" name="wordNum" id="wordNum"  style="width:80px;" onblur="checkwordnum()"/><div id="wordnumdiv" style="display: inline;width: 200px;"></div></td>
			</tr>
			<tr>
				<td>印刷时间：<input type="text" name="printtime" id="printtime" readonly style="width:100px;"/><div id="printtimediv" style="display: inline;"></div></td>
				<td>开本：　　<input type="text" name="booksize" id="booksize"  style="width:30px;" onblur="checkbooksize()"/><div id="booksizediv" style="display: inline;"></div></td>
				<td  >纸张:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="paper" id="paper"  style="width:80px;" onblur="checkpaper()"/><div id="paperdiv" style="display: inline;"></div></td>
			</tr>
			<tr >
			<td> </td>
				<td >
				一级分类：<br/><select name="pid" id="pid" onchange="loadChildren(id)">
						<option value="">==请选择1级分类==</option>
			    		<c:forEach items="${catslists}" var="pcat">
			    		<c:if test="${pcat.pid == 0}">
			    			<option id="${pcat.id}" value="${pcat.id}">${pcat.pname}</option>
			    		</c:if>
			    		</c:forEach>
					</select>
				</td>
				<td>
					二级分类：<br/><select name="cid" id="cid">
						<option value="">==请选择2级分类==</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" id="btn" class="btn" value="新书上架" />
				</td>
				<td></td>
				<td></td>
			</tr>
		</table>
	</div>
   </form>
  </div>
  </body>
</html>
