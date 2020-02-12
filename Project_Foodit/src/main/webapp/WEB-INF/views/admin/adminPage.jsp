<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" >
	<jsp:param value="관리자페이지" name="title"/>
</jsp:include>
		<div class="leftMenu">
			<h2 class="leftTit nbgB">관리자페이지</h2>
			<dl class="myMenu">
				<dt>상품 정보</dt>
				<dd>
					<ul class="menuList">
						<li><a href="productList" >상품목록(수정/삭제)</a></li>					 
						<li><a href="productInsertPage" >상품등록</a></li>					 
					</ul>
				</dd>
			</dl>
			<dl class="myMenu">
				<dt>고객 정보</dt>
				<dd>
					<ul class="menuList">
						<li><a href="" >1:1 문의</a></li>
						<li><a href="" >리뷰</a></li>
						<li><a href="" >나의 맛취향</a></li>
					</ul>
				</dd>
			</dl>
			<dl class="myMenu">
				<dt>게시판 정보</dt>
				<dd>
					<ul class="menuList">
						<li><a href="" >1:1 문의</a></li>
						<li><a href="reviewList" >리뷰목록</a></li>
						<li><a href="noticeList" >공지사항 목록</a></li>
						<li><a href="noticeWritePage" >공지사항 글쓰기</a></li>
						<li><a href="faqList" >FAQ 목록</a></li>
						<li><a href="faqWritePage" >FAQ 글쓰기</a></li>
					</ul>
				</dd>
			</dl>
		<div class="rightCont">
		
				</div>
	</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>