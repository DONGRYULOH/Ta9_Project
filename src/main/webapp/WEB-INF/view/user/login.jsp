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
        
        <script type="text/javascript">       	        	
        	if('${result}' == -1) {
        		alert('${msg}');
        	}
        	if('${register_result}' == 1) {
        		alert('${register_msg}');
        	}
        </script>
    </head>

    <body data-spy="scroll" data-target=".navbar-collapse">
      
		

      


        <div class="culmn">

            <!-- 헤더 메뉴바 공통 -->
            <%@ include file="/WEB-INF/include/header.jsp"%>

               		<!-- LOGIN -->
                    <div class="row" style=" background-color:#a3a3c2;">
                        <div class="main_home text-center">
                            <div class="model_text">
                                <div align="center">
								 <form  method="post">
								 	<div>
									   <label class="text-white text-uppercase">아이디</label>
									   <!--
									   		name은 서버로 보내질 아이디로 Dto 있는 변수명과 똑같이 매칭이 되야지 Dto에 담길수 있다.  
									    -->
									   <input type="text" id="user_id" name="user_id" required="required" />     
									   <label class="text-white text-uppercase">패스워드</label>
									   <input type="password" id="user_pwd" name="user_pwd" required="required" />
									   <button class="btn btn-default" type="submit" >로그인</button>
									</div>   			
								 </form>    
								</div>                              
                            </div>
                        </div>
                   </div>
          

           <!-- 풋터 공통 -->
           <%@ include file="/WEB-INF/include/footer.jsp"%>


        </div>

       
		
    </body>
    	
    	<%@ include file="/WEB-INF/include/js_import.jsp" %>
</html>