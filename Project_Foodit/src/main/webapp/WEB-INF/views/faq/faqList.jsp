<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>faq목</title>
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


</script>

</head>
<body>
  <div id="wrap">
        <h3>faq</h3>
    <!--    <div id="search">
            <form action="dynamicQuery" method="POST">
                검색 
                <select name="query">
                    <option value="PRO_NO">게시글번호</option>
                    <option value="PRO_NAME">게시글명</option>
                    <option value="PRO_TASTE">맛</option>
                </select>
                <input type="text" name="content"/>
                <input type="submit" value="검색">
            </form> 
        </div> -->
        <table border="1">
            <thead>
                <tr>
                    <td>글번</td>
                    <td>글제목</td>
                    <td>항목</td>                           
                </tr>
            </thead>
            <tbody>
                <c:if test="${faqListSize eq 0 }">
                <tr>
                    <td colspan="3">등록된 이 없습니다.</td>                  
                </tr>               
                </c:if>
                <c:forEach var="faqDto" items="${faqList }">
                <tr>                    
                    <td>${faqDto.faq_no }</td>
                    <td><a href="faqView?faq_no=${faqDto.faq_no}">${faqDto.faq_title}</a></td>
                    <td>${faqDto.classno }</td>                   
                </tr>
                </c:forEach>
                <tr>
                    <td colspan="3">총 글개수 : ${faqListSize }개</td>
                </tr>               
            </tbody>
            <tfoot>
            <!--  관리자만 보이는 부분  (처리예정)  -->
                <tr>
                    <td colspan="3">    
                        <input type="button" value="등록" onclick="location.href='faqWritePage'"/>
                    </td>                   
                </tr>
            </tfoot>
    	  <!--  관리자만 보이는 부분  (처리예정)  -->
        </table>    
    </div>
</body>
</html>