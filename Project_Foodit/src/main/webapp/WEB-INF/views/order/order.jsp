
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
        
        <jsp:include page="/WEB-INF/views/common/header.jsp" >
	    <jsp:param value="주문페이지" name="title"/>
      </jsp:include>
         <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="resources/js/order.js"></script>
     
	  <h1>주문하기</h1>
	  
	  <h2>주문자</h2>

		<form method="post" name ="f">
	
			    <!-- 회원일떄 -->
			  
			     <c:choose>
		     <c:when test="${ mDto ne null }">
			   <div>
			   ${sessionScope.mDto.id}님의 회원정보
			   </div>
			  <div>
			   아이디:${mDto.id}
			   </div>
			   <div> 
			    이름:${mDto.name}
			    </div>
			    
			    <div>
			  휴대폰:${mDto.phone}
			 
			  </div>
			  <br />
			  <div>
	
			  <input type="button" value="배송정보" onclick="location.href='mdeliverylistPage'" />
			  </div>
			  
			  
		               <div>
						이름:<input type="text" name="delivery_name" placeholder="필수항목입니다"/>
						
                        </div>
                        
                         <div>
					  	<label>휴대폰</label>
					  	<select name="delivery_phone">
					  <option value="::선택::">::선택::</option>
			          <option value="010">010</option>
			          <option value="011">011</option>
			          <option value="019">019</option>
		               </select>
		               <input type="text" name="delivery_phone2" numberOnly  class="delivery_phone2" placeholder="필수항목입니다"/>
		               <input type="text" name="delivery_phone3"  numberOnly class="delivery_phone3" placeholder="필수항목입니다"/>
		               </div>
		  
                        <div>
                     <label>우편번호</label>
					<input type="text" id="sample4_postcode" numberOnly  placeholder="우편번호" name="order_post" placeholder="필수항목입니다"/>
			    	<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
				      </div>
				      
				      <div>
				       <label>주소</label>
				    <input type="text" id="sample4_roadAddress" name="order_road1" placeholder="필수항목입니다" />
                   </div>
				
		     <!-- 회원일떄 보내는 button -->
		            <h2>상품정보</h2>
		            <c:if test="${orderCartListSize ne 0 }" >
		            <c:forEach var="oDto" items="${orderCartList }" >
		            
		            <div>
		           <img alt="${oDto.product_thumbImg }" 
					src="${pageContext.request.contextPath }/resources/upload/${oDto.product_thumbImg}" style="width:100; height:100px;" />
					</div>
					
					<div>
		          상품이름:  ${oDto.product_name }
		            </div>
		            
		            <div>
		            총개수: ${oDto.cart_amount } 
		            </div>
		            </c:forEach>
		            </c:if>
		           
	             	 <h2>결제정보</h2>
		            
	            <div>
		            <div>
		           총 금액:  <fmt:formatNumber value= "${oDto.product_price * oDto.cart_amount }" pattern="#,###,###" />원
		           </div>
									총 상품금액&nbsp;&nbsp;&nbsp;&nbsp;총 배송비&nbsp;&nbsp;&nbsp;&nbsp;총  결제예정금액<br/>			
									<fmt:formatNumber value= "${sumMoney}" pattern="#,###,###" />원&nbsp;&nbsp; + &nbsp;&nbsp;	
									<fmt:formatNumber value= "${fee }" pattern="#,###,###" />원&nbsp;&nbsp;	= &nbsp;&nbsp;	
									<fmt:formatNumber value= "${sumMoney + fee }" pattern="#,###,###" />원 <br/>
									<c:if test="${fee >= 30000 }"> <!-- 30,000원 이상 구매시 무료배송 -->
										${30000-sumMoney }원 더 구매시 무료배송 해드려요.
									</c:if>
								</div>
	             <input type="button" value="결제하기" onclick="orderBuy()">
		   </c:when>
			 </c:choose>
			 
	             <input type="button" value="취소하기" onclick="regCancel()" />
               </form>
               
     <%@ include file="/WEB-INF/views/common/footer.jsp" %>
 