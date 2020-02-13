<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
    
	<jsp:include page="/WEB-INF/views/common/header.jsp" >
	    <jsp:param value="관리자 주문내역 확인" name="title"/>
      </jsp:include>

     <style>
      h1,h2{
        margin-top:50px;
        font-size: 20px;
        
        }
      table {
           width: 700px; height: 900px;
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
       	width: 150px;
       }
     
     
     
     </style>
     
		<form method="post"  name="f">
        
		     <!-- 회원 비회원 정보가 같이 들어감... -->
		
	        <table border="1">
	       
	   
	       <c:if test="${guest ne null}">
     <c:forEach var="gDto" items="${adminOrderList}" >
	      
	      <tr>
	      <td>
                주문번호
          </td>
          <td>
           ${gDto.order_no}
           </td>
        </tr>
        
        <tr>
        <td>
                비밀번호
        </td>
        <td>  
         ${gDto.guest_pw }
         </td>
         </tr>
            
         <tr>
         <td>
                주문자이름
         </td>
         <td>
             ${gDto.order_name } 
             </td>
             </tr>
             
		<tr>
		<td>
		주문자 휴대폰
		</td>
		<td>
		${gDto.order_phone }-${gDto.order_phone2 }-${gDto.order_phone3 }</td>
	    </tr>
	    
	    
	    <tr>
	    <td>
	    주문자 이메일
	    </td>
	    <td>
	    ${gDto.order_email } @ ${gDto.order_email2}
	    </td>
	    </tr>
	    
	    <tr>
	    <td>
	    
			           <img alt="${gDto.product_thumbImg }" 
						src="${pageContext.request.contextPath }/resources/upload/${gDto.product_thumbImg}" style="width:100; height:100px;" />
						</td>
						<td>
			       <p>   상품이름: ${gDto.product_name }</p>
			           
			        <p>  상품 금액: <fmt:formatNumber value="${gDto.product_price}" pattern="#,###,###" />원</p>
			            
			            <p>총개수: ${gDto.cart_amount } </p>
						
		
			          
			         <c:if test="${gDto.product_price * gDto.cart_amount >30000}">
			       <p>    총 금액:  <fmt:formatNumber value= "${gDto.product_price * gDto.cart_amount }" pattern="#,###,###" />원
	                      </p> 
	                       </c:if>
	                                 
			          
			          <c:if test="${gDto.product_price * gDto.cart_amount < 30000}">
	                       <p>   총 금액:     <fmt:formatNumber value= "${gDto.product_price * gDto.cart_amount+ 3000 }"/> 원
	                                </p> 
	                                 </c:if>
	       
			</td>
			</tr>
	    
	    
	         <tr>
	         <td>
	         배송자이름
	         </td>
	         
	         <td>
	         ${gDto.delivery_name}
	         </td>
	         </tr>
	      
	        <tr>
	        <td>
		    휴대폰번호
		    </td>
		    
		    <td>
		    ${gDto.delivery_phone}-${gDto.delivery_phone2}-${gDto.delivery_phone3}
		    </td>
		    </tr>
		  
		  <tr>
		  <td>
			   우편번호
			   </td>
			   <td>
			   ${gDto.order_post}
			</td>
		</tr>
			
			<tr>
			<td>
			주소
			</td>
			<td>
			 ${gDto.order_road1}
			 </td>
			</tr> 
		</c:forEach>
		</c:if>
		
	</table>
		</form>
		
           <%@ include file="/WEB-INF/views/common/footer.jsp" %>
