<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<%@ page session="true" %>
    
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <title>index</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <%@ include file="/WEB-INF/include/head_import.jsp" %>
        
        <script type="text/javascript">       	        	
        		if('${result2}' == '0'){        			
        			alert('${msg2}');
        		}
        </script>
    </head>

    <body data-spy="scroll" data-target=".navbar-collapse">    
	
        <div class="culmn" style=" background-color:#a3a3c2;">
            

			<!-- 헤더 메뉴바 공통 -->
            <%@ include file="/WEB-INF/include/header.jsp"%>


            <!--Home Sections-->
           
            
              <div class="container" style="height: 600px;">
                  <div class="row">
                      <div class="main_home text-center">
                          <div class="home_text">
                              <h1 class="text-white text-uppercase">Welcome</h1>
                              <h2 class="text-white text-uppercase">TA9 카테고리별 동영상 시청 사이트에 오신것을 환영합니다!</h2>

                              <div class="separator"></div>

                              <h5 class=" text-uppercase text-white"><em>
                              	The way to get started is to quit talking and begin doing.
                              </em></h5>
                          </div>
                      </div>
                  </div><!--End off row-->
              </div><!--End off container -->
           

          	 <div class="row" style="background-color: #e8e3e3">
                        <div class="main_testimonial text-center">

                            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                                <div class="carousel-inner" role="listbox">
                                
                                	<!-- 스포츠 관련 기사 -->
                                    <div class="item testimonial_item active">
                                        <div class="col-sm-10 col-sm-offset-1" style="margin-top: 30px;">
                                            <div class="test_authour">
                                               	<h4>(오늘의 스포츠 관련 기사)</h4>
                                                <h6 class="m-top-20">${sportsList.title}</h6>
                                                <a href="${sportsList.link}"><em>해당 기사로 이동</em> </a>
                                            </div>
                                            <p class="m-top-40">${sportsList.description} </p>
                                        </div>
                                    </div>
                                    
                                    <!-- IT 관련 기사 -->
                                    <div class="item testimonial_item">
                                        <div class="col-sm-10 col-sm-offset-1" style="margin-top: 30px;">

                                            <div class="test_authour">
                                                <h4>(오늘의 IT 관련 기사)</h4>
                                                <h6 class="m-top-20">${it.title}</h6>
                                                <a href="${it.link}"><em>해당 기사로 이동</em> </a>
                                            </div>
                                            <p class="m-top-40">${it.description} </p>


                                        </div>
                                    </div>
                                    
                                    <!-- 경제 관련 기사 -->
                                    <div class="item testimonial_item">
                                        <div class="col-sm-10 col-sm-offset-1" style="margin-top: 30px;">

                                            <div class="test_authour">
                                                <h4>(오늘의 경제 관련 기사)</h4>
                                                <h6 class="m-top-20">${economyList.title}</h6>
                                                <a href="${economyList.link}"><em>해당 기사로 이동</em> </a>
                                            </div>
                                            <p class="m-top-40">${economyList.description} </p>

                                        </div>
                                    </div>
									
									<!-- 외국 관련 기사 -->
									<div class="item testimonial_item">
                                        <div class="col-sm-10 col-sm-offset-1" style="margin-top: 30px;">

                                            <div class="test_authour">
                                                <h4>(오늘의 외국 관련 기사)</h4>
                                                <h6 class="m-top-20">${foreignList.title}</h6>
                                                <a href="${foreignList.link}"><em>해당 기사로 이동</em> </a>
                                            </div>
                                            <p class="m-top-40">${foreignList.description} </p>
                                        </div>
                                    </div>
                                    
                                </div>

                                <!-- Controls -->
                                <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                                    <span class="fa fa-long-arrow-left" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <span class="slash">/</span>
                                <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                                    <span class="fa fa-long-arrow-right" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>

                            </div>
                        </div>
                    </div><!--End off row-->
                   
             


            <!-- 풋터 공통 -->
            <%@ include file="/WEB-INF/include/footer.jsp"%>

        </div>

      

    </body>
    
    <%@ include file="/WEB-INF/include/js_import.jsp" %>
</html>