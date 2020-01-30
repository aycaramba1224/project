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
	  <h1>주문하기</h1>
	  <br />
	  <br />
	  <h2>주문자</h2>
	    <hr />
		<form method="post" action="orderInsert">
	          
		
	                  <div>
	                    <label> 이름</label>   
						<input type="text" name="order_name" id="order_name" />
					  </div>
					  
					   <div>
					  	<label>휴대폰</label>
					  	<select name="order_phone1" class="order_phone">
					  <option value="::선택::">::선택::</option>
			          <option value="010">010</option>
			          <option value="011">011</option>
			          <option value="019">019</option>
		               </select>
		               <input type="text" name="order_phone2" class="order_phone"/>
		               <input type="text" name="order_phone3" class="order_phone"/>
		               </div>
		               
						
						<div>
						<label>이메일</label>
						<input type="text" name="order_email1" class="order_email"/>
						@
						<input type="text" name="order_email2" class="order_email"/>
					  	<select name="order_email3" class="order_email">
			          <option value="::선택::">::선택::</option>
			           <option value="naver.com">naver.com</option>
			          <option value="darm.net">darm.net</option>
			          <option value="google">google</option>
		               </select>
						</div>
					 
					     <div>
					     <label>주문비밀번호</label>
					     <input type="text" name="guest_pw" class="guest_pw"/>
					     <label>주문비밀번호 확인</label> 
					     <input type="text" name="guest_pw" class="guest_pw"/>
					     </div>
					     
					    <h2>배송정보</h2>
					    <div>
	                    <label> 이름</label>   
						<input type="text" name="order_name" id="order_name" />
                        </div>
                        
                         <div>
					  	<label>휴대폰</label>
					  	<select name="order_phone1">
					  <option value="::선택::">::선택::</option>
			          <option value="010">010</option>
			          <option value="011">011</option>
			          <option value="019">019</option>
		               </select>
		               <input type="text" name="order_phone2" class="order_phone"/>
		               <input type="text" name="order_phone3" class="order_phone"/>
		               </div>
		  
                        <div>
                     <label>주소</label>
					<input type="text" id="sample4_postcode" placeholder="우편번호" name="order_post" />
			    	<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
				      </div>
				      
				    <div>
				    <input type="text" id="sample4_roadAddress" name="order_road1" />
                   </div>
				     
				     <br />
				   <div>
				   상품정보(장바구니 정보가 들어가야함)
				   </div>
				    <br />
				    
               	 <h2>결제정보</h2>
               	 <div>
               	 총 상품금액<input type="text" />
               	 </div>
               	 <div>
               	 총 배송비<input type="text" />
               	 </div>
               	 <div>
               	 총 결제 금액<input type="text" />
               	 </div>
               	
               	 
               	 <div>
	             <input type="submit" value="결제하기" />
	             </div>
               </form>
               
               <!-- 이거는 주문내역 페이지에 들어갈 	부분
	        <input type="button" value="주문정보리스트 보기" onclick="location.href='orderBaseList'"/>
           -->
				  <!-- <input type="hidden" name="amount" value="${sum}"/> -->

</body>
</html>