<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<nav class="navbar navbar-default navbar-fixed white no-background bootsnav text-uppercase">
                <!-- Start Top Search -->
                <div class="top-search">
                    <div class="container">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-search"></i></span>
                            <input type="text" class="form-control" placeholder="Search">
                            <span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
                        </div>
                    </div>
                </div>
                <!-- End Top Search -->

                <div class="container">    

                    <!-- Start Header Navigation -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
                            <i class="fa fa-bars"></i>
                        </button>
                        <a class="navbar-brand" href="/">
                            <img src="assets/images/logo.png" class="logo logo-display" alt="">
                            <img src="assets/images/logo.png" class="logo logo-scrolled" alt="">
                        </a>
                    </div>
                    <!-- End Header Navigation -->

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="navbar-menu">
                    	<!-- 비로그인 -->
                    	<c:if test="${User == null}">
                     		<ul class="nav navbar-nav navbar-right" style="padding-left: 50px;">
                        		<li><a href="login">로그인</a></li>
                            	<li><a href="register">회원가입</a></li>                            	                       
                        	</ul>
                        </c:if>
                        <!-- 로그인시 --> 
                        <c:if test="${User != null}">
                     		<ul class="nav navbar-nav navbar-right" style="padding-left: 50px;">
                     			<li><a href="mypage">마이페이지</a></li> 
                     			<li><a href="signOut">로그아웃</a></li>                         		                            	                                                
                        	</ul>
                        </c:if> 
                        <ul class="nav navbar-nav navbar-right" data-in="fadeInDown" data-out="fadeOutUp">
                            <li><a href="sports">스포츠</a></li> 
							<li><a href="aboutus.html">개발</a></li> 							                   
                            <li><a href="model.html">경제</a></li> 							
                            <li><a href="blog.html">외국어</a></li>                                    
                            <li><a href="contactus.html">ETC</a></li>                                              
                        </ul>
                       
                    </div><!-- /.navbar-collapse -->
                </div>  


            </nav>