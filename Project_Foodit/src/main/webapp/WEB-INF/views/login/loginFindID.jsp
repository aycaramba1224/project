<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" >
	<jsp:param value="아이디 찾기" name="title"/>
</jsp:include>

<div class="findWrap">
	<div class="findBox">
		<div class="findTit nbgB">
			<h1>아이디 찾기</h1>
		</div>
		<div class="findFormWrap nbg">
			<form method="post" id="fi">
				<div>
					<h3 class="nbgB">회원 아이디 찾기</h3>
					<p>입력하신 정보는 아이디 찾기에만 사용되며 <span class="pointTxt">저장되지 않습니다.</span></p>
				</div>
				<ul>
					<li>
						<input type="text" name="name" id="fiNm" placeholder="이름을 입력해주세요." autocomplete="off" />
					</li>
					<li>
						<input type="text" name="birth" id="fiBi" placeholder="법정생년월일 6자리를 입력해주세요." maxlength="6" autocomplete="off" numberOnly />
					</li>
					<li>
						<input type="text" name="phone" id="fiPn" placeholder="휴대전화번호 뒤 7~8자리를 입력해주세요. (01X 제외)" maxlength="8" autocomplete="off" numberOnly />
					</li>
				</ul>
				<div class="findButtonWrap">
					<ul>
						<li>
							<button type="button" id="findId">아이디 찾기</button>
						</li>
						<li>
							<button type="button" onclick="location.href='sbmFP'">비밀번호 찾기</button>
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