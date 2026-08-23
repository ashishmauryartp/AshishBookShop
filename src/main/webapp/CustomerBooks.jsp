<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" 
	import="com.abs.bean.*,java.util.*"%>

<%
CustomerBean cb = (CustomerBean) session.getAttribute("cbean");
ArrayList<BookBean> al = (ArrayList<BookBean>) request.getAttribute("bookList");
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
	<title>Available Books</title>
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
					
					<a class="nav-link active" href="customerView">
						<i class="bi bi-book me-2"></i>View Books</a>
					
					<a class="nav-link " href="cart">
						<i class="bi bi-cart3 me-2"></i>View Cart</a>
						
					<a class="nav-link " href="editCustomer"> 
						<i class="bi bi-person-gear me-2"></i>Edit Profile</a>
						
					<a class="nav-link " href="customerLogout">
						<i class="bi bi-box-arrow-right me-2"></i>Logout</a>
				
				</aside>
				
				<main class="col-lg-10 dashboard-main">
					
					<div class="d-flex flex-wrap justify-content-between align-items-center gap-2 mb-3">
						<div>
							<h2 class="fw-bold">Available Books</h2>
							<p class="text-muted mb-0">Select a book and add it to your cart.</p>
						</div>
						<a href="cart" class="btn btn-success">
							<i class="bi bi-cart3 me-2"></i>View Cart</a>
					</div>
					
					<div class="table-card">
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>Code</th>
										<th>Name</th>
										<th>Author</th>
										<th>Price</th>
										<th>Quantity</th>
					
										<th>Action</th>
					
									</tr>
								</thead>
								<tbody>
									<%
									if (al == null || al.isEmpty()) {
									%><tr>
										<td colspan="6" class="text-center py-5 text-muted">Books not available...</td>
									</tr>
									<%
									} else {
										Iterator<BookBean> it = al.iterator();
										while (it.hasNext()) {
										BookBean bb = it.next();
									%><tr>
										<td><span class="badge text-bg-light"><%=bb.getCode()%></span></td>
										<td class="fw-semibold"><%=bb.getName()%></td>
										<td><%=bb.getAuthor()%></td>
										<td class="price">₹ <%=bb.getPrice()%></td>
										<td><span class="badge qty"><%=bb.getQty()%></span></td>
		
										<td><a class="btn btn-sm btn-success" href="addCart?bcode=<%=bb.getCode()%>">
												<i class="bi bi-cart-plus me-1"></i>Add To Cart
											</a>
										</td>
									
									</tr>
									<%
										}
									}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</main>
			</div>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/app.js"></script>
</body>
</html>