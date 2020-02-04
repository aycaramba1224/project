<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
    
    
<jsp:include page="/WEB-INF/views/common/header.jsp" >
	<jsp:param value="FOODIT 장바구니" name="title"/>
</jsp:include> 

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">	 
 
</script>
</head>
<body>
	<span>장바구니</span> 
 
 	<div id="wrap">
 		<div id="로그인확인">
	 	<c:if test="${ sessionScope.mDto eq null }">
	 		로그인을 하시면 장바구니에 담긴 상품을 나중에도 확인하실 수 있습니다.&nbsp;&nbsp;&nbsp;<input type="button" value="로그인" onclick="location.href='sbmr'"/>		 		
	 	</c:if>
 		</div> <br/><br/>
 		
	 <c:choose>
		<c:when test="${cartListSize eq 0 }">  
			<span>장바구니에 담긴 메뉴가 없습니다.</span>  
			<p>다양한 맛을 가진 메뉴를 확인해 보세요.</p>  
			<input type="button" value="메뉴보러가기" onclick="location.href='productList'"/>
		 	</c:when>
		<c:otherwise>
		<form method="POST">
		 
			<table border="1" style="width:500px;">
			
			<thead>
				<tr>
					<td>
						<input type="checkbox" name="allCheck" id="allCheck" checked="checked" />
						<script>
							// 전체 선택
							$("#allCheck").click(function(){
							 var chk = $("#allCheck").prop("checked");
							 if(chk) {
							  $(".chBox").prop("checked", true);
							 } else {
							  $(".chBox").prop("checked", false);
							 }
							});
						</script>
													 
					</td>
					<td>
						<label for="allCheck">총 <!-- 처리예정 --> / ${cartListSize }개</label> 
					</td> 
					<td colspan="4">
						<input type="button" value="선택 삭제" id="selectDelete_btn"  >
				 						 
					</td>
				</tr>
			</thead>
			<tbody>
				 <c:forEach var="cartList" items="${cartList }" >
				<tr>
					<td>
						<input type="checkbox" name="chBox" class="chBox" checked="checked"/>	
						<script>
							 $(".chBox").click(function(){
							  $("#allCheck").prop("checked", false);
							 });
						</script>								 
					</td>
					<td>
						<img alt="${cartList.product_thumbImg }" src="${pageContext.request.contextPath }/resources/upload/${cartList.product_thumbImg}" style="width:100; height:100px;" />
					</td>		
					<td>
						 <a href="productView?product_no=${cartList.product_no}"> ${cartList.product_name }</a> <br/> 
						 <fmt:formatNumber value="${cartList.product_price}" pattern="#,###,###" />원  
					</td>
					<td>
						 ${cartList.cart_amount } 
					</td>
					<td>
						<fmt:formatNumber value= "${cartList.product_price * cartList.cart_amount }" pattern="#,###,###" />원
					</td>
					<td>
						<input type="button" value="x" onclick="location.href='cartDelete?cart_no=${cartList.cart_no}'"/> 
					</td>
				</tr>
			</c:forEach>  
				<tr> 
					<td colspan="6">
						총 상품금액&nbsp;&nbsp;&nbsp;&nbsp;총 배송비&nbsp;&nbsp;&nbsp;&nbsp;총  결제예정금액<br/>			
						 <fmt:formatNumber value= "${sumMoney}" pattern="#,###,###" />원&nbsp;&nbsp; + &nbsp;&nbsp;	
						 <fmt:formatNumber value= "${fee }" pattern="#,###,###" />원&nbsp;&nbsp;	= &nbsp;&nbsp;	
						 <fmt:formatNumber value= "${sumMoney + fee }" pattern="#,###,###" />원 <br/>
						 <c:if test="${fee >= 30000 }"> <!-- 30,000원 이상 구매시 무료배송 -->
						 	${30000-sumMoney }원 더 구매시 무료배송 해드려요.
						 </c:if>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="6">
						<input type="button" value="선택 주문하기" onclick=" "/> 
						<input type="button" value="전체 주문하기" onclick=" "/> 						
					</td>
				</tr>
			</tfoot>
		</table>
		</form>
		</c:otherwise>
		</c:choose>  
	</div> 
	
</body>
</html>