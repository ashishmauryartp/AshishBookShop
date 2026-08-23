<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" 
	import="com.abs.bean.CustomerBean"%>

<%
CustomerBean cb = (CustomerBean) request.getAttribute("cbean");
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
	<title>Edit Customer Profile</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">
</head>

<body>
	<nav class="navbar site-nav navbar-dark">
		<div class="container-fluid px-4">
			<a class="navbar-brand" href="CustomerLogin.jsp"><i class="bi bi-book-half"></i> Ashish Book Shop</a>
			<span class="text-white">Welcome, <%=cb.getfName()%><i class="bi bi-person-circle"></i></span>
		</div>
	</nav>
	
	<div class="dashboard">
		<div class="container-fluid">
			<div class="row">
				<aside class="col-lg-2 sidebar">
				
					<a class="nav-link " href="CustomerLogin.jsp">
						<i class="bi bi-house me-2"></i>Home</a>
						
					<a class="nav-link " href="customerView">
						<i class="bi bi-book me-2"></i>View Books</a>
						
					<a class="nav-link " href="cart">
						<i class="bi bi-cart3 me-2"></i>View Cart</a>
						
					<a class="nav-link active" href="editCustomer">
						<i class="bi bi-person-gear me-2"></i>Edit Profile</a>
						
					<a class="nav-link " href="customerLogout">
						<i class="bi bi-box-arrow-right me-2"></i>Logout</a>
				
				</aside>
				
				<main class="col-lg-10 dashboard-main">
					<div class="table-card profile-card">
						<h2 class="fw-bold">Edit Customer Profile</h2>
						<p class="text-muted">Update your account details.</p>
				
						<form action="updateCustomer" method="post" data-validate novalidate>
							<div class="row g-3">
							
								<div class="col-md-6">
									<label class="form-label">Username</label>
									<input class="form-control" name="uname" value="<%=cb.getuName()%>"	readonly>
								</div>
							
								<div class="col-md-6">
									<label class="form-label">Password</label>
									<input class="form-control" type="password" name="pword" value="<%=cb.getpWord()%>" required>
								</div>
								
								<div class="col-md-6">
									<label class="form-label">First Name</label>
									<input class="form-control" name="fname" value="<%=cb.getfName()%>" required>
								</div>
								
								<div class="col-md-6">
									<label class="form-label">Last Name</label>
									<input class="form-control" name="lname" value="<%=cb.getlName()%>" required>
								</div>
								
								<div class="col-12">
									<label class="form-label">Address</label>
									<input	class="form-control" name="addr" value="<%=cb.getAddr()%>" required>
								</div>
								
								<div class="col-md-6">
									<label class="form-label">Email</label>
									<input class="form-control" type="email" name="mid"	value="<%=cb.getmId()%>" required>
								</div>
								
								<div class="col-md-6">
									<label class="form-label">Phone</label>
									<input class="form-control" name="phno" value="<%=cb.getPhNo()%>" pattern="[0-9]{10}" required>
								</div>
								
								<div class="col-12">
									<button class="btn btn-success px-4">
										<i class="bi bi-check2-circle me-2"></i>Update Profile
									</button>
								</div>
							</div>
						</form>
					</div>
				</main>
			</div>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/app.js"></script>
</body>
</html>