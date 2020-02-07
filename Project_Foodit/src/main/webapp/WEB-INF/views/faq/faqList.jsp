<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<jsp:include page="/WEB-INF/views/common/header.jsp" >
    <jsp:param value="FOODIT 메뉴" name="title"/>
</jsp:include>



<script type="text/javascript">

var isFaqModify = "${isFaqModify}";
if(isFaqModify == "yes"){
    var faqModifyRes = "${faqModifyRes}";
    if(faqModifyRes == 0){
        alert("게시글 수정이 실패하였습니다.");
    } else {
        alert("게시글 수정이 성공하였습니다.");
    }
} 
    var isFaqInsert = "${isFaqInsert}";
if(isFaqInsert == "yes"){
    var faqInsertRes = "${faqInsertRes}";
    if(faqInsertRes == 0){
        alert("게시글 등록이 실패하였습니다.");
    } else {
        alert("게시글 등록이 성공하였습니다.");
    }
}
var isFaqDelete = "${isFaqDelete}";
if(isFaqDelete == "yes"){
    var faqDeleteRes ="${faqDeleteRes}";
    if(faqDeleteRes == 0 ){
        alert("게시글 삭제가 실패하였습니다.");
    } else {
        alert("게시글 삭제가 성공하였습니다.");   
    }
}  
 function faqSearch(f) {
	 if(f.content.value==""){
		alert("검색어를 입력해 주세요.");
		return;
	 }				
	 
	 f.action = "faqSearchResult"; 
	 f.submit();

 }
</script>
<style type="text/css">
	#faqWrap ul li {list-style-type: none; float:left; margin-left:20px;}
</style>
</head>
<body>
     <div id="faqWrap">
        <br/>
        <h1>고객행복센터</h1>
        <hr/>
        <br/>
        <div id="메뉴바">
            <a href="faqList">FAQ</a><a href="noticeList">공지사항</a> 
        </div>  
        <div id="검색박스">
            <form method="POST">
                <input type="hidden" name="query" value="faq_title"/>            
                <input type="text" name="content" placeholder="FAQ를 검색해 주세요."/>
                <input type="button" value="검색" onclick="faqSearch(this.form)"> <!-- 돋보기 아이콘으로 대체 예정  -->
            </form>  
        </div>      
      	<jsp:include page="/WEB-INF/views/faq/faqOrder.jsp"/>   <!-- 카테고리 정렬 -->
       <br/>
       <c:if test="${mDto.role == 'admin' }">    
           <input type="button" value="FAQ등록" onclick="location.href='faqWritePage'"/>  
       </c:if>
        <br/>
        <c:if test="${faqListCount eq 0 }">
          <tr>
            <td colspan="3">등록된 글이 없습니다.</td>                  
          </tr>               
        </c:if>
       <c:forEach var="faqDto" items="${faqList }">
        <tr>                    
           <td>${faqDto.faq_no }</td>
           <td><a href="faqView?faq_no=${faqDto.faq_no}">${faqDto.faq_title}</a></td>
        </tr><br/>
       </c:forEach>   
</div>



                       
