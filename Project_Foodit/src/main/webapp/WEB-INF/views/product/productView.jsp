 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<title>productView</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	function productRemove(){
		var check = confirm("정말 삭제할까요?");
		if (check) {
			location.href="productDelete?product_no=${productDto.product_no }";		
		}
	}	
	function goCart(f){
		var check2 = confirm("상품이 장바구니에 담겼습니다. 장바구니로 이동하시겠습니까?");
		if (check2) {
			f.action="cartView?product_no=${productDto.product_no }";
			f.submit();
		}
	} 
</script>
</head>
<body>
	<div id="wrap">
		<h3>상품 보기</h3>
		<form action="productModify" method="POST">
		<input type="hidden" name="product_no" value="${productDto.product_no }"/>
			<table border="1" style="width:500px;">				
				<tbody>
					<tr>
						<td>상품번호</td>
						<td>${productDto.product_no }</td>
					</tr>
					<tr>
						<td>상품명</td>
						<td><input type="text" name="product_name" value="${productDto.product_name }"/></td>
					</tr>
					<tr>
						<td>상품가격</td>
						<td><input type="text" name="product_price" value="${productDto.product_price }"/></td>
					</tr>
					<tr>
						<td>상품내용</td>
						<!--★ 사진 업로드 기능 추가예정 ★-->
						<td><textarea rows="10" cols="10" name="product_content" >${productDto.product_content }</textarea></td>
					</tr>
					<tr>
						<td>상품재고</td>
						<td><input type="text" name="product_stock" value="${productDto.product_stock }"/></td>
					</tr>
					<tr>
						<td>상품맛</td>
						<td>						
							<select name="product_taste">
								<option value="${productDto.product_taste }">${productDto.product_taste}</option>
								<option value="선택">==========</option>
								<option value="매콤한맛">매콤한맛</option>
								<option value="짭짤한맛">짭짤한맛</option>
								<option value="담백한맛">담백한맛</option>
								<option value="이국적인맛">이국적인맛</option>
								<option value="얼큰한맛">얼큰한맛</option>
							</select>					
						</td>
					</tr>					
				</tbody>
				<tfoot>
					<tr>
						<td>구매수량</td>
						<td>
							<button type="button" class="minus" >-</button>
							<input type="number" class="cartCount" name="cartCount" min="1" max="${productDto.pro_stock}" value="1" readonly="readonly" style="width:30px; border:none;"/>
							<button type="button" class="plus" >+</button> &nbsp;&nbsp;
							<script type="text/javascript"> 
							// 구매 수량 플러스
							$(".plus").click(function(){
								var num = $(".cartCount").val();
								var plusNum = Number(num) + 1;
								if(plusNum >= 11) {	
									alert("최대 구매 가능 수량은 10개 입니다.");// 최대 구매가능 상품은 10개로 제한함(alert위치 파악중)
									$(".cartCount").val(num);
								} else {
									$(".cartCount").val(plusNum);  									
								}								
							});

							// 구매 수량 마이너스
							$(".minus").click(function(){
								var num = $(".cartCount").val();
								var minusNum = Number(num) - 1;							 
								if(minusNum <= 0) {
									$(".cartCount").val(num);
								} else {
									$(".cartCount").val(minusNum);          
								}
							});							
							</script>							
							
							 <input type="button" value="장바구니 담기" onclick="goCart(this.form)"/>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="button" value="상품 목록" onclick="location.href='productList'"/>
						<!-- 관리자만 보이는 부분  (처리예정)-->
							<input type="submit" value="상품 수정" />
							<input type="button" value="상품 삭제" onclick="productRemove()"/>
						<!-- 관리자만 보이는 부분  (처리예정)-->	
						</td>					
					</tr>
				</tfoot>
			</table>	
		</form>
	</div>

</body>
</html>