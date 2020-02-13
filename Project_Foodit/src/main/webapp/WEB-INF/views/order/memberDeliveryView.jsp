<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
 	<jsp:include page="/WEB-INF/views/common/header.jsp" >
	    <jsp:param value="회원 배송지 목록" name="title"/>
      </jsp:include>
	<style>
	 h1,h2{
        margin-top:50px;
        font-size: 20px;
        
        }
      table {
           width: 700px; height: 500px;
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

       <table border="1">
           <c:choose>
		     <c:when test="${ mDto ne null }">
		    
		<p>해당회원의 배송 정보 </p>
		      <tr>
		      <td>
			    이름
			   </td>
			   <td>
			    ${mDto.name}
			    </td>
			   </tr>
			    
			    <tr>
			    <td>
			  휴대폰
			  </td>
			  <td>
			  ${mDto.phone}
			  </td>
			  </tr>
			  
		  <form method="post">
        
			<c:forEach var="OrderBaseDto" items="${memberDeliveryList}">
				   
			      
			         <tr>
			         <td>
			                 배송자이름
			         </td>
			                 <td>
				    <input type="text" name="delivery_name" value="${OrderBaseDto.delivery_name}">
				    </td>
				    </tr>
				    
				    <tr>
				    <td>
				           배송자휴대폰
				           </td>
				           <td>
				         <input type="text" name="delivery_phone" value="${OrderBaseDto.delivery_phone}">-
				         <input type="text" name="delivery_phone2" value="${OrderBaseDto.delivery_phone}">-
				         <input type="text" name="delivery_phone3" value="${OrderBaseDto.delivery_phone}">
				      </td>
				      </tr>
				      
				     <tr>
				     <td>
				          우편번호
				          </td>
				          <td>
				    <input type="text" name="order_post" value="${OrderBaseDto.order_post}">
				    </td>
					</tr>
					
				<tr>
				<td>
					주소
					</td>
					
					<td>
				<input type="text" name ="order_road1" value="${OrderBaseDto.order_road1}"/>
				</td>
				   </tr>
				   
				
				</c:forEach>
				<hr />
			
	              <input type="button" value="신규배송정보등록" onclick="location.href='mdeliverysendPage'" />
				 
       </form>
   </c:when>
   </c:choose>
   </table>
 	<%@ include file="/WEB-INF/views/common/footer.jsp" %>