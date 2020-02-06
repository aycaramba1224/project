<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/views/common/myFooditLM.jsp" />

<div class="modiWrap">
	<div class="modiBox">
		<div class="modiTit nbg">
			<h2>개인정보 변경</h2>
		</div>
		<div class="modiCont ng">
			<form method="post" id="mf">
				<table>
					<tbody>
						<tr>
							<th>아이디</th>
							<td>
								${ sessionScope.mDto.id }
								<input type="hidden" value="${ sessionScope.mDto.id }" name="id" />
							</td>
						</tr>
						<tr>
							<th>
								비밀번호
								<button type="button" id="btnPw">변경</button>
							</th>
							<td class="hide">
								<span>	
									<input type="password" id="moPw" name="pw" placeholder="새로운 비밀번호를 입력해주세요."/>
								</span>
								<p id="eotPw"></p>
							</td>
						</tr>
						<tr class="hide">
							<th>비밀번호 재확인</th>
							<td>
								<span>	
									<input type="password" id="moPwC" placeholder="새로운 비밀번호를 재입력해주세요."/>
								</span>
								<p id="eotPwC"></p>
							</td>
						</tr>
						<tr>
							<th>이름</th>
							<td>
								${ sessionScope.mDto.name }
							</td>
						</tr>
						<tr>
							<th>휴대폰 번호</th>
							<td>
								<span>	
									<input type="text" id="moPhone" name="phone" value="${ sessionScope.mDto.phone }" placeholder="- 를 포함한 숫자만 입력하세요."/>
								</span>
								<p id="eotPhone"></p>
							</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>
								<span>	
									<input type="text" id="moEmail" name="email" value="${ sessionScope.mDto.email }" />
								</span>
								<p id="eotEmail"></p>
							</td>
						</tr>
						<tr>
							<th>생일</th>
							<td>
								<span>	
									<input type="text" id="moBirth" name="birth" value="${ sessionScope.mDto.birth }" />
								</span>
								<p id="eotBirth"></p>
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="2">
								<button type="button" id="cancelBtn">취소</button>
								<button type="button" id="modiBtn">수정</button>
							</td>
						<tr>
					</tfoot>
				</table>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript" src="resources/js/memberOpe.js"></script>
<!-- bootstrap calendar-->
<script type="text/javascript" src="resources/bootstrap/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="resources/bootstrap/js/bootstrap-datepicker.kr.js"></script>


<%@ include file="/WEB-INF/views/common/myFooditRC.jsp" %>