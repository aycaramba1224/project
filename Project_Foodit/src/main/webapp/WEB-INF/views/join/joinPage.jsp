<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" >
	<jsp:param value="회원가입" name="title"/>
</jsp:include>
<div class="joinWrap">
	<div class="joinBox">
		<div class="joinTit nbg">
			<h2>회원가입</h2>
			<p class="ng"><span class="warning">*</span> 표시된 항목은 필수로 입력해주세요.</p>
		</div>
		<div class="joinCont ng">
			<form method="post" id="f">
				<table>
					<tbody>
						<tr>
							<th><label for="mId">아이디</label></th>
							<td>
								<span>
									<input type="text" id="mId" name="id"/>
								</span>
								<p id="etId"></p>
							</td>
						</tr>
						<tr>
							<th><label for="mPw">비밀번호</label></th>
							<td>
								<span>	
									<input type="password" id="mPw" name="pw" />
								</span>
								<p id="etPw"></p>
							</td>
						</tr>
						<tr>
							<th><label for="mPwC">비밀번호 재확인</label></th>
							<td>
								<span>	
									<input type="password" id="mPwC" />
								</span>
								<p id="etPwC"></p>
							</td>
						</tr>
						<tr>
							<th><label for="mName">이름</label></th>
							<td>
								<span>	
									<input type="text" id="mName" name="name" />
								</span>
								<p id="etName"></p>
							</td>
						</tr>
						<tr>
							<th><label for="mPhone">휴대폰 번호</label></th>
							<td>
								<span>	
									<input type="text" id="mPhone" name="phone" placeholder="-없이 입력하세요."/>
								</span>
								<p id="etPhone"></p>
							</td>
						</tr>
						<tr>
							<th><label for="mEmail">이메일</label></th>
							<td>
								<span>	
									<input type="text" id="mEmail" name="email" />
								</span>
								<p id="etEmail"></p>
							</td>
						</tr>
						<tr>
							<th><label for="mBirth">생일</label></th>
							<td>
								<span>	
									<input type="text" id="mBirth" name="birth" />
								</span>
								<p id="etBirth"></p>
							</td>
						</tr>
						<tr>
							<th>우편번호</th>
							<td>
								<span>
									<input type="text" id="mPost" name="post" placeholder="우편번호" />
								</span>
								<button type="button" onclick="postCodeSearch()" id="postSearch">우편번호 찾기</button><br/>
								<span>
									<input type="text" id="mRoad" name="road" placeholder="주소" />
								</span><br/>
								<span>
									<input type="text" id="mDetail" name="addr" placeholder="상세주소" />
								</span>
								<span>
									<input type="text" id="mExtra" placeholder="참고항목" />
								</span>
								<p id="etPost"></p>
							<td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="2">
								<button type="button" onclick="location.href='index'">취소</button>
								<button type="button" id="joinBtn">가입하기</button>
							</td>
						<tr>
					</tfoot>
				</table>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript" src="resources/js/join.js"></script>
<!-- bootstrap calendar-->
<script type="text/javascript" src="resources/bootstrap/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="resources/bootstrap/js/bootstrap-datepicker.kr.js"></script>

<!-- daum postCode API -->  
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
<%@ include file="/WEB-INF/views/common/footer.jsp" %>