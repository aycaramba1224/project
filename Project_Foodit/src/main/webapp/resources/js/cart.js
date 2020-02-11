	$(function(){  
		// 체크된 개수 
		var count = $('input:checkbox[name=chBox]:checked').length;	
		$("#chkCount").empty();
		$("#chkCount").append(count);

		// 체크박스 전체 선택 및 전체 해제
		$("#allCheck").click(function(){
			var chk = $("#allCheck").prop("checked");
			if(chk) {
			 	$(".chBox").prop("checked", true);	
			 	$("#chkCount").empty();
				$("#chkCount").append(count);
			} else {
			 	$(".chBox").prop("checked", false);
			 	$("#chkCount").empty();
			 	$("#chkCount").append(0);
			 }		 
		});
		
		// 개별 체크 박스
		$(".chBox").click(function(){
			$("#allCheck").prop("checked", false);	
			var count = $('input:checkbox[name=chBox]:checked').length;
			$("#chkCount").empty();
			$("#chkCount").append(count);
	 	});		
		
  	});	  

	//체크박스 선택 후 선택 삭제 (회원)
	function selectDelete() {	 
		if($('input:checkbox[name=chBox]:checked').length== 0){
			alert("선택된 상품이 없습니다.")
			return;
		} else {
			var chk = confirm("상품을 삭제하시겠습니까?");			  
			if(chk) {
				var select = $('input:checkbox[name=chBox]:checked').val();	
				var arr = [];
				$("input[class=chBox]:checked").each(function(){
					arr.push($(this).attr("cartNo"));					
				});
				for(var i in arr){					 	
					location.href="cartDelete?cart_no=" + arr[i];
					for(var i = 0; i < 1000000000; i++) { }
				}
			}
		} 
						 
	}	
 	
	
	//체크박스 선택 후 선택 삭제 (비회원)
	function gc_selectDelete() {	 
		if($('input:checkbox[name=chBox]:checked').length== 0){
			alert("선택된 상품이 없습니다.")
			return;
		} else {
			var chk = confirm("상품을 삭제하시겠습니까?");			  
			if(chk) {
				var select = $('input:checkbox[name=chBox]:checked').val();	
				var arr = [];
				$("input[class=chBox]:checked").each(function(){
					arr.push($(this).attr("cartNo"));					
				});
				for(var i in arr){					 	
					location.href="guestCartDelete?cart_no=" + arr[i];
					for(var i = 0; i < 1000000000; i++) { }
				}
			}
		}		 
						 
	}	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	