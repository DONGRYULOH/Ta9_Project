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
        <title>myPageInfo</title>
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
							<h5>${User.user_rank}</h5>
						</div>
					</div>		
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
						      <td>전체공개 + 브론즈 등급의 게시물 접근가능</td>
						   </tr>
						   <tr
						   	<c:if test="${User.user_rank eq 'Sliver' }">
								class="success"
							</c:if>
						   >
						      <td>실버(Sliver)</td>
						      <td>1000 EXP ~ 2999 EXP</td>
						      <td>전체공개 + 브론즈,실버 게시물 접근가능</td>
						   </tr>
						   <tr
						   	<c:if test="${User.user_rank eq 'Gold' }">
								class="success"
							</c:if>
						   >
						      <td>골드(Gold)</td>
						      <td>3000 EXP ~ 9999 EXP</td>
						      <td>전체공개 + 브론즈,실버,골드 게시물 접근가능</td>
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
</html>