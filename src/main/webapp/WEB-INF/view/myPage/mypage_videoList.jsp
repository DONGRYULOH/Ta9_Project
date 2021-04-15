<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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


        <div class="culmn" style=" background-color:#a3a3c2;">
            <!-- 헤더 메뉴바 공통 -->
            <%@ include file="/WEB-INF/include/header.jsp"%>

            <div class="container" >
                    <div class="row">
                        <div class="main_home text-center">
                            <div class="home_text">
                                <h2 class="text-white text-uppercase">My PAGE</h2>
                            </div>
                        </div>
                    </div><!--End off row-->
                </div><!--End off container -->
		</div>

            
			<!-- mypage -->
			<div class="container">
			
				<!-- Mypage 공통 메뉴바 -->
				<%@ include file="/WEB-INF/view/myPage/include/myPage_menu.jsp" %>
				
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
				
				<c:forEach items="${videoBrdList}" var="list" begin="0" end="${videoBrdListSize}"  step="1" varStatus="status">
					<!-- 스포츠 동영상 리스트(썸네일,제목,날짜,조회수) 뿌려주기 1-->
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
								<h4>제목 ${list.video_title}</h4>
							</div>	
							<div class="row">
								<h5>2020/04/09</h5>
							</div>	
							<div class="row">
								<h5>조회수 : 5000</h5>
							</div>			
						</div>
						<!-- 무료,유료 여부 -->
						<div class="col-md-4">
							<h4>전체공개</h4>
						</div>
					</div>	
				</c:forEach>
				
				
				<!-- 스포츠 동영상 리스트(썸네일,제목,날짜,조회수) 뿌려주기 2-->
				<div class="row">
					<!-- 썸네일 -->
					<div class="col-md-4">
						<img src="assets/images/blog/3.jpg" alt="">
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
							<h5>조회수 : 5000</h5>
						</div>		
					</div>
					<!-- 무료,유료 여부 -->
					<div class="col-md-4">
						<h4>골드 등급 부터 열람 가능</h4>
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