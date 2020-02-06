<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FAQ WRITE</title>
<script type="text/javascript">
    function faqWrite(f){
        f.action="faqWrite";
        f.submit();     
    }
</script>
</head>
<body>
<div id="wrap">        
        <form method="POST">
            <table border="1">              
                <tbody>
                    <tr>
                        <td>글제목</td>
                        <td><input type="text" name="faq_title"/></td>
                    </tr>
                    <tr>
                        <td>글내용</td>
                        <!--★ 사이즈 변경예정 ★-->
                        <td><textarea rows="10" cols="10" name="faq_content"></textarea></td>
                    </tr>   
                    <tr>                   
                        <td>카테고리선택</td>
                        <td><select name="faq_category">
                          <option value="">카테고리선택</option>
                          <option value="배송">배송</option>
                          <option value="결제">결제</option>
                          <option value="주문">주문</option>
                          <option value="취소/반품">취소/반품</option>
                          <option value="리뷰">리뷰</option>
                          <option value="회원">회원</option>
                          <option value="기타">기타</option>
                        </select></td>
                    </tr>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="2">
                            <input type="button" value="게시글 등록" onclick="faqWrite(this.form)"/>
                            <input type="button" value="게시글 목록" onclick="location.href='faqList'"/>
                        </td>                   
                    </tr>
                </tfoot>
            </table>    
        </form>
    </div>
</body>
</html>
