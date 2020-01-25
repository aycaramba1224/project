 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>productInsert</title>
<script type="text/javascript">
	function productInsert(f){
		if(f.pro_no.value==""){
			alert("상품번호을 입력하세요.");
			f.pro_no.focus();
			return;
		}
		if(f.pro_name.value==""){
			alert("상품명을 입력하세요.");
			f.pro_name.focus();
			return;
		}
		if(f.pro_price.value==""){
			alert("상품금액을 입력하세요.");
			f.pro_price.focus();
			return;
		}
		if(f.pro_content.value==""){
			alert("상품설명을 입력하세요.");
			f.pro_content.focus();
			return;
		}
		if(f.pro_stock.value==""){
			alert("상품재고를 입력하세요.");
			f.pro_stock.focus();
			return;
		}
		if(f.pro_taste.value==""){
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
		<h3>상품 등록</h3>
		<form method="POST">
			<table border="1">				
				<tbody>
					<tr>
						<td>상품번호</td>
						<td><input type="text" name="pro_no"/></td>
					</tr>
					<tr>
						<td>상품명</td>
						<td><input type="text" name="pro_name"/></td>
					</tr>
					<tr>
						<td>상품가격</td>
						<td><input type="text" name="pro_price"/></td>
					</tr>
					<tr>
						<td>상품내용</td>
						<!--★ 사이즈 변경예정 ★-->
						<td><textarea rows="10" cols="10" name="pro_content"></textarea></td>
					</tr>
					<tr>
						<td>상품재고</td>
						<td><input type="text" name="pro_stock"/></td>
					</tr>
					<tr>
						<td>상품맛</td>
						<td>
							<!--★ 맛이름 변경예정 ★-->							
							<input type="radio" name="pro_taste" value="매콤한맛">매콤한맛
							<input type="radio" name="pro_taste" value="짭짤한맛">짭짤한맛
							<input type="radio" name="pro_taste" value="담백한맛">담백한맛
							<input type="radio" name="pro_taste" value="이국적인맛">이국적인맛
							<input type="radio" name="pro_taste" value="얼큰한맛">얼큰한맛						
						</td>
					</tr>					
				</tbody>
				<tfoot>
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