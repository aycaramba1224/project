<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
    
	<jsp:include page="/WEB-INF/views/common/header.jsp" >
	    <jsp:param value="회원 주문내역페이지" name="title"/>
      </jsp:include>

</head>
<body>

<!-- 손을 봐야됨 -->
		
		<!-- 회원일떄 -->
     <div class="div1">
     
   <form method="post">
	       
     <h1>회원정보</h1>
      
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
			      <h1>상품정보</h1>
		            <c:forEach var="mOrderDto" items="${memberOrderList}" >
		            
		            <div>
		           <img alt="${mOrderDto.product_thumbImg }" 
					src="${pageContext.request.contextPath }/resources/upload/${mOrderDto.product_thumbImg}" style="width:100; height:100px;" />
					</div>
					
					<div>
		          상품이름: ${mOrderDto.product_name }
		            </div>
		          상품 금액: <fmt:formatNumber value="${mOrderDto.product_price}" pattern="#,###,###" />원
		            <div>
		            총개수: ${mOrderDto.cart_amount } 
		            </div>
		            
		         <div>
		            <h2>결제정보</h2>
		           <c:if test="${mOrderDto.product_price < 30000}">
                                    <fmt:formatNumber value= "${mOrderDto.product_price + 3000 }"/> 원
                                 </c:if>
	             <div>
									
								</div>
	            
		           </div>       
		            
		     
		            
		            <h1>배송정보</h1>
		            <div>
		                       주문번호:${mOrderDto.order_no}
		            </div>
			       <div>
			                 배송자이름:${mOrderDto.delivery_name}
				    </div>
				    
				    <div>
				           배송자휴대폰: ${mOrderDto.delivery_phone}-${mOrderDto.delivery_phone2}-
				         ${mOrderDto.delivery_phone3}
				         </div>
				      
				      <div>
				          우편번호:
				   ${mOrderDto.order_post}
					</div>
					
					<div>
					주소
				${mOrderDto.order_road1}
				   </div>
				   
			  
			  
			 
			  </c:forEach>
			  </c:when>
			  </c:choose>
			  
			   <c:if test="${ mDto eq null }" >
           <script>
               alert("로그인 후 이용해주세요");
               location.href="sbmr";
           </script>
           
         </c:if>
    </form>
    </div>
    
    </body>
    
      <%@ include file="/WEB-INF/views/common/footer.jsp" %>
   