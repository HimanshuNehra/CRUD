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
				<h1 class="text-center mb-3" style="font-family: 'Arial', sans-serif; color: #4CAF50; text-shadow: 2px 2px #000000;">READ MODE DATA</h1>
				<table class="table">
					<thead style="background-color: blue; color: white;">
						<tr>
							<th scope="col">Id</th>
							<th scope="col">Product Name</th>
							<th scope="col">Description</th>
							<th scope="col">Price</th>
						
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${product }" var="p">
							<tr>
								<th scope="row">Tech${p.pid }</th>
								<td>${p.name }</td>
								<td>${p.description }</td>
								<td>${p.price }</td>
								
							</tr>
						</c:forEach>
					</tbody>

				</table>
				<div class="container text-center">
					
					<a href="${pageContext.request.contextPath }/user" class="btn btn-primary">Logout</a>
					
				</div>

			</div>
		</div>
	</div>





</body>
</html>
