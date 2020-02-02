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
	 if(f.content2.value==""){
		 alert("비회원주문번호를 입력해주세요");
		 return false;
	 }
	 if(f.content.value==""){
		 alert("비회원비밀번호를 입력해주세요");
		 return false;
	 }
	
	 f.action = "guestSearch";
	 f.submit();
 }
</script>
</head>
<body>
   <div>
    <h1>비회원 주문/배송조회</h1>
    <form method="post">
       
   
    <div>
    <input type="hidden" name="guestquery2" value="order_no"/>
    <input type="text" placeholder="주문번호를 입력해주세요" name="content2" />
    </div>
   
    <div>
    <input type="hidden" name="guestquery" value="guest_pw"/>
    <input type="password" placeholder="주문비밀번호를 입력해주세요" name="content" />
    </div>

     <input type="button" value="비회원주문/배송조회" onclick="guestSearch(this.form)"/>
    </form>
    </div>
</body>
</html>