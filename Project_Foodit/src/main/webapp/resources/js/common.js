$(function(){
	/* commmon-myFooditLM */
	$("ul.menuList li a").click(function(){  
		$("ul.menuList li a").removeClass("on"); // a 에 있는 모든 클래스 on 를 삭제  
		$(this).addClass("on");  // 그리고 현재의 요소에만 selected 클래스 추가.
		$("ul.panel li").hide(); // 탭의 변경에 맞쳐 패널의 표시,비표시를 변경합니다.모든 패널을 비표시합니다. 
		$($(this).attr("href")).show(); // $(this).attr("href") 로 클릭된 a 태그의 href 속성을 가져와 같은 이름의 id 속성을 가진 패널을 보여줍니다.
		return false; 
	});
});

