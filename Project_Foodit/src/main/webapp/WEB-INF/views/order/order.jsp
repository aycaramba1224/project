<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	
<title>Insert title here</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
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
	
	    
		<form method="post" action="orderInsert">
	    <!--상품정보도 들어가야됨  -->
		<table border="1">
			<tbody>
				
					<!--비회원직접쓰는 주문번호 말고 회원은 주문번호를 주어줌 
						그래서 DB에회원용 주문번호 칼럼을 넣고 랜덤으로 주어지도록??-->
					<tr>
					<td>주문아이디<input type="text" name="order_id" id="order_id" /></td>
					</tr>
	                 <!--mId랑 연결해야됨  
	                 <tr>
	                 <td>주문자아이디 (회원아이디)
	                 <input type="text" name="id" id="id" /></td>
	                 </tr>
	                  -->
					<tr>
						<td>주문자이름
						<input type="text" name="order_name" id="order_name" /></td>
					</tr>
					
					<tr>
						<td>우편번호
				<input type="text" id="sample4_postcode" placeholder="우편번호" name="order_post" />
			    <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
			    </td>
				</tr>
				  <tr>
				    <td>주소
				    
		<input type="text" id="sample4_roadAddress" placeholder="도로명주소"  name="order_road1" />
		
         <input type="text" id="sample4_jibunAddress" placeholder="지번주소" name="order_road2">
         <span id="guide" style="color:#999;display:none"></span>
          <input type="text" id="sample4_detailAddress" placeholder="상세주소" name="order_road3" >
          
					     <td>
				    </tr>
				    
				    <tr>
				    <td>주문자 휴대폰 번호
						<input type="text" name="order_phone" id="order_phone"/></td>
				    </tr>
				    <!-- 
				    <tr>
				    <td>
			                         총 가격 <input type="hidden" name="amount" value="${sum}"/> 장바구니 총가격이랑 같아야함
				    </td>
				    </tr>
				    	     -->
               </tbody>
                   <tr>
               	<td colspan="7">
	     <input type="submit" value="구매하기" />
	     <!--비회원 정보 입력하고 정보 입력하고 구매하기 버튼누르면 어디로??? -->
	     <!--관리자일떄  -->
	     <input type="button" value="주문정보리스트 보기" onclick="location.href='orderBaseList'"/>
			</td>
			</tr>
               </table>
               </form>
           

</body>
</html>