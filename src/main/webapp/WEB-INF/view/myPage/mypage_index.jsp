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


        <!-- Preloader -->
        <div id="loading">
            <div id="loading-center">
                <div id="loading-center-absolute">
                    <div class="object"></div>
                    <div class="object"></div>
                    <div class="object"></div>
                    <div class="object"></div>
                    <div class="object"></div>
                    <div class="object"></div>
                    <div class="object"></div>
                    <div class="object"></div>
                    <div class="object"></div>
                    <div class="object"></div>
                </div>
            </div>
        </div>
        <!--End off Preloader -->


        <div class="culmn" style="background-color:#a3a3c2;">
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
				
				<div class="row">
					<div class="col-sm-1"></div>
					
					<div class="col-sm-3">
						<div class="row" style="margin-bottom: 22px;">							
                            <h4>제목</h4>                                                                         
						</div>			
						<div class="row" style="margin-bottom: 22px;">
							<h4>카테고리 선택</h4>
						</div>							
						<div class="row" style="margin-bottom: 22px;">
							<h4>공개여부</h4>
						</div>
						<div class="row" style="margin-bottom: 22px;">
							<h4>썸네일 이미지 선택</h4>
						</div>
						<div class="row" style="margin-bottom: 22px;">
							<h4>동영상 파일 선택</h4>
						</div>
					</div>
					
					<div class="col-sm-8">
						<form role="form" method="post" autocomplete="off" enctype="multipart/form-data">
							<div class="row" style="margin-bottom: 30px;">
								<input id="title" name="title" type="text" class="form-control">
							</div>	
									
							<div class="row" style="margin-bottom: 30px;">
								 <select class="category1" name="category_code">
								  	<option value="">개발</option>
								  	<option value="">경제</option>
								  	<option value="">스포츠</option>
								 </select>
							</div>		
												
							<div class="row" style="margin-bottom: 30px;">
								<div class="row">
									<input type="radio" checked="checked">공개
								</div>
								<div class="row">
									<input type="radio">비공개(포인트 입력)
									<input type="number" min="1">
								</div>
							</div>
						
							<div class="row" style="margin-bottom: 30px;">																  	  	
							  	  <input type="file" id="thumbNail" name="thumbNail" />				  	  								  	  	
							</div>	
							
							<div class="row" style="margin-bottom: 30px;">																  	  	
							  	  <input type="file" id="videoFile" name="videoFile" />				  	  								  	  	
							</div>	
							
							<div align="right" style="margin-bottom: 20px;">
								<button type="submit" id="register_Btn" class="btn btn-primary">동영상 파일 업로드</button>
							</div>
						</form>
					</div>		
				</div>
							
				
			</div>
			
			

          


            <!-- 풋터 공통 -->
           <%@ include file="/WEB-INF/include/footer.jsp"%>

            




        

       

    </body>
    
    <%@ include file="/WEB-INF/include/js_import.jsp" %>
</html>