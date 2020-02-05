<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/myFooditLM.jsp" />

<div class="myMain">
	<div class="mainTop">
		<div class="topInfo">
			<div class="name">${ sessionScope.mDto.name }님</div>
		</div>
		<div class="bottomInfo">
			<ul class="myFHInfo">
			</ul>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/myFooditRC.jsp" %>