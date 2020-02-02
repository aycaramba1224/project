<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비회원 주문 조회</title>
<script>
 function guestSearch(f){
	 location.href='guestSearch?guest_pw=${guest_pw}';
 }
</script>
</head>
<body>
    <form method="post">
       
   <!--  
    <div>
    <input type="text"  placeholder="주문번호입력해주세요" id="order_no" />
    </div>
   -->
    <div>
    <input type="text" placeholder="주문비밀번호를 입력해주세요" id="guest_pw" />
    </div>

     <input type="button" value="비회원주문/배송조회" onclick="guestSearch(this.form)"/>
    </form>
</body>
</html>