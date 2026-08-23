<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" 
	import="com.abs.bean.AdminBean"%>

<%
AdminBean ab = (AdminBean) session.getAttribute("abean");
String msg = (String) request.getAttribute("msg");
if (ab == null) {
	response.sendRedirect("AdminLogin.html");
	return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>Book Added</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">
</head>

<body>
	<nav class="navbar site-nav navbar-dark">
		<div class="container">
			<a class="navbar-brand" href="AdminLogin.jsp"><i class="bi bi-book-half"></i> Ashish Book Shop</a>
		</div>
	</nav>
	
	<div class="auth-wrap">
		<div class="container">
			<div class="auth-card text-center">
				<div class="message-icon">
					<i class="bi bi-check-circle-fill"></i>
				</div>
	
				<h3 class="mt-3"><%=msg%></h3>
	
				<div class="d-flex justify-content-center gap-2 mt-4">
					<a href="book.html" class="btn btn-primary">Add Another Book</a>
					<a href="view" class="btn btn-outline-primary">View Books</a>
					<a href="logout" class="btn btn-outline-danger">Logout</a>
				</div>
			</div>
		</div>
	</div>
	
	<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/app.js"></script>
</body>
</html>