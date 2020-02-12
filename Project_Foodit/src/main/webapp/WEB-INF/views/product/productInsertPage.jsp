<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/admin/adminPageLmenu.jsp" />

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
	   if(f.file_.value==""){
	         alert("상품이미지를 등록 하세요.");
	         return;
      }
		f.action = "productInsert";
		f.submit();
	}
</script>
	<div class="commonWrap">
		<div class="commonArea">
			<div class="commonListTit nbg">
				<h2>상품 등록</h2>	
			</div>
			<div class="commonCont">
				<form method="post" enctype="multipart/form-data">
					<table>				
						<tbody> 
							<tr>
								<th>상품명</th>
								<td><input type="text" name="product_name"/></td>
							</tr>
							<tr>
								<th>상품가격</th>
								<td><input type="text" name="product_price" placeholder="콤마(,) 사용 금지 "/></td>
							</tr>
							<tr>
								<th>상품내용</th>
								<td><textarea rows="10" cols="50" name="product_content"></textarea></td>
							</tr>
							<tr>
								<th>상품재고</th>
								<td><input type="text" name="product_stock"/></td>
							</tr>
							<tr class="cmHeight">
								<th>상품맛</th>
								<td>
									<select name="product_taste">
										<option value="spicy">매콤한맛</option>
										<option value="salty">짭짤한맛</option>
										<option value="plain">담백한맛</option>
										<option value="fresh">상큼한맛</option>
										<option value="exotic">이국적인맛</option>
									</select>					
								</td>
							</tr>					
						</tbody>
						<tfoot>
							<tr class="cmHeight">
								<th>
									상품 이미지 등록
								</th>
								<td>
								  	<label for="profileImg">업로드</label> 
								  	<input type="file" id="profileImg" name="file_"/> 
								    <input class="upload-name1 upform" value="파일선택">
							    </td>
							</tr>
							<tr class="cmHeight">
								<th>
									상품 썸네일 등록
								</th>
								<td>
								  	<label for="thumnailImg">업로드</label> 
								  	<input type="file" id="thumnailImg" name="file_"/> 
								    <input class="upload-name2 upform" value="파일선택">
							    </td>
							</tr>
							<tr>
								<td colspan="2">
									<div class="comBtnWrap">
										<button type="button" onclick="productInsert(this.form)">상품등록</button>
										<button type="button" onclick="location.href='productList'">상품목록</button>
									</div>
								</td>					
							</tr>
						</tfoot>
					</table>	
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="resources/js/common.js"></script>
<%@ include file="/WEB-INF/views/admin/adminPageRmenu.jsp" %>