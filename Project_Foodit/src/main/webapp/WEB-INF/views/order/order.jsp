
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
        
        <jsp:include page="/WEB-INF/views/common/header.jsp" >
	    <jsp:param value="주문페이지" name="title"/>
      </jsp:include>
         <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="resources/js/order.js"></script>
     
     <style>
        h1,h2{
        margin-top:50px;
        font-size: 20px;
        
        }
      table {
           width: 800px; height: 500px;
       }
       table, th, td {
           border: 1px solid gray;
           border-collapse: collapse;
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
	  
	  <h2>(주문자정보) </h2>
	  
		<form method="post" name ="f">
	
			    <!-- 회원일떄 -->
			  <table border="1" >
			     <c:choose>
		     <c:when test="${ mDto ne null }">
			 <tbody>
		
			 <tr>
			 <td>회원아이디 </td>
			 <td>  ${sessionScope.mDto.id}님의 회원정보</td>
			 </tr>
			
			
			   <tr>
			   <td>아이디</td>
			  <td>${mDto.id}
			   </td> 
			   </tr>
			   
			   <tr>
			   <td>이름</td>
			   <td>
			   ${mDto.name}
			   </td>
			  
			  <tr>
			 <td>
			  휴대폰
			 </td>
			  
			  <td>
			  ${mDto.phone}
			 </td>
			  </tr>
	            </c:when>
			 </c:choose>
	
			  
			
		               <tr>
		               <td>주문자이름</td>
		                
		                <td>
		               <input type="text" name="delivery_name" placeholder="필수항목입니다"/>
                        </td>
                        
                         
                         <tr>
                         <td>
					  	<label>휴대폰</label>
					  	</td>
					  	
					  	<td>
					  	<select name="delivery_phone">
					  <option value="::선택::">::선택::</option>
			          <option value="010">010</option>
			          <option value="011">011</option>
			          <option value="019">019</option>
		               </select>
		               <input type="text" name="delivery_phone2" numberOnly  class="delivery_phone2" placeholder="필수항목입니다"/>
		               <input type="text" name="delivery_phone3"  numberOnly class="delivery_phone3" placeholder="필수항목입니다"/>
		               </td>
		              
					  	</tr>
		  
                        <tr>
                        <td>
                     <label>우편번호</label>
                    </td>
                    
                     <td>
					<input type="text" id="sample4_postcode" numberOnly  placeholder="우편번호" name="order_post" placeholder="필수항목입니다"/>
			    	<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
				      </td>
				      </tr>
				      
				      <tr>
				      <td>
				       <label>주소</label>
				       </td>
				       <td>
				    <input type="text" id="sample4_roadAddress" name="order_road1" placeholder="필수항목입니다" />
                   </td>
                   </tr>
				
				
				 
		     <!-- 회원일떄 보내는 button -->
		     <h2>(상품정보)</h2>
		   
		            <c:if test="${orderCartListSize ne 0 }" >
		            <c:forEach var="oDto" items="${orderCartList }" >
		           <div>
		            
		           <img alt="${oDto.product_thumbImg }" 
					src="${pageContext.request.contextPath }/resources/upload/${oDto.product_thumbImg}" style="width:100; height:100px;" />
			
		          상품이름:${oDto.product_name}
		            총개수:${oDto.cart_amount } 
		           
		          </div>
		            </c:forEach>
		            </c:if>
		         
	             	 <h2>(결제정보)</h2>
		      	 
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
								
				<tr>
				<th colspan="2">	
	             <input type="button" value="결제하기" onclick="orderBuy()">
	             <input type="button" value="취소하기" onclick="regCancel()" />
		           </th>
		         </tr>  
		         
		  </table>
               </form>
               
     <%@ include file="/WEB-INF/views/common/footer.jsp" %>
 