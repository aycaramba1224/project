<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

	<jsp:include page="/WEB-INF/views/common/header.jsp" >
	    <jsp:param value="주문/배송 목록페이지" name="title"/>
      </jsp:include>
	
	
	<!--회원 주문내역/비회원 주문내역 정렬 해야됨-->
	
	
			
	<h1>주문자 정보 페이지</h1>
	

	        <form>
 		<c:choose>
	           
	           
	        <c:when test="${ mDto eq null }">
      <table border="1">
			<tbody>
					
				<tr>
			<th>주문번호</th>
		    <th>주문자 비밀번호</th> 
			<th>주문자이름</th>
			<th>주문자 휴대폰</th>
			<th>주문자 이메일</th>
			</tr>
		
		
			<c:forEach var="OrderBaseDto" items="${orderBaseList}">
				<tr>
				    <td>${OrderBaseDto.order_no}</td>
				    <td>${OrderBaseDto.guest_pw}</td>
					<td><a href="orderbaseListview?order_name=${OrderBaseDto.order_name}">${OrderBaseDto.order_name}</a></td>
					<td>${OrderBaseDto.order_phone}-${OrderBaseDto.order_phone2}-${OrderBaseDto.order_phone3}</td>
					<td>${OrderBaseDto.order_email}@${OrderBaseDto.order_email2}</td>
				</tr>
			</c:forEach>
		
			<c:if test="${orderBaseListSize eq 0 }">
			<tr>
				<td colspan="5">저장된 주문정보가 없습니다.</td>
			</tr>
		</c:if>
		</tbody>
   </table>
   
   <br />
    
    <h1>배송정보</h1>
    <table border="1">
    <tbody>
			<tr>
			<th>배송자이름</th>
			<th>배송자휴대폰</th>
			<th>우편번호</th>
			<th>주소</th>
			<th>주문날짜</th>
		   </tr>
		   
        
		   <c:if test="${ mDto eq null }">
			<c:forEach var="OrderBaseDto" items="${orderBaseList}">
			
				<tr>
					
				    <td>${OrderBaseDto.delivery_name}</td>
				    <td>${OrderBaseDto.delivery_phone}-${OrderBaseDto.delivery_phone2}-${OrderBaseDto.delivery_phone3}</td>
				    <td>${OrderBaseDto.order_post}</td>
					<td>${OrderBaseDto.order_road1}</td>
					<td>${OrderBaseDto.orderDate }</td>
				</tr>
				</c:forEach>
				
		</c:if>
		
		
		<c:if test="${orderBaseListSize eq 0 }">
			<tr>
				<td colspan="5">저장된 배송정보가 없습니다.</td>
			</tr>
		</c:if>
		</tbody>
		<tfoot>
		     <tr>
			<th colspan="5">
				전체 주문에대한정보(${orderBaseListSize })개&nbsp;&nbsp;
		     </th>
		     </tr>
		     
		  
		  
			<c:forEach var="OrderBaseDto" items="${memberBaseList}">
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
			</c:forEach>
		
		     
		</tfoot>
		</table>
		</c:when>

		</c:choose>
		</form> 
	
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	 <script type="text/javascript" src="resources/js/order.js"></script>