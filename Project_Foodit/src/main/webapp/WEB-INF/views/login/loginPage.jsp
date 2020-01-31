<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="/WEB-INF/views/common/header.jsp" >
	<jsp:param value="로그인" name="title"/>
</jsp:include>
<div class="loginWrap">
	<div class="loginBox">
		<h1 class="loginTit nbgB">로그인</h1>
		<div class="tabRadMenu nbg">
			<ul>
				<li>
					<div class="radMenu">
						<input type="radio" id="loginMenu01" name="loginChk" checked />
						<label for="loginMenu01">
							<span class="txt">회원 로그인</span>
						</label>
					</div>
				</li>
				<li>
					<div class="radMenu">
						<input type="radio" id="loginMenu02" name="loginChk"/>
						<label for="loginMenu02">
							<span class="txt">비회원 주문조회</span>
						</label>
					</div>
				</li>
			</ul>
		</div>
		<div id="loginM" class="loginCont nbg">
			<form method="post" name="mL">
				<div class="inputArea">
					<input type="text" name="mrId" placeholder="아이디" /> 
				</div>
				
				<div class="inputArea">
					<input type="password" name="mrPw" placeholder="비밀번호" /> 
				</div>
				<div class="cfWrap">
					<div class="chkWrap">
						<input type="checkbox" id="chkSave" name="chkmSave" />
						<label for="chkSave">
							<span class="txt">아이디 저장</span>
						</label> 
					</div>
					<div class="find">
						<a href="#">아이디 찾기</a>
						<a href="#">비밀번호 찾기</a>
					</div>
				</div>
				<div class="btn_wrap"> 
					<button id="loginBtn" onclick="mLogin(this.form)" >
						<span class="nbgB">로그인</span>
					</button>
				</div>
			</form>
		</div>
		<div id="loginNm" class="loginCont nbg" style="display:none">
			<form method="post">
				<div class="inputArea">
					<input type="text" name="mrId" placeholder="주문번호 입력" /> 
				</div>
				<div class="inputArea">
					<input type="password" name="mrPw" placeholder="주문 비밀번호 입력" /> 
				</div>
				<div class="btn_wrap"> 
					<button id="loginBtn" onclick="#" >
						<span class="nbgB">주문조회</span>
					</button>
				</div>
				<div class="btn_noti">
					<ul class="ntList">
						<li>주문 시 입력한 주문비밀번호와 문자로 발송된 주문번호를 입력하시면 주문내역/배송현황을 조회할 수 있습니다.</li>
						<li>비회원으로 구매 시 쿠폰 및 포인트적립 혜택을 받으실 수 없습니다.</li>
						<li>주문번호 및 주문비밀번호를 잊어버리셨다면 COOKIT 고객행복센터 1668-1920로  문의해주세요.</li>
					</ul>
				</div>
			</form>
		</div>
	</div>
</div>	

<script type="text/javascript" src="resources/js/login.js"></script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>