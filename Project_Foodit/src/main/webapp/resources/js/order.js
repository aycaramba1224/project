 //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}

function regCancel(){
	history.back();
}

function passchk() {
	 var guest_pw = f.guest_pw.value;
	 var guest_pw2 =f.guest_pw2.value;
	 if (guest_pw2.length == 0 || guest_pw2 == null) {
	  f.chk.value = "비밀번호를 입력하세요";
	 } else if (guest_pw != guest_pw2) {
	 f.chk.value = "비밀번호가 다릅니다.";
	 } else {   
	 f.chk.value = "비밀번호가 동일합니다.";
	 }
	 return;
	}
	
	
	//회원일떄 결제하기
	function memberbuy() {
		 f.action = "memberbuy";
		 f.submit();
		 alert("주문성공했습니다!주문내역은 주문내역 페이지에서 확인해주세요");
	}
	
	function guestOrder() {
		
		f.action = "orderInsert";
		 f.submit();
		 alert("주문성공했습니다!비회원주문내역은 비회원 주문내역 페이지에서 확인해주세요");
	}
	
	/*주문조회/배송 수정/삭제(비회원)*/
	
	var orderBaseModifyResult = "${orderBaseModifyResult}";
	if( orderBaseModifyResult == "yes"){
		var orderModifyResult= "${orderModifyResult}";
		if(orderModifyResult == 0){
			alert("주문 정보 수정 실패.");
		} else {
			alert("주문정보 수정성공.");
		}
	}


	var orderDeleteResult = "${orderDeleteResult}";
	 if( orderDeleteResult == "yes"){
			var deleteResult = "${deleteResult}";
			if(deleteResult== 0){
				alert("주문정보 삭제 실패.");
			} else {
				alert("주문정보 삭제 성공.");
				
			}
		}
	 
	 function orderDelete(f){
			if (confirm("정말 삭제할까요?")) {
				location.href='orderBaseDelete?order_no=${orderBaseDto.order_no}';
			}
		}
	 
	 //회원일 경우 신규배송지 등록

	 function memberdeliveryInsert(){
		 f.action = "memberdeliveryInsert";
		 f.submit();
		 alert("신규 배송지 등록이 되었습니다.주문페이지,회원 주문조회 페이지에서 확인해주세요");
	 }
