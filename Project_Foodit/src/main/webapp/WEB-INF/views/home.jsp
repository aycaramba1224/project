<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
    
	
	 <input type="button" value="비회원 주문/배송 조회하기" onclick="location.href='guestSearchPage'" />
	<!--   <input type="button" value="주문하기" onclick="location.href='orderInsertPage'"/>-->
	  <input type="button" value="회원주문내역" onclick="location.href='memberOrderlistPage'" />
	 
	  
		&nbsp;
		<input type="button" value="상품 전체 목록" onclick="location.href='productList'" />	
		<input type="button" value="상품 검색" onclick="location.href='productSearch'" />	
		&nbsp;	
		<input type="button" value="장바구니" onclick="location.href='cartMain'" />	
				 
		
		&nbsp;
		<input type="button" value="faq" onclick="location.href='faqList'" />
		<input type="button" value="공지사항" onclick="location.href='noticeList'" />
		<input type="button" value="리뷰" onclick="location.href='reviewList'" />
		
		&nbsp;
		<input type="button" value="관리자페이지" onclick="location.href='adminPage'" />
		<input type="button" value="메인페이지" onclick="location.href='main'" />
 


</body>
</html>
