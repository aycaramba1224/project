<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
	<jsp:include page="/WEB-INF/views/common/header.jsp" >
	    <jsp:param value="회원 주문내역페이지" name="title"/>
      </jsp:include>

	<Style>
	   .div1 {
	     border: 1px solid black; 
	     width: 500px;
	   }
	 .div2 {
	     border: 1px solid black; 
	       width: 500px;
	   }
	
	</Style>


		
		<!-- 회원일떄 -->
     <div class="div1">
     <form method="post">
 
     <h1>주문자 정보 페이지</h1>
	       <c:choose>
	        <c:when test="${mODto ne null }" >
	         <div>
                주문번호: ${mODto.order_no }
        </div>
        
        <div>
                비밀번호:${mODto.guest_pw }
            
         </div>
         <div>주문자이름: ${mODto.order_name } </div>
		<div>주문자 휴대폰:${mODto.order_phone }-
						${mODto.order_phone2 }-
						${mODto.order_phone3 }</div>
	    <div>주문자 이메일:${mODto.order_email } @ ${mODto.order_email2}</div>
        
         <h1>배송정보</h1>
         
         
         <div>이름:${mODto.delivery_name}</div>
	     <div>휴대폰번호:${mODto.delivery_phone}-
	     	 ${mODto.delivery_phone2}-
	    	 ${mODto.delivery_phone3}
	     </div>
	     
		<div>
		   우편번호:${mODto.order_post}
		
		</div>
		
		<div>
		주소: ${mODto.order_road1}
		</div>
		
		<div>
		 주문날짜: ${mODto.orderDate }
	    </div>
         
	        
	     </c:when>
	      <c:when test="${ mDto eq null }">
	           <script>
	           alert("로그인 후 이용해 주세요 ");
	           location.href="sbmr";
	           </script>
	           </c:when>
			</c:choose>
	    
		</form>
			<br />
			<!-- 검색으로 처리 -->
			      
		</div>

</body>
</html>
			

     
      <%@ include file="/WEB-INF/views/common/footer.jsp" %>
   