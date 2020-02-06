<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

 <jsp:include page="/WEB-INF/views/common/header.jsp" >
	<jsp:param value="# ${productDto.product_name} - FOODIT 메뉴" name="title"/>
</jsp:include>   

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">

	function productModify(f){
		f.action = "productModifyPage?product_no=${productDto.product_no }";
		f.submit();	
	} 

	function addCart(f){
		var check = confirm("'#${productDto.product_name}'이 장바구니에 담겼습니다.장바구니로 이동하시겠습니까?");
		if (check) {
				f.action ="cartInsert?product_no=${productDto.product_no }";	
				f.submit();	
		}	
	}
</script>
</head>
<body>

	<div id="wrap">
 	
		<form method="POST">
			<input type="hidden" name="product_no" value="${productDto.product_no }">	<!-- 상품 수정,삭제시에 이용하는 상품 번호 -->
			<input type="hidden" name="cart_id" value="${mDto.id }">					<!-- 현재 로그인한 사용자의 id를 카트 사용자 id로 전달한다. -->
		 
		 	<c:if test="${mDto.role == 'admin' }">	<!-- 관리자만 보이는 부분   -->
				<input type="button" value="수정/삭제" onclick="productModify(this.form)"/> 	 	
		 	</c:if>
		
			<table border="1" style="width:1000px;"> <!-- 테이블 사이즈 향후 수정예정 -->				
				<tbody>
					<tr>
						<td rowspan ="7">
							<!-- 본문 썸네일 이미지 사이즈 : 600x600   -->  
							<img alt="${productDto.product_thumbImg }" src="${pageContext.request.contextPath }/resources/upload/${productDto.product_thumbImg}" style="width:600px; height:600px;" />	 
						</td>
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
							 <input type="button"  value="장바구니 담기" onclick="addCart(this.form)"/>
						</td>
					</tr>
					<tr>
						<td colspan="2"><a href="#detail">상세설명</a>&nbsp;|&nbsp;<a href="#info">상품정보</a>&nbsp;|&nbsp;<a href="#review">리뷰</a>&nbsp;|&nbsp;<a href="#faq">배송/반품/문의</a></td>
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
	
	
	
	<br/><br/>
	<div id="detail">
		<!-- 본문 상세내용 이미지 사이즈 : 780x1272  -->  
		<img alt="${productDto.product_img }" src="${pageContext.request.contextPath }/resources/upload/${productDto.product_img  }"style="width:780px; height:7500px;"/>	 
 	</div>	
 	
	<br/><br/>
	
	<div id="info">
	<span>상품정보</span> <br/>
	<span>상품 코드 : ${productDto.product_no} </span> <br/>
	<span>FOODIT 상품정보는 전자상거래 등에서의 상품정보 제공 고시에 따라 작성되었습니다.</span>
		<table style="width:1000px;">
			<tbody>
				<tr>
					<td>본상품구성</td>
					<td>상세 별도 표기</td>
				</tr>	
				<tr>
					<td>주원료/원산지</td>
					<td>상세 별도 표기</td>
				</tr>	
				<tr>
					<td>원재료 및 함량</td>
					<td>상세 별도 표기</td>
				</tr>	
				<tr>
					<td>식퓸의 유형</td>
					<td>상세 별도 표기</td>
				</tr>	
				<tr>
					<td>제조연월일, 유통기한 또는 품질유지 기한</td>
					<td>구성품 내 표시사항 참고 </td>
				</tr>	
				<tr>
					<td>생산자 및 소재지(수입품의 경우 생산자, 수입자 및 제조국)</td>
					<td>상세 별도 표기</td>
				</tr>	
				<tr>
					<td>포장단위별 용량(중량), 수량</td>
					<td>상세 별도 표기</td>
				</tr>	
				<tr>
					<td>영양성분</td>
					<td>해당사항 없음</td>
				</tr>	
				<tr>
					<td>유전자재조합식품에 해당하는 경우의 표시</td>
					<td>해당사항 없음</td>
				</tr>	
				<tr>
					<td>영유아식 또는 체중조절식품 등에 해당하는 경우 표시광고사전심의필 유무 및 부작용 발생 가능성</td>
					<td>해당사항 없음</td>
				</tr>	
				<tr>
					<td>수입식품에 해당하는 경우 “식품위생법에 따른 수입신고를 필함”의 문구</td>
					<td>식품위생법에 따른 수입신고를 필함</td>
				</tr>	
				<tr>
					<td>소비자상담 관련 전화번호</td>
					<td>1668-1920</td>
				</tr>	
				<tr>
					<td colspan="2">${productDto.product_name } 제품 정보</td>					 
				</tr>	
				<tr>
					<td>제품 정보 이미지 추가 예정</td>
				</tr>
			</tbody>
		</table>
	</div>
	<br/><br/>
	<div id="review">
		리뷰 페이지
		
	</div> 
	<br/><br/>
	<div id="faq">	<!-- 스크롤 위치 보는중   -->	
	배송/반품/문의		<!-- 삭제예정  -->
	<br/>
	<span>상품 관련 문의해 주세요.</span><br/>
	<span>고객님의 질문에 정성껏 빠르게 답변해 드리겠습니다.<br/> </span>
	<span>작성해주신 문의내역 및 답변은 MY푸딧 > 나의활동 > 1:1 문의 내역 메뉴에서 확인 가능합니다.<br/></span>
	<input type="button" value="1:1문의" onclick=""/> <br/><br/>
	
	<h3><span>배송안내</span></h3> <!-- 클릭시 아래내용 나옴  -->
	 
	<table style="width:1000px;">
		<tr>
			<td>배송지역</td>
			<td>서울, 경기, 인천 (일부 지역 제외) 배송 가능 여부 확인</td>
		</tr>
		<tr>
			<td>배송비</td>
			<td>3,000원 (3만원 이상 구매 무료배송)</td>
		</tr>
		<tr>
			<td>주문마감/배송정보 </td>
			<td>주문 마감 시간은 평일 오전 7시입니다.</td>
		</tr>
		<tr>
			<td></td>
			<td>
			<p> 토·일·공휴일은 마감이 없으며, 다음날인 일·월·공휴일 다음날은 배송이 없습니다.</p>	
			배송은 주문 시 지정한 배송일에 집 앞으로 새벽 배송(오전 7시 이전) 됩니다.다만 일부 지역은<br/>  
			새벽이 아닌 전일 저녁 시간에 배송될 수 있으나, 모든 푸딧은 배송 시간과 관계없이 <br/>
			아침까지 품질에 문제 없도록 보냉 포장하여 배송하오니 아침에 발견하더라도 안심하고 이용 부탁드립니다.<br/>	
			지정한 배송일 오전 7시 이전에 배송될 수 있도록 노력하고 있으나, 교통상황 및 기상에 따라 1~2시간 정도 배송이 지연될 수 있습니다.<br/>			
			고객님과 연락이 어려운 새벽에 배송되어, 새벽출입이 제한되는 곳(카드키로만 출입되는 공동현관 등)은 배송이 어렵습니다.<br/>
			위의 경우 새벽 출입 여부를 확인하신 후, 주문시 '공동현관 출입방법'을 자세히 적어주시기 바랍니다.<br/>
			공동현관 출입방법 미기재 및 오기재로 인해 배송이 어려운 경우 공동현관 앞 또는 경비실로 대응 배송될 수 있으며,<br/>
			반송될 경우 취소/반품/환불이 불가합니다.	새벽배송 지역이라도 회사, 관공서, 학교, 기숙사, 병원, 시장, 공단, 산간 등은 배송이 불가합니다.</td>
		</tr>	
	</table>
	<br/><br/>
	
	<h3><span>변경/취소/반품 안내</span></h3> <!-- 클릭시 아래내용 나옴  -->
	 
	<table style="width:1000px;">
		<tr>
			<td>변경/취소 안내</td>
			<td>주문마감 전까지는 배송지 변경, 주문 취소가 가능합니다.<br/>
				주문마감 이후, 주문 상태가 '재료준비'인 단계부터는 변경 및 취소가 불가합니다.
			</td>
		</tr>
		<tr>
			<td>배송비</td>
			<td>3,000원 (3만원 이상 구매 무료배송)</td>
		</tr>
		<tr>
			<td>교환/반품 신청 기간</td>
			<td>상품 수령인로부터 7일 이내<br/>
				(냉장/냉동, 신선식품은 상품 수령일로부터 1~2일 이내)
			</td>
		</tr>
		<tr>
			<td>교환/반품 불가 안내</td>
			<td>한정 수량 판매 방식으로 교환 시 품절이 발생할 수 있어 교환은 불가합니다.<br/>
				냉장･냉동･신선제품으로 시간이 경과되면 상품의 가치가 훼손되기 쉬우므로 제품의 하자 이외의 <br/>
				 이유로(단순변심 등) 인한 교환/반품은 불가합니다.<br/>				
				다음의 경우 교환/반품 신청기간 내에라도 취소/교환/반품이 불가합니다.<br/>
				※포장을 개봉하거나 상품의 일부를 취식한 경우<br/>
			            ※잘못된 보관 방법으로 변질된 경우<br/>
				※패키지 상품, 묶음 상품, 특가 상품의 부분 교환/반품을 원하는 경우<br/>
				※구성품 또는 사은품을 반납하지 않은 경우<br/>
				※냉장·냉동·신선제품에 대해 시간이 경과되어 상품 등의 가치가 현저히 감소한 경우<br/>
				※고객님의 주소 기입 오류, 임의 수취거부, 수취인 연락 부재로 인해 반송될 경우
			</td>
		</tr>	
		<tr>
			<td>반품 안내</td>
			<td>제품의 하자 이외의 이유로 반품시에는 배송비가 부과됩니다.<br/>
				 반품 배송비 : 박스당 6,000원(왕복)<br/>
				 단, 남은 결제금액이 택배비 무료 기준 금액 이상인 경우 3,000원(편도) 부과<br/>
				 제품의 하자, 오배송 시 반품비 무료<br/> 
				 배송된 제품에 하자가 있거나, 구성품 누락, 오배송 시 다음 절차에 따라 반품 신청이 가능합니다.<br/>
				 (임의 반품 시, 처리불가)<br/>
				① 배송된 제품과 배송 상태 확인 후 냉장/냉동보관<br/>				
				② 문제사항 발견 시, 즉시 사진 촬영<br/>				
				    사진만으로 제품 하자 판독이 어려운 경우 회수하여 검수 후, 처리 가능하므로 제품 보관<br/>
				③ 고객행복센터로 사진을 첨부하여 문의<br/>				
				 FOODIT 사이트에서 [1:1문의]로 문의<br/>
				 고객행복센터 1668-1920로 전화 (평일 8:00~17:00, 토요일 8:00~12:00 / 점심시간 12:00~13:00)<br/>
				 고객행복센터 1668-1920로 문자 발송(주문번호, 사진첨부, 문제사항 기재)<br/>
				④ 문의 사항에 대해 내부 심사팀 확인<br/>				
				⑤ 사진만으로 판독이 어려운 경우 회수 안내 및 심사 진행<br/>				
				⑥ 반품신청 후, 7일 이내 '반품완료' 처리 이내<br/>
 			</td>
		</tr>
		<tr>
			<td>환불 안내</td>
			<td>현금으로 결제하신 경우 '반품완료'후 신청하신 환불계좌로 영업일 기준 2~3일 이내 입금됩니다.<br/>
				카드로 결제하신 경우 '반품완료'후 영업일 기준 4~7일 이내 승인취소 처리됩니다.
			</td>
		</tr>	
	</table>

	</div>

</body>
</html>