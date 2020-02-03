<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

 

<title>상품 상세 보기</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script type="text/javascript">

	function productModify(f){
		f.action = "productModifyPage?product_no=${productDto.product_no }";
		f.submit();	
	} 

	function addCart(f){
		alert("상품이 장바구니에 담겼습니다.");
		f.action = "cartInsert?product_no=${productDto.product_no }";	
		f.submit();	// 취소시엔 담기지 않음!! (처리예정)
	}
</script>
</head>
<body>

	<div id="wrap">

		<form method="POST">
		<input type="hidden" name="product_no" value="${productDto.product_no }">
		<input type="hidden" name="cart_id" value="admin"/>
		<!-- 관리자만 보이는 부분  (처리예정)-->
			<input type="button" value="수정/삭제" onclick="productModify(this.form)"/> 
		<!--------------------------->
			<table border="1" style="width:600px;"> <!-- 테이블 사이즈 향후 수정예정 -->				
				<tbody>
					<tr>
						<td rowspan ="7">썸네일이미지</td>
					</tr>
					<tr>
						<td>
							${productDto.product_name } <br/>
							원산지 : 상품정보 참조
						</td>
					</tr>
					<tr>
						<td>
							<fmt:formatNumber value="${productDto.product_price}" pattern="#,###,###" />원
						</td>
					</tr>
					<tr>
						<td>
							배송비 : 3만원 이상 구매 시 무료 배송
						</td>
					</tr>
					<tr>
						<td>
							${productDto.product_name } &nbsp;&nbsp;
							<button type="button" class="minus" >-</button>
							<input type="number" class="cart_amount" name="cart_amount" min="1" max="${productDto.product_stock}" value="1" readonly="readonly" style="width:30px; border:none;"/>
							<button type="button" class="plus" >+</button> &nbsp;&nbsp;
							<script type="text/javascript"> 
							// 구매 수량 플러스
							$(".plus").click(function(){
								var num = $(".cart_amount").val();
								var plusNum = Number(num) + 1;
								if(plusNum >= 11) {	
									alert("최대 구매 가능 수량은 10개 입니다.");// 최대 구매가능 상품은 10개로 제한함 
									$(".cart_amountt").val(num);
								} else {
									$(".cart_amount").val(plusNum);  									
								}								
							});

							// 구매 수량 마이너스
							$(".minus").click(function(){
								var num = $(".cart_amount").val();
								var minusNum = Number(num) - 1;							 
								if(minusNum <= 0) {
									$(".cart_amount").val(num);
								} else {
									$(".cart_amount").val(minusNum);          
								}
							});							
							</script>	
						</td>								
					</tr>
					<tr>
						<td>
							수량 <!-- 처리예정 --> 
						</td>
					</tr>					
					<tr>
						<td>
							 <input type="button"  value="장바구니 담기" onclick="addCart(this.form)"/>
						</td>
					</tr>
					<tr>
						<td colspan="2">메뉴바(상세설명, 상품정보, 리뷰, 배송/반품/문의)</td>
					</tr>
					<tr>
						<td colspan="2">
						상품내용 ${productDto.product_content }
						</td>
					</tr>
				</tbody>
			</table>	
		</form>

	</div>

</body>
</html>