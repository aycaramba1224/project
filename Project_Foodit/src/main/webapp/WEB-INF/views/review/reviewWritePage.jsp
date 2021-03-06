<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" >
    <jsp:param value="FOODIT 메뉴" name="title"/>
</jsp:include> 

<script type="text/javascript">
  function reviewWrite(f) {
      f.action="reviewWrite"; 
      f.submit();
  } 
</script>

    <div id="wrap">     
        <form method="post" enctype="multipart/form-data">
            <table border="1">              
                <tbody> 
                    <tr>
                        <td>작성자</td>
                        <td>${sessionScope.mDto.id }</td>
                        <input type="hidden" name="re_id" value="${sessionScope.mDto.id  }"/>
                    </tr>
                    <tr>
                        <td>상품명</td>
                        <td><input type="text" name="re_product_name" value="${re_product_name} "/></td>
                    </tr>
                    <tr>
                        <td>리뷰내용</td>
                        <!--★ 사이즈 변경예정 ★-->
                        <td><textarea rows="20" cols="50" name="re_content"></textarea></td>
                    </tr>
                    <tr>
                        <td>상품번호 </td>                      
                        <td><input type="text" name="re_product_no"/> </td>
                    </tr>
                    <tr>
                        <td>리뷰 비밀번호 </td>
                        <td><input type="password" name="re_pw"/></td>
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
                        <td>리뷰 이미지 등록</td>
                        <td> <input type="file" name="refile_"/></td> 
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="button" value="리뷰등록" onclick="reviewWrite(this.form)"/>
                            <input type="button" value="리뷰목록" onclick="location.href='reviewList'"/>
                        </td>                   
                    </tr>
                </tfoot>
            </table>    
        </form>
    </div>  
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>