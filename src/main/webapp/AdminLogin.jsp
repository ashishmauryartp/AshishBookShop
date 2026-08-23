<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" 
	import="com.abs.bean.AdminBean"%>
	
<%
AdminBean ab = (AdminBean) session.getAttribute("abean");
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
	<title>Admin Home</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">
</head>

<body>
	<nav class="navbar site-nav navbar-dark">
		<div class="container-fluid px-4">
			<a class="navbar-brand" href="AdminLogin.jsp"><i class="bi bi-book-half"></i> Ashish Book Shop</a>
			<span class="text-white">Welcome Admin, <%=ab.getfName()%> 
				<i class="bi bi-person-circle ms-2"></i>
			</span>
		</div>
	</nav>
	
	<div class="dashboard">
		<div class="container-fluid">
			<div class="row">
				<aside class="col-lg-2 sidebar">
					
					<a class="nav-link active" href="AdminLogin.jsp">
						<i class="bi bi-house me-2"></i>Home</a>
					
					<a class="nav-link " href="book.html">
						<i class="bi bi-plus-circle me-2"></i>Add Book</a>
						
					<a class="nav-link " href="view">
						<i class="bi bi-bookshelf me-2"></i>View Books</a>
					
					<a class="nav-link " href="logout">
						<i class="bi bi-box-arrow-right me-2"></i>Logout</a>
				
				</aside>
				
				<main class="col-lg-10 dashboard-main">
					<h2 class="fw-bold">Admin Dashboard</h2>
					<p class="text-muted">Manage books in your shop.</p>
				
					<div class="row g-4 mt-2">
					
						<div class="col-md-4">
							<div class="dashboard-card">
								<div class="dash-icon">
									<i class="bi bi-plus-circle"></i>
								</div>
								<h5>Add Book</h5>
								<p class="text-muted">Add a new book to inventory.</p>
								<a href="book.html" class="btn btn-primary">Add Book</a>
							</div>
						</div>
					
						<div class="col-md-4">
							<div class="dashboard-card">
								<div class="dash-icon">
									<i class="bi bi-bookshelf"></i>
								</div>
								<h5>View/Edit Books</h5>
								<p class="text-muted">Edit or delete existing books.</p>
								<a href="view" class="btn btn-primary">View Books</a>
							</div>
						</div>
					
						<div class="col-md-4">
							<div class="dashboard-card">
								<div class="dash-icon">
									<i class="bi bi-box-arrow-right"></i>
								</div>
								<h5>Logout</h5>
								<p class="text-muted">End your admin session.</p>
								<a href="logout" class="btn btn-primary">Logout</a>
							</div>
						</div>
					</div>
				</main>
			</div>
		</div>
	</div>
	<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/app.js"></script>
</body>
</html>