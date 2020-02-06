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
<link href="<c:url value="/resources/css/common.css" />" type="text/css" rel="stylesheet" >
<link href="<c:url value="/resources/css/join.css" />" type="text/css" rel="stylesheet" >
<link href="<c:url value="/resources/css/login.css" />" type="text/css" rel="stylesheet" >
<link href="<c:url value="/resources/css/find.css" />" type="text/css" rel="stylesheet" >
<link href="<c:url value="/resources/css/myInfo.css" />" type="text/css" rel="stylesheet" >
<link rel="shortcut icon" href="#" type="image/x-icon">
<link href="<c:url value="/resources/bootstrap/css/datepicker3.css" />" type="text/css" rel="stylesheet" >
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
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
							<li><a href="/foodit/sbm02">회원가입</a></li>
							<li><a href="/foodit/sbmr">로그인</a></li>
							<li><a href="">고객행복센터</a></li>
							<li><a href="">배송지역검색</a></li>
						</ul>
					</c:if>
					<c:if test="${ sessionScope.mDto ne null }">
						<ul>
							<li>${ sessionScope.mDto.name }님</li>
							<li><a href="/foodit/logout">로그아웃</a></li>
							<li><a href="">고객행복센터</a></li>
							<li><a href="">배송지역검색</a></li>
						</ul>
					</c:if>
					</div>
				</div>
				<div class="gnbMenu">
				 	<h1 class="logo">
				 	 	<a href="/foodit/index">로고</a>
				 	</h1>
				 	<ul class="gnbList nbgB">
				 		<li><a href="">FOODIT 소개</a></li>
				 		<li><a href="productList"><span class="red_dot">FOODIT 메뉴</span></a></li>
				 		<li><a href="">리뷰</a></li>
				 		<li><a href="">이벤트</a></li>
				 		<c:if test="${ sessionScope.mDto eq null }">
				 			<li><a href="/foodit/sbmr">MY푸딧</a></li>
				 		</c:if>
				 		<c:if test="${ sessionScope.mDto ne null }">
				 			<li><a href="/foodit/sbmf">MY푸딧</a></li>
				 		</c:if>
				 	</ul>
				 	<div class="gnbSide nbg">
						<ul>
							<li class="sideCart">							
									<a href="cartMain">
									<span class="txt">장바구니</span>
									<span class="num" id="headerCartCount">
										<!-- 장바구니 갯수 카운트 넣을 것.(0 지우고 작업하세요.) -->
										${cartListSize }
									</span>
								</a>								 							
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
		<div id="main">