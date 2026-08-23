<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String msg = (String) request.getAttribute("msg");
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>Message</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">
</head>
<body>
	<nav class="navbar site-nav navbar-dark">
		<div class="container">
			<a class="navbar-brand" href="home.html"><i class="bi bi-book-half"></i> Ashish Book Shop</a>
		</div>
	</nav>
	
	<div class="auth-wrap">
		<div class="container">
			<div class="auth-card text-center">
				<div class="message-icon">
					<i class="bi bi-info-circle-fill"></i>
				</div>
				<h3 class="mt-3"><%=msg%></h3>
				<div class="mt-4">
					<a href="home.html" class="btn btn-primary">Home</a>
				</div>
			</div>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/app.js"></script>
</body>
</html>