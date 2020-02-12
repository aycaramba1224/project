$(function(){	
	//productView.jsp 구매수량 조절 버튼 
	// 구매 수량 플러스  
	$(".plus").click(function(){
		var num = $(".cart_amount").val();
		var plusNum = Number(num) + 1;
		if(plusNum >= 11) {	
			alert("최대 구매 가능 수량은 10개 입니다.");// 최대 구매가능 상품은 10개로 제한함 
			$(".cart_amount").val(num);
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
	// anchor 이동
	var target = $(".pdTabNav ");
	target.on("click", function (e){
		$(this).addClass("on");
		target.not($(this)).removeClass("on");
		e.preventDefault();
		var tabName = $(this).children("a").attr("href");
		if( tabName == "#detail" ){
			window.scrollTo(773,773);
			$("#faq").css("display","none");
			$("#detail").css("display","block");
		} else {
			window.scrollTo(773,773);
			$("#faq").css("display","block");
			$("#detail").css("display","none");
			
		}
	});
	// QnA 슬라이드
	$(document).on("click", ".pdHead", function() {
		$(this).next().slideToggle("fast");
	});
	
});