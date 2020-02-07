<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<jsp:include page="/WEB-INF/views/common/header.jsp" >
	<jsp:param value="비회원 주문번호 찾기" name="title"/>
</jsp:include>
   
   <form method="post" action="order_noSearch">
    <div>
    <input type="hidden" name="guestquery" value="order_name"/>
    <input type="text" placeholder="주문이름를 입력해주세요" name="content" />
    <input type="submit"value="확인" />
    </div>
     
</form>
       

<%@ include file="/WEB-INF/views/common/footer.jsp" %>