 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>productInsert</title>
<script type="text/javascript">
	function productInsert(f){
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
							<select name="pro_taste">
								<option value="맵다">맵다</option>
								<option value="짜다">짜다</option>
								<option value="달다">달다</option>
								<option value="담백">담백</option>
								<option value="이국">이국</option>
							</select>
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