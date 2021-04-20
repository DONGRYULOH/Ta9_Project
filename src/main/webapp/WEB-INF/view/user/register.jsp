<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        
        <%@ include file="/WEB-INF/include/head_import.jsp" %>
        
        <style type="text/css">
        	.inputTag{
        		width: 208px;
        		margin-bottom: 10px;	
        	}        	
        </style>
        
        <script type="text/javascript">       	        	
        	if('${register_result}' == -1) {
        		alert('${register_msg}');
        	}
        </script>
    </head>

    <body data-spy="scroll" data-target=".navbar-collapse">
      
		<!-- 새로고침시 로딩 효과 -->
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

      


        <div class="culmn">

            <!-- 헤더 메뉴바 공통 -->
            <%@ include file="/WEB-INF/include/header.jsp"%>

               	 <!-- 회원가입 -->
                 <div class="row" style=" background-color:#a3a3c2;">
                        <div class="main_home text-center" >
                          <div align="center">
	                         <form  method="post">
								 <table>
								   	 <tbody>
								        <tr>
								            <td>
								            	<h4 class="text-white text-uppercase">아이디</h4>
								            </td>
								            <td>
								            	<input type="text" id="user_id" name="user_id" required="required" class="inputTag"/>
								            	<span class="text-white text-uppercase">(5~12자리의 영문 대소문자 또는 숫자를 사용해주세요)</span>
								            	<!-- ID중복체크  -->
								            	<div id="id_check"></div>    
								            </td>  
								        </tr>
										<tr>
								            <td>
								            	<h4 class="text-white text-uppercase">패스워드</h4>
								            </td>
								            <td>
								            	<input type="password" id="user_pwd" name="user_pwd" required="required" class="inputTag"/>  
								            	<span class="text-white text-uppercase">(8~20자리에 특수문자+영어 대소문자+숫자로 포함된 조합을 사용해주세요)</span>
								            	<div id="pwd"></div>      
								            </td>  
								        </tr>
								        <tr>
								            <td>
								            	<h4 class="text-white text-uppercase">패스워드 확인</h4>
								            
								            </td>
								            <td>
								            	<input type="password" placeholder="다시한번 더 입력하세요"  id="user_pwd_check" name="user_pwd_check"  required="required" class="inputTag"/>
								            	<div id="pwd_check"></div>       
								            </td>  
								        </tr>
								        <tr>
								            <td>
								            	<h4 class="text-white text-uppercase">닉네임</h4>		        
								            </td>
								            <td>
								            	<input type="text" id="user_nickname" name="user_nickname" required="required" class="inputTag"/>
								            	<span class="text-white text-uppercase">(4~10자리의 영어 대소문자를 사용해주세요)</span> 
								            	<div id="nickname_check"></div>       
								            </td>  
								        </tr>				     
								    </tbody>
								</table>								
							<div>				
					 			 <button type="submit" id="reg_submit" class="btn btn-primary">회원가입</button>
							</div>
				 		</form>
			 		</div>
               </div>
          </div>
          

           <!-- 풋터 공통 -->
           <%@ include file="/WEB-INF/include/footer.jsp"%>


        </div>

       
		
    </body>
    
    <!-- 회원가입 검증 로직 -->
    <script type="text/javascript">
    	
    	var validate = new Array; // 회원가입 유효성을 검사할 배열 (false - 유효성 검증 실패 , true - 유효성 검증 성공)
    	// vaildate[0]-아이디 , vaildate[1]-패스워드 , validate[2]-패스워드확인 , validate[3]-닉네임 
    	for(let i=0;i<4;i++){ 
    		validate[i] = false; 
    	}
    
    	var id = /^[a-zA-Z0-9]{5,12}$/; //ID 정규표현식
		var nickname = /^[a-zA-Z]{4,10}$/; //닉네임 정규표현식
		// 패스워드 정규표현식 
		var pwd = /^.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		var blank = /\s/g;
    	
		// 1.아이디 유효성 검사(1 = 중복 / 0 != 중복)
		$("#user_id").keyup(function() {
			var user_id = $('#user_id').val();
			
			// 비동기 방식으로 ID 중복체크 하기 (공백이 아닐경우에 한해서)
			if(user_id != ''){
				$.ajax({
					async : true, // true 설멍하면 비동기 방식을 사용하겠다(기본값:true)
					url : 'idCheck', // 요청을 받을 컨트롤러 
					type : 'POST',
					data : user_id,  
					contentType : 'application/json; charset=UTF-8', // json 형식으로 서버로 보낼때 설정값 
					success : function(data) {
						console.log("1 = 중복o / 0 = 중복x : "+ data);											
						if (data == 1) {
								// 1 : 아이디가 중복될때 
								$("#id_check").text("사용중인 아이디입니다 :p");
								$("#id_check").css("color", "red");
								validate[0] = false;
						} 
						else{ // 2 : 중복되는 아이디가 없는 경우 정규 표현식 검증  														
								if(!id.test(user_id)){								
									$('#id_check').text("아이디는 영문 대소문자,숫자 5~12 자리만 가능합니다 :)");
									$('#id_check').css('color', 'red');
									validate[0] = false;
								} else if(id.test(user_id)){
									//사용가능 
									$('#id_check').text("사용가능한ID입니다 :) :)");
									$('#id_check').css('color', 'blue');
									validate[0] = true;
								}							
							}
					}, 
					error : function() {
						console.log("중복되는 ID 찾는 도중 에러발생...");
					}
				});
		 	}else{ // ID 입력칸이 비어있을 경우 
		 		$('#id_check').text('아이디를 입력해주세요 :)');
				$('#id_check').css('color', 'red');		
				validate[0] = false; 		
		 	}		
		});
		
		// 2.패스워드 유효성 검증
		$('#user_pwd').keyup(function() {
			var user_pwd = $('#user_pwd').val();
			if (!pwd.test($(this).val()) || blank.test($(this).val())) {
				//alert("패스워드"+$(this).val());
				$('#pwd').text("8~20자에 특수문자가 반드시 포함된 영어 대소문자 + 숫자를 사용하세요 :) :)");
				$('#pwd').css('color', 'red');
				validate[1] = false;
			} else {
				$('#pwd').text("사용가능한 패스워드");
				$('#pwd').css('color', 'blue');
				validate[1] = true;
			}
			
		});
		
		// 3.패스워드 일치여부 확인
		$('#user_pwd_check,#user_pwd').keyup(function() {
			if ($('#user_pwd').val() != $('#user_pwd_check').val()) {
				$('#pwd_check').text("비밀번호가 다릅니다.");
				$('#pwd_check').css('color', 'red');
				validate[2] = false;
			}else if($('#user_pwd_check').val() == ''){
				$('#pwd_check').text("패스워드를 재입력 바람!");
				$('#pwd_check').css('color', 'red');
				validate[2] = false;
			}else{
				$('#pwd_check').text("비밀번호가 일치합니다.");
				$('#pwd_check').css('color', 'blue');
				validate[2] = true;
			}
			
		});
		
		// 4.닉네임 유효성 검사(1 = 중복 / 0 != 중복)
		$("#user_nickname").keyup(function() {
			var user_nickname = $('#user_nickname').val();
			
			// 비동기 방식으로 닉네임 중복체크 하기 
			if($('#user_nickname').val() != ''){
				$.ajax({
					async : true, // true 설멍하면 비동기 방식을 사용하겠다(기본값:true)
					url : 'nicknameCheck', // 요청을 받을 컨트롤러 
					type : 'POST',
					data :  user_nickname,  
					contentType : 'application/json; charset=UTF-8', // json 형식으로 서버로 보낼때 설정값 
					success : function(data) {										
						if (data == 1) {
								// 1 : 닉네임 중복될때 
								$("#nickname_check").text("사용중인 닉네임입니다!");
								$("#nickname_check").css("color", "red");
								validate[3] = false;
						} 
						else{ // 2 : 중복되는 닉네임이 없는 경우 														
								if(!nickname.test(user_nickname)){								
									$('#nickname_check').text("4~10자의 영어 대소문자만 가능합니다 :) :)");
									$('#nickname_check').css('color', 'red');
									validate[3] = false;
								} else if(nickname.test(user_nickname)){
									//사용가능 
									$('#nickname_check').text("사용가능한 닉네임 입니다 :) :)");
									$('#nickname_check').css('color', 'blue');
									validate[3] = true;
								}							
							}
					}, 
					error : function() {
						console.log("중복되는 닉네임 찾는 도중 에러발생...");
					}
				});
		 	}else{ // ID 입력칸이 비어있을 경우 
		 		$('#nickname_check').text('닉네임을 입력해주세요 :)');
				$('#nickname_check').css('color', 'red');		
				validate[3] = false; 		
		 	}		
		});
		
		// 5.가입버튼 클릭시 유효성 검증 (validate 전체 배열중 하나라도 false 값이 있으면 회원가입 X)
		//$('button:submit').click
		$('#reg_submit').click(function() {
			//유효성 검증 
			for (let i = 0; i < validate.length; i++) {
				if (validate[i] == false) {
					console.log(i);
					switch (i) {
					case 0:
						$('#user_id').focus();
						$('#id_check').text('아이디를 입력부분을 다시 확인 바람!');
						$('#id_check').css('color', 'red');						
						return false;
					case 1:
						$('#user_pwd').focus();
						$('#pwd').text('패스워드를 입력부분을 다시 확인 바람!');
						$('#pwd').css('color', 'red');
						return false;
					case 2:
						$('#user_pwd_check').focus();
						$('#pwd_check').text('패스워드 확인부분을 다시 확인 바람!');
						$('#pwd_check').css('color', 'red');
						return false;
					case 3:
						$('#user_nickname').focus();
						$('#nickname_check').text('닉네임 부분을 다시 확인 바람!');
						$('#nickname_check').css('color', 'red');
						return false;
					}
				}
			}
			
		});	 
    
    </script>
    	
    	<%@ include file="/WEB-INF/include/js_import.jsp" %>
</html>






















