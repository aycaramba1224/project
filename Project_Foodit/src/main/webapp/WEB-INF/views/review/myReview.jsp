<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 	<jsp:include page="/WEB-INF/views/common/header.jsp" >
	<jsp:param value="FOODIT MY REVIEW" name="title"/>
	</jsp:include> 
 	
 	<script type="text/javascript">
    function reviewDelete() {
        var check = confirm("삭제하시겠습니까?");
        if(check) {
            location.href="reviewDelete?re_no=${reviewDto.re_no}";
        }
    }

    function reviewModifypage() {
    	location.href="reviewModifyPage?re_no=${reviewDto.re_no}";
    }
    

</script>
 	
 	 	
 	 <h2 class="myReviewTit">MY REVIEW</h2>
     
     <c:if test="${myReviewSize eq 0 }">
        등록된 리뷰가 없습니다.
     </c:if>  
     
     
      <table>
      <c:forEach var="reviewDto" items="${myReview }">
      	<input type = "text" name="re_no" value="${reviewDto.re_no }" /></td>
      	<input type = "hidden" name="re_product_name" value="${reviewDto.re_product_name }" /></td>
         <thead>
         	<tr>
               <td>글번호</td>
               <td>리뷰 제품명</td>
               <td>내용</td>
               <td>작성일</td>
         	</tr>
         </thead>
         <tbody>
         <tr>
            <td>${reviewDto.re_no}
            <td>${reviewDto.re_product_name }</td>
            <td>${reviewDto.re_content }</td>
            <td>${reviewDto.re_score }</td>
            <td>${reviewDto.re_date }</td>
            
			<td><input type="button" value="리뷰삭제" onclick="location.href='reviewDelete?re_no=${reviewDto.re_no}'"/></td>  
            <td><input type="button" value="리뷰수정" onclick="location.href='reviewModifyPage?re_no=${reviewDto.re_no}'"/></td>        	
         </tr>
         </tbody>
         <tfoot>
         	<tr>
         	</tr>
         </tfoot>
      </c:forEach>
      </table>
     


 	  
  	<div class="pageNavi">
		<div class="pagingWrap">
    		${pagingView }
   		</div>
   	</div>




<%@ include file="/WEB-INF/views/common/footer.jsp" %>