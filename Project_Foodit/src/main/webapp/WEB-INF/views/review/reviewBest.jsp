<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>


     <div id="reviewBest" style="float:left; padding:20px;">
           <ul style="list-style-type:none;">       
                <li>            
                    <!-- 리뷰 사진 가로 목록 썸네일 이미지 사이즈 : 500x370  -->
                    <span> <img alt="${reviewDto.re_thumbImg }" src="${pageContext.request.contextPath }/resources/upload/${reviewDto.re_thumbImg}" 
                            style="width:480px; height:350px;" /></span> 
                    <br/>
                    <!-- 클릭 시 상품상세페이지로 이동처리 -->
                    <span> <a href=>${reviewDto.re_product_name}</a></span><br/> 
                    <span> <c:if test="${ reviewDto.re_score eq 1}">
                              	      ★☆☆☆☆
                           </c:if>
                    <span> <c:if test="${ reviewDto.re_score eq 2}">
                            	        ★★☆☆☆
                           </c:if>
                    <span> <c:if test="${ reviewDto.re_score eq 3}">
                             	       ★★★☆☆
                           </c:if>
                    <span> <c:if test="${ reviewDto.re_score eq 4}">
                                                                                                                       ★★★★☆
                           </c:if>
                    <span> <c:if test="${ reviewDto.re_score eq 5}">
                                                                                                                       ★★★★★
                           </c:if>
                     ${reviewDto.re_id } </span>
                    <br/><br/>
                    <span> ${reviewDto.re_content } </span>
                </li>         
            </ul>          
      </div>
