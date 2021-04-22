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
        <title>LOGIN</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style type="text/css">
        	.modal_wrap{
			        display: none;
			        width: 500px;
			        height: 300px;
			        position: absolute;
			        top:50%;
			        left: 50%;
			        margin: -250px 0 0 -250px;
			        background:#eee;
			        z-index: 2;
			    }
			    .black_bg{
			        display: none;
			        position: absolute;
			        content: "";
			        width: 100%;
			        height: 100%;
			        background-color:rgba(0, 0,0, 0.5);
			        top:0;
			        left: 0;
			        z-index: 1;
			    }
			    .modal_close{
			        width: 26px;
			        height: 26px;
			        position: absolute;
			        top: -30px;
			        right: 0;
			    }
			    .modal_close> a{
			        display: block;
			        width: 100%;
			        height: 100%;
			        background:url(https://img.icons8.com/metro/26/000000/close-window.png);
			        text-indent: -9999px;
			    }			        
        </style>
        
        <script type="text/javascript">       	        	
        	if('${result}' == 1) {
        		alert('${blameRe}');
        	}
        	if('${result}' == 0) {
        		alert('${blameRe}');
        	}
        </script>
        
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
                            	<h3 class="text-white text-uppercase">제목 : ${videoDetail.video_title}</h3>
                            	<c:choose>
                            		<c:when test="${videoDetail.category_code == '101'}">
                                		<h4 class="text-white text-uppercase">스포츠(카테고리)</h4>
                                	</c:when>
                                	<c:when test="${videoDetail.category_code == '102'}">
                                		<h4 class="text-white text-uppercase">개발(카테고리)</h4>
                                	</c:when>
                                	<c:when test="${videoDetail.category_code == '103'}">
                                		<h4 class="text-white text-uppercase">경제(카테고리)</h4>
                                	</c:when>
                                	<c:when test="${videoDetail.category_code == '104'}">
                                		<h4 class="text-white text-uppercase">외국어(카테고리)</h4>
                                	</c:when>
                                	<c:when test="${videoDetail.category_code == '105'}">
                                		<h4 class="text-white text-uppercase">ETC(카테고리)</h4>
                                	</c:when>
                                </c:choose>
                            </div>
                        </div>
                    </div><!--End off row-->
                </div><!--End off container -->
		</div>
           

			<!-- 동영상 세부 정보(동영상,제목,조회수,올린이 닉네임) -->
            <section id="blog_fashion" class="blog_fashion roomy-100">
                <div class="container">
                    <div class="row">
                        <div class="main_blog_fashion">
                            <div class="col-md-8">
                                <div class="blog_fashion_left">
                                    <div class="blog_fashion_img">
                                        <video id="myVideo" width="500px" height="720px" controls autoplay="autoplay" style="width: 750px;height: 430px;">
											<source src="/fileUpload/${videoDetail.stored_video_name}" type="video/mp4">		
										</video> 
                                    </div>
                                   
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="blog_fashion_right">
                                    <div class="fashion_test text-center">                                        
                                        <h4>제목 : ${videoDetail.video_title}</h4>
                                        <ol class="breadcrumb">                                            
                                            <li><a href="#" class="text-black"><fmt:formatDate value="${videoDetail.video_date}" pattern="yyyy-MM-dd"/></a></li>
                                            <li><a href="#" class="text-black">조회수 : ${videoDetail.video_hits}</a></li>
                                        </ol>
                                    </div>
                                    <div align="center" style="margin-top: 10px;">
                                    	<c:choose>
											<c:when test="${UserSession != null}">
												<button type="button" class="btn btn-primary" id="modal_btn">신고하기</button>	                                    	
		                                    	<div class="black_bg"></div>
												  <div class="modal_wrap">
												    <div class="modal_close"><a href="#">close</a></div>
													    <div class="row">												    	
													    	 <form role="form" method="post" autocomplete="off" action="/report">
													    	 	<input type="hidden" name="video_number" class="form-control" value="${videoDetail.video_number}" />
													    	 	<div class="row">
														         <select class="category1" name="blame_name" style="width: 302px;margin-bottom: 200px;margin-top: 30px;">
																 	<option value="성적인 콘텐츠">성적인 콘텐츠</option>
																  	<option value="폭력적인 콘텐츠">폭력적인 콘텐츠</option>
																  	<option value="테러 조장 유발 콘텐츠">테러 조장 유발 콘텐츠</option>
																  	<option value="저작권 침해 콘텐츠">저작권 침해 콘텐츠</option>																  	
																 </select>
															 	</div>	
															 	 <div class="row">												 
																 	<button type="submit" class="btn btn-danger">신고제출</button>
																 </div>	 
															 </form>
														</div>
												    </div>
											</c:when>													
										</c:choose> 							
									</div>                                    
                                </div>
                            </div>
                        </div>

                    </div><!-- End off row -->


                </div><!-- End off container -->
            </section>
			
			
           <!-- 풋터 공통 -->
           <%@ include file="/WEB-INF/include/footer.jsp"%>


        

       
		
    </body>
    	
    	<%@ include file="/WEB-INF/include/js_import.jsp" %>
    	
    	
    	<script>
		    window.onload = function() {
		 
		    function onClick() {
		        document.querySelector('.modal_wrap').style.display ='block';
		        document.querySelector('.black_bg').style.display ='block';
		    }   
		    function offClick() {
		        document.querySelector('.modal_wrap').style.display ='none';
		        document.querySelector('.black_bg').style.display ='none';
		    }
		 
		    document.getElementById('modal_btn').addEventListener('click', onClick);
		    document.querySelector('.modal_close').addEventListener('click', offClick);
		 
		};
		</script>

    	
    	
    	
</html>