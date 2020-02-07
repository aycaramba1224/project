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
		alert("메뉴 삭제가 성공하였습니다.");
	} else {
		alert("메뉴 삭제가 실패하였습니다.");
	}
}  

function goLogin(f){
 	f.action = "sbmr?cart_id=${cart_id}";
	f.submit();  
}
 
</script>
</head>
<body>
	
 	<div id="cartWrap">
	 	<div class="cartTitWrap">
			<h2 class="cartTit">장바구니</h2>
	 	</div>
	 	<form method="POST" action ="orderInsertPage">	
	   	<c:if test="${mDto.id eq null }">
			<div class="nomem_login">
	 				<p>로그인을 하시면 장바구니에 담긴 상품을 나중에도 확인하실 수 있습니다.</p>
	 				<button type="button" onclick="goLogin(this.form)">로그인</button>		 		 
			</div> 		 
	 	</c:if>    	
	 		
		<c:choose>
			<c:when test="${guestCartListSize eq 0 }">  
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
				
				
					
				아이디 : ${cart_id }
					<input type="hidden" name="cart_id" value="${cart_id }"/>
				 
					<table border="1" style="width:500px;">
						<thead>
							<tr>
								<td>
									<input type="checkbox" name="allCheck" id="allCheck" checked="checked" /> <!-- 전체 선택 체크박스   -->																	 
								</td>
								<td>
									<label for="allCheck">총 <!-- 처리예정 --> / ${guestCartListSize }개</label> 
								</td> 
								<td colspan="4">
									<input type="button" value="선택 삭제" id="selectDelete_btn" onclick="selectDelete()"/>	
								</td> 
							</tr>							
						</thead>
						<tbody>
							<c:forEach var="gc" items="${guestCartList }" >
							<input type="hidden" name="cart_no" value="${gc.cart_no }"/>
							 카트번호 :${gc.cart_no }  
							<tr>
								<td>
									<input type="checkbox" name="chBox" class="chBox" checked="checked" data-cartNo = "${gc.cart_no }"/>	<!-- 개별 선택 체크 박스  -->
								</td>
								<td>
									<a href="productView?product_no=${gc.product_no}"><img alt="${gc.product_thumbImg }" 
									src="${pageContext.request.contextPath }/resources/upload/${gc.product_thumbImg}" style="width:100; height:100px;" /></a>
								</td>		
								<td>
									<a href="productView?product_no=${gc.product_no}"> ${gc.product_name }</a> <br/> 
									<fmt:formatNumber value="${gc.product_price}" pattern="#,###,###" />원  
								</td>					
								<td>						 
									${gc.cart_amount }
								</td>														
								<td>
									<fmt:formatNumber value= "${gc.product_price * gc.cart_amount }" pattern="#,###,###" />원
								</td>
								<td>									
									<input type="button" value="x" onclick="location.href='guestCartDelete?cart_no=${gc.cart_no}'"/> 
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
								<input type="button" value="선택 주문하기(비회원)" onclick=" " /> 
								<input type="submit" value="전체 주문하기(비회원)" /> 
								</td>
							</tr>
						</tfoot>
					</table>
				</c:otherwise>
			</c:choose>  		
		</form>
	</div>
	
<script type="text/javascript" src="resources/js/cart.js"></script>	
<%@ include file="/WEB-INF/views/common/footer.jsp" %>