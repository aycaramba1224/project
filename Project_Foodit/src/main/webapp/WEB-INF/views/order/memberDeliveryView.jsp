<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
 	<jsp:include page="/WEB-INF/views/common/header.jsp" >
	    <jsp:param value="회원 배송지 목록" name="title"/>
      </jsp:include>
	<style>
	
	 .contaniner {
	  border: 1px solid black;
	  width: 800px;
	}
	</style>

       
           <c:choose>
		     <c:when test="${ mDto ne null }">
		     <h1>회원정보</h1>
		        <div> 
			    이름:${mDto.name}
			    </div>
			    
			    <div>
			  휴대폰:${mDto.phone}
			  </div>
		  <form method="post">
          
			
          <h1>배송정보</h1>
			<c:forEach var="OrderBaseDto" items="${memberDeliveryList}">
				    <div class="contaniner">
			      
			     
			       
			         <div>
			                 배송자이름:
				    <input type="text" name="delivery_name" value="${OrderBaseDto.delivery_name}">
				    </div>
				    
				    <div>
				           배송자휴대폰:
				         <input type="text" name="delivery_phone" value="${OrderBaseDto.delivery_phone}" />
				         <input type="text" name="delivery_phone2" value="${OrderBaseDto.delivery_phone}" />-
				         <input type="text" name="delivery_phone3" value="${OrderBaseDto.delivery_phone}" />
				         </div>
				      
				      <div>
				          우편번호:
				    <input type="text" name="order_post" value="${OrderBaseDto.order_post}">
					</div>
					
					<div>
					주소
				<input type="text" name ="order_road1" value="${OrderBaseDto.order_road1}"/>
				   </div>
				 
				   
				   
				   </div>
				</c:forEach>
			
	              <input type="button" value="신규배송정보등록" onclick="location.href='mdeliverysendPage'" />
				 
       </form>
   </c:when>
   </c:choose>
 	<%@ include file="/WEB-INF/views/common/footer.jsp" %>