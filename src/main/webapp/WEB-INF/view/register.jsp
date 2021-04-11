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
	                         <form  method="post" name="formOk">
								 <table>
								   	 <tbody>
								        <tr>
								            <td>
								            	<h4 class="text-white text-uppercase">아이디</h4>
								            </td>
								            <td>
								            	<input type="text" id="user_id" name="user_id" required="required" class="inputTag"/>
								            	<span class="text-white text-uppercase">(영문 소문자 + 숫자 결합 4~12자리)</span>
								            	<!-- ID중복체크  -->
								            	<div class="check_font" id="id_check"></div>    
								            </td>  
								        </tr>
										<tr>
								            <td>
								            	<h4 class="text-white text-uppercase">패스워드</h4>
								            </td>
								            <td>
								            	<input type="password" id="user_pwd" name="user_pwd" required="required" class="inputTag"/>  
								            	<span class="text-white text-uppercase">(8~20자에 특수문자가 반드시 포함된 영어 대소문자,숫자를 사용하세요)</span>
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
								            	<span class="text-white text-uppercase">(4~10자의 영어 대소문자를 사용하세요)</span> 
								            	<div id="nickname"></div>       
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
    	
    	<%@ include file="/WEB-INF/include/js_import.jsp" %>
</html>