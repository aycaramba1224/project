<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
    
<jsp:include page="/WEB-INF/views/common/header.jsp" >
    <jsp:param value="FOODIT 메뉴" name="title"/>
</jsp:include> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>NOTICE VIEW</title>
<script type="text/javascript">
    function noticeDelete() {
        var check = confirm("삭제하시겠습니까?");
        if(check) {
            location.href="noticeDelete?notice_no=${nDto.notice_no}";
        }
    }


</script>
</head>
<body>
 <div id="wrap">
        <h1>고객행복센터</h1>
        <hr/>
        <div id="메뉴바">
            <a href="faqList">FAQ</a> <a href="noticeList">공지사항</a> 
        </div>        
        
        <form action="noticeModify" method="POST">
            <div id="title">
                <a>${nDto.notice_title }</a><br/>
                <a>${nDto.notice_date }</a>
            </div>
            <div id="content">
                <a>${nDto.notice_content }</a>
              <img alt="${nDto.notice_img }" src="${pageContext.request.contextPath }/resources/upload/${nDto.notice_img }"style="width:780px; height:7500px;"/>
            </div>
            <div id="goList">
                <a href="noticeList">목록</a>
            </div>
                <c:if test="${mDto.role == 'admin' }">    
                    <input type="button" value="공지사항삭제" onclick="noticeDelete()"/>  
                    <input type="submit" value="공지사항수정" />
                </c:if> 
        </form>
    </div>
</body>
</html>