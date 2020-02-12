<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
  
   <jsp:include page="/WEB-INF/views/common/header.jsp" >
	    <jsp:param value="바회원 주문배송/조회  결과페이지" name="title"/>
      </jsp:include>
</head>
<body>
		<form method="post"  name="f">
        
	       <h1>주문자 정보</h1>
      <c:choose>
         <c:when test="${gDto ne null }" >
        <div>
                주문번호: ${gDto.order_no}
        </div>
        
        <div>
                비밀번호:${gDto.guest_pw }
            
         </div>
         <div>주문자이름: ${gDto.order_name } </div>
		<div>주문자 휴대폰:${gDto.order_phone }-
						${gDto.order_phone2 }-
						${gDto.order_phone3 }</div>
	    <div>주문자 이메일:${gDto.order_email } @ ${gDto.order_email2}</div>
        
      
        <h1>상품정보</h1>
		            <div>
		           <img alt="${gDto.product_thumbImg }" 
					src="${pageContext.request.contextPath }/resources/upload/${gDto.product_thumbImg}" style="width:100; height:100px;" />
					</div>
					
					<div>
		          상품이름: ${gDto.product_name }
		            </div>
		          상품 금액: <fmt:formatNumber value="${gDto.product_price}" pattern="#,###,###" />원
		            <div>
		            총개수: ${gDto.cart_amount } 
		            </div>
		            
		         <div>
		            <h2>결제정보</h2>
		            
		         <c:if test="${gDto.product_price * gDto.cart_amount >30000}">
		           총 금액:  <fmt:formatNumber value= "${gDto.product_price * gDto.cart_amount }" pattern="#,###,###" />원
                       </c:if>
                                 
		          
		          <c:if test="${gDto.product_price * gDto.cart_amount < 30000}">
                          총 금액:     <fmt:formatNumber value= "${gDto.product_price * gDto.cart_amount+ 3000 }"/> 원
                                 </c:if>
        </div>
        
        
         <h1>배송정보</h1>
         
         
         <div>이름:${gDto.delivery_name}</div>
	     <div>휴대폰번호:${gDto.delivery_phone}-
	     	 ${gDto.delivery_phone2}-
	    	 ${gDto.delivery_phone3}
	     </div>
	     
		<div>
		   우편번호:${gDto.order_post}
		
		</div>
		
		<div>
		주소: ${gDto.order_road1}
		</div>
		
         
         
		</c:when>
         </c:choose>
         <br />
         
         <c:if test="${gDto eq null }" >
           <script>
               alert("해당정보와 일치하는 정보가 없습니다.");
               location.href="sbmr";
           </script>
         </c:if>
         
 </form>
 