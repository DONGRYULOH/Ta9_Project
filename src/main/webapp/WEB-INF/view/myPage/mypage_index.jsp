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
								  <!-- name값이 video로 시작하면 서버에서 받을수 있는데 아니라면 받을수 없는 이유는 뭐지?? -->															  	  	
							  	  <input type="file" id="video_thumbNail"  name="video_thumbNail" onchange="setThumbnail(event);" />
							  	  <div id="image_container"></div>				  	.
							  	    								  	  	
							</div>	
							
							<!-- 동영상 파일 선택 -->
							<div class="row" style="margin-bottom: 30px;">																  	  	
							  	  <input type="file" id="video_File" name="video_File" onchange="setVideo(event);"/>				  	  								  	  	
							</div>	
		
							
							<div align="right" style="margin-bottom: 20px;">
								<button type="submit" id="video_upload" class="btn btn-primary">동영상 게시물 업로드</button>
							</div>
						</form>
					</div>		
				</div>
							
				
			</div>
			
	        <!-- 풋터 공통 -->
           <%@ include file="/WEB-INF/include/footer.jsp"%>

    </body>
    
    <!-- 동영상 게시물 업로드시 유효성 검증 로직 -->
    <script type="text/javascript">
	    var validate = new Array; // 회원가입 유효성을 검사할 배열 (false - 유효성 검증 실패 , true - 유효성 검증 성공)
		// vaildate[0]-제목 , vaildate[1]-썸네일 이미지 , validate[2]-동영상 파일 
		for(let i=0;i<3;i++){ 
			validate[i] = false; 
		}
		var blank = /\s/g; // 공백 검증 정규표현식 
    
    	/* 1.썸네일 이미지 선택시 화면에 표시해주기 + 용량 제한 */
    	function setThumbnail(event) { 
    		
    		$("#image_container").empty();

    		console.log("파일 타입:" + event.target.files[0].type);   
    		//console.log("파일 사이즈:" + event.target.files[0].size);    		
    		// 파일 업로드 용량이 50MB 까지 올릴수 있도록 제한 시킴 
    		if(event.target.files[0].size > 50000000){
    			validate[1] = false;
    			alert("썸네일 이미지 용량이 50MB 넘었습니다!! 50MB 이하로 다시 첨부해주세요");    			
    			return false;
    		}
    		
    		// 가장 많이 쓰이는 이미지 파일 형식인 jpeg,gif,png,bmp 만 업로드가 가능하도록 검증   
    		if(event.target.files[0].type != "image/jpeg" && event.target.files[0].type != "image/gif" && event.target.files[0].type != "image/png" && event.target.files[0].type != "image/bmp"){
    			validate[2] = false;
    			alert("해당 이미지 파일 형식은 현재 웹사이트에서 지원하지 않습니다! (jpeg,gif,png,bmp로 끝나는 이미지 파일 형식만 업로드 가능합니다!)"); 
    			return false;
    		}
    		
    		// 썸네일 이미지 용량이 50MB를 넘지 않는다면 썸네일 이미지 화면에 출력 
    		for (var image of event.target.files) { 
    			var reader = new FileReader();
    			
    			reader.onload = function(event){ 
    				var img = document.createElement("img"); 
    				img.setAttribute("src", event.target.result);    
    				img.setAttribute("height",300);
    				document.querySelector("div#image_container").appendChild(img); 
    			}; 
    			
    			reader.readAsDataURL(image);    
    			validate[1] = true;
    		}
    		    	
    	}
    	
    	/* 2.비디오 영상 올릴시 용량 제한 + HTML5 지원하는 비디오 타입(mp4,ogg/ogv,webm)검증 */
    	function setVideo(event) {     		    		    
    		

    		console.log("파일 타입:" + event.target.files[0].type);
    		
    		// 파일 업로드 용량이 200MB 까지 올릴수 있도록 제한 시킴 (200 000 000 byte -> 200MB)
    		if(event.target.files[0].size > 200000000){
    			validate[2] = false;
    			alert("동영상 파일 용량이 200MB 넘었습니다!! 200MB 이하로 다시 첨부해주세요");    			
    			return false;
    		}
    		
    		// HTML5 에서 지원하는 비디오 타입만 가능하도록 제한 시킴 
    		if(event.target.files[0].type != "video/mp4" && event.target.files[0].type != "video/ogg/ogv" && event.target.files[0].type != "video/webm"){
    			validate[2] = false;
    			alert("해당 비디오 타입은 HTML5에서 지원하지 않습니다. (mp4,ogg/ogv,webm로 끝나는 비디오 확장자 타입만 업로드 가능합니다!)"); 
    			return false;
    		}
    		
    		// 해당 비디오 영상이 용량 제한에 위배되지 않을 경우 true 값 넣어줌 
    		validate[2] = true;
    	}
    	
    	// 3.동영상 게시물 업로드시 전체 유효성 검증 
    	$('#video_upload').click(function() {
    		// console.log("글자수" + $("#video_title").val().length);
    		// 1.글 제목 유효성 검증
    	    if( $("#video_title").val().trim() == '' || $("#video_title").val().trim() == null){ // 공백 검증 
    	    	validate[0] = false;
    	    	alert("제목을 입력해주세요!");
    	    }else if($("#video_title").val().length > 100){ // 글자수 검증(100자 이내)    	    	 
    	    	validate[0] = false; 
    	    	alert("제목은 100자 이내로만 입력 가능합니다!");
    	    }else{
    	    	validate[0] = true;
    	    }
    		
			// 2. 전체 유효성 검증 
			for (let i = 0; i < validate.length; i++) {
				if (validate[i] == false) {
					switch (i) {
					// 글 제목 유효성 검증이 안됬을 경우 
					case 0:					
						return false;
					// 썸네일 이미지 부분에 유효성 검증이 안됬을 경우 
					case 1:
						alert("썸네일 첨부파일 부분을 다시 확인 바람!");
						return false;
					// 동영상 첨부파일 부분에 유효성 검증이 안됬을 경우	
					case 2:
						alert("동영상 첨부파일 부분을 다시 확인 바람!");
						return false;
					}
				}
			}
			
		});	 
		
    </script>
    	
    <%@ include file="/WEB-INF/include/js_import.jsp" %>
</html>