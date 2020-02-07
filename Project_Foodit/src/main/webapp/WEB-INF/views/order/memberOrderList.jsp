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
	        <c:when test="${ mDto ne null }">
    		 ${sessionScope.mDto.id }님의 주문정보<br/>
			
			 <div>
			 주문자이름:
			 ${mDto.name}
			 </div>
			 
			 <div>
			주문자 휴대폰:
			${mDto.phone}
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
			      
			   <form method="post" action="memberOrderSearch">
	          <c:if test="${ mDto ne null }">
	          
	          <input type="hidden" name="guestquery" value="order_name"/>
              <input type="text" placeholder="이름를 입력해주세요" name="content" />
             <input type="submit"value="확인" />
    
		       </c:if>
			</form>
		</div>

</body>
</html>
			

     
      <%@ include file="/WEB-INF/views/common/footer.jsp" %>
   