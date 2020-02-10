<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>       
    
<jsp:include page="/WEB-INF/views/common/header.jsp" >
	<jsp:param value="FOODIT 장바구니" name="title"/>
</jsp:include> 

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">	  
	var isCartDelete = "${isCartDelete}";
	if( isCartDelete == "yes"){
		var cartDeleteResult = "${insertResult}";
		if( cartDeleteResult == 0){
			alert("메뉴가 삭제 되었습니다.");
		} else {
			alert("메뉴가 삭제 되지않았습니다.");
		}
	}  
	
	function selectDelete() {	      
		if($('input:checkbox[name=chBox]:checked').length== 0){
		  	alert("선택된 상품이 없습니다.")
		  return;
		} else{
		 location.href ="cartDelete?cart_no=${cart_no}";     // 카트번호가 안넘어감    	 
		} 
	}
</script>
</head>
<body>
	
	<div id="cartWrap">
	 	<div class="cartTitWrap">
			<h2 class="cartTit">장바구니</h2>
	 	</div>
	 	 
	   	<c:if test="${mDto.id eq null }">
			<div class="nomem_login">
	 				<p>로그인을 하시면 장바구니에 담긴 상품을 나중에도 확인하실 수 있습니다.</p>
	 				<button type="button" onclick="location.href='sbmr'">로그인</button>		 		 
			</div> 		 
	 	</c:if>    
	 			
 		<c:choose>
			<c:when test="${cartListSize eq 0 }">  
				<div class="detail">
					<div class="detail_info">
						<div class="no_data">
							<span class="ico"></span>
							<p>장바구니에 담긴 메뉴가 없습니다.</p>
							<span>다양한 맛을 가진 메뉴를 확인해 보세요.</span>
							<a href="productList" class="rec_link">
								<span>메뉴보러 가기</span>
							</a>
						</div>
					</div>
				</div> 		  
			</c:when>
			<c:otherwise>
				<form method="POST" action ="orderInsertPage">					
					<table border="1" style="width:500px;">				
						<thead>
							<tr>
								<td><!-- 전체 선택 체크박스   -->	
									<input type="checkbox" name="allCheck" id="allCheck" checked="checked"/>		
									 <script>
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
									<input type="button" value="선택 삭제" class="selectDelete_btn" onclick="selectDelete()"/>
								</td> 
							</tr>
						</thead>
						<tbody>
							<c:forEach var="cartList" items="${cartList }"  >
							카트번호 : ${cartList.cart_no }
							<tr>
								<td><!-- 개별 선택 체크 박스  -->
									<input type="checkbox" name="chBox" class="chBox" checked="checked" />
									<script>
										$(".chBox").click(function(){
											$("#allCheck").prop("checked", false);
										});									
									</script>  
								</td>
								<td>
									<a href="productView?product_no=${cartList.product_no}"><img alt="${cartList.product_thumbImg }" 
									src="${pageContext.request.contextPath }/resources/upload/${cartList.product_thumbImg}" style="width:100; height:100px;" /></a>
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
								<input type="button" value="선택 주문하기" onclick=" " /> 
								<input type="submit" value="전체 주문하기" /> 
								</td>
							</tr>
						</tfoot>
					</table>
				</form>
			</c:otherwise>
		</c:choose>  		
	</div>  
	
	
<script type="text/javascript" src="resources/js/cart.js"></script>	
<%@ include file="/WEB-INF/views/common/footer.jsp" %>