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
	
});