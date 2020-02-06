<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/myFooditLM.jsp" />

<script type="text/javascript">
var flag = "${flag}";
if( flag == "1" ){
	alert("패스워드가 일치하지 않습니다.");
}
</script>

<div class="reqInfoWrap">
	<div class="reqInfoTit">
		<h3>개인 정보 변경</h3>
		<p>회원님의 소중한 정보를 안전하게 관리하세요.</p>
	</div>
	<div class="reqInfoCont">
		<div class="reqInfoArea">
			<p>회원정보를 수정하려면 비밀번호를 입력하셔야합니다.</p>
			<p>회원님의 개인정보 보호를 위한 본인 확인 절차이오니, 로그인 시 사용하시는 비밀번호를 입력해주세요.</p>
			<div class="reqInput">
				<form id="rqF">
					<div class="reqForm">
						<input type="password" name="pw" id="rPw" placeholder="비밀번호를 입력해주세요."/>
						<ul>
							<li><button type="button" onclick="location.href='index'">취소</button></li>
							<li><button type="button" id="reqPw" >확인</button></li>
						</ul>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="resources/js/memberOpe.js"></script>
<%@ include file="/WEB-INF/views/common/myFooditRC.jsp" %>