<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="pageTitle" value="Welcome to myCalendar!" scope="request" />
<html lang="en">
<head>
<title>myCalendar: <c:out value="${pageTitle}" />
</title>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<c:url var="resourceUrl" value="/resources" />
<link href="${resourceUrl}/bootstrap-3.3.1/css/bootstrap.css"
	rel="stylesheet" />
<link
	href="${resourceUrl}/bootstrap-3.3.1/css/bootstrap-datetimepicker.css"
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

		<h2>event</h2>
		<c:if test="${not empty eventError}">
			<table width="70%" cellpadding="5" cellspacing="0" border="1"
				align="center"
				style="border-collapse: collapse; border: 1px gray solid; text-align: center">
				<tr>
					<td>No.Event</td>
					<td>OWNER</td>
					<td>DATE</td>
					<td>SUMMARY</td>
					<td>ENEN_TLEVEL</td>
				</tr>
				<c:forEach var="events" items="${events}" varStatus="status1">
					<tr>
						<td align="center" class="events"><c:out
								value="${events.id+1}" /></td>
						<td align="center" class="listtd"><c:out
								value="${events.owner.id}" /></td>
						<td align="center" class="listtd"><c:out
								value="${events.when.time}" /></td>
						<td align="center" class="listtd"><c:out
								value="${events.summary}" /></td>
						<td align="center" class="listtd"><c:out
								value="${events.eventLevel}" /></td>
					</tr>
				</c:forEach>

			</table>
		</c:if>

		<c:if test="${empty eventError}">
			생성하신 이벤트가 없습니다.
		</c:if>
		<c:url value="./eventSet" var="okEvent" />
		<form name='attendeeEvent' action="${okEvent}" method='GET'>

			<table width="70%" cellpadding="5" cellspacing="0" border="1"
				align="center"
				style="border-collapse: collapse; border: 1px gray solid; text-align: center">
				<tr>
					<td>수정할 이벤트</td>
					<td><select name="event1">
							<option>0</option>
							<c:forEach var="events" items="${events}" varStatus="status1">
								<option><c:out value="${events.id+1}" /></option>
							</c:forEach>
					</select></td>
				</tr>
			</table>


			<h2>eventAttendees</h2>

			<c:if test="${not empty eventAttendeesError}">
				<table width="70%" cellpadding="5" cellspacing="0" border="1"
					align="center"
					style="border-collapse: collapse; border: 1px gray solid; text-align: center">
					<tr>

						<td>No.</td>
						<td>Event No.</td>
						<td>Attendee</td>

					</tr>
					<c:forEach var="eventAttendees" items="${eventAttendees}"
						varStatus="status1">
						<tr>
							<td align="center" class="eventAttendees"><c:out
									value="${status1.count}" /></td>
							<td align="center" class="listtd"><c:out
									value="${eventAttendees.event.id+1}" /></td>
							<td align="center" class="listtd"><c:out
									value="${eventAttendees.attendee.email}" /></td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
			<table width="70%" cellpadding="5" cellspacing="0" border="1"
				align="center"
				style="border-collapse: collapse; border: 1px gray solid; text-align: center">
				<tr>
					<td>참석 제외하기</td>
					<td><select name="deleteEvent">
							<option>0</option>
							<c:forEach var="events" items="${eventAttendees}" varStatus="status1">
								<option><c:out value="${status1.count}" /></option>
							</c:forEach>
					</select></td>
				</tr>
			</table>
			<c:if test="${empty eventAttendeesError}">
		참여중인 이벤트가 없습니다.
		</c:if>


			<input name="submit" type="submit" value="submit" />
		</form>
		<jsp:include page="../includes/footer.jsp" />
	</div>
	<script type="text/javascript"
		src="${resourceUrl}/javascript/jquery-1.11.1.min.js"></script>
	<script type="text/javascript"
		src="${resourceUrl}/bootstrap-3.3.1/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="${resourceUrl}/javascript/moment.js"></script>
	<script type="text/javascript"
		src="${resourceUrl}/javascript/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript">
		$(function() {
			$('#datetimepicker1').datetimepicker();
		});
	</script>
</body>
</html>