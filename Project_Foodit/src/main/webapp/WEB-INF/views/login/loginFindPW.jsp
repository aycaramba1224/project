<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" >
	<jsp:param value="비밀번호 찾기" name="title"/>
</jsp:include>

<div class="findWrap">
	<div class="findBox">
		<div class="findTit nbgB">
			<h1>비밀번호 찾기</h1>
		</div>
		<div class="findFormWrap nbg">
			<form method="post" id="fw">
				<div>
					<h3 class="nbgB">임시 비밀번호 발급</h3>
					<p>입력하신 정보는 임시비밀번호 발급에만 사용되며 <span class="pointTxt">저장되지 않습니다.</span></p>
				</div>
				<ul>
					<li>
						<input type="text" name="id" id="fpId" placeholder="아이디를 입력해주세요." autocomplete="off" />
					</li>
					<li>
						<input type="text" name="birth" id="fpBi" placeholder="법정생년월일 6자리를 입력해주세요." maxlength="6" autocomplete="off" numberOnly />
					</li>
					<li>
						<input type="text" name="phone" id="fpPn" placeholder="휴대전화번호 뒤 7~8자리를 입력해주세요. (01X 제외)" maxlength="8" autocomplete="off" numberOnly />
					</li>
				</ul>
				<div class="findButtonWrap">
					<ul>
						<li>
							<button type="button" id="findPw">임시비밀번호 받기</button>
						</li>
						<li>
							<button type="button" onclick="location.href='sbmFI'">아이디 찾기</button>
						</li>
						<li>
							<button type="button" onclick="location.href='sbmr'">로그인 하기</button>
						</li>
					</ul>
				</div>
			</form>
			
		</div>
	</div>
</div>
<script type="text/javascript" src="resources/js/find.js"></script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>