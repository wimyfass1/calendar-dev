<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="pageTitle" value="Welcome to myCalendar!" scope="request"/>
<html lang="en">
<head>
	<title>myCalendar: <c:out value="${pageTitle}"/> </title>
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <c:url var="resourceUrl" value="/resources"/>
    <link href="${resourceUrl}/bootstrap-3.3.1/css/bootstrap.css" rel="stylesheet"/>
    <link href="${resourceUrl}/bootstrap-3.3.1/css/bootstrap-datetimepicker.css" rel="stylesheet"/>    
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
        <div class="alert alert-success" id="message"><c:out value="${message}"/></div>
    </c:if>
    <div class="container row">
    <div class="alert alert-success col-md-6" id="message">도움말: <a href="https://github.com/Eonasdan/bootstrap-datetimepicker/wiki/Installation" target="_blank">https://github.com/Eonasdan/bootstrap-datetimepicker/wiki/Installation</a></div>
    <div class="alert alert-success col-md-6" id="message">예제: <a href="http://eonasdan.github.io/bootstrap-datetimepicker/" target="_blank">http://eonasdan.github.io/bootstrap-datetimepicker/</a></div>
	</div>
	
	<div class="container">
		
	    <div class="row">
	        <div class='col-md-6'>
	            <div class="form-group">
	                <div class='input-group date' id='datetimepicker1'>
	                    <input type='text' class="form-control" />
	                    <span class="input-group-addon">
	                    	<span class="glyphicon glyphicon-calendar"></span>
	                    </span>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
<jsp:include page="./includes/footer.jsp"/>
</div>
<script type="text/javascript" src="${resourceUrl}/javascript/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${resourceUrl}/bootstrap-3.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${resourceUrl}/javascript/moment.js"></script>
<script type="text/javascript" src="${resourceUrl}/javascript/bootstrap-datetimepicker.js"></script>
<script type="text/javascript">
$(function () {
    $('#datetimepicker1').datetimepicker();
});
</script>
</body>
</html>