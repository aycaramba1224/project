<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
<jsp:include page="/WEB-INF/views/common/header.jsp" >
    <jsp:param value="한끼도 특별하게, FOODIT " name="title"/>
</jsp:include>  
 

<script type="text/javascript">
	// 맛추천
	$(function(){
		$('#selectBox').change(function() {	
			var taste = $('#selectBox option:selected').val();			 
			location.href="recommendList?product_taste=" + taste;			  
		}); 		
	});
 
</script>

	<div> <!-- 이미지 슬라이드 -->
	 	<%@ include file="/WEB-INF/views/main/slide.jsp" %>   
	</div>
	
	 <div> <!-- 맛추천  -->		
	
		<select	name="product_taste" id="selectBox" >
			<option value="spicy" selected="selected">매콤한맛</option>
			<option value="salty">짭짤한맛</option>
			<option value="plain">담백한맛</option>
			<option value="fresh">상큼한맛</option>
			<option value="exotic">이국적인맛</option>
		</select>

		<span>메뉴</span>		
		<span>추천 드려요.</span>		
		<span><a href="sbmr">로그인</a>하시면 고객님의 구매내역과 </span>		
		<span>맛취향에 따라 딱맞는 맛있는 메뉴를 추천드려요.</span>
	
		<div> <!-- 맛추천 결과  -->
			<ul style="list-style-type:none;">		 
				<c:forEach var="productDto" items="${recommendList}" >	 
					<li style="float:left; padding:20px; width:400px;">		 	
						<a href="productView?product_no=${productDto.product_no}">						 
							<span> <img alt="${productDto.product_thumbImg }" 
							src="${pageContext.request.contextPath }/resources/upload/${productDto.product_thumbImg}" 
							style="width:366px; height:366px;" /></span><br/>
							<span> 상품 맛 : ${productDto.product_taste }</span>		
							<span> ${productDto.product_name} </span><br/>
							<span> <fmt:formatNumber value="${productDto.product_price}" pattern="#,###,###" />원 </span><br/> 									
						</a>		 	
					</li>		  
				</c:forEach> 		
			</ul>
		</div>
	  
	</div>	
	 
 	<div><!-- 실시간 베스트  -->	
		<jsp:include page="/WEB-INF/views/main/bestList.jsp">
			<jsp:param name="bestList" value="${param.bestList }"/>
		</jsp:include>		
			
	</div>
	
	
	 
 	<div>
		생생한 리뷰 
	</div>   

	<div><!-- 가로 이미지   -->
		<img alt="한끼도 특별하게, FOODIT" src="./resources/main/main1.jpg" style="width:100%; height:100%;">
	</div>
	<div> <!-- 푸딧 메뉴보기  -->
		<jsp:include page="/WEB-INF/views/main/menuList.jsp">
			<jsp:param name="menuList" value="${param.menuList }"/>
		</jsp:include>		
	</div> 
	 
	 
<%@ include file="/WEB-INF/views/common/footer.jsp" %> 