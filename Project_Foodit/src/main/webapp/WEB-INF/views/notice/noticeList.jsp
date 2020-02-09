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
</head>
<body>
  <div id="wrap">
        <h1>고객행복센터</h1>
        <hr/>
        <div id="메뉴바">
            <a href="faqList">FAQ</a>  <a href="noticeList">공지사항</a> 
        </div>        
        <table border="1">
            <thead>
                <tr>
                    <td>번호</td>
                    <td>제목</td>
                    <td>등록일자</td>                           
                </tr>
            </thead>
            <tbody>
                <c:if test="${noticeListCount eq 0 }">
                  <tr>
                    <td colspan="3">등록된 글이 없습니다.</td>                  
                  </tr>               
                </c:if>
                <c:forEach var="noticeDto" items="${noticeList }">
                 <tr>                    
                    <td>${noticeDto.notice_no }</td>
                    <td><a href="noticeView?notice_no=${noticeDto.notice_no}">${noticeDto.notice_title}</a></td>
                    <td>${noticeDto.notice_date }</td>
                 </tr>
                </c:forEach>
            </tbody>
            <tfoot>
                 <c:if test="${mDto.role == 'admin' }">    
                    <input type="button" value="공지사항등록" onclick="location.href='noticeWritePage'"/>  
                 </c:if> 
            </tfoot>
        </table>    
    </div>
   	<!-- 페이징처리 예정 -->
	<br />
    ${pagingView }
    <br />
        


</body>
</html>
