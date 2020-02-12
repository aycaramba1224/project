<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/admin/adminPageLmenu.jsp" />    
<script type="text/javascript">
  function noticeWrite(f) {
      f.action="noticeWrite";
      f.submit();
  }
</script>

	<div class="commonWrap">
		<div class="commonArea">
			<div class="commonListTit nbg">
        		<h2>공지사항 글쓰기</h2>
        	</div>
        	<div class="commonCont">
		        <form method="POST" enctype="multipart/form-data">
		            <table>              
		                <tbody>
		                    <tr>
		                        <th>글제목</th>
		                        <td><input type="text" name="notice_title"/></td>
		                    </tr>
		                  
		                    <tr>
		                        <th>공지내용</th>
		                        <td><textarea rows="10" cols="10" name="notice_content"></textarea></td>
		                    </tr>
		                    <tr class="cmHeight">
								<th>
									상품 이미지 등록 
								</th>
								<td>
								  	<label for="thumnailImg2">업로드</label> 
								  	<input type="file" id="thumnailImg2" name="file_"/> 
								    <input class="upload-name3 upform" value="파일선택">
							    </td>
							</tr>
		                </tbody>
		                <tfoot>
		                    <tr>
		                        <td colspan="2">
		                        	<div class="comBtnWrap">
			                            <button type="button" onclick="noticeWrite(this.form)">등록</button>
			                            <button type="button" onclick="location.href='noticeList'">목록</button>
		                            </div>
		                        </td>                   
		                    </tr>
		                </tfoot>
		            </table>    
		        </form>
	        </div>
        </div>
    </div>
<%@ include file="/WEB-INF/views/admin/adminPageRmenu.jsp" %>
