<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>productView</title>
<script type="text/javascript">
	function productRemove(){
		var check = confirm("���� �����ұ��?");
		if (check) {
			location.href='productDelete?pro_no=${productDto.pro_no }';		
		}
	}
</script>
</head>
<body>
	<div id="wrap">
		<h3>��ǰ ����</h3>
		<form action="productModify" method="POST">
			<table border="1">				
				<tbody>
					<tr>
						<td>��ǰ��ȣ</td>
						<td>${productDto.pro_no }
							 <input type="hidden" name="pro_no" value="${productDto.pro_no }"/>  
						</td>
					</tr>
					<tr>
						<td>��ǰ��</td>
						<td><input type="text" name="pro_name" value="${productDto.pro_name }"/></td>
					</tr>
					<tr>
						<td>��ǰ����</td>
						<td><input type="text" name="pro_price" value="${productDto.pro_price }"/></td>
					</tr>
					<tr>
						<td>��ǰ����</td>
						<!--�� ������ ���濹�� ��-->
						<td><textarea rows="10" cols="10" name="pro_content" >${productDto.pro_content }</textarea></td>
					</tr>
					<tr>
						<td>��ǰ���</td>
						<td><input type="text" name="pro_stock" value="${productDto.pro_stock }"/></td>
					</tr>
					<tr>
						<td>��ǰ��</td>
						<td>
							<!--�� ���̸� ���濹�� ��-->							
							<select name="pro_taste">
								<option value="�ʴ�">�ʴ�</option>
								<option value="¥��">¥��</option>
								<option value="�޴�">�޴�</option>
								<option value="���">���</option>
								<option value="�̱�">�̱�</option>
							</select>
						</td>
					</tr>					
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">
							<input type="submit" value="��ǰ ����" />
							<input type="button" value="��ǰ ����" onclick="productRemove()"/>
							<input type="button" value="��ǰ ���" onclick="location.href='productList'"/>
						</td>					
					</tr>
				</tfoot>
			</table>	
		</form>
	</div>

</body>
</html>