
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
	
	
</script>
</head>
<body>
	  <h1>주문하기</h1>
	  <br />
	  <br />
	  <h2>주문자</h2>
	    <hr />
	    
	    <!--비회원일떄  -->
	   
		<form method="post" id ="f" >
			<c:choose>
	        <c:when test="${ mDto eq null }">
	          
			    <input type="button" value="로그인" onclick="location.href='sbmr'" />
			     
			     	<div>
	                    <label> 이름</label>   
						<input type="text" name="order_name" id="order_name" />
					 </div>
					  
					   <div>
					  	<label> 휴대폰 </label>
					  	<select name="order_phone" class="order_phone">
					  <option value="::선택::">::선택::</option>
			          <option value="010">010</option>
			          <option value="011">011</option>
			          <option value="019">019</option>
		               </select>
		               <input type="text" name="order_phone2" class="order_phone"/>
		               <input type="text" name="order_phone3" class="order_phone"/>
		               </div>
		              
						
				<label>이메일</label>
					<input type="text" id="order_email" name="order_email" />
					 @ 
					<input type="text" id="order_email2" list="domain" name="order_email2" placeholder="직접 입력" />
					<datalist id="domain">
						<option value="naver.com">naver.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="gmail.com">gmail.com</option>
					</datalist>
			
					 
					     <div>
					     <label>주문비밀번호</label>
					     <input type="password" name="guest_pw" class="guest_pw"/>
					     <label>주문비밀번호 확인</label> 
					     <input type="password" name="guest_pw2" class="guest_pw" onblur="passchk(this.form)" />
					      <input type="text" style="border-width: 0px" size="20" name="chk"
                          value="비밀번호를 입력하세요" readonly="readonly"/>
					     </div>
					   
					    <h2>배송정보</h2>
					    <div>
	                    <label>이름</label>   
						<input type="text" name="delivery_name" id="delivery_name" />
                        </div>
                        
                         <div>
					  	<label>휴대폰</label>
					  	<select name="delivery_phone">
					  <option value="::선택::">::선택::</option>
			          <option value="010">010</option>
			          <option value="011">011</option>
			          <option value="019">019</option>
		               </select>
		               <input type="text" name="delivery_phone2" class="delivery_phone2"/>
		               <input type="text" name="delivery_phone3" class="delivery_phone3"/>
		               </div>
		  
                        <div>
                     <label>주소</label>
					<input type="text" id="sample4_postcode" placeholder="우편번호" name="order_post" />
			    	<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
				      </div>
				      
				    <div>
				    <input type="text" id="sample4_roadAddress" name="order_road1" />
                   </div>
                   	
               	  <!-- 비회원일떄보는 submit -->
               	 <h2>상품정보</h2>
	             	 <h2>결제정보</h2>
               	 <div>
               	 총 상품금액<input type="text" />
               	 </div>
               	 <div>
               	 총 배송비
               	 <input type="text"  />
               	 </div>
               	 <div>
               	 총 결제 금액<input type="text" />
               	 </div>
	             <input type="button" value="비회원결제하기" onclick="guestOrder()"/>
	            
			    </c:when>
			</c:choose>
			
			    
			    <!-- 회원일떄 -->
			  
			     <c:choose>
		     <c:when test="${ mDto ne null }">
			   <div>
			   ${sessionScope.mDto.id }님의 회원정보
			   </div>
			  
			   
			   <div> 
			    이름:<input type="text" name="order_name" value="${mDto.name}" />
			    </div>
			    
			    <div>
			  휴대폰<input type="text" name="order_phone" value="${mDto.phone}" />
			  </div>
			  <br />
			  <div>
	
			  <input type="button" value="배송정보" onclick="location.href='mdeliverylistPage'" />
			  </div>
			  
		               <div>
		               <label>이름</label>   
						<input type="text" name="delivery_name" id="delivery_name" />
                        </div>
                        
                         <div>
					  	<label>휴대폰</label>
					  	<select name="delivery_phone">
					  <option value="::선택::">::선택::</option>
			          <option value="010">010</option>
			          <option value="011">011</option>
			          <option value="019">019</option>
		               </select>
		               <input type="text" name="delivery_phone2" class="delivery_phone2"/>
		               <input type="text" name="delivery_phone3" class="delivery_phone3"/>
		               </div>
		  
                        <div>
                     <label>우편번호</label>
					<input type="text" id="sample4_postcode" placeholder="우편번호" name="order_post" />
			    	<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
				      </div>
				      
				      <div>
				       <label>주소</label>
				    <input type="text" id="sample4_roadAddress" name="order_road1" />
                   </div>
				
		     <!-- 회원일떄 보내는 button -->
		            <h2>상품정보</h2>
	             	 <h2>결제정보</h2>
               	 <div>
               	 총 상품금액<input type="text" />
               	 </div>
               	 <div>
               	 총 배송비
               	 <input type="text"  />
               	 </div>
               	 <div>
               	 총 결제 금액<input type="text" />
               	 </div>
	             
	             <input type="button" value="회원결제하기" onclick="memberbuy()">
		   </c:when>
			 </c:choose>
			 
	             <input type="button" value="취소하기" onclick="regCancel()" />
               </form>
                
</body>
</html>