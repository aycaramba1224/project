
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
			<c:choose>
	        <c:when test="${ mDto eq null }">
	          
			    <input type="button" value="로그인" onclick="location.href='sbmr'" />
			     
			     	<div>
	                    <label> 이름</label>   
						<input type="text" name="order_name" />
					 </div>
					  
					   <div>
					  	<label> 휴대폰 </label>
					  	<select name="order_phone">
					  <option value="::선택::">::선택::</option>
			          <option value="010">010</option>
			          <option value="011">011</option>
			          <option value="019">019</option>
		               </select>
		               <input type="text" name="order_phone2" />
		               <input type="text" name="order_phone3" />
		               </div>
		              
						
				<label>이메일</label>
					<input type="text"  name="order_email" />
					 @ 
					<input type="text"  list="domain" name="order_email2" placeholder="직접 입력" />
					<datalist id="domain">
						<option value="naver.com">naver.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="gmail.com">gmail.com</option>
					</datalist>
			
					 
					     <div>
					     <label>주문비밀번호</label>
					     <input type="password" name="guest_pw"/>
					     <label>주문비밀번호 확인</label> 
					     <input type="password" name="guest_pw2"  onblur="passchk(this.form)" />
					      <input type="text" style="border-width: 0px" size="20" name="chk"
                          value="비밀번호를 입력하세요" readonly="readonly"/>
					     </div>
					   
					    <h2>배송정보</h2>
					    <div>
	                    <label>이름</label>   
						<input type="text" name="delivery_name" />
                        </div>
                        
                         <div>
					  	<label>휴대폰</label>
					  	<select name="delivery_phone">
					  <option value="::선택::">::선택::</option>
			          <option value="010">010</option>
			          <option value="011">011</option>
			          <option value="019">019</option>
		               </select>
		               <input type="text" name="delivery_phone2" />
		               <input type="text" name="delivery_phone3" />
		               </div>
		  
                        <div>
                     <label>주소</label>
					<input type="text" id="sample4_postcode" placeholder="우편번호" name="order_post" />
			    	<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
				      </div>
				      
				    <div>
				    <input type="text" id="sample4_roadAddress" name="order_road1" />
                   </div>
                   	
               	  <!-- 비회원일떄보는 submit -->
               	 <h2>상품정보</h2>
               	  <div>
               	  
               	 </div>
               	 
               	 
	             	 <h2>결제정보</h2>
               	 <div>
               	 총 상품금액<input type="text" />
               	 </div>
               	 <div>
               	 총 배송비
               	 <input type="text"  />
               	 </div>
               	 <div>
               	 총 결제 금액<input type="text" />
               	 </div>
	             <input type="button" value="비회원결제하기" onclick="guestOrder()"/>
	            
			    </c:when>
			</c:choose>
			
			    
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
		            <c:forEach var="orderCartList" items="${orderCartList }" >
		              ${orderCartList.cart_no }
		           <img alt="${orderCartList.product_thumbImg }" 
				src="${pageContext.request.contextPath }/resources/upload/${orderCartList.product_thumbImg}" style="width:100; height:100px;" />
		            
		            ${orderCartList.product_name }
		            ${orderCartList.cart_amount } 
		            
		           <fmt:formatNumber value= "${cartList.product_price * cartList.cart_amount }" pattern="#,###,###" />원
		           
		            </c:forEach>
	             	 <h2>결제정보</h2>
               	 <div>
               	   <div>
               	   <!--  
						총 상품금액&nbsp;&nbsp;&nbsp;&nbsp;총 배송비&nbsp;&nbsp;&nbsp;&nbsp;총  결제예정금액<br/>			
						<fmt:formatNumber value= "${sumMoney}" pattern="#,###,###" />원&nbsp;&nbsp; + &nbsp;&nbsp;	
						<fmt:formatNumber value= "${fee }" pattern="#,###,###" />원&nbsp;&nbsp;	= &nbsp;&nbsp;	
						<fmt:formatNumber value= "${sumMoney + fee }" pattern="#,###,###" />원 <br/>
									
								</div>
								-->
               	 </div>
	             
	             <input type="button" value="회원결제하기" onclick="memberbuy()">
		   </c:when>
			 </c:choose>
			 
	             <input type="button" value="취소하기" onclick="regCancel()" />
               </form>
               
     <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="resources/js/order.js"></script>