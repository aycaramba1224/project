$(function(){

	/* Ajax 통신 */
	$(".tab").click(function(){
		$(".txt").val('');
		$(".faqResultTxt").css("display","none");
		$.ajax({
			url: "faqSelect",
			type: "POST",
			dataType: "json",
			data: "faq_category=" + $(this).attr('id'),
			success: function(data){
				$(".faqViewArea").empty();
				$(".pageNavi").empty();
				var result = "";
				var pagingView = data.pagingView;
				if( data["listSize"] > 0 ){
					$.each(data.data, function(){
						var title = this.faq_title;
						var content = this.faq_content;
						var category = this.faq_category;
						// category 값 영->한 변환
						if( category == "delievery" ){ 
							category = "배송";
						} else if ( category == "payment" ){
							category = "결제/영수증";
						} else if ( category == "order" ){
							category = "주문";
						} else if ( category == "ret" ){
							category = "취소/반품";
						} else if ( category == "review" ){
							category = "리뷰";
						} else if ( category == "member" ){
							category = "회원";
						} else if ( category == "etc" ){
							category = "기타";
						}
						result += "<li>";
						result += "<div class='fqHead'>";
						result += "<a href='#' onclick='return false;'>"; 
						result += "<div class='qTit'>" 
						result += "<strong>Q</strong>";
						result += title;
						result += "<span class='cate'>" + category + "</span>";
						result += "</div>";
						result += "</a>";
						result += "</div>";
						result += "<div class='fqBottom' style='display:none'>";
						result += "<strong>A</strong>";
						result += "<p class='fqcont'>" + content + "</p>"; 
						result += "</div>";
						result += "</li>";
					});
				} else {
						result += "<li>";
						result += "<p>" + "게시물이 존재하지 않습니다." + "</p>";
						result += "</li>";
				}
				
				$(".faqViewArea").append(result);
				$(".pageNavi").append(pagingView);
			},
			error: function(){
				alert("페이지의 정보를 불러오지 못했습니다.");
			}
		});
	});
	/* 문의 유형 tab Event*/
	var target = $(".tabItem");
	target.click(function(){ 
		$(this).addClass("on");
		target.not($(this)).removeClass("on");
	});
	// 검색 영역 X버튼 표시/비표시
	$(".txt").focus(function(){
		$(".ico").css("display","block");
	});
	// 클릭 이벤트 처리 후 사라지는 이벤트
	$(".txt").blur(function(){
		var timer = setTimeout(function(){
			$(".ico").css("display","none");
		}, 200);
	});
	// x버튼 input 값 지우기
	$(".ico").click(function(){
		$(".txt").val("");
	});
	// QnA 슬라이드
	$(document).on("click", ".fqHead", function() {
		$(this).next().slideToggle("fast");
	});
	// 검색버튼 클릭에 따른 검색결과 텍스트 show/hide
	$(document).on("click", ".srchBtn", function() {
		var timer = setTimeout(function(){
			$(".faqResultTxt").css("display","block");
		}, 1000);
//		$(".faqViewArea li").css("display","none");
		$(".class").off('click');
	});
	// 검색영역의 값이 없을때에는 텍스트 hide
	var searchVal = $('input[name=faq_content]').val();
	if( searchVal == "" ){
		$(".faqResultTxt").css("display","none");
	} 
	$(document).on("click", ".ico", function() {
		$(".faqResultTxt").css("display","none");
		$(".faqViewArea li").css("display","block");
	});
	
});

