 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 

<title>productView</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	function productRemove(){
		var check = confirm("정말 삭제할까요?");
		if (check) {
			location.href='productDelete?pro_no=${productDto.pro_no }';		
		}
	}
	
	function goCart(f){
		alert("상품이 장바구니에 담겼습니다.");
		f.action ="cartList?pro_no=${productDto.pro_no }";
		
		f.submit();
	}
</script>
</head>
<body>
	<div id="wrap">
		<h3>상품 보기</h3>
		<form action="productModify" method="POST">
		<input type="hidden" name="pro_no" value="${productDto.pro_no }"/>
			<table border="1" style="width:500px;">				
				<tbody>
					<tr>
						<td>상품번호</td>
						<td>${productDto.pro_no }
							 <input type="hidden" name="pro_no" value="${productDto.pro_no }"/>  
						</td>
					</tr>
					<tr>
						<td>상품명</td>
						<td><input type="text" name="pro_name" value="${productDto.pro_name }"/></td>
					</tr>
					<tr>
						<td>상품가격</td>
						<td><input type="text" name="pro_price" value="${productDto.pro_price }"/></td>
					</tr>
					<tr>
						<td>상품내용</td>
						<!--★ 사이즈 변경예정 ★-->
						<td><textarea rows="10" cols="10" name="pro_content" >${productDto.pro_content }</textarea></td>
					</tr>
					<tr>
						<td>상품재고</td>
						<td><input type="text" name="pro_stock" value="${productDto.pro_stock }"/></td>
					</tr>
					<tr>
						<td>상품맛</td>
						<td>						
							${productDto.pro_taste }					
						</td>
					</tr>					
				</tbody>
				<tfoot>
					<tr>
						<td>구매수량</td>
						<td>
							<button type="button" class="minus" >-</button>
							<input type="number" class="numBox" min="1" max="${view.gdsStock}" value="1" readonly="readonly" style="width:30px; border:none;"/>
							<button type="button" class="plus" >+</button> &nbsp;&nbsp;
							<input type="button" value="장바구니 담기" onclick="goCart(this.form)"/>
							<script type="text/javascript"> 
							// 구매 수량 플러스
							$(".plus").click(function(){
								var num = $(".numBox").val();
								var plusNum = Number(num) + 1;
								if(num >= 11){
									alert("최대 구매 가능 수량은 10개 입니다.");
								}
						 
								if(plusNum >= 11) {			// 최대 구매가능 상품은 10개로 제한함(alert위치 파악중)
									$(".numBox").val(num);
								} else {
									$(".numBox").val(plusNum);  
									
								}
								
							});

							// 구매 수량 마이너스
							$(".minus").click(function(){
								var num = $(".numBox").val();
								var minusNum = Number(num) - 1;
							 
								if(minusNum <= 0) {
									$(".numBox").val(num);
								} else {
									$(".numBox").val(minusNum);          
								}
							});							
							</script>
						</td>
					</tr>
					<tr>
						<td colspan="2">
						<!-- 관리자만 보이는 부분  (처리예정)-->
							<input type="submit" value="상품 수정" />
							<input type="button" value="상품 삭제" onclick="productRemove()"/>
						<!-- 관리자만 보이는 부분  (처리예정)-->	
							<input type="button" value="상품 목록" onclick="location.href='productList'"/>
						</td>					
					</tr>
				</tfoot>
			</table>	
		</form>
	</div>

</body>
</html>