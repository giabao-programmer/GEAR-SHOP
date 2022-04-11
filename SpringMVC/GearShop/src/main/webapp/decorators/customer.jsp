<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="dec" uri="http://www.opensymphony.com/sitemesh/decorator"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GEARSHOP</title>
<link href="<c:url value='templates/css/styles.css'/>" rel="stylesheet" />
<link href="<c:url value='templates/css/mystyle.css'/>" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
</head>
<body class="bg-milk">
	<%@ include file="/common/customer/navbar.jsp"%>
	<!-- Body -->
	<div class="container body1680px pt-4" style="display: block;">
		<dec:body />
	</div>
	<!-- Footer-->
	<%@ include file="/common/customer/footer.jsp"%>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>


</body>
</html>