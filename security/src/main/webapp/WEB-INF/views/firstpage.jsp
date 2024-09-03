<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="./base.jsp"%>
<title>Insert title here</title>
<style>
        body {
            background-image: url('${pageContext.request.contextPath}/static/images/OU2FpL.jpg');
            background-size: cover;
        }
    </style>



</head>
<body>

   <nav class="navbar navbar-expand-lg navbar-dark  bg-primary">
  <a class="navbar-brand" href="#">Admin</a>
  
  
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
  
  
    <ul class="navbar-nav ml-auto">
      <li class="nav-item ">
        <a class="nav-link" href="${pageContext.request.contextPath }/">LOGOUT</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="staff">STAFF USER</a>
      </li>
      <li class="nav-item">
        <a class="nav-link " href="addback">PRODUCT DETAILS</a>
      </li>
      
       <li class="nav-item">
        <a class="nav-link " href="createNewUser">CREATE NEW STAFF USER</a>
      </li>
    </ul>
   
  </div>
</nav>
 
 
 <!-- To show the product data -->
<form >
<div class="container mt-3">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<h1 class="text-center mb-3" style="font-family: 'Arial', sans-serif; color: #4CAF50; text-shadow: 2px 2px #000000;">THE PRODUCT DETAILS</h1>
				<table class="table">
					<thead  style="background-color: blue; color: white;">
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
					<a href="adduser" class="btn btn-primary">Add</a>
					
				</div>

			</div>
		</div>
	</div>
</form>




</body>
</html>