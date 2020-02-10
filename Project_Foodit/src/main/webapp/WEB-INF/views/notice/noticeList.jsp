<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="/WEB-INF/views/common/header.jsp" >
    <jsp:param value="FOODIT 메뉴" name="title"/>
</jsp:include> 

<script type="text/javascript">

var iNoticeModify = "${isNoticeModify}";
if(isFaqModify == "Yes"){
    var noticeModifyRes = "${noticeModifyRes}";
    if(noticeModifyRes == 0){
        alert(" 글수정이 실패하였습니다.");
    } else {
        alert(" 글수정이 성공하였습니다.");
    }
} 
    var isNoticeInsert = "${isNoticeInsert}";
if(isNoticeInsert == "Yes"){
    var noticeInsertRes = "${noticeInsertRes}";
    if(noticeInsertRes == 0){
        alert("글 등록이 실패하였습니다.");
    } else {
        alert("글 등록이 성공하였습니다.");
    }
}
var isNoticeDelete = "${isNoticeDelete}";
if(isNoticeDelete == "Yes"){
    var noticeDeleteRes ="${noticeDeleteRes}";
    if(noticeDeleteRes == 0 ){
        alert("글 삭제가 실패하였습니다.");
    } else {
        alert("글 삭제가 성공하였습니다.");   
    }
}   
</script>

<div id="noticeWrap">
	<h1>고객행복센터</h1>
	<div class="tabWrap">
		<ul class="tabs">
			<li>
				<a href="faqList"><span>FAQ</span></a>
			</li>
			<li class="on">
				<a href="noticeList"><span>공지사항</span></a>
			</li>
		</ul> 
	</div>  
	<div class="noticeCont">
        <table>
        	<colgroup>
        		<col width="10%">
        		<col width="*">
        		<col width="15%">
        	</colgroup>
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>등록일자</th>                           
                </tr>
            </thead>
            <tbody>
                <c:if test="${noticeListCount eq 0 }">
                  <tr>
                    <td colspan="3" class="noticeTit">등록된 글이 없습니다.</td>                  
                  </tr>               
                </c:if>
                <c:forEach var="noticeDto" items="${noticeList }">
                 <tr>                    
                    <td>${noticeDto.notice_no }</td>
                    <td class="noticeTit"><a href="noticeView?notice_no=${noticeDto.notice_no}">${noticeDto.notice_title}</a></td>
                    <td>${noticeDto.notice_date }</td>
                 </tr>
                </c:forEach>
            </tbody>
            
        </table>    
	</div>
	<%-- 관리자 권한에 따른 글 수정 권한 --%>
	<%-- 관리자 페이지로 빼세요! --%>
	<c:if test="${mDto.role == 'admin' }">    
		<button type="button" onclick="location.href='noticeWritePage'">
			공지사항등록
		</button>  
    </c:if> 
	<%-- 페이징 처리 예정--%>
	<div class="pageNavi">
		<%-- 여기에 작업 --%>	
	</div>
</div>


