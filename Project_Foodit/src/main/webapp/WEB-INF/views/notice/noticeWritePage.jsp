<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 등록</title>
<script type="text/javascript">
  function noticeWrite(f) {
      f.action="noticeWrite";
      f.submit();
  }
</script>
</head>
<body>
<div id="wrap">
        <h3>공지사항 등록</h3>
        <form method="POST" enctype="multipart/form-data">
            <table border="1">              
                <tbody>
                    <tr>
                        <td>글제목</td>
                        <td><input type="text" name="notice_title"/></td>
                    </tr>
                  
                    <tr>
                        <td>공지내용</td>
                        <!--★ 사이즈 변경예정 ★-->
                        <td><textarea rows="10" cols="10" name="notice_content"></textarea></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                          상품 이미지 등록 <input type="file" name="file_"/>
                        </td>
                    </tr>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="2">
                            <input type="button" value="등록" onclick="noticeWrite(this.form)"/>
                            <input type="button" value="목록" onclick="location.href='noticeList'"/>
                        </td>                   
                    </tr>
                </tfoot>
            </table>    
        </form>
    </div>
</body>
</html>

