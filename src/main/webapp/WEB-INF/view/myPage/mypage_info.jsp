<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <title>myPageInfo</title>
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
						<div class="row" style="margin-bottom: 20px;">							
                            <h4>아이디</h4>                                                                         
						</div>			
						<div class="row" style="margin-bottom: 20px;">
							<h4>닉네임</h4>
						</div>							
						<div class="row" style="margin-bottom: 20px;">
							<h4>My 경험치</h4>
						</div>	
						<div class="row" style="margin-bottom: 20px;">
							<h4>현재등급</h4>
						</div>					
					</div>
					
					<div class="col-sm-8">	
						<div class="row" style="margin-bottom: 30px;margin-top: 5px;">
							<h5>dhehdfbf23</h5> 
						</div>												
						<div class="row" style="margin-bottom: 30px;">
							<h5>비트비트</h5>
						</div>						
						<div class="row" style="margin-bottom: 30px;">
							<h5>500 EXP</h5>
						</div>	
						<div class="row" style="margin-bottom: 30px;">
							<h5>브론즈</h5>
						</div>
					</div>		
				</div>
							
				
			</div>
			
			

          


            <!-- 풋터 공통 -->
           <%@ include file="/WEB-INF/include/footer.jsp"%>

            




        

       

    </body>
    
    <%@ include file="/WEB-INF/include/js_import.jsp" %>
</html>