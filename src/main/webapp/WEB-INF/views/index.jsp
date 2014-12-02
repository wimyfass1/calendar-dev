<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="pageTitle" value="Welcome to myCalendar!" scope="request"/>
<html>
<head>
	<title>myCalendar: <c:out value="${pageTitle}" /> </title>
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <c:url var="resourceUrl" value="/resources"/>
    <link href="${resourceUrl}/bootstrap-3.3.1/css/bootstrap.css" rel="stylesheet"/>
    <link href="${resourceUrl}/css/custom.css" rel="stylesheet"/>
    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>
<body class="header">
<div class="container">
<jsp:include page="./includes/header.jsp"/>
    <c:if test="${message != null}">
        <div class="alert alert-danger" id="message"><c:out value="${message}"/></div>
    </c:if>
	<ul>
	    <li><a id="eventsLink" href="events/">모든 이벤트 보기</a> - 모든 유저들이 등록한 이벤트를 볼 수 있습니다.
	    	<ul>
	    		<li>로그인 전 - 단순 이벤트 정보 목록 보기, 현재 참여중인 유저의 정보 보기</li>
	    		<li>로그인 후
	    			<ul>
	    				<li>ROLE_USER - 특정 이벤트 참여 기능 추가</li>
	    				<li>ROLE_ADMIN - 특정 이벤트 참여 기능 및 이벤트 삭제 기능 추가</li>
	    			</ul>
	    		</li>
	    	</ul>
	    </li>
	    <li><a id="myEventsLink" href="events/my">나의 이벤트</a> - 로그인한 유저가 생성한 이벤트와 참여하는 이벤트 목록을 보여줍니다.</li>
	    <li><a id="createEventLink" href="events/form">이벤트 생성</a> - 로그인한 유저가 새로운 이벤트를 생성합니다.</li>
	    <li><a id="signupLink" href="users/signup">회원 가입</a> - 회원 가입을 합니다.</li>
	    <li><a id="signinLink" href="users/signin">로그인</a> - 로그인을 합니다.</li>
	</ul>
<jsp:include page="./includes/footer.jsp"/>
</div>
</body>
</html>