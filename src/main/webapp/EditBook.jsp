<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" 
	import="com.abs.bean.*"%>

<%
AdminBean ab = (AdminBean) session.getAttribute("abean");
BookBean bb = (BookBean) request.getAttribute("bbean");
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
	<title>Edit Book</title>
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
			<div class="auth-card">
				<h2 class="fw-bold">Edit Book</h2>
				<p class="text-muted">Update price and quantity for <strong><%=bb.getName()%></strong>.</p>
				
				<form action="update" method="post" data-validate novalidate>
					<input type="hidden" name="bcode" value="<%=bb.getCode()%>">
					
					<div class="mb-3">
						<label class="form-label">Book Code</label>
						<input class="form-control" value="<%=bb.getCode()%>" readonly>
					</div>
					
					<div class="mb-3">
						<label class="form-label">Book Price</label>
						<input class="form-control" type="number" step="0.01" min="0" name="bprice" value="<%=bb.getPrice()%>" required>
					</div>

					<div class="mb-3">
						<label class="form-label">Book Quantity</label><input
							class="form-control" type="number" min="0" name="bqty" value="<%=bb.getQty()%>" required>
					</div>
					
					<button class="btn btn-success w-100">
						<i class="bi bi-check2-circle me-2"></i>Update Book
					</button>
				</form>
			</div>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/app.js"></script>
</body>
</html>