<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
    
		<input type="button" value="비회원" onclick="location.href='guestList'" />
		<input type="button" value="비회원 조회하기"  onclick="location.href=''" />
		<input type="button" value="주문하기" onclick="location.href='orderInsertPage'"/>
		
		
		     
		&nbsp;
		<input type="button" value="상품 전체 목록" onclick="location.href='productList'" />	
		<input type="button" value="상품 검색" onclick="location.href='productSearch'" />	
		&nbsp;	
		<input type="button" value="장바구니 목록" onclick="location.href='cartList'" />	
		
		
		
		&nbsp;
		<input type="button" value="faq" onclick="location.href='faqList'" />

</body>
</html>
