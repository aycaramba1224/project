
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
        
        <jsp:include page="/WEB-INF/views/common/header.jsp" >
	    <jsp:param value="주문페이지" name="title"/>
      </jsp:include>

     
	  <h1>주문하기</h1>
	  <br />
	  <br />
	  <h2>주문자</h2>
	    <hr />
	    
	    <!--비회원일떄  -->
	   
		<form method="post" id ="f" >
	
			    <!-- 회원일떄 -->
			  
			     <c:choose>
		     <c:when test="${ mDto ne null }">
			   <div>
			   ${sessionScope.mDto.id }님의 회원정보
			   </div>
			  <div>
			   아이디:${mDto.id }
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
		               <label>이름</label>   
						<input type="text" name="delivery_name" id="delivery_name" />
                        </div>
                        
                         <div>
					  	<label>휴대폰</label>
					  	<select name="delivery_phone">
					  <option value="::선택::">::선택::</option>
			          <option value="010">010</option>
			          <option value="011">011</option>
			          <option value="019">019</option>
		               </select>
		               <input type="text" name="delivery_phone2" class="delivery_phone2"/>
		               <input type="text" name="delivery_phone3" class="delivery_phone3"/>
		               </div>
		  
                        <div>
                     <label>우편번호</label>
					<input type="text" id="sample4_postcode" placeholder="우편번호" name="order_post" />
			    	<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
				      </div>
				      
				      <div>
				       <label>주소</label>
				    <input type="text" id="sample4_roadAddress" name="order_road1" />
                   </div>
				
		     <!-- 회원일떄 보내는 button -->
		            <h2>상품정보</h2>
		            <c:if test="${orderCartListSize ne null }" >
		            <c:forEach var="oDto" items="${orderCartList }" >
		             <div>
		                장바구니 번호:  ${oDto.cart_no }
		             </div>
		           
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
		            
		            <div>
		           <fmt:formatNumber value= "${oDto.product_price * oDto.cart_amount }" pattern="#,###,###" />원
		           </div>
		            </c:forEach>
		            </c:if>
		           
	             	 <h2>결제정보</h2>
	             
	             <input type="button" value="회원결제하기" onclick="memberbuy()">
		   </c:when>
			 </c:choose>
			 
	             <input type="button" value="취소하기" onclick="regCancel()" />
               </form>
               
     <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="resources/js/order.js"></script>