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
    
    function searchReview(f) {
    	if(f.content.value==""){
    		alert("검색어를 입력해 주세요.");
    		return;
    	}				
    	f.action = "reviewSearchResult"; 
    	f.submit();
    }
    
    
</script>
  
    <div id="wrap"> 
    
	<span>리뷰</span>      
    <br/>
	<form method="POST">
		<input type="text" class="txt" name="content" placeholder="메뉴명으로 검색해 주세요."/>
		<button type="button" class="ico">
			<span class>입력 삭제</span>
		</button>
		<button type="button" class="srchBtn" onclick="searchReview(this.form)">
			<span class>검색</span>
		</button>
		<p class="pInfo">FOODIT의 모든 리뷰를 쉽고 빠르게 찾아볼 수 있습니다.</p>
	</form>	 
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
					<a href="#">   
					<!-- 리뷰 사진 가로 목록 썸네일 이미지 사이즈 : 500x370  -->
					<span> <img alt="${reviewDto.re_thumbImg }" src="${pageContext.request.contextPath }/resources/upload/${reviewDto.re_thumbImg}" 
							style="width:500px; height:370px;" /></span> 
					<br/>
					<span> ${reviewDto.re_product_name} </span><br/> 
					<span> <c:if test="${ reviewDto.re_score eq 1}">
			 			            ★
					       </c:if>
					<span> <c:if test="${ reviewDto.re_score eq 2}">
			 			            ★★
					       </c:if>
					<span> <c:if test="${ reviewDto.re_score eq 3}">
			 			            ★★★
					       </c:if>
					<span> <c:if test="${ reviewDto.re_score eq 4}">
			 	    <span>★★★★</span>
					       </c:if>
					<span> <c:if test="${ reviewDto.re_score eq 5}">
			 			            ★★★★★
					       </c:if>
					       
					       
					 | ${reviewDto.re_id } </span>
					<br/><br/>
					<span> ${reviewDto.re_content } </span>
					</a>            
				</li>         
			</ul>        
		</div>
	</c:forEach> 
    </div>
   <div class="pageNavi">
     ${pagingView }
   </div>
        