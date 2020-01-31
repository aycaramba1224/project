<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function orderDelete(f){
	if (confirm("정말 삭제할까요?")) {
		location.href='orderBaseDelete?order_no=${orderBaseDto.order_no}';
	}
}

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
</script>

</head>
<body>
	<form method="post" action="orderListModify" name="f">
	       <h1>주문자 정보</h1>
			<table border="1">
				<tbody>
					<tr>
						<td>주문번호
							${orderBaseDto.order_no }
							<input type="hidden" name="order_no" value="${orderBaseDto.order_no }"/>
						</td>
					</tr>
					  
					 <tr>
					 <td>주문비밀번호
					 ${orderBaseDto.guest_pw }
					 <input type="hidden" name="guest_pw" value="${orderBaseDto.guest_pw}"/>
					 </td>
					 </tr>
					 
					<tr>
						<td>주문자이름
						<input type="text" name="order_name" value="${orderBaseDto.order_name}"/>
						</td>
					</tr>
					
					<tr>
						<td>휴대폰
						<input type="text" name="order_phone" value="${orderBaseDto.order_phone}"/>-
						<input type="text" name="order_phone2" value="${orderBaseDto.order_phone2}"/>-
						<input type="text" name="order_phone3" value="${orderBaseDto.order_phone3}"/>
						</td>
					</tr>
					
					<tr>
						<td>이메일
						<input type="text" name="order_email" value="${orderBaseDto.order_email}"/>
						<input type="text" name="order_email2" value="${orderBaseDto.order_email2}"/>
						</td>
					</tr>
					
					<tr>
					<td>
					  ${OrderBaseDto.orderDate}
					</td>
					</tr>
					
					</tbody>
					</table>
					
					<h1>배송정보</h1>
					<table border="1">
				<tbody>
				   <tr>
						<td>주문자이름
						<input type="text" name="order_name" value="${orderBaseDto.order_name}"/>
						</td>
					</tr>
					
					<tr>
						<td>휴대폰
						<input type="text" name="order_phone" value="${orderBaseDto.order_phone}"/>-
						<input type="text" name="order_phone2" value="${orderBaseDto.order_phone2}"/>-
						<input type="text" name="order_phone3" value="${orderBaseDto.order_phone3}"/>
						</td>
					</tr>
				
					<tr>
						<td>우편번호
				<input type="text" id="sample4_postcode" placeholder="우편번호" name="order_post" value="${orderBaseDto.order_post}" />
			    <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br></td>
					</tr>
					
					<tr>
				    <td>주소
		           <input type="text" id="sample4_roadAddress" placeholder="주소"  name="order_road1" size="70"value="${orderBaseDto.order_road1}" />
		          </td>
					</tr>
				
					<tr>
						<td colspan="4">
						    <input type="button" value="주문 정보보기" onclick="location.href='orderBaseList'" />
						    <input type="submit" value="주문정보 수정" />
							<input type="button" value="주문정보 삭제" onclick="orderDelete()" />
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  

</body>
</html>