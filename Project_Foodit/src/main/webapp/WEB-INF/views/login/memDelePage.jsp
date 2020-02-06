<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/myFooditLM.jsp" />

<div class="deleWrap">
	<div class="deleBox">
		<div class="deleTit nbgB">
			<h2>회원탈퇴</h2>
		</div>
		<div class="deleCont ng">
			<h3>FOOIT 서비스를 이용해주셔서 감사합니다.</h3>
			<p>'회원탈퇴'버튼을 선택해주세요.</p>
		</div>
		<form id="df">
			<input type="hidden" value="${ sessionScope.mDto.id }" name="id" />
		</form>
		<div class="delBtn">
			<button type="button" id="delBtnSend" >회원탈퇴</button>
		</div>
	</div>
</div>
<script type="text/javascript" src="resources/js/memberOpe.js"></script>
<!-- bootstrap calendar-->
<script type="text/javascript" src="resources/bootstrap/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="resources/bootstrap/js/bootstrap-datepicker.kr.js"></script>

<%@ include file="/WEB-INF/views/common/myFooditRC.jsp" %>