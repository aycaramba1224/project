<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/views/admin/adminPageLmenu.jsp" />

<div class="adminListWrap">
	<div class="adminArea">	
		<div class="adminListTit nbg">
			<h2>고객 목록 조회</h2>
		</div>
		<div class="adminListCont">
			<table>
				<thead>
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>전화번호</th>
						<th>이메일</th>
						<th>생일</th>
						<th>집주소</th>
						<th>가입일</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${ listSize ne 0 }">
						<c:forEach var="mDto" items="${ list }">
							<tr>
								<td>${ mDto.id }</td>
								<td>${ mDto.name }</td>
								<td>${ mDto.phone }</td>
								<td>${ mDto.email }</td>
								<td>${ mDto.birth }</td>
								<td>${ mDto.road }</td>
								<td>${ mDto.reg_date }</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${ listSize eq 0 }">
						<tr>
							<td colspan="6">조회된 고객의 목록이 없습니다.</td>
						</tr>
					</c:if>
				</tbody>			
			</table>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/admin/adminPageRmenu.jsp" %>