<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.abs.bean.CustomerBean"%>

<%
CustomerBean cb = (CustomerBean) session.getAttribute("cbean");
String msg = (String) request.getAttribute("msg");
if (cb == null) {
	response.sendRedirect("CustomerLogin.html");
	return;
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>Purchase</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">
</head>

<body>
	<nav class="navbar site-nav navbar-dark">
		<div class="container">
			<a class="navbar-brand" href="CustomerLogin.jsp"><i class="bi bi-book-half"></i> Ashish Book Shop</a>
		</div>
	</nav>
	
	<div class="auth-wrap">
		<div class="container">
			<div class="auth-card text-center">
				<div class="message-icon">
					<i class="bi bi-check-circle-fill"></i>
				</div>
				<h2 class="fw-bold mt-3">Purchase Status</h2>
				<p class="lead mb-4"><%=msg%></p>
				<div class="d-flex flex-wrap justify-content-center gap-2">
					<a href="customerView" class="btn btn-primary">View Books</a>
					<a href="cart" class="btn btn-outline-primary">View Cart</a>
					<a href="editCustomer" class="btn btn-outline-secondary">Edit Profile</a>
					<a href="customerLogout" class="btn btn-outline-danger">Logout</a>
				</div>
			</div>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/app.js"></script>
</body>
</html>