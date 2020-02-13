<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="/WEB-INF/views/common/header.jsp" >
	<jsp:param value="FOODIT 관리자메뉴_공지수정/삭제" name="title"/>
</jsp:include>  

<script type="text/javascript">
	
function noticeModify(f) {
	f.action = "noticeModify";
	f.submit();
	
	var isNoticeModify = "${isNoticeModify}";
	if(isNoticeModify == "Yes"){
		var noticeModifyResult = "${noticeModifyResult}";
		if( noticeModifyResult == 0){
			alert("공지 수정이 실패하였습니다.");
		} else {
			alert("공지 수정이 성공하였습니다.");
		}
	} 
}
	
</script>

	
	<div id="wrap">
	<form method="post">		
		<input type="hidden" name="notice_no" value="${nDto.notice_no }">
		 
			<table border="1"> <!-- 테이블 사이즈 향후 수정예정 -->				
				<tbody>
          		
          			<tr>
						<td>
							제목 : ${nDto.notice_title } <br />
							수정 할 제목 : 필수입력 <br />
							<input type="text" name="notice_title" value="${nDto.notice_title }"/> <br/>						 
						</td>
					</tr>
					<tr>
						<td>
							공지내용 :${nDto.notice_content } <br />
							<textarea name="notice_content" ></textarea> 
						</td>
					</tr>
				</tbody>
			</table>	
			<input type="submit" value="공지사항 수정" onclick="noticeModify(this.form)" />
			<input type="button" value="공지사항 목록" onclick="location.href='noticeList'"/>
		</form>
	</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>