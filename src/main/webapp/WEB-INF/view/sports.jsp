<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                                <h2 class="text-white text-uppercase">스포츠(카테고리)</h2>
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
				
				<!-- 스포츠 동영상 리스트(썸네일,제목,날짜,조회수) 뿌려주기1(전체공개 게시글 영상이므로 등급에 상관없이 비회원,회원 모두 접근가능) -->
				<div class="row" style="margin-bottom: 40px;">												
					
					<!-- 썸네일 -->
					<div class="col-md-4">
						<a href="sportsDetail">
						<img src="assets/images/blog/3.jpg" alt="">
						</a>
					</div>
					<!-- 제목,날짜,조회수 -->
					<div class="col-md-4">
						<div class="row">
							<h4>제목:비트코인 100% 급등</h4>
						</div>	
						<div class="row">
							<h5>2020/04/06</h5>
						</div>	
						<div class="row">
							<h5>조회수 : 1000</h5>
						</div>		
					</div>
					<!-- 무료,유료 여부 -->
					<div class="col-md-4">
						<h4>전체공개</h4>
					</div>
				</div>
				
				<!-- 스포츠 동영상 리스트(썸네일,제목,날짜,조회수) 뿌려주기2(등급제한이 걸려있는 동영상 <게시물 비회원 + 등급조건에 맞지않는 회원> 접근 불가능) -->
				<div class="row" style="margin-bottom: 40px;">
					
					<%-- @@@<동영상 게시물 리스트 뿌려주는 전체 로직>@@@ 
						<!-- 전체공개인 경우(Y인 경우)에 로직 -->
						<c:if test="${list.video_public_check == 'Y' }">
							<a href="sportsDetail">
						   		<img src="assets/images/blog/3.jpg" alt="">
						   	</a>
						</c:if>
						<!-- 등급 제한이 걸려있는 경우(N인 경우)에 로직 -->
						<c:if test="${list.video_public_check == 'N' }">
						    <c:choose>
								<!-- if -->
								<c:when test="${UserSession.my_rank >= list.video_rank_limit && UserSession != null }">
									<a href="sportsDetail">
										<img src="/fileUpload/${list.stored_video_thumb}" >
									</a>
								</c:when>
								<!-- if else(내가 올린 동영상 게시물인 경우는 등급조건에 상관없이 접근가능) -->
								<c:when test="${UserSession.user_id == list.video_user_id }">
									<a href="sportsDetail">
										<img src="/fileUpload/${list.stored_video_thumb}" >
									</a>
								</c:when>
								<!-- else -->
								<c:otherwise>
										<img src="/fileUpload/${list.stored_video_thumb}" >
								</c:otherwise>
							</c:choose> 	
						</c:if> 
					--%>
					
					<!-- 썸네일 -->
					<div class="col-md-4">
						<img src="assets/images/blog/3.jpg" alt="">
					</div>
					<!-- 제목,날짜,조회수 -->
					<div class="col-md-4">
						<div class="row">
							<h4>손흥민 바르셀로나 이적</h4>
						</div>	
						<div class="row">
							<h5>2020/04/06</h5>
						</div>	
						<div class="row">
							<h5>조회수 : 1000</h5>
						</div>		
					</div>
					<!-- 무료,유료 여부 -->
					<div class="col-md-4">
						<h4>골드 등급 부터 열람 가능</h4>
					</div>					                                    																		
				</div>
				
				<!-- 스포츠 동영상 리스트(썸네일,제목,날짜,조회수) 뿌려주기3(등급제한이 걸려있지만 자신이 올린 동영상 게시물인 경우는 등급에 상관없이 접근 가능) -->
				<div class="row">
					<!-- 썸네일 -->
					<div class="col-md-4">
						<img src="assets/images/blog/3.jpg" alt="">
					</div>
					<!-- 제목,날짜,조회수 -->
					<div class="col-md-4">
						<div class="row">
							<h4>호나우지뉴 맨유 이적</h4>
						</div>	
						<div class="row">
							<h5>2020/04/08</h5>
						</div>	
						<div class="row">
							<h5>조회수 : 2000</h5>
						</div>		
					</div>
					<!-- 무료,유료 여부 -->
					<div class="col-md-4">
						<h4>브론즈 등급 부터 열람 가능</h4>
					</div>					                                    																		
				</div>
				
				<!-- 페이징 -->
				<div class="row" align="center">
			 	  <ul class="pagination">
				    <li class="page-item">
				      <a class="page-link" href="#" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				        <span class="sr-only">Previous</span>
				      </a>
				    </li>
				    <li class="page-item"><a class="page-link" href="#">1</a></li>
				    <li class="page-item"><a class="page-link" href="#">2</a></li>
				    <li class="page-item"><a class="page-link" href="#">3</a></li>
				    <li class="page-item">
				      <a class="page-link" href="#" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				        <span class="sr-only">Next</span>
				      </a>
				    </li>
				  </ul>
				</div>
				
			</div>
			
           <!-- 풋터 공통 -->
           <%@ include file="/WEB-INF/include/footer.jsp"%>



       
		
    </body>
    	
    	<%@ include file="/WEB-INF/include/js_import.jsp" %>
</html>