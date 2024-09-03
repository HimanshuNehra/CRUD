<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="./base.jsp"%>
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
<div class="container mt-5">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<h1 class="text-center mb-3"style="font-family: 'Arial', sans-serif; color: #4CAF50; text-shadow: 2px 2px #000000;">THE STAFF USER DETAILS</h1>
				<table class="table">
					<thead  style="background-color: blue; color: white;">
						<tr>
							<th scope="col">Id</th>
							<th scope="col">email</th>
							<th scope="col">username</th>
							<th scope="col">status</th>
							<th scope="col"></th>
							<th scope="col"> change status</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${staff}" var="p">           
							<tr>
								<th scope="row">Tech${p.id }</th>
								<td>${p.email }</td>
								<td>${p.username }</td>
								
							
				               <c:if test="${p.admin==1}">
				               <td>active<td>
				               </c:if>
			                    
			                    <c:if test="${p.admin==2}">
				               <td>deactive<td>
				               </c:if>
				               
								<td><a href="${pageContext.request.contextPath}/active/${p.id}">ACTIVE /</a> <a href="${pageContext.request.contextPath}/deactive/${p.id}">DEACTIVE</a></td>
							</tr>
							
						</c:forEach>
					</tbody>

				</table>

			</div>
		</div>
	</div>
</form>










</body>
</html>