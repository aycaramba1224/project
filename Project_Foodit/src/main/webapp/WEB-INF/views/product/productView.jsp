 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>productView</title>
<script type="text/javascript">
	function productRemove(){
		var check = confirm("정말 삭제할까요?");
		if (check) {
			location.href='productDelete?pro_no=${productDto.pro_no }';		
		}
	}
</script>
</head>
<body>
	<div id="wrap">
		<h3>상품 보기</h3>
		<form action="productModify" method="POST">
			<table border="1">				
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