<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta  charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

</script>
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
</head>
<body>

		
		<!-- 회원일떄 -->
     <h1>주문자 정보 페이지</h1>
     <div class="div1">
     <form method="post">
 
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
			
			<!-- 비회원정보내역도 같이 보임...해겨류ㅠ -->
	          <c:if test="${ mDto ne null }">
			   <c:forEach var="OrderBaseDto" items="${memberBaseList}">
			   <div class="div2">
			   <div>
			   배송자이름:
		           ${OrderBaseDto.delivery_name}
		       </div>
		       
		       <div>
		        배송자 전화번호:
				 ${OrderBaseDto.delivery_phone}-${OrderBaseDto.delivery_phone2}-${OrderBaseDto.delivery_phone3}
				 
				 </div>
				 
				 <div>
				 배송 우편번호주소:
				   ${OrderBaseDto.order_post}
				   </div>
				   
				   <div>
				   배송 주소:
					${OrderBaseDto.order_road1}
					</div>
					
					<div>
					주문날짜:
					${OrderBaseDto.orderDate}
					</div>
					</div>
				</c:forEach>
				</c:if>
			</c:when>
			</c:choose>
		</form>
		</div>

</body>
</html>