<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>      
<jsp:include page="/WEB-INF/views/common/header.jsp" >
	<jsp:param value="FOODIT 메뉴찾기" name="title"/>
</jsp:include> 

<script type="text/javascript">
	function searchMenu(f){
		if(f.content.value==""){
			alert("검색어를 입력해 주세요.");
			return;
		}				
		f.action ="productSearchResult";
		f.submit();
	}
</script>

<<<<<<< HEAD
	<div id="menuSearchWrap">
		<div class="menuSearchTit">
			<h2>메뉴찾기</h2>
		</div>
=======
	<div>
		메뉴찾기
>>>>>>> 7babdc86326918bdd429191eebf49953c8634da8
		
		<div class="menuSearchBox">
			<div class="schWrap">
				<div class="formInputWrap">
					<form method="POST">
						<input type="hidden" name="query" value="product_name"/>			
						<input type="text" class="txt" name="content" placeholder="메뉴명으로 검색해 주세요."/>
						<button type="button" class="ico">
							<span class="hide">입력 삭제</span>
						</button>
						<button type="button" class="srchBtn" value="검색" onclick="searchMenu(this.form)">
							<span class="hide">검색</span>
						</button>
						<p class="pInfo">FOODIT의 모든 메뉴를 쉽고 빠르게 찾아볼 수 있습니다.</p>
					</form>	 
				</div>
			</div>
		</div>
		<div class="menuSearchList">
			<h3>판매중</h3>
		</div>
		<div id="검색결과" >
		<div>

			<jsp:include page="/WEB-INF/views/product/searchResult.jsp">
				<jsp:param name="productList" value="${param.productList }"/>
				<jsp:param name="productListSize" value="${param.productListSize }"/>
			</jsp:include>	 
			 
		</div> 
		
	  	<br/><br/>
	 
	</div> 
	<script type="text/javascript" src="resources/js/menuSearch.js" ></script>
	
