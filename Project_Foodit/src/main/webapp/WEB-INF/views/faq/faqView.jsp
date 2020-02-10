<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FAQ VIEW</title>
<script type="text/javascript">
 function faqDelete() {
     var check=confirm("삭제하시겠습니까?");
     if(check) {
         location.href="faqDelete?faq_no=${fDto.faq_no}";
     }
 } 
</script>
</head>
<body>
<div id="wrap"> 
        <form action="faqModify" method="POST">
            <table border="1">              
                <tbody>
                    <tr>
                        <td>글 번호</td>
                        <td>${fDto.faq_no }
                             <input type="hidden" name="faq_no" value="${fDto.faq_no }"/>  
                        </td>
                    </tr>
                    <tr>
                        <td>제목</td>
                        <td><input type="text" name="faq_title" value="${fDto.faq_title }"/></td>
                    </tr>
                 
                    <tr>
                        <td>내용</td>
                        <!--★ 사이즈 변경예정 ★-->
                        <td><textarea rows="10" cols="10" name="faq_content" >${fDto.faq_content }</textarea></td>
                    </tr>
                    <tr>
                        <td>항목</td>
                        <td>${fDto.faq_category }
                            <input type="hidden" name="faq_category" value="${fDto.faq_category }"/>
                        </td>
                    </tr>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="2">
                            <input type="submit" value="게시글 수정" />
                            <input type="button" value="게시글 삭제" onclick="faqDelete()"/>
                            <input type="button" value="게시글 목록" onclick="location.href='faqList'"/>
                        </td>                   
                    </tr>
                </tfoot>
            </table>    
        </form>
    </div>
</body>
</html>
