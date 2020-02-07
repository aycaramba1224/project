<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
      
      <jsp:include page="/WEB-INF/views/common/header.jsp" >
	    <jsp:param value="회원시 배송지 등록 페이지" name="title"/>
      </jsp:include>
      
   <h2>배송정보</h2>
         <form method="post" id ="f">
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
			     <input type="button" value="배송지 등록" onclick="memberdeliveryInsert()" />
			    
			</form>
			
			  
     <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="resources/js/order.js"></script>