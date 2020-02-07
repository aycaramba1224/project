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
</head>
<body>

	<div>
		메뉴찾기
		
		<div id="검색박스">
			<form method="POST">
				<input type="hidden" name="query" value="product_name"/>			
				<input type="text" name="content" placeholder="메뉴를 검색해 주세요."/>
				<input type="button" value="검색" onclick="searchMenu(this.form)"> <!-- 돋보기 아이콘으로 대체 예정  -->
				
				<br/>			
				<span>FOODIT의 모든 메뉴를 쉽고 빠르게 찾아볼 수 있습니다.</span>
			  			  
			</form>	 
		</div>
		<div>

			<jsp:include page="/WEB-INF/views/product/searchResult.jsp">
				<jsp:param name="productList" value="${param.productList }"/>
				<jsp:param name="productListSize" value="${param.productListSize }"/>
			</jsp:include>	 
			 
		</div> 
		
	  	<br/><br/>
	 
				
	</div> 
	
</body>
</html>