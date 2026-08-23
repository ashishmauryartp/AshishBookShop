<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" 
	import="com.abs.bean.*,java.util.*"%>

<%
AdminBean ab = (AdminBean) session.getAttribute("abean");
ArrayList<BookBean> al = (ArrayList<BookBean>) session.getAttribute("alist");
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
	<title>Manage Books</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">
</head>
<body>
	<nav class="navbar site-nav navbar-dark">
		<div class="container-fluid px-4">
			<a class="navbar-brand" href="AdminLogin.jsp"><i class="bi bi-book-half"></i> Ashish Book Shop</a>
			<span class="text-white">Admin: <%=ab.getfName()%> 
				<i class="bi bi-person-circle"></i>
			</span>
		</div>
	</nav>
	
	<div class="dashboard">
		<div class="container-fluid">
			<div class="row">
				<aside class="col-lg-2 sidebar">
					
					<a class="nav-link " href="AdminLogin.jsp">
						<i class="bi bi-house me-2"></i>Home</a>
					
					<a class="nav-link " href="book.html">
						<i class="bi bi-plus-circle me-2"></i>Add Book</a>
						
					<a class="nav-link active" href="view">
						<i class="bi bi-bookshelf me-2"></i>View Books</a>
						
					<a class="nav-link " href="logout">
						<i class="bi bi-box-arrow-right me-2"></i>Logout</a>
				
				</aside>
				
				<main class="col-lg-10 dashboard-main">

					<div class="d-flex flex-wrap justify-content-between align-items-center gap-2 mb-3">
						<div>
							<h2 class="fw-bold">Manage Books</h2>
							<p class="text-muted mb-0">Edit or delete books from inventory.</p>
						</div>
						
						<a href="book.html" class="btn btn-success">
							<i class="bi bi-plus-circle me-2"></i>Add Book</a>
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

										<th>Actions</th>

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

										<td>
											<a href="edit?bcode=<%=bb.getCode()%>"class="btn btn-sm btn-outline-primary me-1">
												<i class="bi bi-pencil"></i> Edit</a>
											
											<a href="delete?bcode=<%=bb.getCode()%>"class="btn btn-sm btn-outline-danger"
												onclick="return confirm('Delete this book?')">
												<i class="bi bi-trash"></i> Delete</a></td>
									
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