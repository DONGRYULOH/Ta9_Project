<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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
         <style type="text/css">
        	.modal_wrap{
			        display: none;
			        width: 500px;
			        height: 300px;
			        position: absolute;
			        top:50%;
			        left: 50%;
			        margin: -250px 0 0 -250px;
			        z-index: 2;
			    }
			    .black_bg{
			        display: none;
			        position: absolute;
			        content: "";
			        width: 100%;
			        height: 100%;
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
                                <h4 class="text-white text-uppercase">(내정보)</h4>
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
							<h5>${User.user_id}</h5> 
						</div>												
						<div class="row" style="margin-bottom: 30px;">
							<h5>${User.user_nickname}</h5>
						</div>						
						<div class="row" style="margin-bottom: 30px;">
							<h5>${User.user_exp} EXP</h5>
						</div>	
						<div class="row" style="margin-bottom: 30px;">						
							<div class="col-sm-8">	
								<h5>${User.user_rank}</h5>								
							</div>
							<div class="col-sm-4">
								<button type="button" class="btn btn-primary" id="modal_btn">패스워드 변경</button>
							</div>
							<!-- 패스워드 변경 DIV -->
							<div class="black_bg"></div>
							  <div class="modal_wrap">
							    <div class="modal_close"><a href="#">close</a></div>
								    <div class="row" style="background-color:#666699;height: 500px;">
						                        <div class="main_home text-center" style="padding-top: 200px;">
						                          <div align="center">
							                         <form  method="post" action="pwd_update">	
														 <table style="margin-bottom: 20px;">
														   	 <tbody>
																<tr>
														            <td>
														            	<h5 class="text-white text-uppercase">패스워드</h5>
														            </td>
														            <td>
														            	<input type="password" id="user_pwd" name="user_pwd" required="required" placeholder="8~20자리에 특수문자+영어대소문자+숫자로 포함된 조합을 사용!" style="width: 408px;"/>  								            	
														            	<div id="pwd"></div>      
														            </td>  
														        </tr>
														        <tr>
														            <td>
														            	<h5 class="text-white text-uppercase">패스워드 확인</h5>
														            															            
														            </td>
														            <td>
														            	<input type="password" placeholder="다시한번 더 입력하세요"  id="user_pwd_check" name="user_pwd_check"  required="required" style="width: 408px;"/>
														            	<div id="pwd_check"></div>       
														            </td>  
														        </tr>
														       		     
														    </tbody>
														</table>								
													<div>				
											 			 <button type="submit" id="reg_submit" class="btn btn-primary">변경완료</button>
													</div>
										 		</form>
									 		</div>
						               </div>
        	  						</div>
							    </div>
							<!-- 패스워드 변경 DIV -->	  							
						</div>
					</div>		
				</div>
				
				<div class="row">
					
				  </div>
				
				<div class="row">
					<div class="col-sm-1"></div>
					<div class="col-sm-11">
						<table class="table">
						 <thead>
						   <tr>
						      <th>등급</th>
						      <th>경험치(EXP)</th>
						      <th>혜택</th>
						   </tr>
						 </thead>
						 <tbody>
						   <tr
						   	<c:if test="${User.user_rank eq 'Bronze' }">
								class="success"
							</c:if>
						   >
						      <td>브론즈(Bronze)</td>
						      <td>0 EXP ~ 999 EXP</td>
						      <td>전체공개 + 브론즈등급 이상의 게시물 접근가능</td>
						   </tr>
						   <tr
						   	<c:if test="${User.user_rank eq 'Sliver' }">
								class="success"
							</c:if>
						   >
						      <td>실버(Sliver)</td>
						      <td>1000 EXP ~ 2999 EXP</td>
						      <td>전체공개 + 브론즈,실버등급 이상의 게시물 접근가능</td>
						   </tr>
						   <tr
						   	<c:if test="${User.user_rank eq 'Gold' }">
								class="success"
							</c:if>
						   >
						      <td>골드(Gold)</td>
						      <td>3000 EXP ~ 9999 EXP</td>
						      <td>전체공개 + 브론즈,실버,골드등급 이상의 게시물 접근가능</td>
						   </tr>
						   <tr
						   	<c:if test="${User.user_rank eq 'Platinum' }">
								class="success"
							</c:if>
						   >
						      <td>플래티넘(Platinum)</td>
						      <td>10000 EXP 이상</td>
						      <td>모든 게시물 접근가능</td>
						   </tr>
						 </tbody> 						
						</table>
					</div>
				</div>						
			</div>
			

            <!-- 풋터 공통 -->
           <%@ include file="/WEB-INF/include/footer.jsp"%>

    </body>
    
    
    <%@ include file="/WEB-INF/include/js_import.jsp" %>
    
    
    
    	<!-- 패스워드 수정 모달 창  -->
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
    
    
    <!-- 패스워드 변경 검증 로직 -->
    <script type="text/javascript">
    	
    	var validate = new Array; // 회원가입 유효성을 검사할 배열 (false - 유효성 검증 실패 , true - 유효성 검증 성공)
    	//  vaildate[0]-패스워드 , validate[1]-패스워드확인
    	validate[0] = false;
    	validate[1] = false;
    	    
		// 패스워드 정규표현식 
		var pwd = /^.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		var blank = /\s/g;    	
		
		// 1.패스워드 유효성 검증
		$('#user_pwd').keyup(function() {
			var user_pwd = $('#user_pwd').val();
			if (!pwd.test($(this).val()) || blank.test($(this).val())) {
				//alert("패스워드"+$(this).val());
				$('#pwd').text("8~20자에 특수문자가 반드시 포함된 영어 대소문자 + 숫자를 사용!");
				$('#pwd').css('color', 'red');
				validate[0] = false;
			} else {
				$('#pwd').text("사용가능한 패스워드");
				$('#pwd').css('color', 'blue');
				validate[0] = true;
			}
			
		});
		
		// 2.패스워드 일치여부 확인
		$('#user_pwd_check,#user_pwd').keyup(function() {
			if ($('#user_pwd').val() != $('#user_pwd_check').val()) {
				$('#pwd_check').text("비밀번호가 다릅니다.");
				$('#pwd_check').css('color', 'red');
				validate[1] = false;
			}else if($('#user_pwd_check').val() == ''){
				$('#pwd_check').text("패스워드를 재입력 바람!");
				$('#pwd_check').css('color', 'red');
				validate[1] = false;
			}else{
				$('#pwd_check').text("비밀번호가 일치합니다.");
				$('#pwd_check').css('color', 'blue');
				validate[1] = true;
			}
			
		});
					
		// 3.가입버튼 클릭시 유효성 검증 (validate 전체 배열중 하나라도 false 값이 있으면 회원가입 X)
		//$('button:submit').click
		$('#reg_submit').click(function() {
			//유효성 검증 
			for (let i = 0; i < validate.length; i++) {
				if (validate[i] == false) {
					switch (i) {
					case 0:
						$('#pwd').focus();
						$('#pwd').text('패스워드 입력부분 다시 확인 바람!');
						$('#pwd').css('color', 'red');						
						return false;
					case 1:
						$('#pwd_check').focus();
						$('#pwd_check').text('패스워드를 재입력부분 다시 확인 바람!');
						$('#pwd_check').css('color', 'red');
						return false;
					}
				}
			}
			
		});	 
    
    </script>
    
    
    
    
    
    
    
    
    
</html>