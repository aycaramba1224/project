<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/common/header.jsp" >
    <jsp:param value="FOODIT 메뉴" name="title"/>
</jsp:include> 

<script type="text/javascript">
  function reviewModify(f) {
      f.action="reviewModify"; 
      f.submit();
  } 
</script>

    <div>
		<form  method="POST" enctype="multipart/form-data">		
		<input type="hidden" name="re_no" value="${reviewDto.re_no }">
		 
			<input type="submit" value="리뷰 수정" />
		    
		 
		
			<table border="1">  		
				<tbody>
					 <tr>
                        <td>작성자</td>
                        <td>${sessionScope.mDto.id }</td>
                    </tr>
					<%-- <tr>
						<td>
							상품명 : ${reviewDto.re_product_name } <br />
						</td>
					</tr> --%>
					 <tr>
                        <td>리뷰내용</td>
                        <!--★ 사이즈 변경예정 ★-->
                        <td><textarea rows="20" cols="50" name="re_content"></textarea></td>
                    </tr>
                    <tr>
                        <td>리뷰 비밀번호 </td>
                        <td><input type="password" name="re_pw"/></td>
                    <tr>
					<tr>
                        <td>별점</td>
                        <td>
                            <select name="re_score">
                                <option value="1">1점</option>
                                <option value="2">2점</option>
                                <option value="3">3점</option>
                                <option value="4">4점</option>
                                <option value="5">5점</option>
                            </select>                   
                        </td>
                    </tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="2">
								리뷰 이미지 등록 <input type="file" name="refile_2"/><br/>
							</td>
						</tr>
						<tr>
						   <td colspan="2">
                            	<input type="button" value="리뷰수정" onclick="reviewModify(this.form)"/>
                            	<input type="button" value="내 리뷰목록" onclick="location.href='myReview'"/>
                        	</td>                 
						</tr>
					</tfoot>
			</table>	
		</form>
	</div>
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>