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
        
        	     /* 댓글 모달 수정 창 CSS */
			     div.replyModal { position:relative; z-index:1; display:none;}
				 div.modalBackground { position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.8); z-index:-1; }
				 div.modalContent { position:fixed; top:20%; left:calc(50% - 250px); width:500px; height:250px; padding:20px 10px; background:#fff; border:2px solid #666; }
				 div.modalContent textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:450px; height:150px; }
				 div.modalContent button { font-size:20px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; }
				 div.modalContent button.modal_cancel { margin-left:20px; }        
        </style>
        
         <!-- 댓글 리스트 뿌려주기 -->
        <script type="text/javascript">  	
        
        	var user_session = '${UserSession}';
        	var user_nickname = '${UserSession.user_nickname}';        	
        	var reply_count = '${videoDetail.reply_count}';
        	
    		function replyList(){
    			
    			$.getJSON("replyList?n=" + $("#video_number").val() , function(getReplyList){
					
    				var reply_view = "<h4 class='m-bottom-30'>Comment("+reply_count+")</h4>";

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
	                        
	                        		
                        	// 로그인한 유저의 세션의 닉네임이 댓글을 작성한 닉네임과 똑같을경우 수정과 삭제가 가능 
                        	if(user_nickname == this.reply_register){
                        		reply_view +=  "<div class='col-sm-2 pull-right'>"
				                        			+ "<div class='replyFooter'>"
				           						     //수정폼으로 이동시 
				           					    	+ "<button type='button' class='modify_reply' reply_number='" + this.reply_number + "'>수정</button>"
				           					    	 //삭제시 해당 댓글의 고유번호,참조번호,depth 를 받음 
				           					    	+ "<button type='button' class='delete_reply' reply_number='" + this.reply_number + "'  origin_ref='" + this.reply_orgin_number + "' group_layer='" + this.reply_depth + "'>삭제</button>"
				           					    	+ "</div>"								 	           			                                           
			                             	  +"</div>";
                        	}
	                        else{
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
                                    	<a href="mypage_videoUpdate?n=${videoDetail.video_number}" class="btn btn-warning">수정하기 </a>
                                    	<a href="mypage_videoDelete?n=${videoDetail.video_number}"  id="delete_btn" class="btn btn-danger">삭제하기 </a>                                    	                                    										
									</div>                                    
                                </div>
                            </div>
                        </div>

                    </div><!-- End off row -->

					<!-- 댓글 관련 START@@@@ -->
					<div class="row" style="margin-left: 0px;margin-top: 20px;">
						<!-- 로그인 되지 않은 상태일떄 -->
						 <c:if test="${UserSession == null }">
						  	<p>댓글을 남기시려면 <a href="/login">로그인</a>해주세요</p>
						 </c:if>
						 <!-- 로그인이 된경우 -->
						 <c:if test="${UserSession != null}">
							  	  <!-- name 값을 DTO에 있는 컬럼이랑 다르게 작성하면 자동매칭이 안되서 값이 안들어감  -->
								  <input type="hidden" name="video_number" id="video_number" value="${videoDetail.video_number}" >
								   <div >
								    	<textarea name="reply_content" id="reply_content" style="width: 746px;"></textarea>
								   </div>
								   
								   <div align="right" style="width: 740px;">							    							    
								    	<button type="button" id="reply_btn">댓글 남기기</button>							    							   								
								   </div>						   
						 </c:if>
						 				 
						<!-- 댓글 리스트-->
						<div class="blog_comments">
						    <script> 
								replyList();
							</script>      
	                    </div>
	                          
					</div>
					<!-- 댓글 관련 END@@@@@ -->
					
                </div><!-- End off container -->
            </section>
			
			<!-- 댓글 수정이될 폼부분 -->
	    	<div class="replyModal">
	
				 <div class="modalContent">
				  
				  <div>
				   <textarea class="modal_reply_content" name="modal_reply_content"></textarea>
				  </div>
				  
				  <div>
				   <button type="button" class="modal_modify_btn">수정</button>
				   <button type="button" class="modal_cancel">취소</button>
				  </div>
				  
				 </div>
				
				 <div class="modalBackground"></div>
			 
			</div>
			
           <!-- 풋터 공통 -->
           <%@ include file="/WEB-INF/include/footer.jsp"%>

		
    </body>    	
    	<%@ include file="/WEB-INF/include/js_import.jsp" %>
    	
    	
    	<script>
			  
			  $("#delete_btn").on("click",function(event){
				  	var con = confirm("정말로 삭제하시겠습니까?");
				  	
				  	if(!con){
				  		event.preventDefault();	
				  	}
				    
				});
				
		 </script>
    	
    	<!-- 댓글 관련 스크립트   -->
    	<script type="text/javascript">
 
    		<!-- 해당 동영상 게시글에 대한 댓글 작성시 이벤트 발생 함수  -->
			 $("#reply_btn").click(function(){									  
				  var video_number = $("#video_number").val(); // 동영상 게시글 번호 
				  var reply_content = $("#reply_content").val(); // 댓글내용
				  
				  if(reply_content == ''){
					  alert("댓글 내용이 비어있습니다! 댓글 내용을 입력해주세요!");
					  return false;
				  }
				  
				  if(reply_content.length > 100){
					  alert("댓글 내용은 100자 이하로만 작성 가능합니다!");
					  return false;
				  }
				  
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
	
			<!-- 댓글 수정창 부분 모달창 -->
			$(document).on("click", ".modify_reply", function(){
				 //$(".replyModal").attr("style", "display:block;");
				 $(".replyModal").fadeIn(200);
				 
				 var reply_number = $(this).attr("reply_number");
				 
				 $(".modal_modify_btn").attr("reply_number", reply_number);		 
			});
			
			// 모달창 취소버튼 클릭시 함수 
			$(".modal_cancel").click(function(){
				$(".replyModal").fadeOut(200); 
			});
			
			// 모달창 수정 버튼 클릭시 
			$(".modal_modify_btn").click(function(){
				 var modifyConfirm = confirm("정말로 수정하시겠습니까?");
				 
				 //수정완료 버튼을 정상적으로 눌렀을경우 실행 
				 if(modifyConfirm) {
					 
					console.log("현재 댓글 번호 : " + $(this).attr("reply_number"));
					console.log("수정할 댓글 내용 : " + $(".modal_reply_content").val());
					
					if($(".modal_reply_content").val() == ''){
						alert("댓글 내용이 비어있습니다! 댓글 내용을 입력해주세요!");
						return false;
					}
					
					if($(".modal_reply_content").val().length > 100){
						alert("댓글 내용은 100자 이하로만 작성 가능합니다!");
						return false;
					}
					
					// 수정될 댓글 내용과 번호가 담길 객체 
				    var updateData = {
						  reply_number :$(this).attr("reply_number"), //댓글번호
						  reply_content : $(".modal_reply_content").val() //내용 
				    };  
				  
					 $.ajax({
						   url : "replyUpdate",
						   type : "post",
						   data : updateData,
						   success : function(result){
							    if(result == 1){
							    	$(".replyModal").fadeOut(200);
						     		replyList();
							    }else{
							    	alert("댓글 수정중 에러발생.. 다시 댓글을 수정해주세요!");
							    }
						   },
						   error : function(){							   
						    	alert("댓글 수정중 에러발생.. 다시 댓글을 수정해주세요!");
						   }
					 }); 
				 }
			 
			});
			
			 // 댓글 삭제 펑션 
			 $(document).on("click", ".delete_reply", function(){
				  
				 var deleteConfirm = confirm("정말로 삭제하시겠습니까?");
 
					 if(deleteConfirm){						 						 	
						  $.ajax({
							   url : "replyDelete",
							   type : "post",
							   data : {
								   reply_number : $(this).attr("reply_number")
							   },
							   success : function(result){
								   if(result == 1) {
									   replyList();
								   }
								   else{
									   alert("댓글 삭제중 에러발생.. 다시 댓글을 삭제해주세요!");
								   }
							   },
							   error : function(){							   
							    	alert("댓글 삭제 중 에러발생.. 다시 댓글을 삭제해주세요!");
							   }
						  });
					 }									 
				 
				 });
    	</script>
</html>