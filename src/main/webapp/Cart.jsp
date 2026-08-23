<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" 
	import="com.abs.bean.*,java.util.*"%>

<%
CustomerBean cb = (CustomerBean) session.getAttribute("cbean");
ArrayList<BookBean> cart = (ArrayList<BookBean>) session.getAttribute("cart");
if (cb == null) {
	response.sendRedirect("CustomerLogin.html");
	return;
}
float total = 0;
if (cart != null) {
	for (BookBean x : cart)
		total += x.getPrice();
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>Shopping Cart</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">
</head>
<body>
	<nav class="navbar site-nav navbar-dark">
		<div class="container-fluid px-4">
			<a class="navbar-brand" href="CustomerLogin.jsp"><i class="bi bi-book-half"></i> Ashish Book Shop</a>
			<span class="text-white">Welcome, <%=cb.getfName()%> 
				<i class="bi bi-person-circle"></i>
			</span>
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
					
					<a class="nav-link active" href="cart">
						<i class="bi bi-cart3 me-2"></i>View Cart</a>
						
					<a class="nav-link " href="editCustomer">
						<i class="bi bi-person-gear me-2"></i>Edit Profile</a>
						
					<a class="nav-link " href="customerLogout">
						<i class="bi bi-box-arrow-right me-2"></i>Logout</a>
				
				</aside>
				
				<main class="col-lg-10 dashboard-main">
				
					<div class="d-flex justify-content-between align-items-center mb-3">
						<div>
							<h2 class="fw-bold">Shopping Cart</h2>
							<p class="text-muted mb-0">Review your selected books.</p>
						</div>
					</div>
				
					<div class="table-card">
						<%
						if (cart == null || cart.size() == 0) {
						%><div class="empty-cart">
							<i class="bi bi-cart-x"></i>
							<h5>Your cart is empty</h5>
							<p>Add books from the available-books page.</p>
							<a href="customerView" class="btn btn-primary">Browse Books</a>
						</div>
						<%
						} else {
						%><div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>Code</th>
										<th>Book Name</th>
										<th>Author</th>
										<th>Price</th>
										<th>Quantity</th>
									</tr>
								</thead>
								<tbody>
									<%
									Iterator<BookBean> it = cart.iterator();
									while (it.hasNext()) {
										BookBean bb = it.next();
									%><tr>
										<td><%=bb.getCode()%></td>
										<td class="fw-semibold"><%=bb.getName()%></td>
										<td><%=bb.getAuthor()%></td>
										<td class="price">₹ <%=bb.getPrice()%></td>
										<td>1</td>
									</tr>
									<%
									}
									%>
								</tbody>
					
								<tfoot>
									<tr>
										<th colspan="3" class="text-end">Total</th>
										<th colspan="2" class="price fs-5">₹ <%=total%></th>
									</tr>
								</tfoot>
							</table>
						</div>
					
						<div class="d-flex flex-wrap justify-content-end gap-2 mt-3">
							<a href="customerView" class="btn btn-outline-secondary">Continue Shopping</a>
							<a href="buyBook" class="btn btn-success"><i class="bi bi-bag-check me-2"></i>Buy Books</a>
						</div>
						<%
						}
						%>
					</div>
				</main>
			</div>
		</div>
	</div>
	<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/app.js"></script>
</body>
</html>