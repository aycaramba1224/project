<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/common/header.jsp" >
	<jsp:param value="FOODIT 메뉴등록" name="title"/>
</jsp:include> 


<script type="text/javascript">
	function productInsert(f){
	 	if(f.product_name.value==""){
			alert("상품명을 입력하세요.");
			f.product_name.focus();
			return;
		}
		if(f.product_price.value==""){
			alert("상품금액을 입력하세요.");
			f.product_price.focus();
			return;
		}

		if(f.product_content.value==""){
			alert("상품설명을 입력하세요.");
			f.product_content.focus();
			return;
		}
		if(f.product_stock.value==""){
			alert("상품재고를 입력하세요.");
			f.product_stock.focus();
			return;
		}
		if(f.product_taste.value==""){
			alert("상품맛을 선택하세요.");
			return;
		}
		f.action = "productInsert";
		f.submit();
	}

</script>
</head>
<body>

	<div id="wrap">		
		<form method="post" enctype="multipart/form-data">
			<table border="1">				
				<tbody> 
					<tr>
						<td>상품명</td>
						<td><input type="text" name="product_name"/></td>
					</tr>
					<tr>
						<td>상품가격</td>
						<td><input type="text" name="product_price" placeholder="콤마(,) 사용 금지 "/></td>
					</tr>
					<tr>
						<td>상품내용</td>
						<!--★ 사이즈 변경예정 ★-->
						<td><textarea rows="10" cols="10" name="product_content"></textarea></td>
					</tr>
					<tr>
						<td>상품재고</td>
						<td><input type="text" name="product_stock"/></td>
					</tr>
					<tr>
						<td>상품맛</td>
						<td>
							<select name="product_taste">
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
						<td colspan="2">
							상품 썸네일 등록 <input type="file" name="file_"/><br/>
							상품 이미지 등록 <input type="file" name="file_"/>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="button" value="상품등록" onclick="productInsert(this.form)"/>
							<input type="button" value="상품목록" onclick="location.href='productList'"/>
						</td>					
					</tr>
				</tfoot>
			</table>	
		</form>
	</div>

</body>

</html>