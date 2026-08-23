<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" 
	import="com.abs.bean.CustomerBean"%>

<%
CustomerBean cb = (CustomerBean) session.getAttribute("cbean");
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
	<title>Customer Home</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">
</head>
<body>
	<nav class="navbar site-nav navbar-dark">
		<div class="container-fluid px-4">
			<a class="navbar-brand" href="CustomerLogin.jsp"><i class="bi bi-book-half"></i> Ashish Book Shop</a>
			<span class="text-white">Welcome, <%=cb.getfName()%> <%=cb.getlName()%>
				<i class="bi bi-person-circle ms-2"></i>
			</span>
		</div>
	</nav>
	
	<div class="dashboard">
		<div class="container-fluid">
			<div class="row">
				<aside class="col-lg-2 sidebar">
					
					<a class="nav-link active" href="CustomerLogin.jsp">
						<i class="bi bi-house me-2"></i>Home</a>
					
					<a class="nav-link " href="customerView">
						<i class="bi bi-book me-2"></i>View Books</a>
						
					<a class="nav-link " href="cart">
						<i class="bi bi-cart3 me-2"></i>View Cart</a>
						
					<a class="nav-link " href="editCustomer">
						<i class="bi bi-person-gear me-2"></i>Edit Profile</a>
						
					<a class="nav-link " href="customerLogout">
						<i class="bi bi-box-arrow-right me-2"></i>Logout</a>
				
				</aside>
				
				<main class="col-lg-10 dashboard-main">
					<h2 class="fw-bold">Welcome,<%=cb.getfName()%>!</h2>
					<p class="text-muted">Manage your shopping account from here.</p>

					<div class="row g-4 mt-2">

						<div class="col-md-6 col-xl-3">
							<div class="dashboard-card">
								<div class="dash-icon">
									<i class="bi bi-book"></i>
								</div>
								<h5>View Books</h5>
								<p class="text-muted">Browse available books.</p>
								<a href="customerView" class="btn btn-primary">View Books</a>
							</div>
						</div>

						<div class="col-md-6 col-xl-3">
							<div class="dashboard-card">
								<div class="dash-icon">
									<i class="bi bi-cart3"></i>
								</div>
								<h5>View Cart</h5>
								<p class="text-muted">Your selected books.</p>
								<a href="cart" class="btn btn-primary">Open Cart</a>
							</div>
						</div>
						
						<div class="col-md-6 col-xl-3">
							<div class="dashboard-card">
								<div class="dash-icon">
									<i class="bi bi-person-gear"></i>
								</div>
								<h5>Edit Profile</h5>
								<p class="text-muted">Update your details.</p>
								<a href="editCustomer" class="btn btn-primary">Edit Profile</a>
							</div>
						</div>
						
						<div class="col-md-6 col-xl-3">
							<div class="dashboard-card">
								<div class="dash-icon">
									<i class="bi bi-box-arrow-right"></i>
								</div>
								<h5>Logout</h5>
								<p class="text-muted">End your session.</p>
								<a href="customerLogout" class="btn btn-primary">Logout</a>
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