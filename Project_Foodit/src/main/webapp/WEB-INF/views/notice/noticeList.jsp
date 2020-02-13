<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="/WEB-INF/views/common/header.jsp" >
    <jsp:param value="FOODIT 메뉴" name="title"/>
</jsp:include> 

<script type="text/javascript">

var iNoticeModify = "${isNoticeModify}";
if(isNoticeModify == "Yes"){
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
                <c:forEach var="nDto" items="${noticeList }">
                 <tr>                    
                    <td>${nDto.notice_no }</td>
                    <td class="noticeTit"><a href="noticeView?notice_no=${nDto.notice_no}">${nDto.notice_title}</a></td>
                    <td>${nDto.notice_date }</td>
                 </tr>
                </c:forEach>
            </tbody>
            
        </table>    
	</div>

	<%-- 페이징 처리 예정--%>
		<div class="pageNavi">
		<div class="pagingWrap">
    		${pagingView }
   		</div>
   	</div>
</div>
        
<%@ include file="/WEB-INF/views/common/footer.jsp" %>