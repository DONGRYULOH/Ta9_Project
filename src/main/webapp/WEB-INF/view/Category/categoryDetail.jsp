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
       		    
		<!-- 신고하기 CSS -->
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
        
        <!-- 댓글 리스트 뿌려주기 -->
        <script type="text/javascript">  	
        
        	var user_session = '${UserSession}';
        	var user_nickname = '${UserSession.user_nickname}';        	
        	
    		function replyList(){
    			
    			$.getJSON("replyList?n=" + $("#video_number").val() , function(getReplyList){
					
    				var reply_view = "<h4 class='m-bottom-30'>Comment</h4>";

    				 /* 해당 동영상 게시글에 해당하는 모든 댓글 가져와서 뿌려주기 */
    				 $(getReplyList).each(function(){
 		   				
 		   			   //작성일을 한국 시각으로 바꿈 
 					   var reply_insert_date = new Date(this.reply_insert_date);
 					   reply_insert_date = reply_insert_date.toLocaleDateString("ko-US");
 					   
	 		   			if(this.reply_depth == 0){ //depth 0일경우(부모댓글)
		   					//답글쓰기 버튼 추가 
		 		   			reply_view += "<div class='row'>" 
		   						 +"<div class='comment_item'>"
		   						 	+ "<div class='col-sm-12'>"
		   						 	   +"<div class='comments_top_tex'>"
		   						 	      +"<div class='row'>"
		   						 	         +"<div class='col-sm-8 pull-left'>"
		   						 	            +"<h5 class='text-uppercase'>작성자 : "+ this.reply_register + "</h5>"
	                                            +"<small><em>"+ reply_insert_date +"</em></small>"
	                                         +"</div>";
	                        
	                        // 세션이 있는 경우만 답글을 달수 있음 
	                        if(user_session != null && user_session != ''){
	                        		
	                        	// 로그인한 유저의 세션의 닉네임이 댓글을 작성한 닉네임과 똑같을경우 수정과 삭제가 가능 
	                        	if(user_nickname == this.reply_register){
	                        		reply_view +=  "<div class='col-sm-2 pull-right'>"
					                        			+ "<div class='replyFooter'>"
					           						     //수정폼으로 이동시 
					           					    	+ "<button type='button' class='modify' reply_num='" + this.reply_number + "'>수정</button>"
					           					    	 //삭제시 해당 댓글의 고유번호,참조번호,depth 를 받음 
					           					    	+ "<button type='button' class='delete' reply_num='" + this.reply_number + "'  origin_ref='" + this.reply_orgin_number + "' group_layer='" + this.reply_depth + "'>삭제</button>"
					           					    	+ "</div>"
									 	           		+"<button type='button' class='replyBtn' id='replyBtn'><i class='fa fa-mail-reply-all'></i> Reply</button>"	 	                                            
				                             	+"</div>";
	                        	}else{
	                        		reply_view +=  "<div class='col-sm-2 pull-right'>"	                        			
									 	           		+"<a href='#'><i class='fa fa-mail-reply-all'></i> Reply</a>"	 	                                            
				                             	+"</div>";
	                        	}
	                        	
	                        }else{
	                        	reply_view +=  "<div class='col-sm-2 pull-right'>" 	                                            
				                           +"</div>";
	                        }
	                                         
	                        reply_view +="</div>"
	                                   		+"</div>"
	                                   +"<article class='comments_bottom_text m-top-10'>"
	                                     +"<p>"+this.reply_content+"</p>"
	                                   +"</article>"
	                               +"</div>"
	                              +"</div>"
	                             +"</div><hr>";
	                             
		   				}else{ //depth 1이상일경우(댓글에 대한 답글인 경우) 
		   					reply_view += "<div class='row'>" 
		   						 +"<div class='comment_item m-l-40'>"
		   						  +"<div class='col-sm-12'>"
		   						 	   +"<div class='comments_top_tex'>"
		   						 	      +"<div class='row'>"
		   						 	         +"<div class='col-sm-12 pull-left'>"
		   						 	            +"<h5 class='text-uppercase'>작성자 : "+ this.reply_register + "</h5>"
	                                            +"<small><em>"+ reply_insert_date +"</em></small>"
	                                         +"</div>"                 
                    					+ "</div>"
	                                   +"</div>"
	                                   +"<article class='comments_bottom_text m-top-10'>"
	                                     +"<p>"+this.reply_content+"</p>"
	                                   +"</article>";
                                  
	                            // 로그인한 유저의 세션의 닉네임이 댓글을 작성한 닉네임과 똑같을경우 수정과 삭제가 가능 
	                          	if(user_nickname == this.reply_register){	                          		  
	                          		reply_view +=  "<div class='replyFooter'>"
	  			           						     //수정폼으로 이동시 
	  			           					    	+ "<button type='button' class='modify' reply_num='" + this.reply_number + "'>수정</button>"
	  			           					    	 //삭제시 해당 댓글의 고유번호,참조번호,depth 를 받음 
	  			           					    	+ "<button type='button' class='delete' reply_num='" + this.reply_number + "'  origin_ref='" + this.reply_orgin_number + "' group_layer='" + this.reply_depth + "'>삭제</button>"
	  							 	           	+"</div>";	  			                             	
	                          	}
	                              
                              reply_view += "</div>"
			                              +"</div>"
			                          	+ "</div><hr>";
		   				}	 		   			                    
 		   				
    				 });
    				 
    				 $(".blog_comments").html(reply_view);
    				
    			});
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
            	<input type="hidden" id="video_number" value="${videoDetail.video_number}" />
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
                                            <li><a href="#" class="text-black"><fmt:formatDate value="${videoDetail.video_insert_date}" pattern="yyyy-MM-dd"/></a></li>
                                            <li><a href="#" class="text-black">작성자 : ${videoDetail.user_nickname}</a></li>
                                        </ol>
                                    </div>
                                    <div align="center" style="margin-top: 10px;">
                                    	<c:choose>
											<c:when test="${UserSession != null}">
												<button type="button" class="btn btn-primary" id="video_cart">위시리스트 추가</button> 
												<button type="button" class="btn btn-primary" id="modal_btn">신고하기</button>	                                    	
		                                    	<div class="black_bg"></div>
												  <div class="modal_wrap">1
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
				
				<!-- 댓글 관련 @@@@ -->
				<div class="row" style="margin-left: 0px;margin-top: 20px;">
					<!-- 로그인 되지 않은 상태일떄 -->
					 <c:if test="${UserSession == null }">
					  	<p>소감을 남기시려면 <a href="/login">로그인</a>해주세요</p>
					 </c:if>
					 <!-- 로그인이 된경우 -->
					 <c:if test="${UserSession != null}">
						  	  <!-- name 값을 DTO에 있는 컬럼이랑 다르게 작성하면 자동매칭이 안되서 값이 안들어감  -->
							  <input type="hidden" name="video_number" id="video_number" value="${videoDetail.video_number}" >
							   <div >
							    	<textarea name="reply_content" id="reply_content" style="width: 746px;"></textarea>
							   </div>
							   
							   <div align="right" style="width: 740px;">							    							    
							    	<button type="button" id="reply_btn">소감 남기기</button>							    							   								
							   </div>						   
					 </c:if>
					 				 
					<!-- 댓글 리스트-->
					<div class="blog_comments">
					    <script> 
							replyList();
						</script>      
                    </div>
                          
				</div>
				<!-- 댓글 관련 @@@@@ -->

                </div><!-- End off container -->
            </section>
			
			
			
				
				
			
           <!-- 풋터 공통 -->
           <%@ include file="/WEB-INF/include/footer.jsp"%>


        

       
		
    </body>
    	
    	<%@ include file="/WEB-INF/include/js_import.jsp" %>
    	
    	<!-- 신고하기 모달 창  -->
    	<script type="text/javascript">
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

    	
    	<!-- 위시리스트 추가  -->
    	<script type="text/javascript">
    		var video_number = $('#video_number').val();
    		
    		document.getElementById('video_cart').onclick = function(){
    			
    			// 비동기 방식으로 해당 동영상 게시물을 해당 유저의 위시리스트에 추가함
    			$.ajax({
					async : true, // true 설멍하면 비동기 방식을 사용하겠다(기본값:true)
					url : 'addVideoCart', // 요청을 받을 컨트롤러 
					type : 'GET',
					data : {						
							video_number : video_number
					},  
					contentType : 'application/json; charset=UTF-8', // json 형식으로 서버로 보낼때 설정값 
					success : function(data) {							
							if(data == 0) alert("위시리스트 목록에 해당 동영상이 추가되었습니다!");
							if(data == 1) alert("이미 위시리스트 목록에 해당 동영상이 존재합니다!");
					}, 
					error : function() {
						console.log("위시리스트 추가 하는 중 에러발생...");
					}
				});
				
				
    		}    	
    	</script>
    	
    	
    	<!-- 댓글 자바스크립트   -->
    	<script type="text/javascript">
 
    		<!-- 해당 동영상 게시글에 대한 댓글 작성시 이벤트 발생 함수  -->
			 $("#reply_btn").click(function(){									  
				  var video_number = $("#video_number").val(); // 동영상 게시글 번호 
				  var reply_content = $("#reply_content").val(); // 댓글내용
				  
				  console.log("현재 동영상 게시글 번호:" + video_number);
				  console.log("댓글 내용:" + reply_content);
				  
				    var data = {
						  video_number : video_number,
						  reply_content : reply_content
				    };
				  
				  $.ajax({
				  	 url : "replyInsert",
				  	 type : "post",
				   	 data : data,
				     success : function(){
				    	 console.log("댓글 작성 성공!");				    	 
				    	 $("#reply_content").val("");				    	 			    	
				    	 replyList();	
				     },
				     error : function() {
						 alert("댓글 작성중 에러발생 ... 다시 댓글을 작성해주세요!");
					 }
				  });
			 });
	
    		 /* 답글을 작성할수 있는 폼생성 */
			 $(document).on("click", ".replyBtn", function(){
				
				 //부모댓글 번호를 가져옴 
				 var reply_ref = $(this).attr("reply_number");
				 console.log("부모 댓글 번호 : " + reply_ref);
				 console.log("현재 this : " +$(this).parent().parent().html());
				 
				 //추가될 답글 폼태그 
				 var replyTag = "";
				 replyTag += "<div class='input_area'><textarea name='reply_content' id='reply_content' class='reply_content'></textarea>";
				 replyTag += "<button type='button' class='reply_insert'";
				 replyTag += "reply_ref='"+$(this).attr("reply_num")+"'>작성</button>";
				 replyTag += "<button type='button' class='reply_cancel'";
				 replyTag += "reply_ref='"+$(this).attr("reply_num")+"'>취소</button>";
				 replyTag += "</div>";
					  
				 $(this).parent().parent().children(".col-sm-12").html(replyTag);
			});
    	</script>
    	
</html>





























