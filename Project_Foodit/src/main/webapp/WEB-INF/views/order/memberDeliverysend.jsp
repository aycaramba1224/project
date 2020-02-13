<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
      
      <jsp:include page="/WEB-INF/views/common/header.jsp" >
	    <jsp:param value="회원시 배송지 등록 페이지" name="title"/>
      </jsp:include>
      <style>
       h1,h2{
        margin-top:50px;
        font-size: 20px;
        
        }
      table {
           width: 600px; height: 500px;
       }
       table, th, td {
           border: 1px solid gray;
           border-collapse: collapse;
           text-align: left;		/* 가로 정렬 */
           vertical-align: middle;	/* 세로 정렬 */
           padding: 0 5px;
       }
       td:nth-child(1) {
       	font-weight: bold;
       	width: 100px;
       }
      
      
      </style>
      
   <p>배송정보</p>
         <form method="post" id ="f">
					   <table>
					    <tr>
					    <td>
	                    <label>이름</label>   
	                    </td>
	                    <td>
						<input type="text" name="delivery_name" />
                        </td>
                        </tr>
                        
                        
                         <tr>
                         <td>
					  	<label>휴대폰</label>
					  	</td>
					  	<td>
					  	<select name="delivery_phone">
					  <option value="::선택::">::선택::</option>
			          <option value="010">010</option>
			          <option value="011">011</option>
			          <option value="019">019</option>
		               </select>
		               <input type="text" name="delivery_phone2" class="delivery_phone2">
		               <input type="text" name="delivery_phone3" class="delivery_phone3">
		               </td>
		               </tr>
		  
                        <tr>
                        <td>
                     <label>주소</label>
                     </td>
                     <td>
					<input type="text" id="sample4_postcode" placeholder="우편번호" name="order_post" >
			    	<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
				    <input type="text" id="sample4_roadAddress" name="order_road1" />
			    	</td>
				   </tr>
				      
				  <tr>
				  <th colspan="2">
			     <input type="button" value="배송지 등록" onclick="memberdeliveryInsert()" />
			     </th>
			    </tr>
			    </table>
			</form>
			
			  
     <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="resources/js/order.js"></script>