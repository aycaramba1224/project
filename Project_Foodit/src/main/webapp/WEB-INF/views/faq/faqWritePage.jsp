<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/admin/adminPageLmenu.jsp" />
<script type="text/javascript">
    function faqWrite(f){
        f.action="faqWrite";
        f.submit();     
    }
</script>

	<div class="commonWrap">    
		<div class="commonArea"> 
			<div class="commonListTit nbg">
        		<h2>FAQ 글쓰기</h2>
        	</div>
        	<div class="commonCont">
		        <form method="POST">
		            <table>              
		                <tbody>
		                    <tr>
		                        <th>글제목</th>
		                        <td><input type="text" name="faq_title"/></td>
		                    </tr>
		                    <tr>
		                        <th>글내용</th>
		                        <td><textarea rows="10" cols="10" name="faq_content"></textarea></td>
		                    </tr>   
		                    <tr class="cmHeight">                   
		                        <th>카테고리선택</th>
		                        <td>
		                        	<select name="faq_category">
			                          <option value="">카테고리선택</option>
			                          <option value="delievery">배송</option>
			                          <option value="payment">결제</option>
			                          <option value="order">주문</option>
			                          <option value="ret">취소/반품</option>
			                          <option value="review">리뷰</option>
			                          <option value="member">회원</option>
			                          <option value="etc">기타</option>
		                        	</select>
		                        </td>
		                    </tr>
		                </tbody>
		                <tfoot>
		                    <tr>
		                        <td colspan="2">
		                        	<div class="comBtnWrap">
			                            <button type="button" onclick="faqWrite(this.form)">게시글 등록</button>
			                            <button type="button" onclick="location.href='faqList'">게시글 목록</button>
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
