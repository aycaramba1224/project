<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" >
	<jsp:param value="비밀번호 찾기" name="title"/>
</jsp:include>

<div class="resultWrap">
	<div class="resultTit">
		<h1>임시비밀번호 발급</h1>
		<p>임시비밀번호를 확인하여 필히 로그인 후 개인정보 변경을 하십시오.</p>
	</div>
	<div class="resultCont">
		<div class="resultContWrap">
		<c:choose>
			<c:when test="${ mDto ne null }">
				<c:if test="${ userUpdated eq 'YES' }">
					<p>${ mDto.id }님의 임시비밀번호는 <span id="marsking">${ mDto.pw }</span>입니다.</p>
				</c:if>
				<c:if test="${ userUpdated eq 'NO' }">
					<p>임시 비밀번호 발급이 실패했습니다.</p>
				</c:if>
			</c:when>
			<c:otherwise>
				<p>존재하는 회원 정보가 없습니다.</p>
			</c:otherwise>
		</c:choose>
			<p>잠시 후 푸딧 로그인 페이지로 이동됩니다. [바로가기] 버튼을 클릭하시면 바로 이동됩니다.</p>
		</div>
		<div class="resBtn">
			<button type="button" id="goPage" onclick="location.href='sbmr'">바로가기</button>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>