<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
	<jsp:include page="/WEB-INF/views/common/header.jsp" >
	    <jsp:param value="주문/배송 조회 리스트 자세히 볼 수 있는 페이지" name="title"/>
      </jsp:include>

   
	<form method="post" action="orderListModify" name="f">
	       <h1>주문자 정보</h1>
			<table border="1">
		
				<tbody>
					<tr>
						<td>주문번호
							${orderBaseDto.order_no }
							<input type="hidden" name="order_no" value="${orderBaseDto.order_no }"/>
						</td>
					</tr>
					  
					 <tr>
					 <td>주문비밀번호
					 ${orderBaseDto.guest_pw }
					 <input type="hidden" name="guest_pw" value="${orderBaseDto.guest_pw}"/>
					 </td>
					 </tr>
					 
					<tr>
						<td>주문자이름
						<input type="text" name="order_name" value="${orderBaseDto.order_name}"/>
						</td>
					</tr>
					
					<tr>
						<td>휴대폰
						<input type="text" name="order_phone" value="${orderBaseDto.order_phone}"/>-
						<input type="text" name="order_phone2" value="${orderBaseDto.order_phone2}"/>-
						<input type="text" name="order_phone3" value="${orderBaseDto.order_phone3}"/>
						</td>
					</tr>
					
					<tr>
						<td>이메일
						<input type="text" name="order_email" value="${orderBaseDto.order_email}"/>
						<input type="text" name="order_email2" value="${orderBaseDto.order_email2}"/>
						</td>
					</tr>

					</tbody>
					</table>
					
					 <h1>상품정보</h1>
					<h1>배송정보</h1>
					<table border="1">
					
					 <tr>
						<td>배송자이름
						<input type="text" name="delivery_name" value="${orderBaseDto.delivery_name}"/>
						</td>
					</tr>
					
					<tr>
						<td>배송자휴대폰
						<input type="text" name="delivery_phone" value="${orderBaseDto.delivery_phone}"/>-
						<input type="text" name="delivery_phone2" value="${orderBaseDto.delivery_phone2}"/>-
						<input type="text" name="delivery_phone3" value="${orderBaseDto.delivery_phone3}"/>
						</td>
					</tr>
				
					<tr>
						<td>우편번호
				<input type="text" id="sample4_postcode" placeholder="우편번호" name="order_post" value="${orderBaseDto.order_post}" />
			    <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br></td>
					</tr>
					
					<tr>
				    <td>주소
		           <input type="text" id="sample4_roadAddress" placeholder="주소"  name="order_road1" size="70"value="${orderBaseDto.order_road1}" />
		          </td>
					</tr>
				
					<tr>
					<td>
					  ${OrderBaseDto.orderDate}
					</td>
					</tr>
					
					<tr>
						<td colspan="5">
						    <input type="button" value="주문 정보보기" onclick="location.href='orderBaseList'" />
						    <input type="submit" value="주문정보 수정" />
							<input type="button" value="주문정보 삭제" onclick="orderDelete()" />
						</td>
					</tr>
					</tbody>
					</table>
					</form>
					
   <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="resources/js/order.js"></script>

		