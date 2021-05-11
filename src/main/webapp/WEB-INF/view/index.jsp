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
           

          	 <div class="row" style="background-color: #f2f2f2">
                        <div class="main_testimonial text-center">

                            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                                <div class="carousel-inner" role="listbox">
                                
                                <c:forEach items="${allList}" var="list" begin="0" end="${allListSize}"  step="1" varStatus="status">                                 										
                                    <div class="item testimonial_item 
	                                     <c:choose>
									    	<c:when test="${status.index == 0}">
												active	
											</c:when>																		
										</c:choose> 
									">
                                        <div class="col-sm-10 col-sm-offset-1" style="margin-top: 30px;">
                                            <div class="test_authour">
                                               	<h4>(오늘의 신문기사)</h4>
                                                <h6 class="m-top-20">${list.title}</h6>
                                                <a href="${list.link}" target="_blank"><em>해당 기사로 이동</em> </a>
                                            </div>
                                            <p class="m-top-40">${list.description} </p>
                                        </div>
                                    </div>
                                </c:forEach>
 
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


<!--           
  @@@@@@@@@@@@@@@@@@@ 동영상 게시물 차트로 뿌려주기 @@@@@@@@@@@@@@@@@@@@          
<canvas id="myChart" style="background-color: #f2f2f2" ></canvas> 
<script >
var ctx = document.getElementById('myChart');

var all = '${categoryCount.all}';    


var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ['전체', '스포츠', '개발', '경제', '외국어', 'ETC'],
        datasets: [{
            label: '오늘 등록된 동영상 게시물 수',
            data: ['${categoryCount.all}','${categoryCount.sports}','${categoryCount.it}','${categoryCount.economey}','${categoryCount.foregin}','${categoryCount.etc}'],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 2
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});
</script> 
-->