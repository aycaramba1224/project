<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<title>productView</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	var isProductModify = "${isProductModify}";
	if(isProductModify == "yes"){
		var modifyResult = "${modifyResult}";
		if(modifyResult == 0){
			alert("상품 수정이 실패하였습니다.");
		} else {
			alert("상품 수정이 성공하였습니다.");
		}
	} 
	
	function productRemove(){
		var check = confirm("정말 삭제할까요?");
		if (check) {
			location.href="productDelete?product_no=${productDto.product_no }";		
		}
	} 
	var isProductDelete = "${isProductDelete}";
	if(isProductDelete == "yes"){
		var deleteResult ="${deleteResult}";
		if(deleteResult == 0 ){
			alert("상품 삭제가 실패하였습니다.");
		} else {
			alert("상품 삭제가 성공하였습니다.");	
		}
	}	
</script>
</head>
<body>
	<div id="wrap">
		<form action="productModify" method="POST">		
		<input type="hidden" name="product_no" value="${productDto.product_no }">
		 
			<input type="submit" value="상품 수정" />
			<input type="button" value="상품 삭제" onclick="productRemove()"/>
			<input type="button" value="상품 목록" onclick="location.href='productList'"/>
		 
		
			<table border="1" style="width:600px;"> <!-- 테이블 사이즈 향후 수정예정 -->				
				<tbody>
					<tr>
						<td rowspan ="7">
							썸네일이미지
						</td>
					</tr>
					<tr>
						<td>
							상품명 : ${productDto.product_name } <br />
							수정 할 상품명 : 필수입력 <br />
							<input type="text" name="product_name" value="${productDto.product_name }"/> <br/>						 
						</td>
					</tr>
					<tr>
						<td>
							상품금액 :
							<fmt:formatNumber value="${productDto.product_price}" pattern="#,###,###" />원 <br/>
							수정 할 금액 : 필수입력 / ,(콤마)사용금지 <br />
							<input type="text" name="product_price" value="${productDto.product_price}"/>원					
						</td>
					</tr>					
					<tr>
						<td>		
							상품 맛 :${productDto.product_taste} <br /> 				
							<select name="product_taste">
								<option value="매콤한맛">매콤한맛</option>
								<option value="짭짤한맛">짭짤한맛</option>
								<option value="담백한맛">담백한맛</option>
								<option value="이국적인맛">이국적인맛</option>
								<option value="얼큰한맛">얼큰한맛</option>
							</select>					
						</td>
					</tr>				
					<tr>
						<td>
							상품재고: ${productDto.product_stock } <br />
							<input type="text" name="product_stock" value="${productDto.product_stock }" />
						</td>
					</tr>
					<tr>
						<td>
							상품내용 :${productDto.product_content } <br />
							<input type="text" name="product_content" value="${productDto.product_content }" />
						</td>
					</tr>
					<tr>
						<td>							
							상품 번호 (수정불가) : ${productDto.product_no }
						</td>
					</tr>	
				</tbody>
			</table>	
		</form>
	</div>

</body>
</html>