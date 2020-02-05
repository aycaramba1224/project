<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" >
	<jsp:param value="아이디 찾기" name="title"/>
</jsp:include>

<div class="resultWrap">
	<div class="resultTit">
		<h1>아이디 확인</h1>
		<p>입력하신 정보와 일치하는 아이디는 다음과 같습니다.</p>
	</div>
	<div class="resultCont">
		<div class="resultContWrap">
			<c:if test="${ mDto ne null }">
				<p>${ mDto.name }님의 아이디는 <span id="marsking"></span> 입니다.</p>
			</c:if>
			<c:if test="${ mDto eq null }">
				<p>존재하는 회원 정보가 없습니다.</p>
			</c:if>
			<p>잠시 후 푸딧 로그인 페이지로 이동됩니다. [바로가기] 버튼을 클릭하시면 바로 이동됩니다.</p>
		</div>
		<div class="resBtn">
			<button type="button" id="goPage" onclick="location.href='sbmr'">바로가기</button>
		</div>
	</div>
</div>
<script>
	var maskingId = "${mDto.id}";
	var pattern = /.{2}$/; // 정규식
	maskingId = maskingId.replace(pattern, "**");
	document.getElementById("marsking").innerText = maskingId + "님";
	setInterval(function (){
		window.location.href="sbmr";
	}, 5000);
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>