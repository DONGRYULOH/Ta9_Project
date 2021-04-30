<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <title>MyPage</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <%@ include file="/WEB-INF/include/head_import.jsp" %>
    </head>

    <body data-spy="scroll" data-target=".navbar-collapse">


        <div class="culmn" style=" background-color:#a3a3c2;">
            <!-- 헤더 메뉴바 공통 -->
            <%@ include file="/WEB-INF/include/header.jsp"%>

            <div class="container" >
                    <div class="row">
                        <div class="main_home text-center">
                            <div class="home_text">
                                <h2 class="text-white text-uppercase">My PAGE</h2>
                                <h4 class="text-white text-uppercase">(동영상 게시물 위시리스트)</h4>
                            </div>
                        </div>
                    </div><!--End off row-->
                </div><!--End off container -->
		</div>

            
			<!-- mypage -->
			<div class="container">
			
				<!-- Mypage 공통 메뉴바 -->
				<%@ include file="/WEB-INF/view/myPage/include/myPage_menu.jsp" %>
				
				<!-- <div class="row" style="padding-bottom: 50px;margin-top: 10px;">
					<div class="dropdown" >
					  <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">최신순
					  <span class="caret"></span></button>
					  <ul class="dropdown-menu" >
					    <li><a href="#">최신순</a></li>
					    <li><a href="#">조회수</a></li>					    
					  </ul>
					</div>			
				</div> -->
				
			<c:if test="${vcf != null}">
				<c:forEach items="${vcf}" var="list" begin="0" end="${vcfSize}"  step="1" varStatus="status">
					<!-- 스포츠 동영상 리스트(썸네일,제목,날짜,조회수) 뿌려주기 -->
					<div class="row" style="margin-bottom: 40px;">
						<!-- 썸네일 -->
						<div class="col-md-4">
							<a href="categoryDetail?n=${list.video_number}">
								<img src="/fileUpload/${list.stored_video_thumb}" >
							</a>
						</div>
						<!-- 제목,날짜,조회수 -->
						<div class="col-md-4">
							<div class="row">
								<h4>제목:${list.video_title}</h4>
							</div>	
							<div class="row">
								<h5><fmt:formatDate value="${list.video_insert_date}" pattern="yyyy-MM-dd"/></h5>								
							</div>			
						</div>
						<!-- 전체공개,등급별 공개 여부 -->
						<div class="col-md-2">
							<c:choose>
								<c:when test="${list.video_rank_limit eq 0}">
									<h6>비회원,회원 전체 공개</h6>
								</c:when>
								<c:when test="${list.video_rank_limit eq 1}">
									<h6>브론즈등급 이상</h6>
								</c:when>
								<c:when test="${list.video_rank_limit eq 2}">
									<h6>실버등급 이상</h6>
								</c:when>
								<c:when test="${list.video_rank_limit eq 3}">
									<h6>골드등급 이상</h6>
								</c:when>
								<c:when test="${list.video_rank_limit eq 4}">
									<h6>플래티넘등급 이상</h6>
								</c:when>				
							</c:choose> 
						</div>
						<div class="col-md-2">
							<a href="mypage_cartDelete?n=${list.video_cart_number}">
								위시리스트에서 제거	
							</a>
						</div>
					</div>	
				</c:forEach>
			</c:if>
					
				
				<!-- 페이징 -->
				<div class="row" align="center">
			 	  <ul class="pagination">
			 	  
			 	    <c:if test="${pageMaker.prev}">
					    <li class="page-item">
					      <a class="page-link" href="mypage_cartList?page=${pageMaker.startPage-1}" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					        <span class="sr-only">Previous</span>
					      </a>
					    </li>
				    </c:if>
				    
				    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
					    <li>
					       <a class="page-link" href="mypage_cartList?page=${pageNum}">${pageNum}</a>
					    </li>
				    </c:forEach>
					
					<c:if test="${pageMaker.next}">
					    <li class="page-item">
					      <a class="page-link" href="mypage_cartList?page=${pageMaker.endPage+1}" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					        <span class="sr-only">Next</span>
					      </a>
					    </li>
				    </c:if>
				    
				  </ul>
				</div>
				
			</div>
			

            <!-- 풋터 공통 -->
           <%@ include file="/WEB-INF/include/footer.jsp"%>

       

    </body>
    
    <%@ include file="/WEB-INF/include/js_import.jsp" %>
</html>