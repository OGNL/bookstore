<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showbook.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/pager/pager.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/book/desc.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/book/jquery.datepick.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.datepick.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.datepick-zh-CN.js"></script>
	<script type="text/javascript">

$(function() {
	$("#publishtime").datepick({dateFormat:"yy-mm-dd"});
	$("#printtime").datepick({dateFormat:"yy-mm-dd"});
	$("#box").attr("checked", false);
	$("#formDiv").css("display", "none");
	$("#show").css("display", "");	
	
	// 操作和显示切换
	$("#box").click(function() {
		if($(this).attr("checked")) {
			$("#show").css("display", "none");
			$("#formDiv").css("display", "");
		} else {
			$("#formDiv").css("display", "none");
			$("#show").css("display", "");		
		}
	});
	
	$("#editBtn").addClass("editBtn1");
		$("#editBtn").hover(
		function() {
			$("#editBtn").removeClass("editBtn1");
			$("#editBtn").addClass("editBtn2");
		},
		function() {
			$("#editBtn").removeClass("editBtn2");
			$("#editBtn").addClass("editBtn1");
		}
	);
		$("#delBtn").addClass("delBtn1");
		$("#delBtn").hover(
		function() {
			$("#delBtn").removeClass("delBtn1");
			$("#delBtn").addClass("delBtn2");
		},
		function() {
			$("#delBtn").removeClass("delBtn2");
			$("#delBtn").addClass("delBtn1");
		}
	);
	$("#form").submit(
				function (){
				var count = $("#discount").val();
				var price =$("#price").val();
				var publishtime=$("#publishtime").val();
				var printtime=$("#printtime").val();
				var pid=$("#pid").val();
				var cid=$("#cid").val();
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
				}else if(imageb=="")
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
					}else if(cid==""){
						alert("请选择2级分类！");
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
var numReg=/^[1-9][0-9]{0,}([.][1-9][0-9]{0,})?$/;
	var proReg=/^[1-9]([0-9]{1,})?$/;
	var bname;
	var flag=true;
	function checkname(){
				bname=$("#bname").val();
				var checkname=$("#checkname").val();
				if(bname.trim()=="")
						{
							$("#bnamediv").html("<font color='red' size='2'>帐号不能为空！</font>");
							flag=false;
						}else{
							 if(bname==checkname){
									$("#bnamediv").html("<font color='green' size='2'>输入正确！</font>");
									$("#bnamediv font").fadeOut("slow");
									flag=true;							 
							 }else{
									 $.ajax({
									type:"post",
									url:"${pageContext.request.contextPath}/book/testname.action",
									data:"name="+bname,
									dataType:"text",
									success:prodata
									});
							 }
							
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
				$("#pricediv").html("<font color='red' size='2'>输入的定价为数字！</font>");
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
				$("#discountdiv").html("<font color='red' size='2'>输入的折扣为[0-10]之间的数字！</font>");
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
function loadChildren(){
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
			proda
		);
	}
	function proda(data){
		document.form.cid.length=0;
		for(var i=0;i<data.length;i++)
			{
				var option=new Option(data[i].cname,data[i].cid);
				document.form.cid.options.add(option);
			}
	}
	function deletebook(){
		var id=$("#bid").val();
		if(confirm("确定要删除?"))
			{
				$.ajax({
					type:"post",
					url:"${pageContext.request.contextPath}/book/checkbook.action",
					data:"id="+id,
					dataType:"text",
					success:function(resData){
						if(resData.trim() == "error"){
							alert("用户订单、购物车中存在该图书，无法删除！");
						}else{
							location.href="${pageContext.request.contextPath}/book/delete.action?id="+id;
						}
					}
					
				})
				
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
</script>

<style type="text/css">
.editBtn1 {
	background: url("${pageContext.request.contextPath}/images/book/huang_2_btn.jpg") left top
		no-repeat;
}

.editBtn2 {
	background: url("${pageContext.request.contextPath}/images/book/huang_1_btn.jpg") left top
		no-repeat;
}

.delBtn1 {
	background: url("${pageContext.request.contextPath}/images/book/hong_2_btn.jpg") left top
		no-repeat;
}

.delBtn2 {
	background: url("${pageContext.request.contextPath}/images/book/hong_1_btn.jpg") left top
		no-repeat;
}
</style>
  </head>
  
  <body>
    	<input type="checkbox" id="box"><label for="box">编辑或删除</label>
    <br/>
    <br/>
  <div id="show">
    <div class="sm">${book.bname}</div>
    <img align="top" src="/headimage/${book.image_w}" class="tp" />
    <div id="book" style="float:left;">
	    <ul>
	    	<li>商品编号：${book.bid}</li>
	    	<li>当前价：<span class="price_n">&yen;${book.currPrice}</span></li>
	    	<li>定价：<span style="text-decoration:line-through;">&yen;${book.price}</span>　折扣：<span style="color: #c30;">${book.discount}</span>折</li>
	    </ul>
		<hr style="margin-left: 50px; height: 1px; color: #dcdcdc"/>
		<table class="tab" style="margin-left: 50px;">
			<tr>
				<td colspan="3">
					作者：${book.author}著
				</td>
			</tr>
			<tr>
				<td colspan="3">
					出版社：${book.press}
				</td>
			</tr>
			<tr>
				<td colspan="2">出版时间：${book.publishtime}</td>
				<td>库存：${book.stock}</td>
			</tr>
			<tr>
				<td>版次：${book.edition}</td>
				<td>页数：${book.pageNum}</td>
				<td>字数：${book.wordNum}</td>
			</tr>
			<tr>
				<td width="180">印刷时间：${book.printtime}</td>
				<td>开本：${book.booksize}</td>
				<td>纸张：${book.paper}</td>
			</tr>
		</table>
	</div>
  </div>
  
  
  <div id='formDiv'>
   <div class="sm">&nbsp;</div>
   <form action="${pageContext.request.contextPath}/book/update.action" method="post" enctype="multipart/form-data"  id="form" name="form">
 	<input type="hidden" id="checkname"   value="${book.bname}"/>
   	<input type="hidden" name="bid" id="bid" value="${book.bid}"/>
   	<input type="hidden" name="image_w" value="${book.image_w}"/>
   	<input type="hidden" name="image_b" value="${book.image_b}"/>
    <img align="top" src="/headimage/${book.image_w}" class="tp"/>
    <div style="float:left;">
	    <ul>
	    	<li>商品编号：${book.bid}</li>
	    	<li>书名：　<input id="bname" type="text" name="bname" value="${book.bname}" style="width:500px;" onblur="checkname()"/><div id="bnamediv" style="display: inline;"></div></li>
	    	<li>大图：　<input id="image_w" type="file" name="wfile" /><div id="imagewdiv" style="display: inline;"></div></li>
	    	<li>小图：　<input id="image_b" type="file" name="bfile" /><div id="imagebdiv" style="display: inline;"></div></li>
	    	<li>当前价：<input id="currPrice" type="text" name="currPrice"  style="width:80px;" onblur="checkcurrPrice()" readonly placeholder="自动生成！"/><div id="currPricediv" style="display: inline;"></div></li>
	    	<li>定价：　<input id="price" type="text" name="price" value="${book.price}" style="width:50px;" onblur="checkprice()"/><div id="pricediv" style="display: inline;"></div><br/>
	    	折扣：&nbsp;&nbsp;&nbsp;<input id="discount" type="text" name="discount" value="${book.discount}" style="width:50px;" onblur="checkdiscount()"/>折<div id="discountdiv" style="display: inline;"></div></li>
	    </ul>
		<hr style="margin-left: 50px; height: 1px; color: #dcdcdc"/>
		<table class="tab" style="margin-left: 50px;" >
			<tr>
				<td colspan="3">
					作者：　　<input id="author" type="text" name="author" value="${book.author}" style="width:150px;" onblur="checkauthor()"/><div id="authordiv" style="display: inline;"></div>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					出版社：　<input id="press" type="text" name="press" value="${book.press}" style="width:200px;" onblur="checkpress()"/><div id="pressdiv" style="display: inline;"></div>
				</td>
			</tr>
			<tr>
				<td colspan="2">出版时间：<input id="publishtime" type="text" name="publishtime" value="${book.publishtime}" style="width:100px;" onblur="checkpublishttime()" readonly/><div id="publishtimediv" style="display: inline;"></div></td>
				<td>库存：　　<input type="text" name="stock" id="stock"  style="width:80px;" value="${book.stock }"   onblur="checkstock()"/><div id="stockdiv" style="display: inline;"></div></td>
			</tr>
			<tr>
				<td width="170px;">版次：　　<input id="edition" type="text" name="edition" value="${book.edition}" style="width:40px;" onblur="checkedition()"/><div id="editiondiv" style="display: inline;"></div></td>
				<td width="225px;">页数：　　<input id="pageNum" type="text" name="pageNum" value="${book.pageNum}" style="width:50px;" onblur="checkpagenum()"/><div id="pagenumdiv" style="display: inline;"></div></td>
				<td width="250px;">字数：　　<input id="wordNum" type="text" name="wordNum" value="${book.wordNum}" style="width:80px;" onblur="checkwordnum()"/><div id="wordnumdiv" style="display: inline;"></div></td>
			</tr>
			<tr>
				<td>印刷时间：<input id="printtime" type="text" name="printtime" value="${book.printtime}" style="width:100px;" readonly/><div id="printtimediv" style="display:inline;"></div></td>
				<td>开本：　　<input id="booksize" type="text" name="booksize" value="${book.booksize}" style="width:30px;" onblur="checkbooksize()"/><div id="booksizediv" style="display: inline;"></div></td>
				<td>纸张：　　<input id="paper" type="text" name="paper" value="${book.paper}" style="width:80px;" onblur="checkpaper()"/><div id="paperdiv" style="display: inline;"></div></td>
			</tr>
			<tr>
			<td></td>
				<td >一级分类：<br/><select id="pid" onchange="loadChildren(id)">
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
				<td colspan="2">
					<input type="submit" name="method" id="editBtn" class="btn" value="编　　辑">
					<input onclick="deletebook()" type="button" name="method" id="delBtn" class="btn" value="删　　除">
				</td>
				<td></td>
			</tr>
		</table>
		</div>
   </form>
  </body>
  </div>
</html>
