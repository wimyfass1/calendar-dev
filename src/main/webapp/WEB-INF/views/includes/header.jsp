<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<nav class="navbar navbar-default" role="navigation">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
       	    <c:url var="welcomeUrl" value="/" />	
            <li><a id="navWelcomeLink" href="${welcomeUrl}"><span class="glyphicon glyphicon-home"></span> 홈</a></li>

            <c:url var="eventsUrl" value="/events/" />
            <li><a id="navEventsLink" href="${eventsUrl}"><span class="glyphicon glyphicon-th-list"></span> 모든 이벤트 보기</a></li>

            <c:url var="myEventsUrl" value="/events/my" />
            <li><a id="navMyEventsLink" href="${myEventsUrl}"><span class="glyphicon glyphicon-ok-sign"></span> 나의 이벤트</a></li>

            <c:url var="createEventUrl" value="/events/form" />
            <li><a id="navCreateEventLink" href="${createEventUrl}"><span class="glyphicon glyphicon-new-window"></span> 이벤트 생성</a></li>
            
            <c:url var="signupUrl" value="/users/signup" />
            <li><a id="signupLink" href="${signupUrl}"><span class="glyphicon glyphicon-globe"></span> 회원 가입</a></li>
            
<<<<<<< HEAD
            <li class="dropdown">
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a>
	          <ul class="dropdown-menu" role="menu">
	            <li><a href="#">Action</a></li>
	            <li><a href="#">Another action</a></li>
	            <li><a href="#">Something else here</a></li>
	            <li class="divider"></li>
	            <li><a href="#">Separated link</a></li>
	            <li class="divider"></li>
	            <li><a href="#">One more separated link</a></li>
	          </ul>
	        </li>
=======
            <c:url var="signinUrl" value="/users/signin" />
            <li><a id="signinLink" href="${signinUrl}"><span class="glyphicon glyphicon-saved"></span> 로그인</a></li>
>>>>>>> 5e78846e1d5302e38760ba29a51245c18516e882
        </ul>
    </div>
  </div>
</nav>