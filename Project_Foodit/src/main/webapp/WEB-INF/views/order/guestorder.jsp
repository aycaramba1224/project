
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
        
        <jsp:include page="/WEB-INF/views/common/header.jsp" >
	    <jsp:param value="주문페이지" name="title"/>
      </jsp:include>
 
     <style>
        h1,h2{
       
        font-size: 20px;
        }
        
        table {
           width: 800px; height: 500px;
       }
       table, th, td {
           border: 1px solid gray;
          
           text-align: left;		/* 가로 정렬 */
           vertical-align: middle;	/* 세로 정렬 */
           padding: 0 5px;
       }
       td:nth-child(1) {
       	font-weight: bold;
       	width: 100px;
       }
        
     
     </style>
     
	  <h1>주문하기</h1>
	  <br />
	  <br />
	  <h2>주문자</h2>
	    <hr />
	    
	    <!--비회원일떄  -->
	     <table border="1" class="guestordertable">
	     
	  <form method="post" id ="f" >
	  
			<c:choose>
	        <c:when test="${ mDto eq null }">
	        
	        
	         
			    <input type="button" value="로그인" onclick="location.href='sbmr'" />
			     
			        
			     	<tr>
			     	<td>
	                    <label> 이름</label> 
	                 </td>
	                 
	                 <td> 
						<input type="text" name="order_name" />
						</td>
					  </tr>
					  
					  
					   <tr>
					   <td>
					  	<label> 휴대폰 </label>
					  	</td>
					  	
					  	<td >
					  	<select name="order_phone">
					  <option value="::선택::">::선택::</option>
			          <option value="010">010</option>
			          <option value="011">011</option>
			          <option value="019">019</option>
		               </select>
		            
		               <input type="text"  numberOnly name="order_phone2" >-
		               <input type="text"  numberOnly name="order_phone3" >
		               </td>
		               </tr>
		              
						
						<tr>
						<td>
				<label>이메일</label>
				</td>
				
				<td> 
					<input type="text"  name="order_email" />
					 @ 
					<input type="text"  list="domain" name="order_email2" placeholder="직접 입력" />
					<datalist id="domain">
						<option value="naver.com">naver.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="gmail.com">gmail.com</option>
					</datalist>
					</td>
					
			</tr>
					 
					     <tr>
					     <td>
					     <label>주문비밀번호</label>
					     </td>
					     <td>
					     <input type="password" name="guest_pw"/>
					     </td>
					     </tr>
					     
					     <tr>
					     <td>
					     <label>주문비밀번호 확인</label> 
					     </td>
					     <td>
					     <input type="password" name="guest_pw2"  onblur="passchk(this.form)" >
					      <input type="text" style="border-width: 0px" size="20" name="chk"
                          value="비밀번호를 입력하세요" readonly="readonly"/>
					     </td>
					     </tr>
					 
					   
					    
					    
					  <tr>
					  <td>
	                    <label>배송받을분이름</label>  
	                   </td>
	                   
	                   <td>
						<input type="text" name="delivery_name" >
						</td>
                      </tr>
                        
                        <tr>
                        
                        <td>
					  	<label>배송받을분휴대폰</label>
					  	</td>
					  	
					  	
					  	<td >
					  	<select name="delivery_phone">
					  <option value="::선택::">::선택::</option>
			          <option value="010">010</option>
			          <option value="011">011</option>
			          <option value="019">019</option>
		               </select>
		             
		               <input type="text" numberOnly name="delivery_phone2">
		               <input type="text" numberOnly  name="delivery_phone3">
		            </td>
		            </tr>
		             
		  
                        <tr>
                        <td>
                     <label>주소</label>
                     </td>
                     
                     <td>
					<input type="text" id="sample4_postcode" numberOnly placeholder="우편번호" name="order_post">
			    	<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
				    <input type="text" id="sample4_roadAddress" name="order_road1">
				      <td>
				      </tr>
				     
               	  <!-- 비회원일떄보는 submit -->
               	 
               	  
               	   <c:if test="${GuestOrderCartListSize ne 0 }" >
		            <c:forEach var="oDto" items="${GuestOrderCartList }" >
		           
		            <div>
		           <img alt="${oDto.product_thumbImg }" 
					src="${pageContext.request.contextPath }/resources/upload/${oDto.product_thumbImg}" style="width:100; height:100px;" />
		         
		        
		                     <p> 상품이름:${oDto.product_name }</p>
		                 
		         
		    <p>   상품금액: <fmt:formatNumber value="${oDto.product_price}" pattern="#,###,###" />원
		      </p>
		      
		      <p>
		            총개수: ${oDto.cart_amount } 
		            </p>
					</div>
		
		                       <tr>
		                      <td colspan="2">
									총 상품금액&nbsp;&nbsp;&nbsp;&nbsp;총 배송비&nbsp;&nbsp;&nbsp;&nbsp;총  결제예정금액<br/>			
									<fmt:formatNumber value= "${sumMoney}" pattern="#,###,###" />원&nbsp;&nbsp; + &nbsp;&nbsp;	
									<fmt:formatNumber value= "${fee }" pattern="#,###,###" />원&nbsp;&nbsp;	= &nbsp;&nbsp;	
									<fmt:formatNumber value= "${sumMoney + fee }" pattern="#,###,###" />원 <br/>
									<c:if test="${fee >= 30000 }"> <!-- 30,000원 이상 구매시 무료배송 -->
										${30000-sumMoney }원 더 구매시 무료배송 해드려요.
									</c:if>
								</td>
								</tr>
		         
		            </c:forEach>
		            </c:if>
                  
                  <tr>
                  <td colspan="2">
	             <input type="button" value="결제하기" onclick="guestOrder()"/>
	             <input type="button" value="취소하기" onclick="regCancel()" />
	            
	             </td>
	             </tr>
			    </c:when>
			</c:choose>
			
               </form>
			</table>
			    
			    
			 
               
     <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="resources/js/order.js"></script>