<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="/WEB-INF/views/common/header.jsp" >
    <jsp:param value="FOODIT 메뉴" name="title"/>
</jsp:include> 

<script type="text/javascript"> 
    var isReviewWrite = "${isReviewWrite}";
    if(isReviewWrite == "yes"){
        var reviewWriteResult = "${reviewWriteResult}";
        if(reviewWriteResult == 0){
            alert("상품 등록이 실패하였습니다.");
        } else {
            alert("상품 등록이 성공하였습니다.");
        }
    }  
</script>
  
    <div id="wrap"> 
    
	<span>리뷰</span>      
     
	<c:if test="${mDto.role == 'admin' }">  <!-- 관리자만 보이는 부분   -->
		<input type="button" value="리뷰등록" onclick="location.href='reviewWritePage'"/><br/><br/>   
	</c:if> 
	
	<c:if test="${reviewListCount eq 0 }">
		등록된 리뷰가 없습니다.
	</c:if> 
        
	<c:forEach var="reviewDto" items="${reviewList }" >   
		<div id="목록" style="float:left; padding:20px;" >        
			<ul style="list-style-type:none;">       
				<li>            
					<a href="reviewView?re_no=${reviewDto.re_no}">   
					<!-- 리뷰 사진 가로 목록 썸네일 이미지 사이즈 : 500x370  -->
					<span> <img alt="${reviewDto.re_thumbImg }" src="${pageContext.request.contextPath }/resources/upload/${reviewDto.re_thumbImg}" 
							style="width:500px; height:370px;" /></span> 
					<span> ${reviewDto.re_product_name} </span><br/> 
					<span> ${reviewDto.re_score } | ${reviewDto.re_id } </span>
					<br/><br/>
					<span> ${reviewDto.re_content } </span>
					</a>            
				</li>         
			</ul>        
		</div>
	</c:forEach> 
        
        
        
        
        
        
         
    </div>
    