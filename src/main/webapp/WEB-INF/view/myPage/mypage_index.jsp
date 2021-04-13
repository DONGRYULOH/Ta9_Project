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
						<div class="row" style="margin-bottom: 330px;">
							<h4>썸네일 이미지 선택</h4>
						</div>
						<div class="row" style="margin-bottom: 22px;">
							<h4>동영상 파일 선택</h4>
						</div>
					</div>
					
					<div class="col-sm-8">
						<form role="form" method="post" autocomplete="off" action="/mypage_create" enctype="multipart/form-data">
							<div class="row" style="margin-bottom: 30px;">
								<input id="video_title" name="video_title" type="text" class="form-control">
							</div>	
									
							<!-- 카테고리 선택 -->									
							<div class="row" style="margin-bottom: 30px;">
								 <select class="category1" name="category_code">
								 	<option value="101">스포츠</option>
								  	<option value="102">개발</option>
								  	<option value="103">경제</option>
								  	<option value="104">스포츠</option>
								  	<option value="105">기타 등등(ETC)</option>
								 </select>
							</div>		
												
							<!-- 공개여부 선택 -->											
							<div class="row" style="margin-bottom: 30px;">
								<div class="row">
									<input type="radio" name="public_check" checked="checked" value="Y">전체공개
								</div>
								<div class="row">
									<input type="radio" name="public_check" value="N">등급별 게시물 접근 선택 
									<select name="video_rank_limit">
									 	<option value="Bronze">브론즈</option>
									  	<option value="Sliver">실버</option>
									  	<option value="Gold">골드</option>
									  	<option value="Platinum">플래티넘</option>									  	
									</select>
								</div>
							</div>
						
							<!-- 썸네일 이미지 선택 -->
							<div class="row" style="margin-bottom: 50px;height: 320px;">																  	  	
							  	  <input type="file" id="thumbNail" onchange="setThumbnail(event);" />
							  	  <div id="image_container"></div>				  	  								  	  	
							</div>	
							
							<!-- 동영상 파일 선택 -->
							<div class="row" style="margin-bottom: 30px;">																  	  	
							  	  <input type="file" id="video_File" name="video_File"  />				  	  								  	  	
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
    
    <script type="text/javascript">
    	/* 썸네일 이미지 선택시 화면에 표시해주기 */
    	function setThumbnail(event) { 
    		$("#image_container").empty();    		
    		for (var image of event.target.files) { 
    			var reader = new FileReader(); 
    			reader.onload = function(event){ 
    				var img = document.createElement("img"); 
    				img.setAttribute("src", event.target.result);    
    				img.setAttribute("height",300);
    				document.querySelector("div#image_container").appendChild(img); 
    			}; 
    			console.log(image); 
    			reader.readAsDataURL(image);     			
    		}
    		
    	}
		
    </script>
    	
    <%@ include file="/WEB-INF/include/js_import.jsp" %>
</html>