<html>
<Head>
<%@include file="./base.jsp"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
        body {
            background-image: url('${pageContext.request.contextPath}/static/images/OU2FpL.jpg');
            background-size: cover;
        }
    </style>

</Head>
<body>

<div class="container mt-3">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<h1 class="text-center mb-3">WELECOME ADMIN</h1>
				<table class="table">
					<thead style="background-color: blue; color: white;">
						<tr>
							<th scope="col" >Id</th>
							<th scope="col">Product Name</th>
							<th scope="col">Description</th>
							<th scope="col">Price</th>
							<th scope="col">Action</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${product }" var="p">
							<tr>
								<th scope="row">Tech${p.pid }</th>
								<td>${p.name }</td>
								<td>${p.description }</td>
								<td>${p.price }</td>
								<td><a href="update/${p.pid }">update</a> <a href="delete/${p.pid }">delete</a></td>
							</tr>
						</c:forEach>
					</tbody>

				</table>
				<div class="container text-center">
					<a href="addProduct" class="btn btn-primary">Add</a>
					<a href="${pageContext.request.contextPath }/" class="btn btn-outline-danger">Logout</a>
				</div>

			</div>
		</div>
	</div>





</body>
</html>
