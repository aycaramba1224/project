<%@page import="com.koreait.foodit.dao.CartDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	// title 처리
	String title = "Foodit";
	request.setCharacterEncoding("utf-8");
	String paramTitle = request.getParameter("title");
	if( paramTitle != null && !paramTitle.isEmpty() ){
		title = paramTitle;
	}
	// EL 사용을 위해서
	pageContext.setAttribute("title", title);
 
%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${ title }</title>
<link href="<c:url value="/resources/css/slide.css" />" type="text/css" rel="stylesheet" >
<link href="<c:url value="/resources/css/common.css" />" type="text/css" rel="stylesheet" >
<link href="<c:url value="/resources/css/join.css" />" type="text/css" rel="stylesheet" >
<link href="<c:url value="/resources/css/login.css" />" type="text/css" rel="stylesheet" >
<link href="<c:url value="/resources/css/find.css" />" type="text/css" rel="stylesheet" >
<link href="<c:url value="/resources/css/myInfo.css" />" type="text/css" rel="stylesheet" >
<link href="<c:url value="/resources/css/cart.css" />" type="text/css" rel="stylesheet" >
<link href="<c:url value="/resources/css/menuSearch.css" />" type="text/css" rel="stylesheet" >
<link href="<c:url value="/resources/css/faq.css" />" type="text/css" rel="stylesheet" >
<link href="<c:url value="/resources/css/product.css" />" type="text/css" rel="stylesheet" >
<link href="<c:url value="/resources/css/admin.css" />" type="text/css" rel="stylesheet" >
<link rel="shortcut icon" href="#" type="image/x-icon">
<link href="<c:url value="/resources/bootstrap/css/datepicker3.css" />" type="text/css" rel="stylesheet" >
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="resources/js/common.js"></script>
<script type="text/javascript">
// logout alert
var isLogout = "${isLogout}"
if(isLogout == "yes"){
	alert("로그아웃 되었습니다.");
}

</script>
</head>
<body>
	<div id="container">
		<div id="header">
			<div class="gnbWrap">
				<div class="gnbUtil">
					<div class="utilWrap nbg">
					<c:if test="${ sessionScope.mDto eq null }">
						<ul>
							<li><a href="sbm02">회원가입</a></li>
							<li><a href="sbmr">로그인</a></li>
							<li><a href="faqList">고객행복센터</a></li>
							<li><a href="">배송지역검색</a></li>
						</ul>
					</c:if>
					<c:if test="${ sessionScope.mDto ne null }">
						<ul>
							<li>${ sessionScope.mDto.name }님</li>
							<li><a href="logout">로그아웃</a></li>
							<li><a href="faqList">고객행복센터</a></li>
							<li><a href="">배송지역검색</a></li>
						</ul>
					</c:if>
					</div>
				</div>
				<div class="gnbMenu">
				 	<h1 class="logo">
				 	 	<a href="main">로고</a>
				 	</h1>
				 	<ul class="gnbList nbgB">
				 		<li><a href="#" onclick="return false;">FOODIT 소개</a></li>
				 		<li><a href="productList"><span class="red_dot">FOODIT 메뉴</span></a></li>
				 		<li><a href="reviewList">리뷰</a></li>
				 		<c:choose>
					 		<c:when test="${ sessionScope.mDto.role eq 'admin' }">
					 			<li><a href="adminPage">관리자푸딧</a></li>
					 		</c:when>
					 		<c:when test="${ sessionScope.mDto ne null }">
					 			<li><a href="sbmf">MY푸딧</a></li>
					 		</c:when>
					 		<c:otherwise>
					 			<li><a href="sbmr">MY푸딧</a></li>
					 		</c:otherwise>				 		
				 		</c:choose>				 		
				 	</ul>
				 	<div class="gnbSide nbg">
						<ul>
							<li class="sideCart">		
							 	<c:choose>
							 		<c:when test="${ mDto.id ne null }">
							 			<a href="cartList">							 
									<span class="txt">장바구니</span>
									<span class="num" id="headerCartCount">
										<!-- 장바구니 갯수 카운트 넣을 것.(0 지우고 작업하세요.) -->
										<c:choose>
											<c:when test="${cartListSize eq null}">
												0	
											</c:when>
											<c:otherwise>
												${cartListSize }
											</c:otherwise>
										</c:choose>										
									</span>
								</a>	
							 		</c:when>
							 		<c:otherwise>
							 			<c:choose> 
							 				<c:when test="${guestCartListSize eq null}"> 
							 					<a href="cartMain"></a>
							 				</c:when>
							 				<c:otherwise>
							 					<a href="guestCartList"></a>	
							 				</c:otherwise>
							 			</c:choose>							 
									<span class="txt">장바구니</span>
									<span class="num" id="headerCartCount">
										<!-- 장바구니 갯수 카운트 넣을 것.(0 지우고 작업하세요.) -->
										<c:choose>
											<c:when test="${guestCartListSize eq null}">
												0
											</c:when>
											<c:otherwise>
												${guestCartListSize }
											</c:otherwise>
										</c:choose>										
									</span>
								</a>	
							 		</c:otherwise>
							 	</c:choose>									 							 							
							</li>
							<li class="sideFind">
								<a href="productSearch">
									<span class="txt">메뉴찾기</span>
								</a>
							</li>
						</ul>				 	
				 	</div>
				</div>
			</div>
		</div>
		<div id="myContainer">
			<div id="content" class="myContent">
				<div id="main">