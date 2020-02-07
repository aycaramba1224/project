$(function(){
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
});