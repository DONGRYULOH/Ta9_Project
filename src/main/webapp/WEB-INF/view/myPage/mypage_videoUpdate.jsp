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
        <title>MyPage</title>
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
                                <h2 class="text-white text-uppercase">My PAGE(동영상 게시글 수정)</h2>
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
							<h4>카테고리</h4>
						</div>							
						<div class="row" style="margin-bottom: 22px;">
							<h4>공개여부</h4>
						</div>
						<div class="row" style="margin-bottom: 330px;">
							<h4>썸네일 이미지 수정</h4>
						</div>
					</div>
					
					<div class="col-sm-8">
						<form role="form" method="post" autocomplete="off"  enctype="multipart/form-data">
							<input type="hidden" name="video_number" class="form-control" value="${videoDetail.video_number}" />
							
							<div class="row" style="margin-bottom: 40px;">
								<input id="video_title" name="video_title" type="text" value="${videoDetail.video_title}">
							</div>	
									
							<!-- 카테고리 선택 -->									
							<div class="row" style="margin-bottom: 40px;">
								 <select class="category1" name="category_code">
								 	<c:choose>
	                            		<c:when test="${videoDetail.category_code == '101'}">
	                                		<option value="101" selected>스포츠</option>
	                                		<option value="102" >개발</option>
										  	<option value="103" >경제</option>
										  	<option value="104" >스포츠</option>
										  	<option value="105" >기타 등등(ETC)</option>
	                                	</c:when>
	                                	<c:when test="${videoDetail.category_code == '102'}">
	                                		<option value="101" >스포츠</option>
	                                		<option value="102" selected>개발</option>
										  	<option value="103">경제</option>
										  	<option value="104">스포츠</option>
										  	<option value="105">기타 등등(ETC)</option>
	                                	</c:when>
	                                	<c:when test="${videoDetail.category_code == '103'}">
	                                		<option value="101">스포츠</option>
	                                		<option value="102">개발</option>
										  	<option value="103" selected>경제</option>
										  	<option value="104">스포츠</option>
										  	<option value="105">기타 등등(ETC)</option>
	                                	</c:when>
	                                	<c:when test="${videoDetail.category_code == '104'}">
	                                		<option value="101">스포츠</option>
	                                		<option value="102">개발</option>
										  	<option value="103">경제</option>
										  	<option value="104" selected>스포츠</option>
										  	<option value="105">기타 등등(ETC)</option>
	                                	</c:when>
	                                	<c:when test="${videoDetail.category_code == '105'}">
	                                		<option value="101" >스포츠</option>
	                                		<option value="102" >개발</option>
										  	<option value="103" >경제</option>
										  	<option value="104" >스포츠</option>
										  	<option value="105" selected>기타 등등(ETC)</option>
	                                	</c:when>
                                	</c:choose>								 									  	
								 </select>
							</div>		
												
							<!-- 공개여부 선택 -->											
							<div class="row" style="margin-bottom: 25px;">							
								<c:choose>
								
                            		<c:when test="${videoDetail.public_check == 'Y'}">
                                		<div class="row">
											<input type="radio" name="public_check" value="Y" checked>전체공개
										</div>
										<div class="row">
											<input type="radio" name="public_check"  value="N">등급별 게시물 접근 선택 
											<select name="video_rank_limit">
											 	<option value="1">브론즈</option>
											  	<option value="2">실버</option>
											  	<option value="3">골드</option>
											  	<option value="4">플래티넘</option>									  	
											</select>
										</div>
                                	</c:when>
                                	
                                	<c:when test="${videoDetail.public_check == 'N'}">
                                		<div class="row">
											<input type="radio" name="public_check" value="Y" >전체공개
										</div>
										<div class="row">
											<input type="radio" name="public_check"  value="N" checked>등급별 게시물 접근 선택 
											<select name="video_rank_limit">
												<c:choose>
				                            		<c:when test="${videoDetail.video_rank_limit == '1'}">
				                                		<option value="1" selected>브론즈</option>
													  	<option value="2">실버</option>
													  	<option value="3">골드</option>
													  	<option value="4">플래티넘</option>
				                                	</c:when>
				                                	<c:when test="${videoDetail.video_rank_limit == '2'}">
				                                		<option value="1" >브론즈</option>
													  	<option value="2" selected>실버</option>
													  	<option value="3">골드</option>
													  	<option value="4">플래티넘</option>
				                                	</c:when>
				                                	<c:when test="${videoDetail.video_rank_limit == '3'}">
				                                		<option value="1" >브론즈</option>
													  	<option value="2">실버</option>
													  	<option value="3" selected>골드</option>
													  	<option value="4">플래티넘</option>
				                                	</c:when>
				                                	<c:when test="${videoDetail.video_rank_limit == '4'}">
				                                		<option value="1" >브론즈</option>
													  	<option value="2">실버</option>
													  	<option value="3" >골드</option>
													  	<option value="4" selected>플래티넘</option>
				                                	</c:when>
			                                	</c:choose>											 										  
											</select>
										</div>
                                	</c:when>  
                                	                             
                                </c:choose>                               								
							</div>
						
							<!-- 썸네일 이미지 선택 -->
							<div class="row" style="margin-bottom: 50px;height: 320px;">	
								  <!-- name값이 video로 시작하면 서버에서 받을수 있는데 아니라면 받을수 없는 이유는 뭐지?? -->															  	  	
							  	  <input type="file" id="video_thumbNail" name="video_thumbNail" onchange="setThumbnail(event);"/>
							  	  <div id="image_container">
							  	  		<img src="/fileUpload/${videoDetail.stored_video_thumb}"  />
							  	  		<input type="hidden" value="orgin_ok" name="orgin_video_thumbNail" id="orgin_video_thumbNail"/>
							  	  </div>				  	
							  	   <!-- 
							  	   		동영상 게시글을 수정했을때 name="orgin_video_thumbNail" 해당 값이 없으면
							  	   		새로운 썸네일 이미지로 바꿨다는 뜻이므로 기존에 올린 썸네일 이미지가 저장된 장소에 있는 파일을 삭제하고   
							  	   		새롭게 올린 썸네일 이미지를 업로드 시킨다음 DB에 새로운 썸네일 이미지 이름으로 업데이트 시킴 
							  	    -->				  	  	
							</div>	
		
							
							<div align="right" style="margin-bottom: 20px;">
								<button type="submit" id="video_update" class="btn btn-primary">동영상 게시물 수정하기</button>
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
		// vaildate[0]-제목 , vaildate[1]-썸네일 이미지 
		validate[0] = true;
		validate[1] = true;
	    
		var blank = /\s/g; // 공백 검증 정규표현식 
    
    	/* 1.썸네일 이미지 선택시 화면에 표시해주기 + 용량 제한 */
    	function setThumbnail(event) { 
    		
    		$("#image_container").empty();
 		
    		// 파일 업로드 용량이 50MB 까지 올릴수 있도록 제한 시킴 
    		if(event.target.files[0].size > 50000000){
    			validate[1] = false;
    			alert("썸네일 이미지 용량이 50MB 넘었습니다!! 50MB 이하로 다시 첨부해주세요");    			
    			return false;
    		}
    		
    		// 가장 많이 쓰이는 이미지 파일 형식인 jpeg,gif,png,bmp 만 업로드가 가능하도록 검증   
    		if(event.target.files[0].type != "image/jpeg" && event.target.files[0].type != "image/gif" && event.target.files[0].type != "image/png" && event.target.files[0].type != "image/bmp"){
    			validate[1] = false;
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
    	
    	// 2.동영상 게시물 업로드시 전체 유효성 검증 
    	$('#video_update').click(function() {
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
    		
    		// 2.썸네일 이미지 공백검증 
    		if($("#video_thumbNail").val() == '' ||  $("#video_thumbNail").val() == null || $("#video_thumbNail").val().empty() ){
    			if( $("#orgin_video_thumbNail").val() == null){
    				validate[1] = false; 
    	    		alert("썸네일 파일을 첨부해주세요!");
    	    		return false;
    			}    	    	
    		}
    		
			// 3. 전체 유효성 검증 
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
					}
				}
			}
			
		});	 
		
    </script>
    	
    <%@ include file="/WEB-INF/include/js_import.jsp" %>
</html>