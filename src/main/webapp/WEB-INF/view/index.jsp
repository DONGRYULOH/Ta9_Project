<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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


       <!-- 메인 페이지 새로고침시 로딩 효과 -->
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
	
        <div class="culmn" style=" background-color:#a3a3c2;">
            

			<!-- 헤더 메뉴바 공통 -->
            <%@ include file="/WEB-INF/include/header.jsp"%>


            <!--Home Sections-->
           
              
                <div class="container" >
                    <div class="row">
                        <div class="main_home text-center">
                            <div class="home_text">
                                <h4 class="text-white text-uppercase">a new creative studio</h4>
                                <h1 class="text-white text-uppercase">good design is always in season</h1>

                                <div class="separator"></div>

                                <h5 class=" text-uppercase text-white"><em>One day, the dream will come true with lorem ipsum dolor sit amet, 
                                        consectetuer adipiscing elit, nummy nibh euismod tincidunt laoreet.</em></h5>
                            </div>
                        </div>
                    </div><!--End off row-->
                </div><!--End off container -->
           

          


            <!-- 풋터 공통 -->
            <%@ include file="/WEB-INF/include/footer.jsp"%>

        </div>

      

    </body>
    
    <%@ include file="/WEB-INF/include/js_import.jsp" %>
</html>