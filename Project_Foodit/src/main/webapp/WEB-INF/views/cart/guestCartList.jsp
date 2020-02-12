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

 	function goLogin(f){ 		// 비회원의 임시아이디를 본래 아이디로 업데이트함
	 	f.action = "sbmr?cart_id=${cart_id}";	 
		f.submit();  
	}
</script>
	
	<div id="cartWrap">
	 	<div class="cartTitWrap">
			<h2 class="cartTit">장바구니</h2>
	 	</div>
	 	 
	   	<c:if test="${mDto.id eq null }">
			<div class="nomem_login">
	 				<p>로그인을 하시면 장바구니에 담긴 상품을 나중에도 확인하실 수 있습니다.</p>
	 				<button type="button" onclick="goLogin(this.form)">로그인</button>		 		 
			</div> 		 
	 	</c:if>    
	 			
		<div class="detail">
	 		<c:choose>
				<c:when test="${guestCartListSize eq 0 }">  
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
				</c:when>
				<c:otherwise>
					<form method="POST" action ="guestorderPage">
						<input type="hidden" name="cart_id" value="${cart_id }"/>
						<div class="cartSelect"> 					
							<!-- 전체 선택 체크박스   -->	
							<div class="cartTotalChkWrap">
								<input type="checkbox" name="allCheck" id="allCheck" checked="checked"/>		
								<label for="allCheck">
									총 <span id="chkCount"></span> / ${guestCartListSize }개
								</label> 
								<button type="button" onclick="gc_selectDelete()">선택 삭제</button> 
							</div>
						</div>
						<div class="deliveryArea"> 
							<div class="productList">
								<ul class="proAllChk">
									<c:forEach var="gc" items="${guestCartList }" >							
										<li>
											<div class="proModule">
												<div class="proCheckWrap">
													<!-- 개별 선택 체크 박스  -->
													<input type="checkbox" name="chBox" id="checkEBox" class="chBox" checked="checked" cartNo="${gc.cart_no }"/> <!-- 체크박스에 카트번호를 속성으로 넣는다. -->
													<label for="checkEBox"></label> 
												</div>
												<div class="proimgWrap">
													<img alt="${gc.product_thumbImg }" src="${pageContext.request.contextPath }/resources/upload/${gc.product_thumbImg}" />
												</div>
												<a href="productView?product_no=${gc.product_no}">
													<div class="cartProInfo"> 
														<span class="cartProInfoTit mtElps">${gc.product_name }</span>
														<span class="cartProInfoPrice"><fmt:formatNumber value="${gc.product_price}" pattern="#,###,###" />원</span>  
													</div>
												</a>
												<div class="proCartQuantityWrap">
													<span class="proCartQuantity">${gc.cart_amount }개</span> 
												</div>
												<div class="proCartPrice">
													<fmt:formatNumber value= "${gc.product_price * gc.cart_amount }" pattern="#,###,###" />원 
												</div>
												<button type="button" class="proCartDel"onclick="location.href='guestCartDelete?cart_no=${gc.cart_no}'"></button> 
											</div>
										</li>   
									</c:forEach>
								</ul>
							</div>
						</div>
						<div class="prdTotalPay">
							<span>
								총 상품금액
								<span class="strong">
									<fmt:formatNumber value= "${sumMoney}" pattern="#,###,###" />원
								</span> 	
							</span>
							<span class="plusIco"></span>		
							<span>
								총 배송비
								<span class="strong">
									<fmt:formatNumber value= "${fee }" pattern="#,###,###" />원
								</span> 	
							</span>
							<span class="equalIco"></span>
							<span class="prDtotal">
								총 결제예정금액
								<span class="strong">
									<fmt:formatNumber value= "${sumMoney + fee }" pattern="#,###,###" />원
								</span> 	
							</span> 	
							<c:if test="${sumMoney < 30000 }"> <!-- 30,000원 이상 구매시 무료배송 -->
								<div class="freeDelivery">
									<div class="freeDeliveryInfo">
										<span class="deliveryTxt"><fmt:formatNumber value= "${30000-sumMoney }" pattern="#,###,###" />원 더 구매시 무료배송 해드려요.</span>
									</div>
								</div>
							</c:if>
						</div>
						<div class="proBtn">
							<button type="button" onclick="guestSelectOrder()">선택 주문하기</button> 
							<button type="submit" >전체 주문하기</button>
						</div>
					</form>
				</c:otherwise>
			</c:choose>  		
		</div>  
	</div>
	
<script type="text/javascript" src="resources/js/cart.js"></script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>