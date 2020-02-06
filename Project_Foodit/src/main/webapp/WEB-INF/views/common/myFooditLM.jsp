<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" >
	<jsp:param value="MY푸딧" name="title"/>
</jsp:include>
		<div class="leftMenu">
			<h2 class="leftTit nbgB">MY푸딧</h2>
			<dl class="myMenu">
				<dt>나의 주문정보</dt>
				<dd>
					<ul class="menuList">
						<li><a href="" >주문/배송 조회</a></li>
						<li><a href="" >취소/반품 조회</a></li>
						<li><a href="" >배송지 관리</a></li>
					</ul>
				</dd>
			</dl>
			<dl class="myMenu">
				<dt>나의 활동</dt>
				<dd>
					<ul class="menuList">
						<li><a href="" >1:1 문의</a></li>
						<li><a href="" >리뷰</a></li>
						<li><a href="" >나의 맛취향</a></li>
					</ul>
				</dd>
			</dl>
			<dl class="myMenu">
				<dt>나의 정보</dt>
				<dd>
					<ul class="menuList"> 
						<li><a href="memModiPage">개인정보 변경</a></li>
						<li><a href="memDelePage">회원 탈퇴</a></li>
					</ul>
				</dd>
			</dl>
		</div>
		<div class="rightCont">
