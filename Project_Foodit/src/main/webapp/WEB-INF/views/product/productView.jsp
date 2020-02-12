<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

 <jsp:include page="/WEB-INF/views/common/header.jsp" >
	<jsp:param value="# ${productDto.product_name} - FOODIT 메뉴" name="title"/>
</jsp:include>   

<script type="text/javascript">
	function productModify(f){
		f.action = "productModifyPage?product_no=${productDto.product_no }";
		f.submit();	
	} 

	function addCart(f){	// 회원 장바구니 담기
		var check = confirm("'#${productDto.product_name}'이 장바구니에 담겼습니다.장바구니로 이동하시겠습니까?");
		if (check) {
			f.action ="cartInsert";	
			f.submit();	
		}	
	}
	function guestAddCart(f){	// 비회원 장바구니 담기
		var check = confirm("'#${productDto.product_name}'이 장바구니에 담겼습니다.장바구니로 이동하시겠습니까?");
		if (check) {
			f.action ="guestCartInsert";	
			f.submit();	
		}	
	} 
</script>

	<form method="POST">
		<div class="pdDetailWrap">
		 	<c:if test="${mDto.role == 'admin' }">	<!-- 관리자만 보이는 부분   -->
				<button type="button" class="adminBtn" onclick="productModify(this.form)">수정/삭제</button> 	 	
		 	</c:if>
			<div class="topInfo">
					<input type="hidden" name="product_no" value="${productDto.product_no }">	<!-- 상품 수정,삭제시에 이용하는 상품 번호 -->
					<input type="hidden" name="cart_id" value="${mDto.id }">					<!-- 현재 로그인한 사용자의 id를 카트 사용자 id로 전달한다. -->
					<div class="pdLeftWrap">
						<div class="pdImgWrap">
							<!-- 본문 썸네일 이미지 사이즈 : 550 x 550 -->  
							<img alt="${productDto.product_thumbImg }" src="${pageContext.request.contextPath }/resources/upload/${productDto.product_thumbImg}"/>	 
						</div>
					</div>
					<div class="pdRightWrap">
						<div class="pdRtit">
							<div class="pdRtitWrap">
								<div class="pdRtitInfo">
									<span class="pdRCont">${productDto.product_content }</span>
									<span class="pdRTit">${productDto.product_name }</span>
								</div>
							</div>
							<p class="pdOrgin">원산지 : 상품정보 참조</p>
						</div>
						<div class="pdRpriWrap">
							<dl class="priceTxt">
								<dt>판매가</dt>
								<dd>
									<span class="pdPrice">
										<fmt:formatNumber value="${productDto.product_price}" pattern="#,###,###" />원
									</span>
								</dd>
							</dl>
						</div>
						<div class="pdSendWrap">
							<dl>
								<dt>배송비 :</dt>
								<dd>
									<span class="stPrice">3,000원</span>
									<span class="stTxt">3만원 이상 구매 시 무료 배송</span>
								</dd>
							</dl>
						</div>
						<div class="orderSendWrap">
							<div class="itemBoxWrap">
								<div class="itemBox">
									<span class="itemInfo mtElps">
										${productDto.product_name }
									</span>
									<div class="itemQuantity">
										<div class="itemAddBox">
											<div class="cartBox">
												<button type="button" class="minus btn_amount" ></button>
												<input type="number" id="count" class="cart_amount" name="cart_amount" min="1" max="${productDto.product_stock}" value="1" readonly="readonly"/>
												<button type="button" class="plus btn_amount" ></button>
											</div> 
										</div>
									</div>
									<span class="itemPriceWrap">
										<span class="itemPrice"><fmt:formatNumber value="${productDto.product_price}" pattern="#,###,###" />원</span>
									</span>
								</div>
							</div>
						</div>	
						<div class="cartSend">
							<div class="cartSendBtnWrap">
								<div class="cartSendBtn">
									<c:choose>
										<c:when test="${mDto.id eq null }">
											<!-- 비회원 장바구니 담기 -->
											<button type="button" onclick="guestAddCart(this.form)">장바구니 담기</button>
										</c:when>
										<c:otherwise>
											<!-- 회원 장바구니 담기 -->
											<button type="button" onclick="addCart(this.form)">장바구니 담기</button>
										</c:otherwise>
									</c:choose> 
								</div>
							</div>
						</div>
					</div>
				</div>
			<div class="bottomInfo">
				<div class="pdTabWrap">
					<div class="pdTabList">
						<ul class="pdTab">
							<li class="pdTabNav">
								<a href="#detail">
									<span>상세설명</span>
								</a>
							</li>
							<li class="pdTabNav">
								<a href="#faq">
									<span>배송/반품/문의</span>
								</a>
							</li>
						</ul>
					</div>
				</div>	
			
				<div id="detail" class="tabContent">
					<div class="tabView viewDetail">
						<div class="detailBox">
							<div class="detailImg">
								<!-- 본문 상세내용 이미지 사이즈 : 1000x5716  -->  
								<img alt="${productDto.product_img }" src="${pageContext.request.contextPath }/resources/upload/${productDto.product_img  }"/>
							</div>
						</div>
					</div>	
			 	</div>	
			 	
				<div id="faq" class="tabContent" style="display:none">		
					<div class="tabView viewDetail">
						<div class="tTit_wrap">
							<h2 class="h2_tit">상품 관련 문의해 주세요.</h2>
							<span class="subTtext">
								고객님의 질문에 정성껏 빠르게 답변해 드리겠습니다.<br/> 
								이메일 : foodit@food.com
							</span>
						</div>
						<div class="list_acco">
							<ul>
								<li>
									<div class="pdHead">
										<a href="#" onclick="return false;">
											<span class="pTit">배송안내</span>
										</a>
									</div>
									<div class="pdBottom" style='display:none'>
										<dl>
											<dt class="pContTit">배송지역</dt>
											<dd class="pContTxt">
												<p class="txtPar">서울, 경기, 인천 (일부 지역 제외) 배송 가능 여부 확인</p>
											</dd>
										</dl>
										<dl>
											<dt class="pContTit">배송비</dt>
											<dd class="pContTxt">
												<p class="txtPar">3,000원 (3만원 이상 구매 무료배송)</p>
											</dd>
										</dl>
										<dl>
											<dt class="pContTit">주문마감/배송정보</dt>
											<dd class="pContTxt">
												<p class="txtPar">주문 마감 시간은 <span class="fc_black">평일 오전 7시입니다.</span></p>
												<p class="txtPar">토·일·공휴일은 마감이 없으며, 다음날인 일·월·공휴일 다음날은 배송이 없습니다.</p>
												<p class="txtPar">
													<span class="fc_black">배송은 주문 시 지정한 배송일에 집 앞으로 새벽 배송(오전 7시 이전) 됩니다.</span>
													다만 일부 지역은 새벽이 아닌 전일 저녁 시간에 배송될 수 있으나, 모든 푸딧은 배송 시간과 관계없이 
													아침까지 품질에 문제 없도록 보냉 포장하여 배송하오니 아침에 발견하더라도 안심하고 이용 부탁드립니다.
												</p>
												<p class="txtPar">
													지정한 배송일 오전 7시 이전에 배송될 수 있도록 노력하고 있으나, 교통상황 및 기상에 따라 1~2시간 정도 
													배송이 지연될 수 있습니다.
												</p>
												<p class="txtPar">
													고객님과 연락이 어려운 새벽에 배송되어, 새벽출입이 제한되는 곳(카드키로만 출입되는 공동현관 등)은 
													배송이 어렵습니다. 위의 경우 새벽 출입 여부를 확인하신 후, 주문시 '공동현관 출입방법'을 자세히 적어주시기 바랍니다.
												</p>
												<p class="txtPar">
													공동현관 출입방법 미기재 및 오기재로 인해 배송이 어려운 경우 공동현관 앞 또는 경비실로 대응 
													배송될 수 있으며, 반송될 경우 취소/반품/환불이 불가합니다.
												</p>
												<p class="txtPar">
													새벽배송 지역이라도 회사, 관공서, 학교, 기숙사, 병원, 시장, 공단, 산간 등은 배송이 불가합니다.
												</p>
											</dd>
										</dl>
									</div>
								</li>
								<li>
									<div class="pdHead">
										<a href="#" onclick="return false;">
											<span class="pTit">변경/취소/반품 안내</span>
										</a>
									</div>
									<div class="pdBottom" style='display:none'>
										<div class="pContWrap">
											<dl>
												<dt class="pContTit">변경/취소 안내</dt>
												<dd class="pContTxt">
													<p class="txtPar">주문마감 전까지는 배송지 변경, 주문 취소가 가능합니다.</p>
													<p class="txtPar">
														주문마감 이후, 주문 상태가 <span class="fc_black">'재료준비'</span>인 단계부터는 
														<span class="fc_black">변경 및 취소가 불가</span>합니다.
													</p>
												</dd>
											</dl>
											<dl>
												<dt class="pContTit">교환/반품 신청 기간</dt>
												<dd class="pContTxt">
													<p class="txtPar">상품 수령인로부터 7일 이내</p>
													<p class="txtPar"><span class="fc_black">(냉장/냉동, 신선식품은 상품 수령일로부터 1~2일 이내)</span></p>
												</dd>
											</dl>
											<dl>
												<dt class="pContTit">교환/반품 불가 안내</dt>
												<dd class="pContTxt">
													<p class="txtPar">한정 수량 판매 방식으로 교환 시 품절이 발생할 수 있어 교환은 불가합니다.</p>
													<p class="txtPar">
														<span class="fc_black">
															냉장･냉동･신선제품으로 시간이 경과되면 상품의 가치가 훼손되기 쉬우므로 제품의 하자 
															이외의 이유로(단순변심 등) 인한 교환/반품은 불가합니다.
														</span>
														<div class="txtPar">
															다음의 경우 교환/반품 신청기간 내에라도 취소/교환/반품이 불가합니다.
															<div class="txtBox">
																<ul class="bul_list">
																	<li><i class="bul"></i>포장을 개봉하거나 상품의 일부를 취식한 경우</li>
																	<li><i class="bul"></i>잘못된 보관 방법으로 변질된 경우</li>
																	<li><i class="bul"></i>패키지 상품, 묶음 상품, 특가 상품의 부분 교환/반품을 원하는 경우</li>
																	<li><i class="bul"></i>구성품 또는 사은품을 반납하지 않은 경우</li>
																	<li><i class="bul"></i>냉장·냉동·신선제품에 대해 시간이 경과되어 상품 등의 가치가 현저히 감소한 경우</li>
																	<li><i class="bul"></i>고객님의 주소 기입 오류, 임의 수취거부, 수취인 연락 부재로 인해 반송될 경우</li>
																</ul>
															</div>
														</div>
													</p>
												</dd>
											</dl>
											<dl>
												<dt class="pContTit">반품 안내</dt>
												<dd class="pContTxt">
													<div class="txtPar">
														제품의 하자 이외의 이유로 반품시에는 배송비가 부과됩니다.
														<div class="txtBox">
															<ul class="bul_list">
																<li>
																	<i class="bul"></i>반품 배송비 : 박스당 6,000원(왕복)<br/>
																	단, 남은 결제금액이 택배비 무료 기준 금액 이상인 경우 3,000원(편도) 부과
																</li>
																<li><i class="bul"></i>제품의 하자, 오배송 시 반품비 무료</li>
															</ul>
														</div>
													</div>
													<div class="txtPar">
														배송된 제품에 하자가 있거나, 구성품 누락, 오배송 시 다음 절차에 따라 반품 신청이 가능합니다. 
														(임의 반품 시, 처리불가)
														<div class="txtBox">
															<ul class="bul_num_list">
																<li>
																	<p>①
																	<span class="num_txt">배송된 제품과 배송 상태 확인 후 냉장/냉동보관</span>
																	</p>
																</li>
																<li>
																	<p>②
																	<span class="num_txt fc_black">배송된 제품과 배송 상태 확인 후 냉장/냉동보관</span>
																	</p>
																</li>
															</ul>
															<ul class="bul_list">
																<li>
																	<i class="bul"></i>사진만으로 제품 하자 판독이 어려운 경우 회수하여 검수 후, 처리 가능하므로 제품 보관
																</li>
															</ul>
															<ul class="bul_num_list">
																<li>
																	<p>③
																	<span class="num_txt fc_black">고객행복센터로 사진을 첨부하여 문의</span>
																	</p>
																</li>
															</ul>
															<ul class="bul_list">
																<li><i class="bul"></i>FOODIT 사이트에서 안내된 email로 문의</li>
																<li><i class="bul"></i>고객행복센터 1668-1920로 전화 (평일 8:00~17:00, 토요일 8:00~12:00 / 점심시간 12:00~13:00)</li>
																<li><i class="bul"></i>고객행복센터 1668-1920로 문자 발송(주문번호, 사진첨부, 문제사항 기재)</li>
															</ul>
															<ul class="bul_num_list">
																<li>
																	<p>④
																	<span class="num_txt">문의 사항에 대해 내부 심사팀 확인</span>
																	</p>
																</li>
																<li>
																	<p>⑤
																	<span class="num_txt">문의 사항에 대해 내부 심사팀 확인</span>
																	</p>
																</li>
																<li>
																	<p>⑥
																	<span class="num_txt">반품신청 후, 7일 이내 '반품완료' 처리 이내</span>
																	</p>
																</li>
															</ul>
														</div>
													</div>
												</dd>
											</dl>
											<dl>
												<dt class="pContTit">환불 안내</dt>
												<dd class="pContTxt">
													<p class="txtPar">현금으로 결제하신 경우 '반품완료'후 신청하신 환불계좌로 영업일 기준 2~3일 이내 입금됩니다.</p>
													<p class="txtPar">카드로 결제하신 경우 '반품완료'후 영업일 기준 4~7일 이내 승인취소 처리됩니다.</p>
												</dd>
											</dl>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div> <!-- end -->
	</form>

<script type="text/javascript" src="resources/js/product.js"></script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>