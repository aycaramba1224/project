<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
    
	<jsp:include page="/WEB-INF/views/common/header.jsp" >
	    <jsp:param value="회원 주문내역페이지" name="title"/>
      </jsp:include>

<script type="text/javascript">
 function reviewWritePage() {
	 if(check) {
	 location.href="reviewWritePage?re_product_name={mOrderDto.re_product_name}";
	 }
 }


</script>
     <style>
    
       table tbody tr:first-child{ border:0; }
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
       	width: 200px;
       }
     
     </style>
<!-- 손을 봐야됨 -->
		
		<!-- 회원일떄 -->
    
     
   <form method="POST">
	       
     
           <table>
			 <c:choose>
		     <c:when test="${ mDto ne null }">
		     <tr>
			  <td>
			   ${sessionScope.mDto.id }님의 회원정보
			   </td>
			   <tr>
			   
			   
			  <tr>
			  <td>
			   아이디
			   </td>
			   <td>
			   ${mDto.id }
			   </td>
			   </tr>
			   
			 <tr>
			 <td>
			    이름
			 </td>
			 <td>
			    ${mDto.name}
			 </td>
			 </tr>
			    
			    <tr>
			    <td>
			  휴대폰
			  </td>
			  <td>
			  ${mDto.phone}
			  </td>
		</tr>
			 
<<<<<<< HEAD
			  <br />
			      <h1>상품정보</h1>
		            <c:forEach var="mOrderDto" items="${memberOrderList}" >
		             
=======
			     
		            
		            <c:forEach var="mOrderDto" items="${memberOrderList}" >
>>>>>>> c7eb659b4c5197199c6c9fc0589f8cd062fe9561
		            <div>
		           <img alt="${mOrderDto.product_thumbImg }" 
					src="${pageContext.request.contextPath }/resources/upload/${mOrderDto.product_thumbImg}" style="width:100; height:100px;" >
		       <p>   상품이름: ${mOrderDto.product_name }</p>
		      <p>    상품 금액:<fmt:formatNumber value="${mOrderDto.product_price}" pattern="#,###,###" />원
		          </p>
		          <p>
		            총개수:${mOrderDto.cart_amount } 
		            </p>
					
		            <h2>결제정보</h2>
<<<<<<< HEAD
		           <c:if test="${mOrderDto.product_price < 30000}">
                                    <fmt:formatNumber value= "${mOrderDto.product_price + 3000 }"/> 원
                                 </c:if>
	             <div>
									
								</div>
	            
=======
		          
		          
		          
		             <c:if test="${mOrderDto.product_price * mOrderDto.cart_amount < 30000}">
                          총 금액:     <fmt:formatNumber value="${mOrderDto.product_price * mOrderDto.cart_amount+ 3000 }"/> 원
                                 </c:if>
                                 
                                 
		         총 금액:  <c:if test="${mOrderDto.product_price * mOrderDto.cart_amount >30000}">원
		                   <fmt:formatNumber value="${mOrderDto.product_price * mOrderDto.cart_amount}"/> 원
                       </c:if>
                                 
		          
		          
	           
>>>>>>> c7eb659b4c5197199c6c9fc0589f8cd062fe9561
		           </div>       
		            <hr />
		     
		           
		            <tr>
		            <td>
		                       주문번호
                  </td>
                  <td>
		    ${mOrderDto.order_no}
		    </td>
		      </tr>
		      
		      
		        
			    <tr>
			    <td>
			                 배송자이름
			     </td>
			     <td>
			     ${mOrderDto.delivery_name}
			     </td>
			     </tr>
				   
				    
				    <tr>
				    <td>
				           배송자휴대폰 
				         </td>
				         <td>
				            ${mOrderDto.delivery_phone}-${mOrderDto.delivery_phone2}-
				         ${mOrderDto.delivery_phone3}
				         </td>
				         </tr>
				         
				         
				     <tr>
				     <td>
				          우편번호
				          </td>
				          
				          <td>
				   ${mOrderDto.order_post}
				   </td>
					</tr>
					
					<tr>
					<td>
					주소
					</td>
				<td>
				${mOrderDto.order_road1}
				</td>
				 </tr>
				   
<<<<<<< HEAD
			<input type="button" value="리뷰등록" onclick="location.href='reviewWritePage?re_product_name=${mOrderDto.product_name}'"/>
=======
>>>>>>> c7eb659b4c5197199c6c9fc0589f8cd062fe9561
			  </c:forEach>
			  </c:when>
			  </c:choose>
		 <c:if test="${ mDto eq null }" >
           <script>
               alert("로그인 후 이용해주세요");
               location.href="sbmr";
           </script>
           
         </c:if>
<<<<<<< HEAD
				   <
=======
         </table>
>>>>>>> c7eb659b4c5197199c6c9fc0589f8cd062fe9561
    </form>
  
    

    
      <%@ include file="/WEB-INF/views/common/footer.jsp" %>
   