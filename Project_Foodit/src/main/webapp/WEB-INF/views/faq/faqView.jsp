<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="wrap"> 
        <form action="faqModify" method="POST">
            <table border="1">              
                <tbody>
                    <tr>
                        <td>글번호</td>
                        <td>${faqDto.faq_no }
                             <input type="hidden" name="faq_no" value="${faqDto.faq_no }"/>  
                        </td>
                    </tr>
                    <tr>
                        <td>글제목</td>
                        <td><input type="text" name="faq_name" value="${faqDto.faq_name }"/></td>
                    </tr>
                 
                    <tr>
                        <td>글내용</td>
                        <!--★ 사이즈 변경예정 ★-->
                        <td><textarea rows="10" cols="10" name="faq_content" >${faqDto.faq_content }</textarea></td>
                    </tr>
                             
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="2">
                        <!-- 관리자만 보이는 부분  (처리예정)-->
                            <input type="submit" value="게시글 수정" />
                            <input type="button" value="게시글  삭제" onclick="faqRemove()"/>
                        <!-- 관리자만 보이는 부분  (처리예정)--> 
                            <input type="button" value="게시글 목록" onclick="location.href='faqList'"/>
                        </td>                   
                    </tr>
                </tfoot>
            </table>    
        </form>
    </div>
</body>
</html>