<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<c:set var="pageTitle" value="Welcome to myCalendar!" scope="request" />
<html>
<head>
<title>myCalendar: <c:out value="${pageTitle}" />
</title>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<c:url var="resourceUrl" value="/resources" />
<link href="${resourceUrl}/bootstrap-3.3.1/css/bootstrap.css"
	rel="stylesheet" />
<link href="${resourceUrl}/css/custom.css" rel="stylesheet" />
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>
<body class="header">
	<div class="container">
		<jsp:include page="../includes/header.jsp" />
		   <div align="center">
    <!-- register로 쏴준다 
    	.java의 get가 아닌 post 방식으로 쏴준다.
    	commendName이 userForm의 path에 있는 id가 set이된다.
    	get으로 부를때 userForm의 id속성 name속성들이 다들어간다. 그리고
    	확인을 눌렀을때 post방식으로 클래스에 보내주면 그때 각 속성에 따른 userForm이 전송되고 각각 더해진다.
    -->
<!-- body onload='document.loginForm.id.focus();' -->
 
	<h1>Spring Security Login Form (Database Authentication)</h1>
 
	<div id="login-box">
 
		<h3>Login!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!</h3>
 
		</div>
		</div>
		<jsp:include page="../includes/footer.jsp" />
	</div>
	
	<META http-equiv=refresh content="0;url=../"> 
</body>
</html>