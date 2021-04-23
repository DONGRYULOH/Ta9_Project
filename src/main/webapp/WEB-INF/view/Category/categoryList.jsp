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
        <title>Pouseidon - Free HTML5 Model Agency Bootstrap Template</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <%@ include file="/WEB-INF/include/head_import.jsp" %>
    </head>

    <body data-spy="scroll" data-target=".navbar-collapse">

        <div class="culmn" style="background-color:#a3a3c2;">
        
        	<!-- 헤더 메뉴바 공통 -->
            <%@ include file="/WEB-INF/include/header.jsp"%>
			<div class="container" >
                    <div class="row">
                        <div class="main_home text-center">
                            <div class="home_text">                            	
                                <c:choose>
                            		<c:when test="${cateCode == '101'}">
                                		<h1 class="text-white text-uppercase">스포츠(카테고리)</h1>
                                	</c:when>
                                	<c:when test="${cateCode == '102'}">
                                		<h1 class="text-white text-uppercase">개발(카테고리)</h1>
                                	</c:when>
                                	<c:when test="${cateCode == '103'}">
                                		<h1 class="text-white text-uppercase">경제(카테고리)</h1>
                                	</c:when>
                                	<c:when test="${cateCode == '104'}">
                                		<h1 class="text-white text-uppercase">외국어(카테고리)</h1>
                                	</c:when>
                                	<c:when test="${cateCode == '105'}">
                                		<h1 class="text-white text-uppercase">ETC(카테고리)</h1>
                                	</c:when>
                                </c:choose>
                            </div>
                        </div>
                    </div><!--End off row-->
                </div><!--End off container -->
        </div>  	             

			<!-- 스포츠 관련 컨테이너 -->
			<div class="container" >
			
				<div class="row" style="padding-bottom: 50px;margin-top: 10px;">
					<div class="dropdown" >
					  <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">최신순
					  <span class="caret"></span></button>
					  <ul class="dropdown-menu" >
					    <li><a href="#">최신순</a></li>
					    <li><a href="#">조회수</a></li>					    
					  </ul>
					</div>
					
				</div>
				
				<c:forEach items="${categoryList}" var="list" begin="0" end="${categoryListSize}"  step="1" varStatus="status">
					<div class="row" style="margin-bottom: 40px;">												
						
						<!-- 썸네일 -->
						<div class="col-md-4">
								<!-- 전체공개인 경우(Y인 경우)에 로직 -->
								<c:if test="${list.public_check eq 'Y' }">
									<c:choose>
										<c:when test="${UserSession.user_id != list.user_id }">
											<a href="categoryDetail?n=${list.video_number}">
												<img src="/fileUpload/${list.stored_video_thumb}" >
											</a>
										</c:when>
										<c:when test="${UserSession.user_id == list.user_id }">
											<a href="mypage_videoDetail?n=${list.video_number}">
												<img src="/fileUpload/${list.stored_video_thumb}" >
											</a>
											<h5 class=" text-uppercase text-black" align="center">My 동영상 게시물</h5>											
										</c:when>
								   	</c:choose>
								</c:if>
								<!-- 등급 제한이 걸려있는 경우(N인 경우는 회원만 접근 가능)에 로직 -->
								<c:if test="${list.public_check eq 'N' && UserSession != null}">
									<!-- 
											1.if(내등급이 해당 동영상 게시물의 등급과 같거나 이상인경우 접근가능)
											2.if else(내가 올린 동영상 게시물인 경우는 등급조건에 상관없이 접근가능)											
									 -->
								    <c:choose>
								    	<c:when test="${UserSession.user_id eq list.user_id }">
											<a href="mypage_videoDetail?n=${list.video_number}">
												<img src="/fileUpload/${list.stored_video_thumb}" >
											</a>
											<h5 class=" text-uppercase text-black" align="center">My 동영상 게시물</h5>
										</c:when>
										<c:when test="${UserSession.user_rank_code >= list.video_rank_limit}">
											<a href="categoryDetail?n=${list.video_number}">
												<img src="/fileUpload/${list.stored_video_thumb}" >
											</a>
										</c:when>																			
										<c:otherwise>
												<img src="/fileUpload/${list.stored_video_thumb}" >
										</c:otherwise>
									</c:choose> 	
								</c:if> 
								<!-- 등급 제한이 걸려있는 경우(N인 경우는 회원만 접근 가능)에 로직 -->
								<c:if test="${list.public_check == 'N' && UserSession == null}">
									<img src="/fileUpload/${list.stored_video_thumb}" >
								</c:if>
						</div>
						<!-- 제목,날짜,조회수 -->
						<div class="col-md-4">
							<div class="row">
								<h4>제목 : ${list.video_title}</h4>
							</div>	
							<div class="row">
								<h5><fmt:formatDate value="${list.video_date}" pattern="yyyy-MM-dd"/></h5>
							</div>	
							<div class="row">
								<h5>조회수:${list.video_hits}</h5>
							</div>		
						</div>
						<!-- 전체공개,등급별 공개 여부 -->
						<div class="col-md-4">
							<!-- 전체공개인 경우(비회원,회원 모두 공개) -->
							<c:if test="${list.public_check eq 'Y'}">
								<h4>전체공개</h4>
							</c:if>
							<!-- 등급 제한이 걸려있는 경우(N인 경우는 회원만 접근 가능)에 로직 -->
							<c:if test="${list.public_check eq 'N'}">
								<c:choose>
									<c:when test="${list.video_rank_limit eq 0}">
										<h4>비회원,회원 전체 공개</h4>
									</c:when>
									<c:when test="${list.video_rank_limit eq 1}">
										<h4>브론즈 등급부터 시청가능</h4>
									</c:when>
									<c:when test="${list.video_rank_limit eq 2}">
										<h4>실버 등급부터 시청가능</h4>
									</c:when>
									<c:when test="${list.video_rank_limit eq 3}">
										<h4>골드 등급부터 시청가능</h4>
									</c:when>
									<c:when test="${list.video_rank_limit eq 4}">
										<h4>플래티넘 등급부터 시청가능</h4>
									</c:when>				
								</c:choose> 
							</c:if>
						</div>
					</div>
				</c:forEach>
				
				
				<!-- 페이징 -->
				<div class="row" align="center">
			 	  <ul class="pagination">
			 	  
			 	    <c:if test="${pageMaker.prev}">
					    <li class="page-item">
					      <a class="page-link" href="categoryList?page=${pageMaker.startPage-1}&cateCode=${cateCode}" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					        <span class="sr-only">Previous</span>
					      </a>
					    </li>
				    </c:if>
				    
				    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
					    <li>
					       <a class="page-link" href="categoryList?page=${pageNum}&cateCode=${cateCode}">${pageNum}</a>
					    </li>
				    </c:forEach>
					
					<c:if test="${pageMaker.next}">
					    <li class="page-item">
					      <a class="page-link" href="categoryList?page=${pageMaker.endPage+1}&cateCode=${cateCode}" aria-label="Next">
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