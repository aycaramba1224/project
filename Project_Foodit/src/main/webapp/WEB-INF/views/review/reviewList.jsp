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
    function reviewDelete(f) {
    	f.action = "reviewDelete"; 
    	f.submit();
    }
    
</script>
  
    <div id="menuSearchWrap">
		<div class="menuSearchTit">
			<h2>리뷰</h2>
		</div>
		<div class="menuSearchBox">
			<div class="schWrap">
				<div class="formInputWrap">
					<form method="POST">
						<input type="text" class="txt" name="content" placeholder="메뉴명으로 검색해 주세요."/>
						<button type="button" class="ico">
							<span class="hide">입력 삭제</span>
						</button>
						<button type="button" class="srchBtn" value="검색" onclick="searchReview(this.form)">
							<span class="hide">검색</span>
						</button>
						<p class="pInfo">FOODIT의 모든 리뷰를 쉽고 빠르게 찾아볼 수 있습니다.</p>
					</form>	 
				</div>
			</div>
		</div>
		<div class="productList">
			<c:if test="${reviewListCount eq 0 }">
				 <div class="detail">
					<div class="detail_info">
						<div class="no_data">
							<span id="icon"></span>
							<p>등록된 리뷰가 없습니다.</p>
						</div>
					</div>
				</div>
			</c:if>
		</div>
	        
		<div class="reviewWrap" >        
			<ul style="list-style-type:none;">       
				<c:forEach var="reviewDto" items="${reviewList }" >   
					<li>            
						<div class="topWrap">
							<p class="tit">
								<span class="titName"> ${reviewDto.re_product_name}</span>
							</p>
							<p class="date">${ reviewDto.re_date }</p>
						</div>  
						<div class="linkWrap">
							<div class="etcInfo">
								<div class="ratingWrap">
									<c:if test="${ reviewDto.re_score eq 1}">
										★☆☆☆☆
				                    </c:if>
				                    <c:if test="${ reviewDto.re_score eq 2}">
										★★☆☆☆
									</c:if>
				                    <c:if test="${ reviewDto.re_score eq 3}">
										★★★☆☆
				                    </c:if>
				                    <c:if test="${ reviewDto.re_score eq 4}">
										★★★★☆
				                    </c:if>
				                    <c:if test="${ reviewDto.re_score eq 5}">
										★★★★★
				                    </c:if>
			                    </div>
			                    <div class="userReId">${reviewDto.re_id }</div>
		                    </div>
		                    <div class="linkMore">
		                    	<div class="txtWrap">
			                    	<div class="txtCont" >
			                    		<p class="txt mt_Elps">${reviewDto.re_content }</p>
			                    	</div>
		                    	</div>
		                    	<div class="imgLeftWrap">
		                    		<div class="reviewImg">
		                    			<img alt="${reviewDto.re_thumbImg }" src="${pageContext.request.contextPath }/resources/upload/${reviewDto.re_img}" 
										style="width:186px; height:186px;" /> 
		                    		</div>
		                    	</div>
		                    </div>
						</div>
					</li>         
				  </c:forEach>
				</ul>        
			</div>
		</div> 
	<!-- 마이푸딧으로 옮길 예정 -->
  	<div class="pageNavi">
		<div class="pagingWrap">
    		${pagingView }
   		</div>
   	</div>
        
        
    	<script type="text/javascript" src="resources/js/menuSearch.js" ></script>
	
<%@ include file="/WEB-INF/views/common/footer.jsp" %>